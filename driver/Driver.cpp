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
#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
// #include "llvm/ADT/SetVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringSet.h"
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
#include "llvm/Target/TargetMachine.h"
#include "llvm/TargetParser/Host.h"
#include "llvm/TargetParser/SubtargetFeature.h"
#include "llvm/TargetParser/Triple.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
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
InputFilenames(cl::Positional, cl::OneOrMore,
               cl::desc("<input file>"),
               cl::cat(DebaseToolCategory));

static cl::opt<std::string>
OutputFilename("o",
               cl::desc("Output filename"), cl::value_desc("filename"),
               cl::init("-"), cl::cat(DebaseToolCategory));

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
    errs() << "-M" << unsigned(M) << '\n';
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
        cl::desc("Output more runtime information."),
        cl::init(false), cl::cat(DebaseToolCategory));

static cl::alias
VerboseA("V",
        cl::desc("Alias for '-verbose'."),
        cl::aliasopt(Verbose),
        cl::cat(DebaseToolCategory));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished."),
           cl::init(false), cl::cat(DebaseToolCategory));

} // namespace debase_tool

[[noreturn]] static void exitWithError(Twine Msg, std::string Hint = "") {
  errs() << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note() << Hint << "\n";
  errs().flush();
  std::exit(1);
}

static void FixupFilename(std::string& InFilename) {
  SmallString<128> Filename{StringRef(InFilename)};
  if (auto EC = sys::fs::make_absolute(Filename))
    exitWithError(EC.message());
  if (!sys::fs::exists(Filename))
    exitWithError(Twine("'") + Filename.str() + "' does not exist!");
  InFilename = static_cast<std::string>(Filename);
}

static bool ParseCLArgs(int argc, char* const* argv) {
  cl::AddExtraVersionPrinter([](raw_ostream& OS) {
    OS << DEBASE_VENDOR_NAME  << ":\n  ";
    OS << DEBASE_PACKAGE_NAME << " version "
       << DEBASE_PACKAGE_VERSION;
    OS << ".\n";
  });
  cl::HideUnrelatedOptions(DebaseToolCategory);
  return cl::ParseCommandLineOptions(argc, argv,
    "debaser compile pass\n", &errs());
}

////////////////////////////////////////////////////////////////////////////////

/// Initializes literally everything. Might be able to pull back a bit...
static void LLVMInitializeEverything();

/// Gets some basic passes we can run on functions.
static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification();

static int DebaseModules(ArrayRef<std::string> Filenames,
                         ArrayRef<std::string> Unlinks,
                         char** argv, LLVMContext& Context);

static constexpr StringRef ExampleUnlinks[] {
  "A", "B", "C",
  //"D<*>",
  //"\"e::*\""
};

int main(int argc, char** argv) {
  InitLLVM X(argc, argv);
  LLVMInitializeEverything();

  if (!ParseCLArgs(argc, argv))
    exitWithError("Failed to parse commandline arguments!");
  if (Strict && Permissive)
    exitWithError("'-strict' and '-permissive' cannot be used together!");
  // Make any paths absolute.
  for (auto& Filename : InputFilenames)
     FixupFilename(Filename);
  
  std::vector<std::string> StrUnlinks(
    std::begin(ExampleUnlinks), std::end(ExampleUnlinks));
  
  LLVMContext Context;
  return DebaseModules(
    InputFilenames, StrUnlinks,
    argv, Context
  );
}

template <typename...ArgsT>
static Error MakeError(ArgsT&&...Args) {
  return createStringError(
    llvm::inconvertibleErrorCode(),
    std::forward<ArgsT>(Args)...
  );
}

////////////////////////////////////////////////////////////////////////////////
// UnlinkRefs

namespace {

/// Holds all the unlink identifiers which can be searched through later.
class UnlinkRefs {
  BumpPtrAllocator BP;
  /// The set of simple names.
  StringSet<BumpPtrAllocator&> SimpleUnlinks;
  /// Blah blah
  bool Failed = false;

public:
  UnlinkRefs(ArrayRef<std::string> Unlinks) : SimpleUnlinks(BP) {
    this->compileUnlinks(Unlinks);
  }

  bool didFail() const { return Failed; }
  size_t simpleCount() const { return SimpleUnlinks.size(); }
  size_t complexCount() const { return 0; }

