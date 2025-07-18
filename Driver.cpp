#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
// #include "llvm/ADT/SetVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Option/OptTable.h"
#include "llvm/Option/Option.h"
#include "llvm/Support/CommandLine.h"
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
#include <memory>
#include <optional>
#include <string>

#ifndef _NDEBUG
# include "llvm/Support/BuryPointer.h"
# define DbgBuryPointer(...) ::llvm::BuryPointer(__VA_ARGS__)
#else
# define DbgBuryPointer(...) ((void)0)
#endif

using namespace llvm;

static cl::opt<std::string>
InputFilename(cl::Positional, cl::OneOrMore,
              cl::desc("<input file>"), cl::init("-"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished."),
           cl::init(false));

static cl::opt<bool>
Strict("strict", cl::Hidden,
       cl::desc("Makes certain rules exit instead of warning.."),
       cl::init(false));

static cl::opt<bool>
Permissive("permissive", cl::Hidden,
           cl::desc("Warns on certain rules instead of exiting."),
           cl::init(false));

[[noreturn]] static void exitWithError(Twine Msg, std::string Hint = "") {
  errs() << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note() << Hint << "\n";
  errs().flush();
  std::exit(1);
}

static void LLVMInitializeEverything();

static void FixupFilename(std::string& InFilename) {
  SmallString<128> Filename{StringRef(InFilename)};
  if (auto EC = sys::fs::make_absolute(Filename))
    exitWithError(EC.message());
  if (!sys::fs::exists(Filename))
    exitWithError(Twine("'") + Filename.str() + "' does not exist!");
  InFilename = static_cast<std::string>(Filename);
}

static bool ParseCLArgs(int argc, char* const* argv) {
  return cl::ParseCommandLineOptions(argc, argv,
    "debaser compile pass\n", &errs());
}

////////////////////////////////////////////////////////////////////////////////

static int DebaseModules(ArrayRef<StringRef> Filenames,
                         ArrayRef<StringRef> Unlinks,
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
  FixupFilename(InputFilename.getValue());

  LLVMContext Context;
  StringRef Names[1] {InputFilename.getValue()};
  return DebaseModules(
    Names, ExampleUnlinks,
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
  UnlinkRefs(ArrayRef<StringRef> Unlinks) : SimpleUnlinks(BP) {
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
  void compileUnlinks(ArrayRef<StringRef> Unlinks);
  /// Gets the symbol for a simple symbol.
  void compileSimpleUnlink(StringRef FullName);
  /// Writes a simple name to `SimpleUnlinks`.
  void addSimpleUnlink(ArrayRef<StringRef> Names);
  /// If not permissive, sets `Failed` to `true`, otherwise prints `Msg` to `errs()`.
  void failOrPrint(StringRef Msg = "") {
    if (!Permissive)
      this->Failed = true;
    else
      errs() << Msg;
  }
};

} // namespace `anonymous`

void UnlinkRefs::addSimpleUnlink(ArrayRef<StringRef> Names) {
  SmallString<128> MangledName;
  raw_svector_ostream OS(MangledName);

  OS << "_ZN";
  if (Names.front() == "std") {
    OS << "St";
    Names = Names.drop_front();
  }
  for (StringRef Name : Names)
    OS << Name.size() << Name;
  
  // [deleting destructor]
  OS << "D0Ev";
  SimpleUnlinks.insert(MangledName);
  MangledName.pop_back_n(4);

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

void UnlinkRefs::compileUnlinks(ArrayRef<StringRef> Unlinks) {
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
  
  BI__debase_mark_begin = M->getFunction("__debase_mark_begin");
  BI__debase_mark_end = M->getFunction("__debase_mark_end");
}

#define SetInfoWithAttrKind(MEMBER, KIND) do {																\
  Info.MEMBER = F->hasFnAttribute(KIND);																			\
  if (!Info.MEMBER)																														\
    F->addFnAttr(KIND);																												\
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
    if (DumpModule) {
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

static int DebaseModules(ArrayRef<StringRef> Filenames,
                         ArrayRef<StringRef> Unlinks,
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

  if (DumpModule) {
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

static void LLVMInitializeEverything() {
  outs().enable_colors(true);
  errs().enable_colors(true);

  InitializeAllTargetInfos();
  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmPrinters();
  InitializeAllAsmParsers();
  InitializeAllDisassemblers();

  // Copied from llvm/tools/opt/optdriver.cpp, no idea what these are...
  //
  // Initialize passes
  PassRegistry* Registry = PassRegistry::getPassRegistry();
  initializeCore(*Registry);
  initializeScalarOpts(*Registry);
  initializeVectorization(*Registry);
  initializeIPO(*Registry);
  initializeAnalysis(*Registry);
  initializeTransformUtils(*Registry);
  initializeInstCombine(*Registry);
  initializeTarget(*Registry);
  // For codegen passes, only passes that do IR to IR transformation are
  // supported.
  initializeExpandLargeDivRemLegacyPassPass(*Registry);
  initializeExpandLargeFpConvertLegacyPassPass(*Registry);
  initializeExpandMemCmpLegacyPassPass(*Registry);
  initializeScalarizeMaskedMemIntrinLegacyPassPass(*Registry);
  initializeSelectOptimizePass(*Registry);
  initializeCallBrPreparePass(*Registry);
  initializeCodeGenPrepareLegacyPassPass(*Registry);
  //initializeAtomicExpandLegacyPass(*Registry);
  initializeWinEHPreparePass(*Registry);
  initializeDwarfEHPrepareLegacyPassPass(*Registry);
  initializeSafeStackLegacyPassPass(*Registry);
  initializeSjLjEHPreparePass(*Registry);
  initializePreISelIntrinsicLoweringLegacyPassPass(*Registry);
  initializeGlobalMergePass(*Registry);
  initializeIndirectBrExpandLegacyPassPass(*Registry);
  initializeInterleavedLoadCombinePass(*Registry);
  initializeInterleavedAccessPass(*Registry);
  //initializePostInlineEntryExitInstrumenterPass(*Registry);
  initializeUnreachableBlockElimLegacyPassPass(*Registry);
  initializeExpandReductionsPass(*Registry);
  initializeWasmEHPreparePass(*Registry);
  initializeWriteBitcodePassPass(*Registry);
  initializeReplaceWithVeclibLegacyPass(*Registry);
  initializeJMCInstrumenterPass(*Registry);
}
