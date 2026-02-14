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
#include "PatternLex.hpp"
#include "Shared.hpp"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/MapVector.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/Support/Compiler.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/StringSaver.h"
#include "llvm/Support/raw_ostream.h"
#include "Character.hpp"
#include "FilePropertyCache.hpp"
#include "NameClassifier.hpp"
#include "SymbolFeatures.hpp"

using namespace debase_tool;
using namespace llvm;

using Token = Pattern::Token;
static_assert(sizeof(Token) <= 2 * sizeof(void*));

static StringRef InternStringRef(BumpPtrAllocator& BP, StringRef S) {
  if (S.empty())
    return "";
  char* Out = BP.Allocate<char>(S.size() + 1);
  std::memcpy(Out, S.data(), S.size());
  Out[S.size()] = '\0';
  return {Out, S.size()};
}

/// Identifies `@` or `**`, otherwise `KUnknown`.
static Token::Kind IdentifyStandalone(StringRef S) {
  return StringSwitch<Token::Kind>(S)
    .Case("@", Token::KAnonymous)
    .Case("**", Token::KGlob)
    .Default(Token::KUnknown);
}

/// Checks if `{obj.[member]}` is valid.
static std::optional<StringRef> GetValidReplacementMember(Token::Kind, StringRef Member) {
  if (Member.empty())
    return "";
  else if (Member.equals_insensitive("stem"))
    return Token::kStem;
  else if (Member.equals_insensitive("dir"))
    return Token::kDir;
  else if (Member.equals_insensitive("ext"))
    return Token::kExt;
  else
    return std::nullopt;
}
/// Checks if `{obj.[member]}` is valid.
static std::optional<StringRef> GetValidReplacementMember(StringRef Member) {
  return GetValidReplacementMember(Token::KThis, Member);
}

/// Ensures a case range only contains valid characters, and doesn't pass through
/// invalid characters.
static bool IsValidCaseRange(char Start, char End) {
  // [A-Z]
  if (llvm::isUpper(Start))
    return llvm::isUpper(End);
  // [a-z]
  if (llvm::isDigit(Start))
    return llvm::isDigit(End);
  // [0-9]
  if (llvm::isLower(Start))
    return llvm::isLower(End);
  return false;
}

/// Checks if a `[:class:]` is valid.
static bool IsValidPOSIXMetaclass(StringRef CC) {
  return StringSwitch<bool>(CC)
    .Case("upper", true)
    .Case("lower", true)
    .Case("alpha", true)
    .Case("digit", true)
    .Case("alnum", true)
    .Case("xdigit", true)
    //.Case("ident", true)
    .Default(false);
}

//============================================================================//
// Pattern
//============================================================================//

bool SimplePattern::match(ArrayRef<std::string> Names) const {
  if (requiredCount() != Names.size())
    return false;
  auto Patterns = getPatterns();
  for (size_t I = 0; I < Patterns.size(); ++I)
    if (Patterns[I] != Names[I])
      return false;
  return true;
}

bool LeadingSimplePattern::match(ArrayRef<std::string> Names) const {
  if (requiredCount() >= Names.size())
    return false;
  auto Patterns = getPatterns();
  for (size_t I = 0; I < Patterns.size(); ++I)
    if (Patterns[I] != Names[I])
      return false;
  return true;
}

bool SingleSequencePattern::match(ArrayRef<std::string> Names) const {
  auto Patterns = getPatterns();
  if (Patterns.size() != Names.size())
    return false;
  for (size_t I = 0; I < Patterns.size(); ++I)
    if (!Patterns[I]->match(Names[I]))
      return false;
  return true;
}

AnySequencePattern::AnySequencePattern(ArrayRef<Pattern*> Patterns)
    : MultiTrailingPattern(Patterns), RealCount(0) {
  for (Pattern* P : getPatterns()) {
    assert(!isa<GlobPattern>(P));
    if (auto* MP = dyn_cast<MultiPattern>(P))
      RealCount += MP->requiredCount();
    else
      RealCount += 1;
  }
}