  /// Tries to match a function name against every ref.
  bool match(StringRef Name) {
    assert(!Failed);
    return SimpleUnlinks.contains(Name);
  }

private:
  /// "Compiles" the unlink data.
  void compileUnlinks(ArrayRef<std::string> Unlinks);
  /// Gets the symbol for a simple symbol.
  void compileSimpleUnlink(StringRef FullName);
  /// Writes a simple name to `SimpleUnlinks`.
  void addSimpleUnlink(ArrayRef<StringRef> Parts);
  /// If not permissive, sets `Failed` to `true`, otherwise prints `Msg` to `errs()`.
  void failOrPrint(StringRef Msg = "") {
    if (!Permissive)
      this->Failed = true;
    else
      errs() << Msg;
  }
};

} // namespace `anonymous`

void UnlinkRefs::addSimpleUnlink(ArrayRef<StringRef> Parts) {
  SmallString<128> MangledName;
  raw_svector_ostream OS(MangledName);

  OS << "_ZN";
  if (Parts.front() == "std") {
    OS << "St";
    Parts = Parts.drop_front();
  }
  for (StringRef Part : Parts)
    OS << Part.size() << Part;
#if 0
  // [deleting destructor]
  OS << "D0Ev";
  SimpleUnlinks.insert(MangledName);
  MangledName.pop_back_n(4);
#endif
  // [base object destructor]
  OS << "D2Ev";
  SimpleUnlinks.insert(MangledName);
}

LLVM_ATTRIBUTE_NOINLINE static
bool CompareSimpleNSSplit(StringRef FullName, ArrayRef<StringRef> Parts) {
  SmallVector<StringRef, 8> OtherParts;
  FullName.split(OtherParts, "::", -1, true);
  return Parts.equals(OtherParts);
}

void UnlinkRefs::compileSimpleUnlink(StringRef FullName) {
  SmallVector<StringRef, 8> Parts;
  FullName.split(Parts, "::", -1, false);
  if (Strict && !CompareSimpleNSSplit(FullName, Parts)) {
    errs() << "Invalid name: '" << FullName << "'. Contains empty parts.\n";
    this->Failed = true;
    return;
  }

  for (StringRef& Part : Parts)
    // Remove leading and trailing spaces.
    Part = Part.ltrim().rtrim();
  // Generate the mangled symbols.
  this->addSimpleUnlink(Parts);
}

void UnlinkRefs::compileUnlinks(ArrayRef<std::string> Unlinks) {
  for (StringRef FullName : Unlinks) {
    const auto FirstNonRegularChar
      = FullName.find_first_of("?*+@$[]<>");
    if (FirstNonRegularChar != StringRef::npos) {
      errs() << "Unimplemented identifier type: '"
        << FullName << "' (only simple IDs are supported). ";
      failOrPrint("Skipping.");
      errs() << '\n';
      continue;
    }
    this->compileSimpleUnlink(FullName);
  }
}

////////////////////////////////////////////////////////////////////////////////
// Debaser

namespace {

/// The actual implementation of the debaser.
class DeBaser {
  /// The diagnostic engine for the current module.
  SMDiagnostic Err;
  /// The matcher for the current module group.
  UnlinkRefs& Refs;
  /// The commandline (for diagnostics).
  char* const* Argv = nullptr;

  struct PrevFunctionInfo {
    bool HadNoinline : 1 = false;
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

