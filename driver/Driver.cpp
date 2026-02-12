//===- driver/Driver.cpp --------------------------------------------------===//
//
// Copyright (C) 2025-2026 Ninefold
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
//     limitations under the License.
//
//===----------------------------------------------------------------------===//

#include "Shared.hpp"
#include "FilePropertyCache.hpp"
#include "LLVMTargets.hpp"
#include "NameClassifier.hpp"
#include "SymbolFeatures.hpp"
#include "SymbolMatcher.hpp"
#include "Pattern.hpp"
#include "PatternLex.hpp"
#include "Triple.hpp"
#include "UniqueStringVector.hpp"
#include "UnlinkRefs.hpp"
#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
#include "llvm/Demangle/Demangle.h"
// #include "llvm/ADT/SetVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Option/OptTable.h"
#include "llvm/Option/Option.h"
#include "llvm/Support/FileSystem.h"
// #include "llvm/Support/GlobPattern.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/WithColor.h"
#include "llvm/Support/raw_ostream.h"
// Target related
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/CodeGen/CommandFlags.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/TargetParser/SubtargetFeature.h"
#include "llvm/TargetParser/Triple.h"
// Transforms
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Utils/Debugify.h"
// Miscellaneous
#include <debase/Config.hpp>
#include <memory>
#include <optional>
#include <string>
//#include <matjson.hpp>

#ifndef NDEBUG
# include "llvm/Support/BuryPointer.h"
# define DbgBuryPointer(...) ::llvm::BuryPointer(__VA_ARGS__)
#else
# define DbgBuryPointer(...) ((void)0)
#endif

#define DO_DBG_STMT 0
#if DO_DBG_STMT
# define DBG_STMT(...) __VA_ARGS__
#else
# define DBG_STMT(...) ((void)0)
#endif

using namespace llvm;
using namespace debase_tool;

static codegen::RegisterCodeGenFlags CFG;

bool debase_tool::Strict = false;
bool debase_tool::Permissive = false;

enum HardeningMode {
  strict,
  normal,
  permissive,
};

cl::OptionCategory debase_tool::DebaseToolCategory("Debaser Options");

namespace debase_tool {

static cl::list<std::string>
InputFilenames(cl::Positional,
               cl::desc("<input files...>"),
               cl::cat(DebaseToolCategory));

static cl::opt<std::string>
ConfigFile("config",
           cl::desc("Config file"), cl::value_desc("config"),
           cl::cat(DebaseToolCategory));

static cl::opt<std::string>
OutputFilepath("o",
               cl::desc("Output folder"), cl::value_desc("folder"),
               cl::cat(DebaseToolCategory));

static cl::opt<HardeningMode>
Hardening(
  cl::desc("Defines the program's correctness requirements:"),
  cl::value_desc("value"), cl::cat(DebaseToolCategory),
  cl::init(HardeningMode::normal),
  cl::values(
    clEnumVal(normal,     "The default, exits only when required"),
    clEnumVal(strict,     "Extra checks, exits instead of warning"),
    clEnumVal(permissive, "Less checks, warns when possible")),
  cl::callback([](const HardeningMode& M) {
    auto HMFlags = std::tie(Strict, Permissive);
    if (M == normal)
      HMFlags = std::pair{false, false};
    else if (M == strict)
      HMFlags = std::pair{true, false};
    else if (M == permissive)
      HMFlags = std::pair{false, true};
  }));

cl::opt<bool>
Verbose("verbose",
        cl::desc("Output more runtime information"),
        cl::init(false), cl::cat(DebaseToolCategory));

static cl::alias
VerboseA("V",
        cl::desc("Alias for '--verbose'"),
        cl::aliasopt(Verbose),
        cl::cat(DebaseToolCategory));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished"),
           cl::init(false), cl::cat(DebaseToolCategory));

// The following options were taken from llvm opt:
static cl::OptionCategory& OptToolCategory = DebaseToolCategory;

static cl::opt<bool>
OutputSuccessfulFilenames("output-filenames",
                          cl::desc("Output a list of the updated files"),
                          cl::cat(OptToolCategory));

//static constexpr bool OutputAssembly = true;
static cl::opt<bool>
OutputAssembly("output-assembly",
               cl::desc("Output LLVM assembly instead of bitcode"),
               cl::cat(OptToolCategory));

static cl::opt<bool>
PrintPasses("print-passes",
            cl::desc("Print available passes and exit"),
            cl::cat(OptToolCategory));

static cl::opt<bool>
StripDebug("strip-debug",
           cl::desc("Strip debugger symbol info from translation unit"),
           cl::cat(OptToolCategory));

static cl::opt<bool>
StripNamedMetadata("strip-named-metadata",
                   cl::desc("Strip module-level named metadata"),
                   cl::cat(OptToolCategory));

static cl::opt<std::string>
TargetTriple("mtriple",
             cl::desc("Override target triple for module"),
             cl::cat(OptToolCategory));

static cl::opt<bool>
NoOutput("disable-output", cl::Hidden,
         cl::desc("Do not write result bitcode file"),
         cl::cat(OptToolCategory));

static cl::opt<bool>
NoVerify("disable-verify", cl::Hidden,
         cl::desc("Do not run the verifier"),
         cl::cat(OptToolCategory));

static cl::opt<bool>
VerifyDebugInfoPreserve(
  "verify-debuginfo-preserve",
  cl::desc("Start the pipeline with collecting and end it with checking of "
           "debug info preservation."),
  cl::cat(OptToolCategory));

static cl::opt<bool>
VerifyEach("verify-each",
           cl::desc("Verify after each transform"),
           cl::cat(OptToolCategory));