bool AnySequencePattern::match(ArrayRef<std::string> Names) const {
  if (Names.size() < RealCount)
    return false;
  for (Pattern* P : getPatterns()) {
    if (auto* SP = dyn_cast<SinglePattern>(P)) {
      if (!SP->match(Names.front()))
        return false;
      Names = Names.drop_front();
    } else /*MultiPattern*/ {
      auto* MP = cast<MultiPattern>(P);
      const unsigned N = MP->requiredCount();
      if (!MP->match(Names.take_front(N)))
        return false;
      Names = Names.drop_front(N);
    }
  }
  return true;
}

bool LeadingGlobPattern::match(ArrayRef<std::string> Names) const {
  assert(!Names.empty() && "Invalid glob input");
  const unsigned Count = Trailing->count();
  if (Names.size() < Count)
    return false;
  if (auto* Simple = dyn_cast<SimplePattern>(Trailing))
    return Simple->match(
             Names.take_back(Count));
  // Some other type
  return Trailing->match(
           Names.take_back(Count));
}

bool ButterflyGlobPattern::match(ArrayRef<std::string> Names) const {
  assert(!Names.empty() && "Invalid glob input");
  const unsigned LeadingCount = Leading->count(),
                 TrailingCount = Trailing->count();
  if (Names.size() < LeadingCount + TrailingCount)
    return false;
  if (!Leading->match(Names.take_front(LeadingCount)))
    return false;
  return Trailing->match(
    Names.take_back(TrailingCount));
}

// Replacer

/// Parses tokens into a replacement vector.
SmallVector<FmtReplacer::ReplacerPiece, 2>
 FmtReplacer::ParseToks(ArrayRef<Pattern::Token> Toks) {
  assert(!Toks.empty() && Toks[0].trailing == Toks.size() - 1);
  Pattern::Token Head = Toks[0];
  ArrayRef<Pattern::Token> Trailing = Toks.drop_front();
  /// Parse with LLVM methods.
  auto TmpReplacements = formatv_object_base::parseFormatString(Head.str());
  SmallVector<ReplacerPiece, 2> OutReplacements;
  OutReplacements.reserve(TmpReplacements.size());

  auto AddReplacement = [&] (StringRef Val, bool IsFmt) {
    OutReplacements.push_back({
      .Lit = Val.data(),
      .Size = unsigned(Val.size()),
      .IsFormat = IsFmt
    });
  };

  for (const ReplacementItem& RI : TmpReplacements) {
    if (RI.Type == ReplacementType::Empty)
      continue;
    else if (RI.Type == ReplacementType::Literal) {
      AddReplacement(RI.Spec, false);
      continue;
    }
    assert(RI.Index < Trailing.size());
    AddReplacement(Trailing[RI.Index].str(), true);
  }

  return OutReplacements;
}

Error FmtReplacer::replace(llvm::BumpPtrAllocator& BP, FilePropertyCache& C) {
  SmallString<32> Format;
  for (ReplacerPiece RP : Pieces) {
    if (RP.IsFormat) {
      Expected<StringRef> Prop = C.getPropertyRaw(RP.Lit);
      if (LLVM_UNLIKELY(!Prop))
        return Prop.takeError();
      Format.append(*Prop);
    } else
      Format.append(StringRef(RP.Lit, RP.Size));
  }
  
  StringRef ToReplace = Format.str();
  if (!this->isRegex())
    ToReplace = InternStringRef(BP, ToReplace);
  this->replaceData(ToReplace);
  return Error::success();
}

ReplacerStorage<ProxySoloPattern>::ReplacerStorage(Pattern::Token Tok)
    : TheProp(Tok.data), ThePattern() {
  assert(Token::GetFilePropertyKind(Tok.data) != Token::FPKUnknown);
}

Error ReplacerStorage<ProxySoloPattern>::replace(BumpPtrAllocator&,
                                                 FilePropertyCache& C) {
  Expected<StringRef> Prop = C.getPropertyRaw(TheProp);
  if (LLVM_UNLIKELY(!Prop))
    return Prop.takeError();
  ThePattern.replace(*Prop);
  return Error::success();
}

// Printing

