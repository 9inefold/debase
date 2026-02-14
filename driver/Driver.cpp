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
#include "ArchiveHandler.hpp"
#include "FilePropertyCache.hpp"
#include "LLVMTargets.hpp"
#include "Magic.hpp"
#include "NameClassifier.hpp"
#include "SymbolFeatures.hpp"
#include "SymbolMatcher.hpp"
#include "Pattern.hpp"
#include "Triple.hpp"
#include "UniqueStringVector.hpp"
// General LLVM
#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Demangle/Demangle.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Option/OptTable.h"
#include "llvm/Option/Option.h"
#include "llvm/Support/FileSystem.h"
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
bool debase_tool::Verbose = false;

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
VerboseO("verbose",
  cl::desc("Output more runtime information"),
  cl::init(false), cl::cat(DebaseToolCategory),
  cl::callback([](const bool& IsVerbose) {
    Verbose = IsVerbose;
  }));

static cl::alias
VerboseA("V",
        cl::desc("Alias for '--verbose'"),
        cl::aliasopt(VerboseO),
        cl::cat(DebaseToolCategory));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished"),
           cl::init(false), cl::cat(DebaseToolCategory));

static cl::opt<bool>
AllowNoBI("allow-no-builtins", cl::Hidden,
          cl::desc("Ignore files which have no builtins"),
          cl::init(false), cl::cat(DebaseToolCategory));

static std::optional<std::string> ArchiveOnly;
static std::optional<std::string> OutputSuccessfulFilenames;

// The ArchiveOnly cl option
static cl::opt<std::string>
ArchiveOnlyOpt(
  "archive-only", cl::Hidden,
  cl::desc("Only archive the input files"),
  cl::cat(DebaseToolCategory), cl::ValueOptional,
  cl::callback([] (const std::string& ArchiveName) {
    if (!ArchiveName.empty())
      ArchiveOnly.emplace(ArchiveName);
    else
      ArchiveOnly.emplace("out.a");
  }));

// The OutputSuccessfulFilenames cl option
static cl::opt<std::string>
OutputSuccessfulFilenamesOpt(
  "output-filenames",
  cl::desc("Output a list of the updated files"),
  cl::cat(DebaseToolCategory), cl::ValueOptional,
  cl::callback([] (const std::string& OName) {
    if (!OName.empty())
      OutputSuccessfulFilenames.emplace(OName);
    else
      OutputSuccessfulFilenames.emplace("out.json");
  }));

static cl::opt<bool>
NoXArchives("no-archives",
            cl::desc("Disallow archive loading"),
            cl::cat(DebaseToolCategory));

// The following options were taken from llvm opt:

//static constexpr bool OutputAssembly = true;
static cl::opt<bool>
OutputAssembly("output-assembly",
               cl::desc("Output LLVM assembly instead of bitcode"),
               cl::cat(DebaseToolCategory));

//static cl::opt<bool>
//PrintPasses("print-passes",
//            cl::desc("Print available passes and exit"),
//            cl::cat(DebaseToolCategory));

static cl::opt<bool>
StripDebug("strip-debug",
           cl::desc("Strip debugger symbol info from translation unit"),
           cl::cat(DebaseToolCategory));

static cl::opt<bool>
StripNamedMetadata("strip-named-metadata",
                   cl::desc("Strip module-level named metadata"),
                   cl::cat(DebaseToolCategory));

static cl::opt<std::string>
TargetTriple("mtriple",
             cl::desc("Override target triple for module"),
             cl::cat(DebaseToolCategory));

static cl::opt<bool>
NoOutput("disable-output", cl::Hidden,
         cl::desc("Do not write result bitcode file"),
         cl::cat(DebaseToolCategory));

static cl::opt<bool>
NoVerify("disable-verify", cl::Hidden,
         cl::desc("Do not run the verifier"),
         cl::cat(DebaseToolCategory));