static cl::opt<std::string>
ClDataLayout("data-layout",
             cl::desc("data layout string to use"),
             cl::value_desc("layout-string"),
             cl::init(""), cl::cat(OptToolCategory));

static cl::opt<bool>
RunTwice("run-twice", cl::Hidden,
         cl::desc("Run all passes twice, re-using the same pass manager."),
         cl::init(false), cl::cat(OptToolCategory));

} // namespace debase_tool

////////////////////////////////////////////////////////////////////////////////
// Startup/Utility Functions

[[noreturn]] static void exitWithError(Twine Msg, std::string Hint = "") {
  errs() << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note() << Hint << "\n";
  errs().flush();
  std::exit(1);
}

static void exitOrLogWithError(Twine Msg, std::string Hint = "") {
  if (!Permissive)
    return exitWithError(Msg, std::move(Hint));
  // Permissive, continue!
  errs() << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note() << Hint << "\n";
}

template <typename DefaultT>
static decltype(auto) exitOrReturnDefault(DefaultT&& Default,
                                          Twine Msg, std::string Hint = "") {
  exitOrLogWithError(Msg, std::move(Hint));
  return std::forward<DefaultT>(Default);
}
template <typename DefaultT>
static decltype(auto) exitOrReturnDefault(DefaultT&& Default) {
  if (!Permissive)
    return std::exit(1);
  return std::forward<DefaultT>(Default);
}

static bool FixupFilename(SmallVectorImpl<char>& Filename) {
  if (auto EC = sys::fs::make_absolute(Filename)) {
    exitOrLogWithError(EC.message());
    Filename.clear();
    return false;
  }
  if (!sys::fs::exists(Filename)) {
    StringRef FilenameS(Filename.data(), Filename.size());
    exitOrLogWithError(Twine("'") + FilenameS + "' does not exist!");
    Filename.clear();
    return false;
  }
  return true;
}

static bool FixupFilename(std::string& InFilename) {
  SmallString<128> Filename{StringRef(InFilename)};
  if (!FixupFilename(Filename)) {
    InFilename.clear();
    return false;
  }
  InFilename = static_cast<std::string>(Filename);
  return true;
}

static bool OptionIsHidden(cl::Option& Opt) {
  const auto Flag = Opt.getOptionHiddenFlag();
  return Flag == cl::Hidden || Flag == cl::ReallyHidden;
}

/// Like `cl::HideUnrelatedOptions`, but only partially hidden.
static void SemiHideUnrelatedOptions(
 cl::OptionCategory& In,
 cl::SubCommand& Sub = cl::SubCommand::getTopLevel()
) {
  cl::OptionCategory& Generic = cl::getGeneralCategory();
  for (auto& [Name, O] : Sub.OptionsMap) {
    bool Unrelated = true;
    if (OptionIsHidden(*O))
      // Already hidden, skip.
      continue;
    for (auto& Cat : O->Categories) {
      if (Cat == &Generic) {
        Unrelated = true;
        break;
      }
      if (Cat == &In)
        Unrelated = false;
    }
    if (Unrelated)
      O->setHiddenFlag(cl::Hidden);
  }
}

static raw_ostream& vbss() {
  return *(Verbose ? &errs() : &nulls());
}

////////////////////////////////////////////////////////////////////////////////
// LLVM Related Functions

static void CheckStuff(const Triple& T) {
  outs() << T.getTriple() << " {\n  ";
  outs() << "Arch:    " << debase_tool::get_triple_arch(T) << "\n  ";
  if (T.getSubArch() != Triple::SubArchType::NoSubArch)
    outs() << "SubArch: " << debase_tool::get_triple_subarch(T) << "\n  ";
  outs() << "Vendor:  " << debase_tool::get_triple_vendor(T) << "\n  ";
  if (!T.isOSUnknown())
    outs() << "OS:      " << debase_tool::get_triple_os(T) << "\n  ";
  else if (isTripleAndroidOS(T))
    outs() << "OS:      " << T.getOSName() << "\n  ";
  outs() << "Env:     " << debase_tool::get_triple_env(T) << '\n';
  outs() << "}\n";
}

static void CheckStuff(const std::string& Env) {
  Triple T(Env);
  CheckStuff(T);
}

static void CheckStuff() {
  CheckStuff("i386-pc-windows-msvc");
  CheckStuff("arm64-apple-darwin");
  CheckStuff("arm-linux-androideabi29");
  CheckStuff("aarch64-linux-android29");
  CheckStuff("arm64-apple-macosx10.7");
  CheckStuff("x86_64-pc-windows-msvc19.34.31935");
  CheckStuff("aarch64-unknown-linux-gnu");
  CheckStuff("armv7-apple-ios");
}

/// Info that stays the same with every triple.
struct CachedTargetInfo {
  std::unique_ptr<TargetMachine> TM = nullptr;
  TargetLibraryInfoImpl TLII;
  DebugifyCustomPassManager Passes;
public:
  CachedTargetInfo(const Triple& TT,
                   std::unique_ptr<TargetMachine> InTM)
   : TM(std::move(InTM)), TLII(TT) {
    //// Add TLII Pass.
    //Passes.add(new TargetLibraryInfoWrapperPass(TLII));
    //// Add internal analysis passes from the target machine.
    //Passes.add(createTargetTransformInfoWrapperPass(TM ? TM->getTargetIRAnalysis()
    //                                                   : TargetIRAnalysis()));
    //if (TM) {
    //  // FIXME: We should dyn_cast this when supported.
    //  auto& LTM = static_cast<LLVMTargetMachine&>(*TM);
    //  Passes.add(LTM.createPassConfig(Passes));
    //}
  }
};