void SimplePattern::print(raw_ostream& OS) const {
  ListSeparator LS("::");
  for (StringRef S : getPatterns())
    OS << LS << S;
}
void LeadingSimplePattern::print(raw_ostream& OS) const {
  ListSeparator LS("::");
  for (StringRef S : getPatterns())
    OS << LS << S;
}
void LeadingGlobPattern::print(raw_ostream& OS) const {
  OS << "**::";
  Trailing->print(OS);
}
void ButterflyGlobPattern::print(raw_ostream& OS) const {
  Leading->print(OS);
  OS << "::**::";
  Trailing->print(OS);
}
void SingleSequencePattern::print(raw_ostream& OS) const {
  ListSeparator LS("::");
  for (Pattern* P : getPatterns()) {
    OS << LS;
    P->print(OS);
  }
}
void AnySequencePattern::print(raw_ostream& OS) const {
  ListSeparator LS("::");
  for (Pattern* P : getPatterns()) {
    OS << LS;
    P->print(OS);
  }
}
void ForwardingPattern::print(raw_ostream& OS) const {
  ThePattern->print(OS);
}
void SoloPattern::print(raw_ostream& OS) const {
  OS << this->P;
}
void RegexPattern::print(raw_ostream& OS) const {
  OS << "/REGEX/";
}

//============================================================================//
// PatternLex
//============================================================================//

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
  /// Allocator for compound groups.
  /// Safe to store as `PatternLexer` cannot exist longer than the caller.
  StringTransformer Intern;
  /// Replacement function for `this`, if it exists
  FilePropertyCache* This = nullptr;

public:
  PatternLexer(StringRef Pat,
               SmallVectorImpl<Pattern::Token>& Toks,
               StringTransformer Intern, FilePropertyCache* This)
   : Toks(Toks), Pat(Pat), Intern(Intern), This(This) {}
  
  class CompoundLexer;
  
  /// Pre-checks + Lexing + Post-checks.
  Error lex();
  /// Main lexing loop.
  Error lexImpl();
  /// Handles simple identifiers.
  Error handleSimple();
  /// Identifies `@` or `**`, otherwise `KUnknown`.
  inline Token::Kind identifyStandalone() const;
  /// Returns if last token was `**`.
  inline bool wasLastTokenGlob() const;
  /// Handle replacement `{obj.member}`.
  Error handleReplacement(StringRef R);
  /// Handle identifying replacement `{obj.member}` without modifying state.
  Expected<Token> handleReplacementImpl(StringRef R) const;
  /// Returns if input is a replacement `{obj.member}`
  static bool isReplacement(StringRef R);
  /// Handle compound sequences (any combo of regex/replacements).
  Error handleCompound();

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
  /// Does any extra token checks.
  Error validateTokens() const { return Error::success(); }

  /// Reports an error using `Curr`.
  LLVM_ATTRIBUTE_NOINLINE
  Error report(const Twine& Msg) const { return report(Curr, Msg); }
  /// Reports an error using input `S`.
  static Error report(StringRef S, const Twine& Msg) {
    return MakeError(Twine("invalid pattern '") + S + "', " + Msg);
  }
};

/// CompoundLexer deals with things that might use regex or mixed replacements.
/// eg. `{this.stem}Class`, `I?Foo`, `[A-Z]*{file.stem}+[^123]`
///
/// The regex flavor is very limited as it only needs to work with C++ identifiers.
/// While this technically could be extended to a lot of utf8 characters, I don't
/// care enough to support that lmao
///
/// It also doesn't support any grouping at the moment.
///
/// Keep in mind replacements add overhead to regex since it needs to be recompiled
/// for every file.
class PatternLexer::CompoundLexer {
  PatternLexer* Lex;
  /// The current slice.
  StringRef Curr;
  /// The current position.
  const char* At = nullptr;
  /// The last token type read.
  Character::Kind LastReadKind = Character::KUnsupported;

  /// If the current expression contains regex.
  bool HasRegex : 1 = false;
  /// If the current expression contains replacements.
  bool HasReplacements : 1 = false;
  /// If the lexer has written its tokens.
  bool HasFinished : 1 = false;
  /// If the lexer is in an error state.
  mutable bool HasErrored : 1 = false;

