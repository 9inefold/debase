//===- TestLexPattern.cpp -------------------------------------------------===//
//
// Copyright (C) 2026 Ninefold
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
#include "UnlinkRefs.hpp"
#include "llvm/Demangle/Demangle.h"

static bool TestLexPattern(StringRef P, const bool ShouldPass,
                           llvm::BumpPtrAllocator& BP,
                           FilePropertyCache* Prop = nullptr,
                           int Indent = 0) {
  SmallVector<Pattern::Token> Toks;
  if (Error E = lexTokensForPattern(P, Toks, BP, Prop)) {
    outs().indent(Indent * 2);
    if (!ShouldPass) {
      WithColor(outs(), raw_ostream::GREEN)
        << "pattern '" << P << "' correctly failed!\n";
    } else {
      WithColor(outs(), raw_ostream::RED)
        << "pattern '" << P << "' failed.\n";
    }
    outs().indent((Indent + 1) * 2) << toString(std::move(E)) << "\n\n";
    return !ShouldPass;
  }

  outs().indent(Indent * 2);
  if (ShouldPass) {
    WithColor(outs(), raw_ostream::GREEN)
      << "pattern '" << P << "' succeeded!\n";
  } else {
    WithColor(outs(), raw_ostream::RED)
      << "pattern '" << P << "' should have failed.\n";
  }

  outs().indent((Indent + 1) * 2);
  printTokenGroup(outs(), Toks);
  outs() << "\n\n";

  return ShouldPass;
}

static bool TestLexGroup(StringRef Name, ArrayRef<std::pair<StringRef, bool>> Patterns,
                         llvm::BumpPtrAllocator& BP, FilePropertyCache* Prop) {
  WithColor(outs(), raw_ostream::YELLOW) << Name << ":\n";
  bool Result = true;
  for (auto [P, ShouldPass] : Patterns)
    if (!TestLexPattern(P, ShouldPass, BP, Prop, 1))
      Result = false;
  return Result;
}

#define LEX_TESTS(NAME, ...) [&Result, &BP, &Prop] () {   \
  std::pair<StringRef, bool> Patterns[] { __VA_ARGS__ };  \
  FilePropertyCache* P = Prop ? &*Prop : nullptr;         \
  Result = TestLexGroup(NAME, Patterns, BP, P) && Result; \
}()

static void RunLexTests(bool Exit = true) {
  llvm::BumpPtrAllocator BP;
  std::optional<FilePropertyCache> Prop;
  bool Result = true;

  LEX_TESTS("Simple",
    {"::foo",       true},
    {"::a::b::C",   true},
    {"x :: y :: z", true}
  );
  
  LEX_TESTS("Empty",
    {"",            false},
    {"\t",          false},
    {"  :: ",       false},
    {"x::",         false},
    {"x:: ::z",     false}
  );
  
  LEX_TESTS("Standalone",
    {"@::xyz",      true},
    {"@::@::bar",   true},
    {"@",           false},
    {"::@::**",     true},
    {"**::xyz",     true},
    {"::**",        false},
    {"**::",        false}
  );

  LEX_TESTS("Replacements",
    // Config path
    {"{this}",      true},
    {"{This.Dir}",  true},
    {"{thiS.stEm}", true},
    {"{SELF}",      true},
    {"{sElF.dir}",  true},
    {"{seLf.STEM}", true},
    // Input path
    {"{file}",      true},
    {"{input.diR}", true},
    {"{filE.Stem}", true},
    {"{fILe.sTEm}", true},
    // Invalid
    {"{ \t  }",     false},
    {"{.stem}",     false},
    {"{@.stem}",    false},
    {"{this.@}",    false},
  );

  Prop.emplace("xyz/Config.json");

  LEX_TESTS("This Replacements",
    {"{This.Dir}",  true},
    {"{thiS.stEm}", true},
    {"{this.dir}",  true},
  );

  LEX_TESTS("Regex",
    // Basic
    {"/II/",              true},
    {"II?",               true},
    {"I+",                true},
    {"/I+/",              true},
    {"I*v",               true},
    {"::/I*v/",           true},
    {"x::/I*v/",          true},
    {"**::I*v",           true},
    {"**::/I*v/",         true},
    {"?v",                false},
    {"*v",                false},
    {"I::*v",             false},
    {"+v",                false},
    {"**v",               false},
    {"v**",               false},
    {"I*?v",              true},
    {"I*??v",             false},
    {"I*+v",              false},
    // Escapes
    {"\\a\\d?",           true},
    {"\\w+",              true},
    {"\\a\\i*",           true},
    {"\\n+",              false},
    {"\\*",               false},
    // Character classes
    {"[a-z]",             true},
    {"[a-zA-Z]+",         true},
    {"[0-z]",             false},
    {"[0-9A-z]",          false},
    {"[^0-9]",            true},
    {"[^]",               false},
    {"[-abc]",            false},
    {"[abc-]",            false},
    {"[[:alnum:]]",       true},
    {"[^[:digit:]]",      true},
    {"[[:xyz:]]",         false},
  );

  LEX_TESTS("Simple Format",
    {"I{file.stem}",      true},
    {"{this.stem}{file.stem}", true},
    {"/I{file.stem}/",    true},
    {"/I{this.stem}/",    true},
    {"I{this.@}v",        false}
  );

  LEX_TESTS("Regex Format",
    {"I{file.stem}+",     true},
    {"/{this.stem}+/",    true},
    {"i::/{file.stem}+/", true},
    {"x::I{this.stem}",   true},
    {"**::{file.stem}",   true},
    {"{this.stem}\\w*",   true},
    {"?{file.stem}",      false},
    {"I[{file.stem}]",    false},
  );

  if (Exit)
    std::exit(Result ? 0 : 1);
}

int main() {
  InitLLVM X(Argc, Argv);
  RunLexTests(false);

  auto SM = std::make_unique<SymbolMatcher>();
  auto LoadPattern = [&SM] (StringRef pattern) -> Pattern* {
    auto POrErr = SM->compilePattern(pattern);
    if (!POrErr) {
      errs() << toString(POrErr.takeError()) << "\n\n";
      std::exit(1);
    }
    return *POrErr;
  };
  auto SetFilename = [&SM] (StringRef Filename) {
    if (auto E = SM->setFilename(Filename)) {
      errs() << toString(std::move(E)) << "\n\n";
      std::exit(1);
    }
  };

  auto PrintPatterns = [] (ArrayRef<Pattern*> Patterns) {
    for (Pattern* P : Patterns) {
      P->print(outs());
      outs() << '\n';
    }
    outs() << '\n';
  };

  Pattern* P[] = {
    LoadPattern("x::/y+/::z::I?{file.stem}"),
    LoadPattern("**::{file.stem}"),
    LoadPattern("[[:lower:]]+::**::{file.stem}")
  };

  SetFilename("bindings/CCScheduler.cpp");
  PrintPatterns(P);
  assert(P[0]->matchSymbol({"x", "y", "z", "ICCScheduler"}));
  assert(P[1]->matchSymbol({"cocos2d", "CCScheduler"}));
  assert(P[2]->matchSymbol({"x", "y", "z", "CCScheduler"}));

  SetFilename("bindings/CCLightning.cpp");
  PrintPatterns(P);
  assert(P[0]->matchSymbol({"x", "yyy", "z", "CCLightning"}));
  assert(P[1]->matchSymbol({"cocos2d", "CCLightning"}));
  assert(P[2]->matchSymbol({"cocos2d", "CCLightning"}));

  llvm::BuryPointer(std::move(SM));
}
