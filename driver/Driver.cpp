//===- driver/Driver.cpp --------------------------------------------------===//
//
// Copyright (C) 2025 Eightfold
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
#include "UnlinkRefs.hpp"
#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
// #include "llvm/ADT/SetVector.h"
#include "llvm/ADT/StringExtras.h"
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

#ifndef NDEBUG
# include "llvm/Support/BuryPointer.h"
# define DbgBuryPointer(...) ::llvm::BuryPointer(__VA_ARGS__)
#else
# define DbgBuryPointer(...) ((void)0)
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
               cl::desc("<input file>"),
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
        cl::desc("Alias for '-verbose'"),
        cl::aliasopt(Verbose),
        cl::cat(DebaseToolCategory));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished"),
           cl::init(false), cl::cat(DebaseToolCategory));

// The following options were taken from llvm opt:
static cl::OptionCategory& OptToolCategory = DebaseToolCategory;

// Always enabled!
static constexpr bool OutputAssembly = true;

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

static bool FixupFilename(std::string& InFilename) {
  SmallString<128> Filename{StringRef(InFilename)};
  if (auto EC = sys::fs::make_absolute(Filename)) {
    exitOrLogWithError(EC.message());
    InFilename.clear();
    return false;
  }
  if (!sys::fs::exists(Filename)) {
    exitOrLogWithError(Twine("'") + Filename.str() + "' does not exist!");
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

/// On some versions `Module::setTargetTriple` takes a `StringRef`, on others
/// it takes... a `Triple`. This utility helps keep things smooth.
class SetTargetTripleCtorCast {
  std::string Data;
public:
  SetTargetTripleCtorCast(StringRef Unnormalized) : 
    Data(Triple::normalize(Unnormalized)) {}
  SetTargetTripleCtorCast(const std::string& Unnormalized) :
    SetTargetTripleCtorCast(StringRef(Unnormalized)) {}
  
  operator StringRef() const { return StringRef(Data); }
  operator Triple() const { return Triple(Data); }
};

/// Initializes literally everything. Might be able to pull back a bit...
static void LLVMInitializeEverything();
/// Gets the OptLevel of `-O1`.
static CodeGenOptLevel GetCodeGenOptLevel() { return CodeGenOptLevel::Less; } 
/// Gets some basic passes we can run on functions.
static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification();

static bool LoadUnlinks(SmallVectorImpl<std::string>& Unlinks) {
  static constexpr StringRef ExampleUnlinks[] {
    "A", "B", "C",
    //"D<*>",
    //"\"e::*\""
  };
  // TODO: Load unlinks from a file...
  constexpr std::size_t N = std::size(ExampleUnlinks);
  Unlinks.append(ExampleUnlinks, ExampleUnlinks + N);
  return true;
}

namespace {

/// The actual implementation of the debaser.
class DeBaser {
  /// The diagnostic engine for the current module.
  SMDiagnostic Err;
  /// The matcher for the current module group.
  UnlinkRefs& Refs;
  /// The commandline (for diagnostics).
  char* const* Argv = nullptr;

  /// Stores all the attribute data from our matched functions so they can be
  /// restored later. This allows for passes which would otherwise be harder
  /// to deal with.
  struct PrevFunctionInfo {
    bool HadNoinline : 1 = false;
    bool HadAlwaysinline : 1 = false;
    //bool HadUsed : 1 = false;
  };

  /// The module itself.
  std::unique_ptr<Module> M = nullptr;
  /// The map of `(ReferencedFunc*, PrevInfo)` tuples.
  SmallDenseMap<Function*, PrevFunctionInfo> LocatedRefs;
  // Builtins...
  Function* BI__debase_mark_begin = nullptr;
  Function* BI__debase_mark_end = nullptr;
  Function* BI__debase_continuation = nullptr;

  /// The number of simple references encountered.
  unsigned EncounteredSimple = 0;
  /// The number of complex references encountered.
  /// Unlike `EncounteredSimple`, this can vary.
  unsigned EncounteredComplex = 0;

  bool LoadedModule : 1 = false;
  bool SetUnlinks : 1 = false;
  bool LastCheck : 1 = true;
  bool DidCleanup : 1 = false;

public:
  /// A utility for creating new debaser objects.
  class Factory {
    UnlinkRefs& Refs;
    LLVMContext& Context;
    char* const* Argv = nullptr;
  public:
    Factory(UnlinkRefs& Refs, char** Argv, LLVMContext& Context) :
     Refs(Refs), Context(Context), Argv(Argv) {}
    
    std::optional<DeBaser> New(StringRef Filename) {
      std::optional<DeBaser> DB;
      DB.emplace(Filename, Refs, Argv, Context);
      if (!DB->LoadedModule || !DB->SetUnlinks || !DB->LastCheck) {
        // Unfortunately, we have failed... Return nothing.
        return std::nullopt;
      }
      return DB;
    }
  };

  DeBaser(StringRef Filename, UnlinkRefs& Refs,
          char* const* Argv, LLVMContext& Context);

  DeBaser(DeBaser&&) = default;
  //DeBaser& operator=(DeBaser&&) = default;
  DeBaser(const DeBaser&) = delete;
  DeBaser& operator=(const DeBaser&) = delete;

  ~DeBaser() {
    if (M) {
      assert(this->LoadedModule
          && "Forgot to set DeBaser::LoadedModule!");
      DbgBuryPointer(std::move(M));
    }
  }

  /// Runs a set of passes on our collected functions.
  /// @return `true` if the function was modified.
  void runPasses(const std::vector<FunctionPass*>& Passes, StringRef PassName = "") {
    for (auto [F, _] : LocatedRefs) {
      bool DidModify = false;
      for (FunctionPass* P : Passes) {
        if (Verbose) {
          WithColor::note(outs(), PassName)
            << "Pass: " << P->getPassName() << "\n";
          outs().flush();
        }
        if (P->runOnFunction(*F))
          DidModify = true;
      }
      if (DidModify && Verbose) {
        WithColor::note(outs(), PassName)
          << F->getName() << " was modified.\n";
      }
    }
  }

  raw_ostream& error() {
    return WithColor::error(errs(), Argv[0]);
  }

private:
  /// Loads a `Module` from the specified file into `DeBaser::M`.
  bool loadModule(StringRef Filename, LLVMContext& Context);

  /// Gets a `PrevFunctionInfo` while updating the function.
  static PrevFunctionInfo GetInfoAndUpdate(Function* F);
  /// Loads references matching the provided list, updating their attributes.
  bool loadAndUpdateRefsFromModule();
};

} // namespace `anonymous`

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
  
  LLVMContext Context;

  if (PrintPasses) {
    PassBuilder PB;
    PB.printPassNames(outs());
    return 0;
  }

  if (InputFilenames.empty()) {
    WithColor::error(errs(), Argv[0])
      << "No input files provided!";
    return 1;
  }

  // TODO: Unique filenames.
  SmallVector<StringRef, 1> ValidFilenames;
  for (auto& Filename : InputFilenames)
    if (FixupFilename(Filename))
      ValidFilenames.emplace_back(Filename);

  if (ValidFilenames.empty()) {
    WithColor::error(errs(), Argv[0])
      << "No valid input files were provided!";
    return 1;
  }

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
  // The pointer holding all the Modules output files.
  std::unique_ptr<ToolOutputFile> Out;
  auto LoadToolOutputFile = [&](StringRef Filename) -> Error {
    using namespace std::literals;
    SmallString<128> Path;
    // Default to standard output.
    if (OutputFilepath.empty())
      Path.append(sys::path::parent_path(Filename));
    else
      Path.append(OutputFilepath);
    if (!Filename.consume_back(".ll"))
      return MakeError("Invalid filename"s + Filename.str());
    StringRef Stem = sys::path::filename(Filename);
    sys::path::append(Path, Twine(Stem) + ".out.ll");

    std::error_code EC;
    sys::fs::OpenFlags Flags =
        OutputAssembly ? sys::fs::OF_TextWithCRLF : sys::fs::OF_None;
    Out.reset(new ToolOutputFile(Path.str(), EC, Flags));
    if (EC)
      return errorCodeToError(EC);
    // Boss.
    return Error::success();
  };

  Triple LastModuleTriple;
  std::unique_ptr<TargetMachine> TM;
  std::optional<TargetLibraryInfoImpl> TLII;
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
      M->setTargetTriple(Triple::normalize(TargetTriple));
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

    if (NoOutput) {
      if (!OutputFilepath.empty())
        errs() << "WARNING: The -o (output path) option is ignored when\n"
                  "the -disable-output option is used.\n";
    } else {
      if (Error E = LoadToolOutputFile(Filename))
        return E;
    }

    Triple ModuleTriple(M->getTargetTriple());
    const bool SameTriple = 
      (LastModuleTriple == ModuleTriple);
    std::string CPUStr, FeaturesStr;
    if (!SameTriple) {
      // Only reinitialize when triple differs.
      if (ModuleTriple.getArch()) {
        auto* volatile GetMCPU = &codegen::getMCPU;
        std::string XCPU = (*GetMCPU)();
        CPUStr = codegen::getCPUStr();
        FeaturesStr = codegen::getFeaturesStr();
        Expected<std::unique_ptr<TargetMachine>> ExpectedTM =
            codegen::createTargetMachineForTriple(ModuleTriple.str(),
                                                  GetCodeGenOptLevel());
        if (auto E = ExpectedTM.takeError()) {
          errs() << Argv[0] << ": WARNING: failed to create target machine for '"
                 << ModuleTriple.str() << "': " << toString(std::move(E)) << "\n";
          TM.reset();
        } else {
          TM = std::move(*ExpectedTM);
        }
      } else if (ModuleTriple.getArchName() != "unknown" &&
                 ModuleTriple.getArchName() != "") {
        std::string Out; raw_string_ostream(Out)
          << Argv[0] << ": unrecognized architecture '"
          << ModuleTriple.getArchName() << "' provided.\n";
        return MakeError(std::move(Out));
      }
    }

    // Override function attributes based on CPUStr, FeaturesStr, and command
    // line flags.
    codegen::setFunctionAttributes(CPUStr, FeaturesStr, *M);

    if (!SameTriple) {
      TLII.emplace(ModuleTriple);
      LastModuleTriple = std::move(ModuleTriple);
    }

    WithColor::note(vbss())
      << "Successfully loaded '" << Filename << "'!\n";
    return M;
  };

  // TODO: Load unlinks from a file...
  SmallVector<std::string, 8> ExampleUnlinks;
  LoadUnlinks(ExampleUnlinks);
  // Compile the references...
  UnlinkRefs Refs(ExampleUnlinks);
  if (Refs.didFail()) {
    WithColor::error(errs(), Argv[0])
      << "Failed generating unlink references!";
    return 1;
  }

  Expected<std::unique_ptr<Module>> FirstModuleOrError = 
    LoadModuleFromFile(ValidFilenames.front());
  if (Error E = FirstModuleOrError.takeError()) {
    errs() << toString(std::move(E)) << '\n';
    if (!Permissive)
      return 1;
    if (!TLII.has_value())
      return 1;
  }

  DebugifyCustomPassManager Passes;
  Passes.add(new TargetLibraryInfoWrapperPass(*TLII));

  // Add internal analysis passes from the target machine.
  Passes.add(createTargetTransformInfoWrapperPass(TM ? TM->getTargetIRAnalysis()
                                                     : TargetIRAnalysis()));

  if (TM) {
    auto& LTM = static_cast<LLVMTargetMachine&>(*TM);
    Pass* TPC = LTM.createPassConfig(Passes);
    Passes.add(TPC);
  }

  // Get the passes to be run before analysis.
  auto O1OptPasses = GetO1PassesRequiredForSimplification();

  DeBaser::Factory DBFactory(Refs, Argv, Context);
  for (StringRef Filename : ValidFilenames) {
    if (Filename.empty())
      continue;

    Expected<std::unique_ptr<Module>> ModuleOrError
      = LoadModuleFromFile(Filename);
    if (Error E = ModuleOrError.takeError()) {
      errs() << toString(std::move(E)) << '\n';
      if (Permissive)
        continue;
      return 1;
    }

#if 0
    auto DB = DBFactory.New(Filename);
    if (!DB.has_value()) {
      if (!Permissive)
        return 1;
      WithColor::warning(errs(), Argv[0])
        << "Failed to generate module for '"
        << Filename << "'.\n";
      continue;
    }
#endif
    //DB->runPasses(O1OptPasses);
  }
}