  /// Stores an ordered mapping of `TempTokens`
  mutable SmallMapVector<StringRef, Token, 1> Replacements;
  /// Temp buffer storing strings.
  mutable SmallString<32> TempBuffer;

public:
  CompoundLexer(PatternLexer* Lex) : Lex(Lex) {
    assert(Lex != nullptr && "Invalid this?");
  }
  ~CompoundLexer() {
    //this->finish();
  }

  /// Lex a compound group.
  Error lex();
  /// Reads until something interesting.
  Error lexImpl();
  /// Handles `{obj.member}`.
  Error handleReplacement();
  /// Dispatches regex handling.
  Error dispatchRegexChecker(Character::Kind K);
  /// Handles `*/+/?`.
  Error handleKleeneOrQuantifier(Character::Kind K);
  /// Handles [...].
  Error handleCharacterClass();
  /// Validates [...].
  Error validateCharacterClass(StringRef CC);
  /// Handles escape sequences.
  Error handleEscape();
  /// Handles escape sequences.
  void handleEscape(char C);
  /// Dispatches regex error.
  LLVM_ATTRIBUTE_NOINLINE
  Error handleRegexError(Character::Kind K);

  void tok(Token::Kind K) {
    //Toks.push_back(Token::New(K, Curr, true));
    llvm_unreachable("unimplemented?");
  }
  void tok(Token::Kind K, StringRef Data) {
    Lex->tok(K, Data, /*Grouped=*/true);
  }

  void start() {
    this->Curr = Lex->Curr;
    assert(!Curr.empty());
    TempBuffer.reserve(Curr.size());
    this->At = Curr.begin();
    assert(At != nullptr);
  }
  void finish() {
    if (HasFinished || HasErrored)
      return;
    
    // Create leading token.
    StringRef Interned = Lex->Intern(TempBuffer.str());
    Token::Kind K
      = HasRegex
        ? HasReplacements
          ? Token::KRegexFmt
          : Token::KRegex
        : Token::KSimpleFmt;
    
    Token Main = Token::New(K, Interned, HasReplacements);
    Main.trailing = Replacements.size();
    // Push leading token.
    auto& Toks = Lex->Toks;
    Toks.push_back(Main);

    // Handle trailing.
    if (HasReplacements) {
      assert(!Replacements.empty());
      // End the compound group.
      Replacements.back().second.grouped = false;
      for (const auto& T : Replacements)
        Toks.push_back(T.second);
    }

    HasFinished = true;
  }

  /// Returns current character kind, `At[0]`.
  Character::Kind at() const {
    if (LLVM_UNLIKELY(At >= Curr.end()))
      return Character::KEnd;
    return Character::identify(At[0]);
  }
  /// Returns previous character kind, `At[-1]`.
  Character::Kind prev() const {
    return LastReadKind;
  }
  /// Returns next character kind, `At[+1]`.
  Character::Kind next() const {
    if (LLVM_UNLIKELY((At + 1) >= Curr.end()))
      return Character::KEnd;
    return Character::identify(At[1]);
  }

  /// Reports an error using `Curr`.
  LLVM_ATTRIBUTE_NOINLINE
  Error report(const Twine& Msg) const {
    HasErrored = true;
    return Lex->report(Lex->Curr, Msg);
  }
  /// Reports an error using input `S`.
  LLVM_ATTRIBUTE_NOINLINE
  Error report(StringRef S, const Twine& Msg) {
    HasErrored = true;
    return Lex->report(S, Msg);
  }
};

} // namespace `anonymous`

/// Alias for `PatternLexer::CompoundLexer`.
using CompoundLexer = PatternLexer::CompoundLexer;

//#define LOAD_NEXT_TOKEN() do {                                  \
//  if (!loadNextToken())                                         \
//    return Error::success();                                    \
//  else if (Curr.empty())                                        \
//    return MakeError("invalid pattern: contains empty token");  \
//} while (false)