/// Initializes literally everything. Might be able to pull back a bit...
static void LLVMInitializeEverything();
/// Gets the OptLevel of `-O1`.
static CodeGenOptLevel GetCodeGenOptLevel() { return CodeGenOptLevel::Less; } 
/// Gets some basic passes we can run on functions.
static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification();

namespace {

/// The actual implementation of the debaser.
class DeBaser {
  /// The diagnostic engine for the current module.
  SMDiagnostic Err;
  /// The matcher for the current module group.
  SymbolMatcher& SM;
  /// The original filename.
  std::string LLFile;
  /// The commandline (for diagnostics).
  StringRef Argv0;

  /// Stores all the attribute data from our matched functions so they can be
  /// restored later. This allows for passes which would otherwise be harder
  /// to deal with.
  struct PrevFunctionInfo {
    bool HadNoinline : 1 = false;
    bool HadAlwaysinline : 1 = false;
    bool IsCtor : 1 = false;
    bool IsDtor : 1 = false;
    //bool HadUsed : 1 = false;
  };

  /// The module itself.
  std::unique_ptr<Module> M = nullptr;
  /// Used to determine the type of functions.
  Classifier* SymClassifier = nullptr;
  /// The map of `(ReferencedFunc*, PrevInfo)` tuples.
  SmallDenseMap<Function*, PrevFunctionInfo> LocatedRefs;

  // Builtins...
  Function* BI__debase_mark_begin = nullptr;
  Function* BI__debase_mark_end = nullptr;
  Function* BI__debase_continuation = nullptr;
  // Clang builtins
  Function* BI__clang_call_terminate = nullptr;
  // Holds builtins
  SmallPtrSet<Function*, 4> BISet;

  bool LoadedModule : 1 = false;
  bool SetUnlinks : 1 = false;
  bool LastCheck : 1 = true;
  bool DidCleanup : 1 = false;

public:
  /// A utility for creating new debaser objects.
  class Factory {
    SymbolMatcher& SM;
    LLVMContext& Context;
    std::string Argv0;
  public:
    Factory(SymbolMatcher& SM, const char* Argv0, LLVMContext& Context) :
     SM(SM), Context(Context), Argv0(Argv0) {}
    
    std::optional<DeBaser> New(StringRef Filename, LLVMContext& Ctx) {
      std::optional<DeBaser> DB;
      DB.emplace(Filename, SM, Argv0, Context);
      if (!DB->LoadedModule) {
        // Unfortunately, we have failed... Return nothing.
        return std::nullopt;
      }
      return DB;
    }
    std::optional<DeBaser> New(StringRef Filename) {
      return New(Filename, this->Context);
    }
  };

  DeBaser(StringRef Filename, SymbolMatcher& SM,
          std::string Argv0, LLVMContext& Context);

  DeBaser(DeBaser&&) = default;
  //DeBaser& operator=(DeBaser&&) = default;
  DeBaser(const DeBaser&) = delete;
  DeBaser& operator=(const DeBaser&) = delete;

  ~DeBaser() {
    if (M) {
      assert(this->LoadedModule
          && "Forgot to set DeBaser::LoadedModule!");
      //DbgBuryPointer(std::move(M));
    }
  }

  void setNameDemangler(Classifier* C) {
    this->SymClassifier = C;
  }

  bool loadRefsAndBuiltins();

  /// Runs a set of passes on our collected functions.
  /// @return `true` if the function was modified.
  void runPasses(const std::vector<FunctionPass*>& Passes, StringRef PassName = "");

  /// Runs debaser on all functions.
  void debaseFunctions() {
    if (!this->SetUnlinks) {
      error() << "SetUnlinks is false!\n";
      return;
    }
    for (auto [F, _] : LocatedRefs) {
      this->debaseFunction(F);
      DBG_STMT(F->print(errs() << '\n'));
    }
  }

  /// Resets function attributes to their original state
  void resetFunctionAttrs() {
    for (auto [F, PrevInfo] : LocatedRefs)
      DeBaser::ResetInfo(F, PrevInfo);
  }

  ErrorOr<std::string> writeLLVM(const Twine& Dir);

  Triple getTriple() const {
    assert(M && "Module was not initialized!");
    return Triple(M->getTargetTriple());
  }

  raw_ostream& error() const {
    return WithColor::error(errs(), "");
  }

private:
  /// Gets a `PrevFunctionInfo` while updating the function.
  static PrevFunctionInfo GetInfoAndUpdate(Function* F, const SymbolFeatures& FFeats);
  /// Resets a `Function` using `PrevFunctionInfo`.
  static void ResetInfo(Function* F, const PrevFunctionInfo& Info);

  /// Loads a `Module` from the specified file into `DeBaser::M`.
  bool loadModule(StringRef Filename, LLVMContext& Context);
  /// Loads references matching the provided list, updating their attributes.
  bool loadAndUpdateRefsFromModule();

  /// Handles debasing one function.
  bool debaseFunction(Function* F);
  /// Handles debasing one function.
  bool debaseConstructor(Function* F);
  /// Handles debasing one function.
  bool debaseDestructor(Function* F);

  /// Checks if type is ctor or dtor.
  bool isConstructor(Function* F) const {
    // TODO: Change this!
    return LocatedRefs.at(F).IsCtor;
  }
  /// Checks if is removable
  bool isRemovableFunction(Function* F) const;
};

} // namespace `anonymous`