static cl::opt<bool>
VerifyDebugInfoPreserve(
  "verify-debuginfo-preserve",
  cl::desc("Start the pipeline with collecting and end it with checking of "
           "debug info preservation."),
  cl::cat(DebaseToolCategory));

static cl::opt<bool>
VerifyEach("verify-each",
           cl::desc("Verify after each transform"),
           cl::cat(DebaseToolCategory));

static cl::opt<std::string>
ClDataLayout("data-layout",
             cl::desc("data layout string to use"),
             cl::value_desc("layout-string"),
             cl::init(""), cl::cat(DebaseToolCategory));

static cl::opt<bool>
RunTwice("run-twice", cl::Hidden,
         cl::desc("Run all passes twice, re-using the same pass manager."),
         cl::init(false), cl::cat(DebaseToolCategory));

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
  WithColor::error(errs())
    << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note(errs()) << Hint << "\n";
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

#if 0
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
#endif

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
  /// The original filename.
  std::string LLFile;
  /// The matcher for the current module group.
  SymbolMatcher& SM;
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
  class Factory;
  
  DeBaser(StringRef Filename, SymbolMatcher& SM, StringRef Argv0)
    : LLFile(Filename), SM(SM), Argv0(Argv0) {
  }

  DeBaser(MemoryBufferRef IRFile, SymbolMatcher& SM, StringRef Argv0)
    : LLFile(IRFile.getBufferIdentifier()), SM(SM), Argv0(Argv0) {
  }

  ~DeBaser() {
    if (M) {
      assert(this->LoadedModule
          && "Forgot to set DeBaser::LoadedModule!");
      //DbgBuryPointer(std::move(M));
    }
  }

  DeBaser(DeBaser&&) = delete;
  DeBaser& operator=(DeBaser&&) = delete;
  DeBaser(const DeBaser&) = delete;
  DeBaser& operator=(const DeBaser&) = delete;

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
    return WithColor::error(errs());
  }

private:
  /// Gets a `PrevFunctionInfo` while updating the function.
  static PrevFunctionInfo GetInfoAndUpdate(Function* F, const SymbolFeatures& FFeats);
  /// Resets a `Function` using `PrevFunctionInfo`.
  static void ResetInfo(Function* F, const PrevFunctionInfo& Info);

  /// Common between both `loadModule` implementations.
  bool loadModuleCommon(StringRef Filename);
  /// Loads a `Module` from the specified file into `DeBaser::M`.
  bool loadModule(StringRef Filename, LLVMContext& Context);
  /// Loads a `Module` from the specified buffer into `DeBaser::M`.
  bool loadModule(MemoryBufferRef IRFile, LLVMContext& Context);
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

/// A utility for creating new debaser objects.
class DeBaser::Factory {
  SymbolMatcher& SM;
  std::string Argv0;
public:
  Factory(SymbolMatcher& SM, const char* Argv0) :
   SM(SM), Argv0(Argv0) {}
  
  static LLVMContext& ctx() {
    static thread_local LLVMContext Context;
    return Context;
  }
  
  std::unique_ptr<DeBaser> New(StringRef Filename) {
    std::unique_ptr<DeBaser> DB(
        new DeBaser(Filename, SM, Argv0));
    if (!DB->loadModule(Filename, this->ctx()))
      return nullptr;
    if (LLVM_UNLIKELY(!DB->LoadedModule)) {
      // Unfortunately, we have failed... Return nothing.
      return nullptr;
    }
    return DB;
  }

