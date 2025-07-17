#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Option/OptTable.h"
#include "llvm/Option/Option.h"
#include "llvm/Support/BuryPointer.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
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

using namespace llvm;

static cl::opt<std::string>
InputFilename(cl::Positional, cl::desc("<input file>"), cl::init("-"));

[[noreturn]] static void exitWithError(Twine Msg, std::string Hint = "") {
  errs() << raw_ostream::RED << Msg 
    << "\n" << raw_ostream::RESET;
  if (!Hint.empty())
    WithColor::note() << Hint << "\n";
  errs().flush();
  std::exit(1);
}

static void LLVMInitializeEverything();

static void FixupInputFilename() {
	SmallString<128> Filename{StringRef(InputFilename)};
	if (auto EC = sys::fs::make_absolute(Filename))
		exitWithError(EC.message());
	InputFilename = static_cast<std::string>(Filename);
}

int main(int argc, char** argv) {
	InitLLVM X(argc, argv);
	LLVMInitializeEverything();

	cl::ParseCommandLineOptions(argc, argv, "debaser compile pass\n");
	FixupInputFilename();

	// Load the module to be compiled...
	std::unique_ptr<Module> M;
  SMDiagnostic Err;
	LLVMContext Context;
	
	M = parseIRFile(InputFilename, Err, Context);
	if (!M) {
    Err.print(argv[0], WithColor::error(errs(), argv[0]));
    return 1;
  }

	M->dump();
	// TODO: Figure out this fault
	BuryPointer(std::move(M));
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