bool DeBaser::loadRefsAndBuiltins() {
  if (!loadAndUpdateRefsFromModule())
    return false;
  this->SetUnlinks = true;
  auto LoadFunction = [this] (StringRef BIName) -> Function* {
    auto* F = M->getFunction(BIName);
    if (F)
      BISet.insert(F);
    return F;
  };
  // Load builtins...
  BI__debase_mark_begin   = LoadFunction("__debase_mark_begin");
  BI__debase_mark_end     = LoadFunction("__debase_mark_end");
  BI__debase_continuation = LoadFunction("__debase_continuation");
  // Load clang builtins
  BI__clang_call_terminate = M->getFunction("__clang_call_terminate");
  // Check builtins loaded
  return (BI__debase_mark_begin && BI__debase_mark_end);
}

void DeBaser::runPasses(const std::vector<FunctionPass*>& Passes, StringRef PassName) {
  if (!this->SetUnlinks) {
    error() << "SetUnlinks is false!\n";
    return;
  }

  for (auto [F, _] : LocatedRefs) {
    bool DidModify = false;
    for (FunctionPass* P : Passes) {
      //if (Verbose) {
      //  WithColor::note(outs(), PassName)
      //    << "Pass: " << P->getPassName() << "\n";
      //  outs().flush();
      //}
      if (P->runOnFunction(*F))
        DidModify = true;
    }
    if (DidModify && Verbose) {
      WithColor::note(outs(), PassName)
        << F->getName() << " was modified.\n";
    }
  }
}

bool DeBaser::debaseFunction(Function* F) {
  DBG_STMT(
    errs() << "\n\n" << llvm::demangle(F->getName()) << ": "
           << F->getInstructionCount());
  // TODO: Check the type of the function (ctor or dtor)!
  if (isConstructor(F))
    return debaseConstructor(F);
  else
    return debaseDestructor(F);
}

LLVM_ATTRIBUTE_NOINLINE
static void PrintCall(CallBase& I, int type) {
  switch (type) {
  // To be kept
  case 0: {
    WithColor OS(errs(), raw_ostream::GREEN);
    I.print(OS << '\n');
    break;
  }
  // To be removed
  case 1: {
    WithColor OS(errs(), raw_ostream::RED);
    I.print(OS << '\n');
    break;
  }
  // Builtin
  case 2:
  default: {
    WithColor OS(errs(), raw_ostream::YELLOW);
    I.print(OS << '\n');
    break;
  }
  }
}

static void IterateInstructions(Function* F, function_ref<bool(CallBase&)> CB) {
  for (BasicBlock& BB : *F) {
#if DO_DBG_STMT
    {
      WithColor OS(errs());
      bool IsEntryBlock = BB.getParent() && BB.isEntryBlock();
      if (BB.hasName()) {
        OS << raw_ostream::CYAN << '\n' << BB.getName() << ":\n";
      } else if (!IsEntryBlock) {
        OS << '\n';
        //int Slot = Machine.getLocalSlot(BB);
        //if (Slot != -1)
        //  OS << Slot << ":\n";
        //else
        //  OS << "<badref>:\n";
        OS << "*:\n";
      }
    }
#endif
    for (Instruction& I : BB) {
      if (!isa<CallBase>(I)) {
        DBG_STMT(I.print(errs() << '\n'));
        continue;
      }
      // CallBase
      if (!CB(cast<CallBase>(I)))
        return;
    }
  }
}

bool DeBaser::isRemovableFunction(Function* F) const {
  //errs() << raw_ostream::RESET << "\n*" << F->getName() << "*\n";
  if (F == BI__clang_call_terminate)
    return false;
  StringRef FName = F->getName();
  if (FName.starts_with("__cxa_"))
    return false;
  else if (FName.starts_with("__clang_"))
    return false;
  else if (FName.starts_with("llvm."))
    return false;
  //if (SymClassifier->isMSVC())
  //  return true;
  else 
    return true;
}

bool DeBaser::debaseConstructor(Function* F) {
  Instruction* Begin = nullptr;
  //Instruction* Continue = nullptr;
  SmallPtrSet<Instruction*, 32> ToRemove;

  auto ScanFunc = [&, this] (CallBase& I) -> bool {
    Function* IDest = I.getCalledFunction();
    if (!IDest) {
      if (!I.isIndirectCall())
        return false;
      DBG_STMT(I.print(errs() << '\n'));
      return true;
    }
    // Check if this is a __debase pseudofunction
    if (BISet.contains(IDest)) {
      // Check which one it is :)
      if (BI__debase_mark_begin == IDest) {
        if (!Begin)
          Begin = &I;
        // We don't exit here so we can remove all builtins
      }
      DBG_STMT(PrintCall(I, 2));
      ToRemove.insert(&I);
      return true;
    }
    // Add all calls before beginning of ctor
    if (Begin == nullptr)
      if (this->isRemovableFunction(IDest))
        ToRemove.insert(&I);
    DBG_STMT(PrintCall(I, ToRemove.contains(&I)));
    return true;
  };

  IterateInstructions(F, ScanFunc);
  // Remove it all
  for (Instruction* I : ToRemove) {
    if (LLVM_UNLIKELY(I->isSafeToRemove())) {
      WithColor::warning(errs())
        << "Unable to remove instruction.\n";
      continue;
    }
    I->eraseFromParent();
  }

  return true;
}