////////////////////////////////////////////////////////////////////////////////

DeBaser::DeBaser(StringRef Filename, UnlinkRefs& Refs,
                 char* const* Argv, LLVMContext& Context)
     : Refs(Refs), Argv(Argv) {
  assert(!Refs.didFail());
  if (!loadModule(Filename, Context))
    return;
  if (!loadAndUpdateRefsFromModule())
    return;
  // Load builtins...
  BI__debase_mark_begin   = M->getFunction("__debase_mark_begin");
  BI__debase_mark_end     = M->getFunction("__debase_mark_end");
  BI__debase_continuation = M->getFunction("__debase_continuation");
}

bool DeBaser::loadModule(StringRef Filename, LLVMContext& Context) {
  if (LoadedModule) {
    if (Filename == M->getName())
      return true;
    error() << "Module for '" << Filename
      << "' has already been loaded as '" << M->getName() << "'!\n";
    return false;
  }

  M = parseIRFile(Filename, Err, Context);
  if (!M) {
    Err.print(Argv[0], error());
    return false;
  }

  assert(Filename == M->getName());
  this->LoadedModule = true;
  return true;
}

#define SetInfoWithAttrKind(MEMBER, KIND) do {                                \
  Info.MEMBER = F->hasFnAttribute(KIND);                                      \
  if (!Info.MEMBER)                                                           \
    F->addFnAttr(KIND);                                                       \
} while(0)

