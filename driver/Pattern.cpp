//===- driver/Pattern.cpp -------------------------------------------------===//
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
///
/// \file
/// Implements patterns used to check symbols.
///
//===----------------------------------------------------------------------===//

#include "Pattern.hpp"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/ADT/StringSwitch.h"

using namespace debase_tool;
using namespace llvm;

using Token = Pattern::Token;

static Error MakeError(const Twine& Msg) {
  return createStringError(llvm::inconvertibleErrorCode(), Msg);
}

/// Gets simple C++ identifiers.
LLVM_ATTRIBUTE_ALWAYS_INLINE static bool IsIdentifierChar(char C) {
  return llvm::isAlnum(C) || C == '_' || C == '$';
}
/// Checks if whole string uses C++ identifier characters.
static bool IsIdentifier(StringRef S) {
  for (const char C : S)
    if (LLVM_UNLIKELY(!IsIdentifierChar(C)))
      return false;
  return true;
}

/// Checks if `{obj.[member]}` is valid.
static std::optional<StringRef> GetValidReplacementMember(Token::Kind, StringRef Member) {
  if (Member.empty())
    return "";
  else if (Member.equals_insensitive("stem"))
    return "stem";
  else if (Member.equals_insensitive("dir"))
    return "dir";
  else
    return std::nullopt;
}

namespace {

/// Implements lexing for patterns.
class PatternLexer {
  using enum Pattern::Token::Kind;
  /// Output tokens.
  SmallVectorImpl<Pattern::Token>& Toks;
  /// The pattern.
  StringRef Pat;
  /// The current token text.
  StringRef Curr = "";

public:
  PatternLexer(StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks)
   : Toks(Toks), Pat(Pat) {}
  
  /// Pre-checks + Lexing + Post-checks.
  Error lex();
  /// Main lexing loop.
  Error lexImpl();
  /// Handles simple identifiers.
  Error handleSimple();
  /// Identifies `@` or `**`, otherwise `KUnknown`.
  Token::Kind identifyStandalone() const;
  /// Returns if last token was `**`.
  bool wasLastTokenGlob() const;
  /// Handle replacement `{obj.member}`.
  Error handleReplacement(StringRef R);
  /// Handle identifying replacement `{obj.member}` without modifying state.
  Expected<Token> handleReplacementImpl(StringRef R) const;
  /// Returns if input is a replacement `{obj.member}`
  static bool isReplacement(StringRef R);

  void tok(Token::Kind K, bool Grouped = false) {
    Toks.push_back(Token::New(K, Curr, Grouped));
    Curr = "";
  }
  void tok(Token::Kind K, StringRef Data, bool Grouped = false) {
    Toks.push_back(Token::New(K, Data, Grouped));
  }

  /// Gets the next token.
  bool loadNextToken();
  /// Checks if all text has been consumed.
  bool done() const { return Pat.empty() && Curr.empty(); }
  /// Reports an error using `Curr`.
  Error report(const Twine& Msg) const { return report(Curr, Msg); }
  /// Reports an error using input `S`.
  static Error report(StringRef S, const Twine& Msg) {
    return MakeError(Twine("invalid pattern '") + S + "', " + Msg);
  }
};

} // namespace `anonymous`

#define LOAD_NEXT_TOKEN() do {                                  \
  if (!loadNextToken())                                         \
    return Error::success();                                    \
  else if (Curr.empty())                                        \
    return MakeError("invalid pattern: contains empty token");  \
} while (false)

Error PatternLexer::lex() {
  auto report_pat = [this, S = Pat] (const Twine& Msg) {
    return PatternLexer::report(S, Msg);
  };

  // Pre-parsing validation
  if (Pat.ends_with("::"))
    return report_pat("cannot end with scope resolution");
  else if (Pat.ends_with("@"))
    return report_pat("cannot end with anonymous namespace");
  // Real parsing
  if (Error E = this->lexImpl())
    return E;
  // Post-parsing validation
  if (Toks.size() == 1) {
    const Token::Kind lk = Toks.back().kind;
    if (lk == KGlob)
      return report_pat("must contain non-glob particle");
    else if (lk == KAnonymous)
      return report_pat("must contain non-anonymous particle");
  }
  return Error::success();
}