  std::unique_ptr<DeBaser> From(MemoryBufferRef IRFile) {
    std::unique_ptr<DeBaser> DB(
        new DeBaser(IRFile, SM, Argv0));
    if (!DB->loadModule(IRFile, this->ctx()))
      return nullptr;
    if (LLVM_UNLIKELY(!DB->LoadedModule)) {
      // Unfortunately, we have failed... Return nothing.
      return nullptr;
    }
    return DB;
  }
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
    for (FunctionPass* P : Passes)
      if (P->runOnFunction(*F))
        DidModify = true;
    // ...
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

bool DeBaser::loadModuleCommon(StringRef Filename) {
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

/// Loads a `Module` from the specified buffer into `DeBaser::M`.
bool DeBaser::loadModule(MemoryBufferRef IRFile, LLVMContext& Context) {
  if (LLVM_UNLIKELY(LoadedModule)) {
    error() << "Module has already been loaded as '"
            << M->getName() << "'!\n";
    return false;
  }

  SMDiagnostic Err;
  M = parseIR(IRFile, Err, Context);
  if (!M) {
    //if (!isASCII(IRFile.getBuffer()))
    Err.print(Argv0.data(), error());
    return false;
  }

  return loadModuleCommon(IRFile.getBufferIdentifier());
}

bool DeBaser::loadModule(StringRef Filename, LLVMContext& Context) {
  if (LLVM_UNLIKELY(LoadedModule)) {
    if (Filename == M->getName())
      return true;
    error() << "Module for '" << Filename
      << "' has already been loaded as '" << M->getName() << "'!\n";
    return false;
  }

  SMDiagnostic Err;
  M = parseIRFile(Filename, Err, Context);
  if (!M) {
    
    Err.print(Argv0.data(), error());
    return false;
  }

  return loadModuleCommon(Filename);
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
  sys::path::append(OutPath, sys::path::filename(LLFile).split('.').first);
  sys::path::replace_extension(OutPath, OutputAssembly ? ".ll" : ".bc");
  if (auto EC = sys::fs::make_absolute(OutPath)) {
    errs() << "For '" << OutPath.str() << "'" << EC.message() << '\n';
    return EC;
  }
  sys::path::remove_dots(OutPath);
  // Open file
  ErrorOr<int> FDOrErr = CreateToolOutputFile(OutPath.str());
  if (auto EC = FDOrErr.getError()) {
    errs() << "While opening '" << OutPath.str() << "'"
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
    errs() << "While writing '" << OutPath.str() << "'" << EC.message() << '\n';
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

  //if (PrintPasses) {
  //  PassBuilder PB;
  //  PB.printPassNames(outs());
  //  return 0;
  //}

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
        << "Error creating '" << Dir << "': "
        << EC.message() << '\n';
      return 1;
    }
  }

  auto SM = std::make_unique<SymbolMatcher>();
  //LLVMContext Context;

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
      << "Loaded config '" << Conf << "'.\n";
  }
  if (ValidFilenames.empty()) {
    WithColor::error(errs())
      << "No valid input files were provided!";
    return 1;
  }

  if (ArchiveOnly) {
    vbss() << "Only running archiver!\n";
    SmallString<80> ArchivePath(OutputFilepath.getValue());
    sys::path::append(ArchivePath, *ArchiveOnly);
    // Create FD
    StringRef ArName = ArchivePath.str();
    errs() << "Generated archive: '" << ArName << "'!\n";
    //ErrorOr<int> FDOrErr = CreateToolOutputFile(ArName, false);
    //if (auto EC = FDOrErr.getError()) {
    //  WithColor::error(errs())
    //    << "Failed to create archive: "
    //    << EC.message() << "\n";
    //  return 1;
    //}
    //raw_fd_ostream OS(*FDOrErr, true);
    //if (Error E = createARFile(OS, ArName, ValidFilenames)) {
    if (Error E = createARFile(ArName, ValidFilenames)) {
      WithColor::error(errs())
        << "Failed to create archive: "
        << toString(std::move(E)) << "\n";
      return 1;
    }

    errs() << "Generated archive: '" << ArName << "'!\n";
    return 0;
  }

  //std::vector<std::unique_ptr<MemoryBuffer>> ArchiveFiles;
  BumpPtrAllocator ArBP;
  std::vector<MemoryBufferRef> ExtraModuleFiles;