DeBaser::PrevFunctionInfo DeBaser::GetInfoAndUpdate(Function* F) {
  using AttrKind = Attribute::AttrKind;
  PrevFunctionInfo Info {};
  SetInfoWithAttrKind(HadNoinline, AttrKind::NoInline);
  // SetInfoWithAttrKind(Info.HadAlwaysinline, AttrKind::AlwaysInline);
  // SetInfoWithAttrKind(HadUsed, AttrKind::Used?);
  return Info;
}

bool DeBaser::loadAndUpdateRefsFromModule() {
  for (Function& F : M->getFunctionList()) {
    if (!Refs.match(F.getName()))
      continue;
    // TODO: Switch when complex added.
    ++EncounteredSimple;

    auto [It, DidEmplace] = LocatedRefs.try_emplace(&F);
    if (LLVM_UNLIKELY(!DidEmplace)) {
      if (!Permissive) {
        error() << "Duplicate definition of "
          << F.getName() << "??\n";
        return false;
      }
      continue;
    }

    It->second = GetInfoAndUpdate(&F);
    if (Verbose) {
      WithColor::note(outs())
        << "Found " << F.getName() << '\n';
    }
  }

  if (Strict && EncounteredSimple != Refs.simpleCount()) {
    error()
      << "In '-strict' all simple definitions are required to be encountered. Only "
      << EncounteredSimple << " were encountered, when "
      << Refs.simpleCount() << " were required.\n";
    return false;
  }

  this->SetUnlinks = true;
  return true;
}