  unsigned EncounteredSimples = 0;

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
      if (!DB->LoadedModule
       || !DB->SetUnlinks
       || !DB->LastCheck) {
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

private:
  static PrevFunctionInfo GetInfoAndUpdate(Function* F);

  bool loadModule(StringRef Filename, LLVMContext& Context) {
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

  bool loadAndUpdateRefsFromModule();

  raw_ostream& error() {
    return WithColor::error(errs(), Argv[0]);
  }
};

} // namespace `anonymous`

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

#define SetInfoWithAttrKind(MEMBER, KIND) do {                                \
  Info.MEMBER = F->hasFnAttribute(KIND);                                      \
  if (!Info.MEMBER)                                                            \
    F->addFnAttr(KIND);                                                        \
} while(0)

DeBaser::PrevFunctionInfo DeBaser::GetInfoAndUpdate(Function* F) {
  using AttrKind = Attribute::AttrKind;
  PrevFunctionInfo Info {};
  SetInfoWithAttrKind(HadNoinline, AttrKind::NoInline);
  // SetInfoWithAttrKind(HadUsed, AttrKind::Used?);
  return Info;
}

bool DeBaser::loadAndUpdateRefsFromModule() {
  for (Function& F : M->getFunctionList()) {
    if (!Refs.match(F.getName()))
      continue;
    // TODO: Switch when complex added.
    ++EncounteredSimples;

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

  if (Strict && EncounteredSimples != Refs.simpleCount()) {
    error()
      << "In '-strict' all simple definitions are required to be encountered. Only "
      << EncounteredSimples << " were encountered, when "
      << Refs.simpleCount() << " were required.\n";
    return false;
  }

  this->SetUnlinks = true;
  return true;
}

static int DebaseModules(ArrayRef<std::string> Filenames,
                         ArrayRef<std::string> Unlinks,
                         char** Argv, LLVMContext& Context) {
  // ...
  if (Filenames.empty()) {
    WithColor::error(errs(), Argv[0])
      << "No input files provided!";
    return 1;
  }

  UnlinkRefs Refs(Unlinks);
  if (Refs.didFail()) {
    WithColor::error(errs(), Argv[0])
      << "Failed generating unlink references!";
    return 1;
  }

  DeBaser::Factory DBFactory(Refs, Argv, Context);
  auto O1OptPasses = GetO1PassesRequiredForSimplification();
  for (StringRef Filename : Filenames) {
    auto DB = DBFactory.New(Filename);
    if (!DB.has_value()) {
      if (!Permissive)
        return 1;
      WithColor::warning(errs(), Argv[0])
        << "Failed to generate module '"
        << Filename << "'.\n";
      continue;
    }
    
    //DB->runPasses(O1OptPasses);
  }

  return 0;
}

static int DebaseModule(StringRef Filename, char** argv, LLVMContext& Context) {
  // Load the module to be compiled...
  std::unique_ptr<Module> M;
  SMDiagnostic Err;

  // TODO: Do other stuff later...

  M = parseIRFile(Filename, Err, Context);
  if (!M) {
    Err.print(argv[0],
      WithColor::error(errs(), argv[0]));
    return 1;
  }
  outs() << "Loaded '" << M->getName() << "')!\n";
  
  const Function* MarkBegin = M->getFunction("__debase_mark_begin");
  const Function* MarkEnd = M->getFunction("__debase_mark_end");

  if (Verbose) {
    if (MarkBegin)
      outs() << "Found '__debase_mark_begin'!\n";
    if (MarkEnd)
      outs() << "Found '__debase_mark_end'!\n";
  }

  if (DumpModule && 0)
    M->dump();
  
  // TODO: Figure out this fault (probably a debug/release thing...)
  DbgBuryPointer(std::move(M));
  return 0;
}

static std::vector<FunctionPass*> GetO1PassesRequiredForSimplification() {
  // TODO: Use PassBuilder!!!!
  std::vector<FunctionPass*> Out;
  Out.reserve(4);
  //Out.push_back(createCFGSimplificationPass());
  Out.push_back(createSROAPass(false));
  Out.push_back(createInstructionCombiningPass());
  return Out;
}

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
  //initializeExpandFpLegacyPassPass(Registry);
  initializeExpandMemCmpLegacyPassPass(Registry);
  initializeScalarizeMaskedMemIntrinLegacyPassPass(Registry);
  initializeSelectOptimizePass(Registry);
  initializeCallBrPreparePass(Registry);
  initializeCodeGenPrepareLegacyPassPass(Registry);
  //initializeAtomicExpandLegacyPass(Registry);
  initializeWinEHPreparePass(Registry);
  initializeDwarfEHPrepareLegacyPassPass(Registry);
  initializeSafeStackLegacyPassPass(Registry);
  initializeSjLjEHPreparePass(Registry);
  initializePreISelIntrinsicLoweringLegacyPassPass(Registry);
  initializeGlobalMergePass(Registry);
  initializeIndirectBrExpandLegacyPassPass(Registry);
  initializeInterleavedLoadCombinePass(Registry);
  initializeInterleavedAccessPass(Registry);
  //initializePostInlineEntryExitInstrumenterPass(Registry);
  initializeUnreachableBlockElimLegacyPassPass(Registry);
  initializeExpandReductionsPass(Registry);
  initializeWasmEHPreparePass(Registry);
  initializeWriteBitcodePassPass(Registry);
  initializeReplaceWithVeclibLegacyPass(Registry);
  initializeJMCInstrumenterPass(Registry);
}