Error PatternLexer::lexImpl() {
  while (!done()) {
    // On the first run, try and grab the whole symbol at once.
    if (Error E = handleSimple())
      return E;
    if (done())
      return Error::success();
    assert(!Curr.empty());
    // Handle next most simple
    if (auto SA = identifyStandalone()) {
      if (!wasLastTokenGlob() || SA != KGlob)
        // Skip multiple globs in a row.
        this->tok(SA);
      continue;
    } else if (isReplacement(Curr)) {
      StringRef R = Curr.drop_front().drop_back();
      if (Error E = handleReplacement(R))
        return E;
      continue;
    }

    return report("unknown particle");
  }

  return Error::success();
}

Error PatternLexer::handleSimple() {
  while (true) {
    LOAD_NEXT_TOKEN();
    if (!IsIdentifier(Curr))
      // Some other thing we don't worry about here :)
      return Error::success();
    // Identifiers cannot start with [0-9]
    if (llvm::isDigit(Curr.front()))
      return report("identifiers cannot start with a number");
    this->tok(Token::KSimple);
  }

  llvm_unreachable("what");
}

Token::Kind PatternLexer::identifyStandalone() const {
  return StringSwitch<Token::Kind>(Curr)
    .Case("@", Token::KAnonymous)
    .Case("**", Token::KGlob)
    .Default(Token::KUnknown);
}

bool PatternLexer::wasLastTokenGlob() const {
  if (LLVM_UNLIKELY(Toks.empty()))
    return false;
  return Toks.back().kind == KGlob;
}

Expected<Token> PatternLexer::handleReplacementImpl(StringRef R) const {
  R = R.trim();
  if (LLVM_UNLIKELY(R.empty()))
    return report("empty replacement body");
  // Break into [obj].[member]
  auto [Obj, Member] = R.split('.');
  // Determine [obj].member
  auto Tok = StringSwitch<Token::Kind>(Obj.rtrim())
    .CasesLower("this", "self", Token::KThis)
    .CasesLower("file", "input", Token::KLateBind)
    .Default(Token::KUnknown);
  if (Tok == KUnknown)
    return report("unknown replacement object");
  // Determine obj.[member]
  Member = Member.ltrim();
  if (auto M = GetValidReplacementMember(Tok, Member))
    // Valid replacement {obj.member}
    return Token::New(Tok, *M);
  return report("unknown replacement member");
}

Error PatternLexer::handleReplacement(StringRef R) {
  Expected<Token> Tok = handleReplacementImpl(R);
  if (!Tok)
    return Tok.takeError();
  Toks.push_back(*Tok);
  Curr = "";
  return Error::success();
}

bool PatternLexer::isReplacement(StringRef R) {
  if (R.size() < 2)
    return false;
  return '{' == R.front() && R.back() == '}';
}

bool PatternLexer::loadNextToken() {
  if (Pat.empty()) {
    Curr = "";
    return false;
  }
  std::tie(Curr, Pat) = Pat.split("::");
  Curr = Curr.trim();
  return true;
}

Error debase_tool::lexTokensForPattern(StringRef Pat,
                                       SmallVectorImpl<Pattern::Token>& Toks) {
  Toks.clear();
  Pat = Pat.trim();
  Pat.consume_front("::");
  // Symbols can never be empty.
  if (Pat.empty())
    return MakeError("invalid pattern: cannot be empty");
  
  PatternLexer PL(Pat, Toks);
  return PL.lex();
}

////////////////////////////////////////////////////////////////////////////////
// Pattern

void Pattern::anchor() {}