static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification() {
  // TODO: Use PassBuilder!!!!
  std::vector<FunctionPass*> Out;
  Out.reserve(4);
  // EntryExitInstrumenterPass
  // AlwaysInlinerPass?
  // CoroConditionalPass
  // AnnotationRemarksPass
  //Out.push_back(createCFGSimplificationPass());
  Out.push_back(createSROAPass(false));
  Out.push_back(createInstructionCombiningPass());
  return Out;
}

#if !LLVM_VERSION_MIN(12)
#define initializeScalarizeMaskedMemIntrinLegacyPassPass(Registry) (void(0))
#endif
#if !LLVM_VERSION_MIN(13)
#define initializeReplaceWithVeclibLegacyPass(Registry) (void(0))
#endif
#if !LLVM_VERSION_MIN(15)
#define initializeExpandLargeDivRemLegacyPassPass(Registry) (void(0))
#define initializeJMCInstrumenterPass(Registry) (void(0))
#define initializeSelectOptimizePass(Registry) (void(0))
#endif
#if !LLVM_VERSION_MIN(17)
#define initializeCallBrPreparePass(Registry) (void(0))
#endif
#if !LLVM_VERSION_MIN(19)
#define initializeAtomicExpandLegacyPass(Registry) (void(0))
#define initializePostInlineEntryExitInstrumenterPass(Registry) (void(0))
#endif
#if !LLVM_VERSION_MIN(21)
#define initializeExpandFpLegacyPassPass(Registry) (void(0))
#endif

static void LLVMInitializeEverything() {
  InitializeAllTargetInfos();
  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmPrinters();
  InitializeAllAsmParsers();
  InitializeAllDisassemblers();

  // Copied from llvm/tools/opt/optdriver.cpp
  //
  // Initialize passes
  PassRegistry &Registry = *PassRegistry::getPassRegistry();
  initializeCore(Registry);
  initializeScalarOpts(Registry);
  initializeVectorization(Registry);
  initializeIPO(Registry);
  initializeAnalysis(Registry);
  initializeTransformUtils(Registry);
  initializeInstCombine(Registry);
  initializeTarget(Registry);
  // For codegen passes, only passes that do IR to IR transformation are
  // supported.
  initializeExpandLargeDivRemLegacyPassPass(Registry);
  initializeExpandFpLegacyPassPass(Registry);
  initializeExpandMemCmpLegacyPassPass(Registry);
  initializeScalarizeMaskedMemIntrinLegacyPassPass(Registry);
  initializeSelectOptimizePass(Registry);
  initializeCallBrPreparePass(Registry);
  initializeCodeGenPrepareLegacyPassPass(Registry);
  initializeAtomicExpandLegacyPass(Registry);
  initializeWinEHPreparePass(Registry);
  initializeDwarfEHPrepareLegacyPassPass(Registry);
  initializeSafeStackLegacyPassPass(Registry);
  initializeSjLjEHPreparePass(Registry);
  initializePreISelIntrinsicLoweringLegacyPassPass(Registry);
  initializeGlobalMergePass(Registry);
  initializeIndirectBrExpandLegacyPassPass(Registry);
  initializeInterleavedLoadCombinePass(Registry);
  initializeInterleavedAccessPass(Registry);
  initializePostInlineEntryExitInstrumenterPass(Registry);
  initializeUnreachableBlockElimLegacyPassPass(Registry);
  initializeExpandReductionsPass(Registry);
  initializeWasmEHPreparePass(Registry);
  initializeWriteBitcodePassPass(Registry);
  initializeReplaceWithVeclibLegacyPass(Registry);
  initializeJMCInstrumenterPass(Registry);
}