bool DeBaser::debaseDestructor(Function* F) {
  Instruction* End = nullptr;
  //Instruction* Continue = nullptr;
  SmallPtrSet<Instruction*, 32> ToRemove;

  auto ScanFunc = [&, this] (CallBase& I) -> bool {
    Function* IDest = I.getCalledFunction();
    if (!IDest) {
      if (!I.isIndirectCall())
        return false;
      I.print(errs() << '\n');
      return true;
    }
    // Check if this is a __debase pseudofunction
    if (BISet.contains(IDest)) {
      // Check which one it is :)
      if (BI__debase_mark_end == IDest) {
        if (!End)
          End = &I;
        // We don't exit here so we can remove all builtins
      }
      DBG_STMT(PrintCall(I, 2));
      ToRemove.insert(&I);
      return true;
    }
    // Add all calls before beginning of ctor
    if (End != nullptr)
      if (this->isRemovableFunction(IDest))
        ToRemove.insert(&I);
    DBG_STMT(PrintCall(I, ToRemove.contains(&I)));
    return true;
  };

  IterateInstructions(F, ScanFunc);
  // Remove it all
  for (Instruction* I : ToRemove) {
    if (LLVM_UNLIKELY(I->isSafeToRemove())) {
      WithColor::warning(errs())
        << "Unable to remove instruction.\n";
      continue;
    }
    I->eraseFromParent();
  }

  // TODO...
  return true;
}

////////////////////////////////////////////////////////////////////////////////

DeBaser::DeBaser(StringRef Filename, SymbolMatcher& SM,
                 std::string Argv0, LLVMContext& Context)
    : SM(SM), LLFile(Filename), Argv0(Argv0) {
  loadModule(Filename, Context);
}

LLVM_ATTRIBUTE_NOINLINE
bool DeBaser::loadModule(StringRef Filename, LLVMContext& Context) {
  if (LLVM_UNLIKELY(LoadedModule)) {
    if (Filename == M->getName())
      return true;
    error() << "Module for '" << Filename
      << "' has already been loaded as '" << M->getName() << "'!\n";
    return false;
  }

  M = parseIRFile(Filename, Err, Context);
  if (!M) {
    Err.print(Argv0.data(), error());
    return false;
  }

  /*Update the ModuleID*/ {
    std::string ModuleID;
    raw_string_ostream OS(ModuleID);
    OS << M->getSourceFileName();
    if (SM.loadedConfig())
      OS << '@' << SM.getConfigFilename();
    M->setModuleIdentifier(ModuleID);
  }
  if (Error E = SM.setFilename(Filename)) [[unlikely]] {
    error() << "Unable to set filename '" << Filename << "'.\n";
    return false;
  }

  // Strip debug info before running the verifier.
  if (StripDebug)
    llvm::StripDebugInfo(*M);

  // Erase module-level named metadata, if requested.
  if (StripNamedMetadata) {
    while (!M->named_metadata_empty()) {
      NamedMDNode* NMD = &*M->named_metadata_begin();
      M->eraseNamedMetadata(NMD);
    }
  }

  // Immediately run the verifier to catch any problems before starting up the
  // pass pipelines. Otherwise we can crash on broken code during
  // doInitialization().
  if (!NoVerify && verifyModule(*M, &errs())) {
    error() << "input module is broken!\n";
    return false;
  }

  this->LoadedModule = true;
  return true;
}

DeBaser::PrevFunctionInfo DeBaser::GetInfoAndUpdate(Function* F, const SymbolFeatures& FFeats) {
  using enum Attribute::AttrKind;
  PrevFunctionInfo Info {
    .HadNoinline      = F->hasFnAttribute(NoInline),
    .HadAlwaysinline  = F->hasFnAttribute(AlwaysInline),
    .IsCtor           = FFeats.isCtor(),
    .IsDtor           = FFeats.isDtor()
  };
  if (!Info.HadNoinline)
    F->addFnAttr(NoInline);
  if (Info.HadAlwaysinline)
    F->removeFnAttr(AlwaysInline);
  // SetInfoWithAttrKind(HadUsed, Used?);
  return Info;
}

void DeBaser::ResetInfo(Function* F, const PrevFunctionInfo& Info) {
  using enum Attribute::AttrKind;
  if (!Info.HadNoinline)
    F->removeFnAttr(NoInline);
  if (Info.HadAlwaysinline)
    F->addFnAttr(AlwaysInline);
}

bool DeBaser::loadAndUpdateRefsFromModule() {
  if (!LoadedModule)
    return false;
  if (!this->SymClassifier) {
    error() << "SymClassifier was not initialized!\n";
    return false;
  }

  SymbolFeatures FFeats {};
  for (Function& F : M->getFunctionList()) {
    std::string Name = F.getName().str();
    SymClassifier->classify(Name, &FFeats);
    if (!FFeats.isCtorDtor())
      continue;
    // Check if itanium deleting destructor
    if (FFeats.Variant == 0)
      continue;
    if (!SM.match(FFeats))
      continue;
    // Check if this is an inline function
    if (F.hasComdat()) {
      WithColor::note(vbss())
        << "Skipping " << F.getName() << ", has comdat tag.\n";
      continue;
    }
    // TODO: Switch when complex added.
    //++EncounteredSimple;

    auto [It, DidEmplace] = LocatedRefs.try_emplace(&F);
    if (LLVM_UNLIKELY(!DidEmplace)) {
      if (!Permissive) {
        error() << "Duplicate definition of "
          << F.getName() << "??\n";
        return false;
      }
      continue;
    }

    It->second = GetInfoAndUpdate(&F, FFeats);
    if (Verbose) {
      WithColor::note(vbss())
        << "Found " << F.getName() << '\n';
    }
  }

  //if (Strict && EncounteredSimple != Refs.simpleCount()) {
  //  error()
  //    << "In '-strict' all simple definitions are required to be encountered. Only "
  //    << EncounteredSimple << " were encountered, when "
  //    << Refs.simpleCount() << " were required.\n";
  //  return false;
  //}

  this->SetUnlinks = true;
  return true;
}

