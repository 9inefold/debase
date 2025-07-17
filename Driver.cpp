#include "llvm/InitializePasses.h"
#include "llvm/PassRegistry.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Option/OptTable.h"
#include "llvm/Option/Option.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/GlobPattern.h"
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
InputFilename(cl::Positional, cl::desc("<input file>"), cl::init("-"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));

static cl::opt<bool>
DumpModule("dump-module", cl::Hidden,
           cl::desc("Dump the module once finished."),
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

LLVM_ENABLE_BITMASK_ENUMS_IN_NAMESPACE();

enum RefKind : unsigned {
	RK_Simple 			= 0b00'00'000,
	RK_Templated		= 0b00'00'001,
	RK_Subobject		= 0b00'00'010,
	RK_PartialNS		= 0b00'01'000,
	RK_AnyNS				= 0b00'10'000,
	RK_PartialName	= 0b01'00'000,
	RK_AnyName			= 0b10'00'000,
	LLVM_MARK_AS_BITMASK_ENUM(/* LargestValue = */ RK_AnyName)
};

enum TokenKind : unsigned {
	TK_Name,
	TK_ParentName,
	TK_PartialTemplatedName,
	TK_AnyTemplatedName,
	TK_NS,
	TK_AnonNS,
	TK_PartialNS,
	TK_AnyNS,
	TK_Unknown,
};

/// Holds all the unlink identifiers which can be searched through later.
class UnlinkRefs {
public:
	struct Token {
		StringRef Piece = "";
		TokenKind Kind = TK_Unknown;
	};

private:
	BumpPtrAllocator BP;
	/// The set of simple names.
	StringMap<bool, BumpPtrAllocator&> SimpleUnlinks;

	/// Represents a `(Pattern, Kind)` tuple.
	using GlobType = std::pair<llvm::GlobPattern, RefKind>;
	/// The list of globbing names and their kinds.
	/// Currently doesn't support: anonymous namespaces, values, abi tags, etc.
	SmallVector<std::pair<llvm::GlobPattern, RefKind>, 0> GlobUnlinks;
	/// Blah blah
	bool Failed = false;

public:
	UnlinkRefs(ArrayRef<StringRef> Unlinks) : SimpleUnlinks(BP) {
		this->compileUnlinks(Unlinks);
	}

	/// Classifies a reference kind.
	static Expected<RefKind> ClassifyRef(StringRef Name);

private:

	/// Classifies a reference kind.
	static Expected<RefKind> ClassifyRef(StringRef Name,
																			 SmallVectorImpl<Token>& Toks);

	/// "Compiles" the unlink data.
	void compileUnlinks(ArrayRef<StringRef> Unlinks);
};

} // namespace `anonymous`

static bool isIDChar(char C) { return llvm::isAlnum(C) || C == '_'; }

static RefKind ClassifySimpleRef(StringRef ID, SmallVectorImpl<UnlinkRefs::Token>& Toks) {
	assert(ID.size() == 1);
	switch (ID[0]) {
	case '*':
		Toks.push_back({ID, TK_AnyNS});
		return RK_AnyNS;
	case '?':
		Toks.push_back({ID, TK_AnonNS});
		return RK_Simple;
	default:
		assert(isIDChar(ID[0]));
		Toks.push_back({ID, TK_NS});
		return RK_Simple;
	}
}

static Expected<bool> ClassifyImpl(StringRef ID) {
	bool HasGlobChar = false;
	for (char C : ID) {
		if (C == '*') {
			HasGlobChar = true;
			continue;
		}
		if (!isIDChar(C))
			return MakeError("Invalid character in identifier!");
	}
	return HasGlobChar;
}

static Expected<RefKind> ClassifyNSRef(StringRef ID,
																			 SmallVectorImpl<UnlinkRefs::Token>& Toks) {
	if (llvm::isDigit(ID.front()))
		return MakeError("Identifier starts with a digit!");
	
	Expected<bool> HasGlobChar = ClassifyImpl(ID);
	if (!HasGlobChar)
		return HasGlobChar.takeError();

	Toks.push_back({ID, !*HasGlobChar ? TK_NS : TK_PartialNS});
	return !*HasGlobChar ? RK_Simple : RK_PartialNS;
}

static Expected<RefKind> ClassifyNameRef(StringRef ID,
																			 	 SmallVectorImpl<UnlinkRefs::Token>& Toks) {
	if (llvm::isDigit(ID.front()))
		return MakeError("Identifier starts with a digit!");
	
	Expected<bool> HasGlobChar = ClassifyImpl(ID);
	if (!HasGlobChar)
		return HasGlobChar.takeError();
	else if (*HasGlobChar)
		return MakeError("Globs in names currently unsupported!");
	
	Toks.push_back({ID, TK_Name});
	return RK_Simple;
} 