Error PatternLexer::lex() {
  auto report_pat = [this, S = Pat] (const Twine& Msg) {
    return this->report(S, Msg);
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
  assert(Toks.size() >= 1 && "Empty pattern made it here?");
  if (Toks.size() == 1) {
    const Token::Kind lk = Toks.back().kind;
    if (lk == KGlob)
      return report_pat("must contain non-glob particle");
    else if (lk == KAnonymous)
      return report_pat("must contain non-anonymous particle");
  } else {
    if (Error E = validateTokens())
      return E;
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

    // Must be a compound type.
    if (Error E = handleCompound())
      return E;
    //return report("unknown particle");
  }

  return Error::success();
}

Error PatternLexer::handleSimple() {
  while (true) {
    if (!loadNextToken())
      return Error::success();
    else if (Curr.empty())
      return MakeError("invalid pattern: contains empty token");
    if (!Character::isIdentifier(Curr))
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
  return IdentifyStandalone(Curr);
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
  if (auto M = GetValidReplacementMember(Tok, Member)) {
    if (Tok == KThis && This) {
      Expected<StringRef> Prop = This->getProperty(*M);
      if (LLVM_UNLIKELY(!Prop))
        return Prop.takeError();
      else if (!Character::isIdentifier(*Prop))
        return report("replacement contains invalid characters");
      // Direct replacement via {this.prop}
      return Token::New(KSimple, *Prop);
    }
    // Valid replacement {obj.member}
    return Token::New(Tok, *M);
  }
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
  if ('{' == R.front() && R.back() == '}')
    // Make sure we handle things like `{this.stem}{file.stem}`
    return R.count('{') == 1;
  return false;
}

Error PatternLexer::handleCompound() {
  if (Curr.consume_front("/")) {
    if (!Curr.consume_back("/"))
      return report("unknown sequence in compound.");
  }
  CompoundLexer H(this);
  if (Error E = H.lex())
    return E;
  // Do more stuff?
  return Error::success();
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

////////////////////////////////////////////////////////////////////////////////
// CompoundLexer

Error CompoundLexer::handleKleeneOrQuantifier(Character::Kind K) {
  using enum Character::Kind;
  //assert(LastReadKind != Character::KUnsupported);
  if (LLVM_UNLIKELY(LastReadKind == KUnsupported))
    return report("'" + Twine(*At) + "' found at the start of pattern");
  // Check for errors.
  switch (LastReadKind) {
  case KIdentifier:
  case KWildcard:
  case KCloseParen:
  case KCloseBrace:
    // Regular regex stuff
    break;
  case KZeroOrOne:
  case KKleene:
  case KKleenePlus:
    // Ensure things like +* are invalid, but lazy sequences still allowed.
    if (K != KZeroOrOne) {
      if (K == KKleene && LastReadKind == KKleene)
        return report("glob not allowed in compound expressions");
      return report("found multiple quantifiers in a row");
    }
    // Check for *??
    if (next() == KZeroOrOne)
      return report("found multiple quantifiers in a row");
    break;
  case KCloseCurly:
    // Replacement sequence, eg. {file.stem}?
    assert(HasReplacements && "'}' without replacement?");
    break;
  default:
    return handleRegexError(K);
  }
  // W
  TempBuffer.push_back(*At++);
  LastReadKind = K;
  return Error::success();
}

void CompoundLexer::handleEscape(char C) {
  // Check for replacement:
  switch (C) {
  case 'a':
    TempBuffer.append("[A-Za-z]");
    break;
  case 'd':
    TempBuffer.append("[0-9]");
    break;
  case 'w':
    TempBuffer.append("[A-Za-z0-9_]");
    break;
  case 'i':
    // Any identifier... kinda pointless but whatev.
    TempBuffer.append("[A-Za-z0-9_$]");
    break;
  default:
    llvm_unreachable("invalid escape");
  }
}

Error CompoundLexer::handleEscape() {
  // Make sure we dont have "...\"
  if (LLVM_UNLIKELY(this->next() == Character::KEnd))
    return report("character must follow escape sequence");
  // Check for replacement:
  switch (*++At) {
  case 'a':
  case 'd':
  case 'w':
  case 'i':
    handleEscape(*At);
    break;
  case 'n':
  case 'r':
  case 't':
  case '0':
    return report("whitespace escapes are not allowed");
  default:
    if (llvm::isPrint(*At))
      return report("invalid escape sequence '\\" + Twine(*At) + "'");
    else
      return report("invalid escape sequence");
  }
  At += 1;
  LastReadKind = Character::KCloseBrace;
  return Error::success();
}

Error CompoundLexer::validateCharacterClass(StringRef CC) {
  assert(CC.front() == '[' && CC.back() == ']');
  auto ccreport = [this, CC] (const Twine& Msg) -> Error {
    return this->report(CC, "invalid character " + Msg);
  };

  // Check for empty and invalid braces.
  if (LLVM_UNLIKELY(CC.size() <= 2))
    return ccreport("class");
  
  size_t Start = 1;
  // Check for [-xyz]
  // TODO: Check for collating symbols & equivalence classes?
  if (CC[1] == '-')
    return ccreport("'-' found at start class");
  else if (CC[1] == '^') {
    // Check for [^]
    if (CC.size() == 3)
      return ccreport("'^' found in class");
    // Skip over negation.
    Start = 2;
  }

  // Checks content inside braces.
  for (size_t I = Start, E = CC.size() - 1; I < E; ++I) {
    // Handle case range
    if (CC[I] == '-') {
      // Check for [xyz-]
      if (LLVM_UNLIKELY(I == Start))
        return ccreport("'-' found at end of class");
      // At this point, we know CC[I - 1] must be valid.
      // We just need to check CC[I + 1].
      if (LLVM_UNLIKELY(!Character::isIdentifier(CC[I + 1])))
        return ccreport("'" + Twine(CC[I + 1]) + "' in case range");
      // Now just check it's a valid case range!
      if (!IsValidCaseRange(CC[I - 1], CC[I + 1])) {
        StringRef R(CC.data() + (I - 1), 3);
        return this->report(CC, "invalid case range '" + Twine(R) + "'");
      }
      // Skip to the end of case range.
      I += 1;
      continue;
    }

    // POSIX metaclass
    if (CC[I] == '[' && CC[I + 1] == ':') {
      if (LLVM_UNLIKELY(I + 5 >= E))
        return this->report(CC, "invalid POSIX metaclass");
      const char* MCStart = CC.data() + (I + 2);
      const char* MCEnd = MCStart;
      while (*MCEnd != ':') {
        if (MCEnd + 1 >= CC.data() + E)
          return this->report(CC, "unterminated POSIX metaclass");
        else if (!llvm::isLower(*MCEnd)) 
          return this->report(CC, "invalid character in POSIX metaclass");
        ++MCEnd;
      }
      if (MCEnd[1] != ']')
        return this->report(CC, "unterminated POSIX metaclass");
      // Get the offset from the start
      const size_t MCSize = MCEnd - MCStart;
      StringRef MC(MCStart, MCSize);
      if (!IsValidPOSIXMetaclass(MC))
        return this->report(MC, "unknown POSIX metaclass '" + Twine(MC) + "'");
      // Skip [:class:
      I += 2 + MCSize + 1;
      continue;
    }

    if (!Character::isIdentifier(CC[I]))
      return ccreport("'" + Twine(CC[I]) + "' found in case range");
  }

  return Error::success();
}

Error CompoundLexer::handleCharacterClass() {
  const char* CCEnd = At + 1;
  // For handling [:NAME:]
  bool InPOSIXMC = false;
  while (CCEnd < Curr.end()) {
    if (*CCEnd == ']') {
      if (!InPOSIXMC)
        break;
      InPOSIXMC = false;
    } else if (*CCEnd == '[') {
      if (LLVM_UNLIKELY(InPOSIXMC))
        return report("invalid character class nesting");
      InPOSIXMC = true;
    }
    ++CCEnd;
  }
  // Check for "[xyz"
  if (LLVM_UNLIKELY(CCEnd >= Curr.end()))
    return report("unterminated character class");
  // Skip past closing ]
  ++CCEnd;
  
  StringRef CC(At, CCEnd - At);
  if (Error E = validateCharacterClass(CC))
    return E;
  
  TempBuffer.append(CC);
  At = CCEnd;
  LastReadKind = Character::KCloseBrace;
  return Error::success();
}

Error CompoundLexer::dispatchRegexChecker(Character::Kind K) {
  using enum Character::Kind;
  HasRegex = true;
  switch (K) {
  case KWildcard:
    LastReadKind = Character::KWildcard;
    handleEscape('i');
    return Error::success();
  case KZeroOrOne:
  case KKleene:
  case KKleenePlus:
    return handleKleeneOrQuantifier(K);
  case KEscape:
    return handleEscape();
  case KOpenBrace:
    return handleCharacterClass();
  case KOpenParen:
    //break;
    return report("match groups currently unsupported");
  default:
    return handleRegexError(K);
  }
}

Error CompoundLexer::handleReplacement() {
  assert(*At == '{');
  const char* RBegin = At + 1;
  const char* REnd = RBegin;
  while (*REnd != '}') {
    if (LLVM_UNLIKELY(REnd >= Curr.end()))
      return report("unterminated replacement block");
    ++REnd;
  }

  auto R = StringRef(RBegin, REnd - RBegin).trim();
  if (Lex->This && R.starts_with_insensitive("this")) {
    std::optional<StringRef> M = GetValidReplacementMember(R.split('.').second);
    // TODO: Cache?
    if (LLVM_UNLIKELY(!M))
      return report("invalid property name");
    Expected<StringRef> Prop = Lex->This->getProperty(*M);
    if (LLVM_UNLIKELY(!Prop))
      return Prop.takeError();
    else if (!Character::isIdentifier(*Prop))
      return report("replacement contains invalid characters");
    // Handle replacement
    TempBuffer.push_back('(');
    TempBuffer.append(*Prop);
    TempBuffer.push_back(')');
    // Done
    At = REnd + 1;
    LastReadKind = Character::KIdentifier;
    return Error::success();
  }

  HasReplacements = true;
  auto [It, DidEmplace] = Replacements.try_emplace(R);
  if (DidEmplace) {
    Expected<Token> Tok = Lex->handleReplacementImpl(R);
    if (!Tok)
      return Tok.takeError();
    Tok->grouped = true;
    It->second = *Tok;
  }

  size_t Off = It - Replacements.begin();
  if (LLVM_UNLIKELY(Off > Token::kMaxTrailing))
    return report("too many trailing arguments: " + Twine(Off));
  /*Print replacement*/ {
    raw_svector_ostream OS(TempBuffer);
    OS << '{' << Off << '}';
  }

  At = REnd + 1;
  LastReadKind = Character::KCloseCurly;
  return Error::success();
}

Error CompoundLexer::lexImpl() {
  auto* const End = Curr.end();
  while (At < End) {
    Character::Kind K = this->at();
    if (K == Character::KOpenCurly) {
      if (Error E = handleReplacement())
        return E;
    } else if (K == Character::KIdentifier) {
      TempBuffer.push_back(*At++);
      // Set last read.
      LastReadKind = K;
    } else {
      // Other regex character (or error).
      if (Error E = dispatchRegexChecker(K))
        return E;
    }
  }
  // Read the whole string!
  return Error::success();
}

/// Strips parentheses from (Replacement)
static void StripParentheses(SmallVectorImpl<char>& S) {
  char* Dst = &*S.begin();
  char* Src = Dst;
  const char* End = &*S.end();
  
  while (Src != End) {
    if (*Src == '(' || *Src == ')') {
      ++Src; continue;
    }

    if (Src != Dst)
      *Dst = *Src;
    ++Src; ++Dst;
  }
  // Change to fit stripped data.
  S.resize(Dst - S.begin());
}

Error CompoundLexer::lex() {
  if (Character::isIdentifier(Lex->Curr)) {
    // Simple case of something like /abc/
    assert(Character::isIdentifier(Lex->Curr));
    Lex->tok(Token::KSimple);
    return Error::success();
  }

  this->start();
  if (Error E = lexImpl())
    return E;
  //assert((HasRegex || HasReplacements)
  //    && "Why was this passed to CompoundLexer T-T");
  if (!HasRegex && !HasReplacements) {
    assert(Lex->This != nullptr);
    StripParentheses(TempBuffer);
    StringRef Interned = Lex->Intern(TempBuffer.str());
    Lex->tok(Token::KSimple, Interned);
    return Error::success();
  }
  // Push tokens
  this->finish();
  return Error::success();
}

LLVM_ATTRIBUTE_NOINLINE
Error CompoundLexer::handleRegexError(Character::Kind K) {
  using enum Character::Kind;
  assert(K != KIdentifier && "logic error");
  switch (K) {
  case KOpenCurly:
    return report("quantifiers not allowed in this regex flavor");
  //case KOpenParen:
  //case KCloseParen:
  //  return report("match groups not allowed in this regex flavor");
  case KRange:
  case KNot:
    return report("character '" + Twine(*At)
                + "' found outside character class");
  case KCloseParen:
  case KCloseBrace:
  case KCloseCurly:
    return report("unopened '" + Twine(*At) + "'");
  case KWhitespace:
    return report("whitespace found in pattern");
  default:
    if (llvm::isPrint(*At))
      return report("invalid character '" + Twine(*At) + "' in pattern");
    else
      return report("invalid character in pattern");
  }
}

// PatternLex

constexpr char Token::kStem[] = "stem";
constexpr char Token::kDir[]  = "dir";
constexpr char Token::kExt[]  = "ext";

static StringRef TokenName(Pattern::Token::Kind K) {
  using enum Pattern::Token::Kind;
  switch (K) {
  case KSimple:
    return "Simple";
  case KAnonymous:
    return "Anonymous";
  case KGlob:
    return "Glob";
  case KRegex:
    return "Regex";
  case KThis:
    return "This";
  case KLateBind:
    return "LateBind";
  case KSimpleFmt:
    return "SimpleFmt";
  case KRegexFmt:
    return "RegexFmt";
  default:
    llvm_unreachable("invalid Token::Kind");
  }
}

/// Checks if value is a global id, and returns the enum.
Token::FilePropertyKind Token::GetFilePropertyKind(const char* Str) {
  //static SmallPtrSet<const char*, 4> Props {kStem, kDir, kExt};
  if (LLVM_UNLIKELY(!Str))
    return FPKUnknown;
  if (Str[0] == '\0')
    return FPKFile;
  //if (!Props.contains(Str))
  //  return FPKUnknown;
  // Get the actual properties.
  else if (Str == kStem)
    return FPKStem;
  else if (Str == kDir)
    return FPKDir;
  else if (Str == kExt)
    return FPKExt;
  else
    return FPKUnknown;
  //llvm_unreachable("invalid file property name");
}

Error debase_tool::lexTokensForPattern(StringRef Pat,
                                       SmallVectorImpl<Pattern::Token>& Toks,
                                       StringTransformer Interner,
                                       FilePropertyCache* This) {
  Toks.clear();
  Pat = Pat.trim();
  Pat.consume_front("::");
  // Symbols can never be empty.
  if (Pat.empty())
    return MakeError("invalid pattern: cannot be empty");
  
  PatternLexer PL(Pat, Toks, Interner, This);
  return PL.lex();
}

Error debase_tool::lexTokensForPattern(StringRef Pat,
                                       SmallVectorImpl<Pattern::Token>& Toks,
                                       BumpPtrAllocator& BP, FilePropertyCache* This) {
  return lexTokensForPattern(Pat, Toks,
   [&BP](StringRef S) -> StringRef {
    return InternStringRef(BP, S);
  }, This);
}

raw_ostream& debase_tool::operator<<(raw_ostream& OS, Pattern::Token Tok) {
  OS << "<" << TokenName(Tok.kind) << ":'";
  /*if (Tok.kind == Token::KAnonymous)
    return OS << "@'>";
  else*/ if (Tok.kind == Token::KGlob)
    return OS << "**'>";
  else
    return OS << Tok.str() << "'>";
}

void debase_tool::printTokenGroup(raw_ostream& OS, ArrayRef<Pattern::Token> Toks) {
  if (!Toks.empty()) {
    int SkipCount = 0;
    ListSeparator LS(" :: ");
    for (Pattern::Token Tok : Toks) {
      if (SkipCount--) {
        outs() << Tok << (SkipCount ? ", " : ")");
        continue;
      }
      outs() << LS << Tok;
      if ((SkipCount = Tok.trailing))
        outs() << " (";
    }
  } else {
    outs() << "<empty>";
  }
}

void Pattern::anchor() {}
void MultiPattern::anchor() {}
void SinglePattern::anchor() {}
void GlobPattern::anchor() {}
void SoloPattern::anchor() {}
void RegexPattern::anchor() {}

void Replacer::anchor() {}
void FmtReplacer::anchor() {}