static ErrorOr<int> CreateToolOutputFile(StringRef OutPath, bool IsText) {
  int ResultFD = -1;
  std::error_code EC = sys::fs::openFile(
    OutPath, ResultFD,
    sys::fs::CD_CreateAlways, sys::fs::FA_Write,
    IsText ? sys::fs::OF_TextWithCRLF : sys::fs::OF_None
  );
  if (EC)
    return EC;
  assert(ResultFD != -1);
  return ResultFD;
}

static ErrorOr<int> CreateToolOutputFile(StringRef OutPath) {
  return CreateToolOutputFile(OutPath, OutputAssembly);
}

ErrorOr<std::string> DeBaser::writeLLVM(const Twine& Dir) {
  SmallString<80> OutPath;
  Dir.toVector(OutPath);
  sys::path::append(OutPath, sys::path::filename(LLFile));
  sys::path::replace_extension(OutPath, OutputAssembly ? ".ll" : ".bc");
  if (auto EC = sys::fs::make_absolute(OutPath)) {
    errs() << "For \"" << OutPath.str() << "\"" << EC.message() << '\n';
    return EC;
  }
  sys::path::remove_dots(OutPath);
  // Open file
  ErrorOr<int> FDOrErr = CreateToolOutputFile(OutPath.str());
  if (auto EC = FDOrErr.getError()) {
    errs() << "While opening \"" << OutPath.str() << "\""
           << EC.message() << '\n';
    return EC;
  }
  ToolOutputFile TheFile(OutPath.str(), *FDOrErr);
  auto& OS = TheFile.os();
  // Write data to file
  if (OutputAssembly)
    M->print(OS, nullptr);
  else {
    bool IsNewDbgInfoFormat = M->IsNewDbgInfoFormat;
    if (IsNewDbgInfoFormat)
      M->convertFromNewDbgValues();
    WriteBitcodeToFile(*M, OS);
    if (IsNewDbgInfoFormat)
      M->convertToNewDbgValues();
  }
  if (auto EC = OS.error()) {
    OS.clear_error();
    errs() << "While writing \"" << OutPath.str() << "\"" << EC.message() << '\n';
    return EC;
  }
  TheFile.keep();
  return TheFile.outputFilename();
}