Expected<RefKind> UnlinkRefs::ClassifyRef(StringRef Name,
																					SmallVectorImpl<Token>& Toks) {
	Name = Name.ltrim().rtrim();
	Name.consume_front("::");
	if (Name.empty())
		return MakeError("Attempted to classify an empty string!");

	RefKind Out = RK_Simple;
	StringRef NS = "";

	if (auto P = Name.find_first_of("@<"); P != StringRef::npos) {
		if (Name[P] == '@') {
			NS = Name.substr(0, P).rtrim();
			Name = Name.substr(P);
			Out |= RK_Subobject;
		} else {
			auto NSPos = Name.rfind(':', P);
			NS = Name.substr(0, P);
			if (!NS.consume_back("::"))
				return MakeError("Stray ':' in namespace!");
			Name = Name.substr(P + 1);
		}
	}

	/// Handle namespaces.
	while (!NS.empty()) {
		auto [LHS, RHS] = NS.split("::");
		LHS = LHS.rtrim();
		if (LLVM_UNLIKELY(LHS.empty()))
			return MakeError("Found empty namespace!");
		
		if (RHS.empty())
			break;
		NS = RHS.ltrim();

		if (LHS.size() == 1) {
			/// Simple case.
			Out |= ClassifySimpleRef(LHS, Toks);
			continue;
		}

		Expected Ty = ClassifyNSRef(LHS, Toks);
		if (!Ty)
			return Ty.takeError();
		Out |= *Ty;
	}

	/// Handle final name.
	if (Out & RK_Subobject)
		return MakeError("Subobjects are currently unsupported!");
	if (Out & RK_Templated)
		return MakeError("Templates are currently unsupported!");
	
	Expected Ty = ClassifyNameRef(Name, Toks);
	if (!Ty)
		return Ty.takeError();
	return (Out | *Ty);
}

Expected<RefKind> UnlinkRefs::ClassifyRef(StringRef Name) {
	SmallVector<Token, 16> Toks;
	return ClassifyRef(Name, Toks);
}

////////////////////////////////////////////////////////////////////////////////
// Debaser

namespace {

/// The actual implementation of the debaser.
class DeBaser {
	/// The diagnostic engine for the current module.
  SMDiagnostic Err;
	/// The commandline (for diagnostics).
	char* const* argv = nullptr;

	/// The module itself.
	std::unique_ptr<Module> M = nullptr;

	llvm::Function* Fn__debase_mark_begin = nullptr;
	llvm::Function* Fn__debase_mark_end = nullptr;

	bool LoadedModule : 1 = false;
	bool SetUnlinks : 1 = false;

public:
	DeBaser(StringRef Filename,
					char* const* argv, LLVMContext& Context) : argv(argv) {
		if (!loadModule(Filename, Context))
  	  return;

		Fn__debase_mark_begin = M->getFunction("__debase_mark_begin");
		Fn__debase_mark_end = M->getFunction("__debase_mark_end");
	}

	DeBaser(DeBaser&&) = default;
	DeBaser& operator=(DeBaser&&) = default;

	DeBaser(const DeBaser&) = delete;
	DeBaser& operator=(const DeBaser&) = delete;

	~DeBaser() {
		if (M) {
			assert(this->LoadedModule
					&& "Forgot to set DeBaser::LoadedModule!");
			DbgBuryPointer(std::move(M));
		}
	}

	/// A utility for creating new debaser objects.
	class Factory {
		LLVMContext& Context;
		char* const* argv = nullptr;
	public:
		Factory(char** argv, LLVMContext& Context) :
		 Context(Context), argv(argv) {}
		
		std::optional<DeBaser> New(StringRef Filename) {
			std::optional<DeBaser> DB;
			DB.emplace(Filename, argv, Context);
			if (!DB->LoadedModule)
				return std::nullopt;
			return DB;
		}
	};

private:
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
  	  Err.print(argv[0], error());
  	  return false;
  	}

		assert(Filename == M->getName());
		this->LoadedModule = true;
		return true;
	}

	raw_ostream& error() {
		return WithColor::error(errs(), argv[0]);
	}
};

} // namespace `anonymous`

static int DebaseModules(ArrayRef<StringRef> Filenames,
												 ArrayRef<StringRef> Unlinks,
												 char** argv, LLVMContext& Context) {
  // ...
	if (Filenames.empty()) {
		WithColor::error(errs(), argv[0])
			<< "No input files provided!";
		return 1;
	}

	DeBaser::Factory DBFactory(argv, Context);
	for (StringRef Filename : Filenames) {
		auto DB = DBFactory.New(Filename);
		if (!DB.has_value())
			return 1;
		
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