  /// Returns true if parsing should continue (.ll or .bc).
  /// Otherwise an archive was saved and should be handled later.
  auto LoadIROrArchive = [&] (StringRef Filename, std::unique_ptr<MemoryBuffer>& Out) -> bool {
    ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrError
        = MemoryBuffer::getFile(Filename, /*IsText=*/false);
    if (auto EC = FileOrError.getError()) {
      WithColor::error(errs())
        << "Error loading '" << Filename << "': "
        << EC.message() << '\n';
      debase_tool::exitP(1);
      return false;
    }

    // Load file so we can see its contents
    std::unique_ptr<MemoryBuffer> FileBuffer = std::move(*FileOrError);
    file_magic FileKind = identify_magic_ex(FileBuffer->getBuffer());

    // bitcode would either be a real .bc file or a detected .ll file      
    if (FileKind == file_magic::bitcode) {
      Out = std::move(FileBuffer);
      return true;
    }
    // Check if this is some unsupported type
    if (FileKind != file_magic::archive) {
      WithColor::error(errs())
        << "Error loading '" << Filename << "': "
        << "unsupported file type '" << file_magic_name(FileKind) << "'\n";
      debase_tool::exitP(1);
      return false;
    } else if (NoXArchives) {
      WithColor::error(errs())
        << "Error loading '" << Filename << "': "
        << "archive files not allowed with '--no-archives'\n";
      debase_tool::exitP(1);
      return false;
    }

    // Now try and parse the archive contents.
    if (Error E = extractInMemoryARFile(*FileBuffer, ExtraModuleFiles, ArBP)) {
      std::string ErrMsg = toString(std::move(E));
      WithColor::error(errs()) << ErrMsg << '\n';
      debase_tool::exitP(1);
    }

    return false;
  };

  // The following was copied from llvm/tools/opt/optdriver.cpp
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

  if (OutputSuccessfulFilenames) {
    if (Error E = LoadToolOutputFile(*OutputSuccessfulFilenames)) {
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
  DeBaser::Factory DBFactory(*SM, Argv[0]);

  ItaniumClassifier IClass;
  MSVCClassifier MClass;

  /// Handles the actual debasing implementation based on local variables.
  auto HandleDebasing = [&] (DeBaser* DB, StringRef Filename) {
    //LLVMContext LocalCtx;
    vbss() << "File: " << Filename << '\n';
    if (DB == nullptr) {
      WithColor::warning(errs())
        << "Failed to generate module for '"
        << Filename << "'.\n";
      debase_tool::exitP(1);
      return;
    }

    llvm::Triple T = DB->getTriple();
    auto IsItanium = checkTripleTargetSymbolType(T);
    if (!IsItanium.has_value()) {
      errs() << "Invalid triple for '" << Filename
             << "': " << T.getTriple() << "\n";
      return;
    }

    if (*IsItanium)
      DB->setNameDemangler(&IClass);
    else
      DB->setNameDemangler(&MClass);

    if (!DB->loadRefsAndBuiltins()) {
      if (!AllowNoBI)
        errs() << "Unable to load builtins for '" << Filename << "'\n";
      return;
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
  };

  // Handle loading llvmir/bitcode files and dispatching archives. 
  for (StringRef Filename : ValidFilenames) {
    if (Filename.empty())
      continue;

    // Check if this is a recognized format
    if (!Filename.ends_with(".ll") && !Filename.ends_with(".bc")) {
      std::unique_ptr<MemoryBuffer> Out;
      if (!LoadIROrArchive(Filename, Out))
        continue;
      assert(Out && "Didn't actually load file?");
      std::unique_ptr<DeBaser> DB = DBFactory.From(*Out);
      HandleDebasing(DB.get(), Filename);
      continue;
    }

    std::unique_ptr<DeBaser> DB = DBFactory.New(Filename);
    HandleDebasing(DB.get(), Filename);
  }

  // Handle loading llvmir/bitcode files and dispatching archives.
  for (MemoryBufferRef Data : ExtraModuleFiles) {
    std::unique_ptr<DeBaser> DB = DBFactory.From(Data);
    HandleDebasing(DB.get(), Data.getBufferIdentifier());
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