int main(int Argc, char** Argv) {
  InitLLVM X(Argc, Argv);
  LLVMInitializeEverything();

  // Hide opt options from -help, but still allow the user to query them.
  SemiHideUnrelatedOptions(DebaseToolCategory);

  // Register the Target and CPU printer for --version.
  cl::AddExtraVersionPrinter(&sys::printDefaultTargetAndDetectedCPU);
  // Get the debaser version printer.
  cl::AddExtraVersionPrinter([](raw_ostream& OS) {
    OS << DEBASE_VENDOR_NAME << ":\n  "
       << DEBASE_PACKAGE_NAME << " version "
       << DEBASE_PACKAGE_VERSION << "\n";
  });

  cl::ParseCommandLineOptions(Argc, Argv,
    "llvmir pass that removes calls to bases in ctors/dtors.\n");

  auto SM = std::make_unique<SymbolMatcher>();
  LLVMContext Context;

  if (PrintPasses) {
    PassBuilder PB;
    PB.printPassNames(outs());
    return 0;
  }

  if (InputFilenames.empty() && ConfigFile.empty()) {
    WithColor::error(errs())
      << "No input files provided!";
    return 1;
  }

  if (NoOutput && !OutputFilepath.empty()) {
    errs() << "WARNING: The -o (output path) option is ignored when the "
              "-disable-output option is used.\n";
  } else if (!OutputFilepath.empty()) {
    StringRef Dir = OutputFilepath.getValue();
    if (auto EC = sys::fs::create_directories(Dir)) {
      WithColor::error(errs())
        << "Error creating \"" << Dir << "\": "
        << EC.message() << '\n';
      return 1;
    }
  }

  // TODO: Unique filenames.
  UniqueStringVector ValidFilenames;
  for (auto& Filename : InputFilenames) {
    if (FixupFilename(Filename)) {
      auto [_, DidInsert] = ValidFilenames.try_insert(Filename);
      if (DidInsert)
        continue;
      WithColor::warning(errs())
        << "Duplicate filename '" << Filename << "'.\n";
      if (Strict)
        return 1;
    } else {
      WithColor::error(errs())
        << "Invalid filename '" << Filename << "'.\n";
      if (Strict)
        return 1;
    }
  }
  if (!ConfigFile.empty()) {
    SmallVector<std::string> ConfigFilenames;
    const auto& Conf = ConfigFile.getValue();
    Error E = SM->loadSymbolsFromJSONFile(Conf, &ConfigFilenames);
    if (LLVM_UNLIKELY(E)) {
      WithColor::error(errs())
        << "Config file failed to process.\n"
        << "reason: " << toString(std::move(E)) << "\n\n";
      return 1;
    }
    for (auto& Filename : ConfigFilenames)
      ValidFilenames.insert(Filename);
    WithColor::remark(outs())
      << "Loaded config \"" << Conf << "\".\n";
  }
  if (ValidFilenames.empty()) {
    WithColor::error(errs())
      << "No valid input files were provided!";
    return 1;
  }

#if !defined(NDEBUG)
  SM->dump();
#endif

  SMDiagnostic Err;
  auto WriteSMErrToString = [&Err, Argv](bool UseColors = true) {
    std::string Str; raw_string_ostream OS(Str);
    Err.print(Argv[0], OS, UseColors);
    return Str;
  };

  // The following were copied from llvm/tools/opt/optdriver.cpp
  //
  auto SetDataLayout = [&](StringRef IRTriple,
                           StringRef IRLayout) -> std::optional<std::string> {
    // Data layout specified on the command line has the highest priority.
    if (!ClDataLayout.empty())
      return ClDataLayout;
    // If an explicit data layout is already defined in the IR, don't infer.
    if (!IRLayout.empty())
      return std::nullopt;

    // If an explicit triple was specified (either in the IR or on the
    // command line), use that to infer the default data layout. However, the
    // command line target triple should override the IR file target triple.
    std::string TripleStr =
        TargetTriple.empty() ? IRTriple.str() : Triple::normalize(TargetTriple);
    // If the triple string is still empty, we don't fall back to
    // sys::getDefaultTargetTriple() since we do not want to have differing
    // behaviour dependent on the configured default triple. Therefore, if the
    // user did not pass -mtriple or define an explicit triple/datalayout in
    // the IR, we should default to an empty (default) DataLayout.
    if (TripleStr.empty())
      return std::nullopt;
    // Otherwise we infer the DataLayout from the target machine.
    Expected<std::unique_ptr<TargetMachine>> ExpectedTM =
        codegen::createTargetMachineForTriple(
          TripleStr, GetCodeGenOptLevel());
    if (!ExpectedTM) {
      WithColor::warning(errs(), Argv[0])
        << "failed to infer data layout: "
        << toString(ExpectedTM.takeError()) << "\n";
      return std::nullopt;
    }
    return (*ExpectedTM)->createDataLayout().getStringRepresentation();
  };
  
  // Holds all the successful Modules output files.
  std::unique_ptr<ToolOutputFile> JSONRecord;
  auto LoadToolOutputFile = [&](StringRef Filename) -> Error {
    using namespace std::literals;
    SmallString<128> Path;
    // Default to standard output.
    if (OutputFilepath.empty())
      Path.append(sys::path::parent_path(Filename));
    else
      Path.append(OutputFilepath);
    StringRef Stem = sys::path::filename(Filename);
    sys::path::append(Path, Stem);

    ErrorOr<int> FDOrErr = ::CreateToolOutputFile(Path.str(), true);
    if (auto EC = FDOrErr.getError())
      return errorCodeToError(EC);
    // Boss.
    JSONRecord.reset(new ToolOutputFile(Path.str(), *FDOrErr));
    return Error::success();
  };

  StringMap<std::optional<CachedTargetInfo>> TargetInfoCache;
  auto LoadTargetInfoCacheEntry = [&TargetInfoCache, Argv] (Module* M) -> Error {
    Triple ModuleTriple(M->getTargetTriple());
    auto ModuleTripleError = [&]() -> Error {
      std::string Out; raw_string_ostream(Out)
        << Argv[0] << ": unrecognized architecture '"
        << ModuleTriple.getArchName() << "' provided.\n";
      return MakeError(std::move(Out));
    };
    auto It = TargetInfoCache.find(ModuleTriple.str());
    if (It != TargetInfoCache.end()) {
      if (!It->second)
        // Found an error previously...
        return ModuleTripleError();
      return Error::success();
    }
    
    // Handle generating target info.
    std::unique_ptr<TargetMachine> TM = nullptr;
    if (ModuleTriple.getArch()) {
      Expected<std::unique_ptr<TargetMachine>> ExpectedTM =
          codegen::createTargetMachineForTriple(ModuleTriple.str(),
                                                GetCodeGenOptLevel());
      if (auto E = ExpectedTM.takeError()) {
        WithColor::warning(errs(), Argv[0])
          << "failed to create target machine for '"
          << ModuleTriple.str() << "': "
          << toString(std::move(E)) << "\n";
        TM.reset();
      } else {
        TM = std::move(*ExpectedTM);
      }
    } else if (ModuleTriple.getArchName() != "unknown" &&
               ModuleTriple.getArchName() != "") {
      return ModuleTripleError();
    }
    
    bool DidEmplace = false;
    std::tie(It, DidEmplace) = TargetInfoCache
        .try_emplace(ModuleTriple.str(), std::in_place,
                     ModuleTriple, std::move(TM));
    CachedTargetInfo& CTI = *It->second;
    return Error::success();
  };
  auto LoadModuleFromFile =
      [&, Argv](StringRef Filename) -> Expected<std::unique_ptr<Module>> {
    // ...
    std::unique_ptr<Module> M
      = parseIRFile(Filename, Err, Context,
                    ParserCallbacks(SetDataLayout));
    if (!M)
      return MakeError(
        WriteSMErrToString());
    
    // Strip debug info before running the verifier.
    if (StripDebug)
      StripDebugInfo(*M);

    // Erase module-level named metadata, if requested.
    if (StripNamedMetadata) {
      while (!M->named_metadata_empty()) {
        NamedMDNode* NMD = &*M->named_metadata_begin();
        M->eraseNamedMetadata(NMD);
      }
    }

    // If we are supposed to override the target triple, do so now.
    if (!TargetTriple.empty()) {
      SetTargetTripleCtorCast TT(TargetTriple);
      M->setTargetTriple(TT);
    }
    
    // Immediately run the verifier to catch any problems before starting up the
    // pass pipelines. Otherwise we can crash on broken code during
    // doInitialization().
    if (!NoVerify && verifyModule(*M, &errs())) {
      std::string Out; raw_string_ostream(Out)
        << Argv[0] << ": " << Filename
        << ": error: input module is broken!\n";
      return MakeError(std::move(Out));
    }

    if (!NoOutput) {
      if (Error E = LoadToolOutputFile(Filename))
        return E;
    }

    if (Error E = LoadTargetInfoCacheEntry(&*M))
      return std::move(E);
    
    // Override function attributes based on CPUStr, FeaturesStr, and command
    // line flags.
    std::string CPUStr = codegen::getCPUStr();
    std::string FeaturesStr = codegen::getFeaturesStr();
    codegen::setFunctionAttributes(CPUStr, FeaturesStr, *M);

    WithColor::note(vbss())
      << "Successfully loaded '" << Filename << "'!\n";
    return M;
  };

  if (OutputSuccessfulFilenames) {
    if (Error E = LoadToolOutputFile("out.json")) {
      WithColor::error(errs())
        << "Failed to generate output file list.\n";
      return 1;
    }
    // Set up file!
    assert(JSONRecord && "JSONRecord should be initialized!");
    JSONRecord->os() << "{\n\"files\": [\n";
  }

  ListSeparator OutLS(",\n");
  auto JSONRecordFilename = [&] (StringRef Filename) {
    if (!JSONRecord)
      return;
    auto Path = sys::path::convert_to_slash(Filename);
    JSONRecord->os() << OutLS << '\"' << Path << '\"';
  };

  // CheckStuff();
  auto O1OptPasses = GetO1PassesRequiredForSimplification();
  DeBaser::Factory DBFactory(*SM, Argv[0], Context);

  ItaniumClassifier IClass;
  MSVCClassifier MClass;

  for (StringRef Filename : ValidFilenames) {
    //LLVMContext LocalCtx;
    vbss() << "File: " << Filename << '\n';
    if (Filename.empty())
      continue;

    std::optional<DeBaser> DB = DBFactory.New(Filename);
    //std::optional<DeBaser> DB = DBFactory.New(Filename, LocalCtx);
    if (!DB.has_value()) {
      WithColor::warning(errs())
        << "Failed to generate module for '"
        << Filename << "'.\n";
      if (!Permissive)
        return 1;
      continue;
    }

    llvm::Triple T = DB->getTriple();
    auto IsItanium = checkTripleTargetSymbolType(T);
    if (!IsItanium.has_value()) {
      errs() << "Invalid triple for \"" << Filename
             << "\": " << T.getTriple() << "\n";
      continue;
    }

    if (*IsItanium)
      DB->setNameDemangler(&IClass);
    else
      DB->setNameDemangler(&MClass);

    if (!DB->loadRefsAndBuiltins()) {
      errs() << "Unable to load builtins for \"" << Filename << "\"\n";
      continue;
    }

    DB->runPasses(O1OptPasses);
    DB->debaseFunctions();
    DB->resetFunctionAttrs();
    // TODO: Run aggressive optimizer?
    // Write module
    if (!NoOutput) {
      auto OFOrErr = DB->writeLLVM(OutputFilepath.getValue());
      if (!OFOrErr.getError())
        JSONRecordFilename(*OFOrErr);
      else
        WithColor::warning(errs()) << "Unable to write file.\n";
    } else
      JSONRecordFilename(Filename);

    if (Verbose) {
      outs().flush();
      errs() << '\n';
    }
  }

  if (JSONRecord) {
    JSONRecord->os() << "\n]\n}";
    JSONRecord->keep();
  }
}

////////////////////////////////////////////////////////////////////////////////

static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification() {
  // TODO: Use PassBuilder!!!!
  std::vector<FunctionPass*> Out;
  Out.reserve(4);
  // EntryExitInstrumenterPass
  // AlwaysInlinerPass?
  // CoroConditionalPass
  // AnnotationRemarksPass
  //Out.push_back(createCFGSimplificationPass());
  if (auto* Pass = createSROAPass(false))
    Out.push_back(Pass);
  if (auto* Pass = createInstructionCombiningPass())
    Out.push_back(Pass);
  return Out;
}

namespace {
  inline void InitializeTargetInfos() {
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##TargetInfo();
    INITIALIZE_TARGETS(LLVM_TARGET)
#undef LLVM_TARGET
  }

  inline void InitializeTargets() {
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##Target();
    INITIALIZE_TARGETS(LLVM_TARGET)
#undef LLVM_TARGET
  }

  inline void InitializeTargetMCs() {
#define LLVM_TARGET(TargetName) LLVMInitialize##TargetName##TargetMC();
    INITIALIZE_TARGETS(LLVM_TARGET)
#undef LLVM_TARGET
  }

  inline void InitializeAsmPrinters() {
#define LLVM_ASM_PRINTER(TargetName) LLVMInitialize##TargetName##AsmPrinter();
    INITIALIZE_TARGETS(LLVM_ASM_PRINTER)
#undef LLVM_ASM_PRINTER
  }

  inline void InitializeAsmParsers() {
#define LLVM_ASM_PARSER(TargetName) LLVMInitialize##TargetName##AsmParser();
    INITIALIZE_TARGETS(LLVM_ASM_PARSER)
#undef LLVM_ASM_PARSER
  }

  inline void InitializeDisassemblers() {
#define LLVM_DISASSEMBLER(TargetName) LLVMInitialize##TargetName##Disassembler();
    INITIALIZE_TARGETS(LLVM_DISASSEMBLER)
#undef LLVM_DISASSEMBLER
  }
} // namespace `anonymous`

static void LLVMInitializeEverything() {
  InitializeTargetInfos();
  InitializeTargets();
  InitializeTargetMCs();
  InitializeAsmPrinters();
  InitializeAsmParsers();
  InitializeDisassemblers();

  // Copied from llvm/tools/opt/optdriver.cpp
  //
  // Initialize passes
  PassRegistry &Registry = *PassRegistry::getPassRegistry();
  initializeCore(Registry);
  initializeScalarOpts(Registry);
  initializeAnalysis(Registry);
  initializeTransformUtils(Registry);
  initializeInstCombine(Registry);
  initializeTarget(Registry);
}
