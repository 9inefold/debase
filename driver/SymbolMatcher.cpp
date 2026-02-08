//===- driver/SymbolMatcher.cpp -------------------------------------------===//
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
/// Implements a structure to match symbols against.
///
//===----------------------------------------------------------------------===//

#include "SymbolMatcher.hpp"
#include "llvm/ADT/ScopeExit.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/JSON.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Path.h"
#include "FilePropertyCache.hpp"
#include "PatternLex.hpp"

#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/raw_ostream.h"

using namespace debase_tool;
using namespace llvm;

using Token = Pattern::Token;

static Error MakeError(const Twine& Msg) {
  return createStringError(llvm::inconvertibleErrorCode(), Msg);
}

LLVM_ATTRIBUTE_ALWAYS_INLINE
ArrayRef<Pattern::Token> SymbolMatcher::TokenGroup::arr() const {
  return {Tok, Tok + Count};
}

SymbolMatcher::~SymbolMatcher() {
  for (Pattern* P : ToDestroy) {
    if (LLVM_LIKELY(P != nullptr))
      std::destroy_at(P);
  }
  for (Replacer* R : Replacements) {
    if (LLVM_LIKELY(R != nullptr))
      std::destroy_at(R);
  }
}

Error SymbolMatcher::setFilename(StringRef Filename) {
  CurrentFilename = intern(Filename);
  FilePropertyCache FPC(*CurrentFilename);
  for (Replacer* R : Replacements) {
    if (Error E = R->replace(BP, FPC)) [[unlikely]] {
      if (!Permissive)
        return E;
#ifndef NDEBUG
      //else
      //  outs() << "Unable to set filename for "
      //         << static_cast<void*>(R) << '\n';
#endif
    }
  }
  return Error::success();
}

StringRef SymbolMatcher::intern(StringRef S) {
  if (S.empty())
    return "";
  char* Out = BP.Allocate<char>(S.size() + 1);
  std::memcpy(Out, S.data(), S.size());
  Out[S.size()] = '\0';
  return {Out, S.size()};
}

bool SymbolMatcher::ownsThisData(const void* Ptr) {
  return BP.identifyObject(Ptr).has_value();
}

Expected<Pattern*> SymbolMatcher::compilePattern(
    StringRef Pat, SmallVectorImpl<Pattern::Token>* ToksBuf) {
  Pattern*& Out = PatternMappings[Pat];
  if (Out != nullptr)
    return Out;
  Expected<Pattern*> CompiledOrErr = [=, this] {
    if (ToksBuf)
      return this->compilePatternImpl(Pat, *ToksBuf);
    else
      return this->compilePatternImpl(Pat);
  }();
  if (!CompiledOrErr)
    return CompiledOrErr.takeError();
  return (Out = *CompiledOrErr);
}

LLVM_ATTRIBUTE_NOINLINE
Expected<Pattern*> SymbolMatcher::compilePatternImpl(StringRef Pat) {
  SmallVector<Pattern::Token> Toks;
  if (Error E = lexTokensForPattern(Pat, Toks, BP))
    return E;
  return compilePatternImpl(Toks);
}

Expected<Pattern*> SymbolMatcher::compilePatternImpl(
    StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks) {
  if (Error E = lexTokensForPattern(Pat, Toks, BP))
    return E;
  return compilePatternImpl(Toks);
}

Expected<unsigned> SymbolMatcher::splitIntoGroups(ArrayRef<Pattern::Token> Toks,
                                                  SmallVectorImpl<TokenGroup>& Groups) {
  unsigned Globs = 0;
  size_t I = 0, E = Toks.size();
  while (I < E) {
    TokenGroup Group {
      .Tok = &Toks[I],
      .AllSimple = true
    };
    // Skip leading globs
    if (Group.Tok->kind == Token::KGlob) {
      ++Globs;
      Group.Tok = &Toks[++I];
      Group.LeadingGlob = true;
      if (LLVM_UNLIKELY(Group.Tok->kind == Token::KGlob))
        return MakeError("sequential globs not coalesced?");
      else if (LLVM_UNLIKELY(I >= E))
        return MakeError("glob token found at end of pattern?");
    }
    // Check for replacement groups
    if (Group.Tok->trailing > 0) {
      // Replacements are always their own group
      Group.Count = Group.Tok->trailing + 1;
      Group.AllSimple = false;
      Group.Replacement = true;
      I += Group.Count;
      Groups.push_back(Group);
      continue;
    }
    
    // Search for terminating token
    size_t N = 0, LastTheEnd = E - I;
    for (; N < LastTheEnd; ++N, ++I) {
      Token Curr = Group.Tok[N];
      if (Curr.kind == Token::KGlob)
        break;
      else if (Curr.trailing > 0)
        break;
      if (!Curr.isLiteral())
        Group.AllSimple = false;
    }
    if (LLVM_UNLIKELY(N == 0))
      return MakeError("found empty group?");

    Group.Count = N;
    Groups.push_back(Group);
  }

  if (LLVM_UNLIKELY(Groups.empty()))
    return MakeError("found no groups?");
  return Globs;
}

Expected<Pattern*> SymbolMatcher::compilePatternImpl(ArrayRef<Pattern::Token> Toks) {
  SmallVector<TokenGroup> Groups;
  Expected<unsigned> GlobsOrErr = splitIntoGroups(Toks, Groups);
  if (!GlobsOrErr)
    return GlobsOrErr.takeError();
  const unsigned Globs = *GlobsOrErr;
#if 0
  ListSeparator LS(" :: ");
  for (TokenGroup Group : Groups) {
    outs() << LS << (Group.Replacement ? "*[ " : "[ ");
    printTokenGroup(outs(), Group.arr());
    outs() << " ]";
  }
  outs() << '\n';
#endif
  // Switch based on globs
  if (Globs == 0)
    return compilePattern0Globs(Groups);
  else if (Globs == 1)
    return compilePattern1Globs(Groups);
  else /*Globs > 1*/
    return compilePatternNGlobs(Groups, Globs);
}

SimplePattern* SymbolMatcher::makeSimple(TokenGroup Group) {
  assert(Group.AllSimple);
  SmallVector<StringRef> Literals;
  Literals.reserve(Group.Count);
  for (Pattern::Token Tok : Group.arr())
    Literals.push_back(Tok.str());
  return makeNew<SimplePattern>(Literals);
}

SingleSequencePattern* SymbolMatcher::makeSingleSequence(TokenGroup Group) {
  SmallVector<SinglePattern*> Patterns;
  Patterns.reserve(Group.Count);
  for (Pattern::Token Tok : Group.arr()) {
    switch (Tok.kind) {
    case Token::KSimple:
    case Token::KAnonymous:
      Patterns.push_back(
        make<SoloPattern>(Tok.str()));
      break;
    case Token::KLateBind:
      Patterns.push_back(
        makeR<ProxySoloPattern>(Tok));
      break;
    case Token::KRegex:
      Patterns.push_back(
        make<RegexPattern>(Tok.str()));
      break;
    default:
      llvm_unreachable("invalid token kind");
    }
  }
  return makeNew<SingleSequencePattern>(Patterns);
}

SinglePattern* SymbolMatcher::makeReplacement(TokenGroup Group) {
  assert(Group.Replacement);
  Token::Kind K = Group.Tok[0].kind;
  if (K == Token::KSimpleFmt)
    return makeR<SoloPattern>(Group.arr());
  else if (K == Token::KRegexFmt)
    return makeR<RegexPattern>(Group.arr());
  llvm_unreachable("invalid replacement kind");
}

Pattern* SymbolMatcher::makeDispatch(TokenGroup Group) {
  if (Group.AllSimple)
    return makeSimple(Group);
  else if (Group.Replacement)
    return makeReplacement(Group);
  else
    return makeSingleSequence(Group);
}

Pattern* SymbolMatcher::compilePattern0Globs(ArrayRef<TokenGroup> Groups) {
  if (Groups.size() == 1)
    return makeDispatch(Groups[0]);
  SmallVector<Pattern*> Patterns;
  for (TokenGroup Group : Groups)
    Patterns.push_back(makeDispatch(Group));
  return makeNew<AnySequencePattern>(Patterns);
}

Expected<Pattern*> SymbolMatcher::compilePattern1Globs(ArrayRef<TokenGroup> Groups) {
  if (Groups[0].LeadingGlob) {
    return make<LeadingGlobPattern>(
             wrap(compilePattern0Globs(Groups)));
  }
  // Grab all the groups up to the glob
  auto Leading = Groups.take_until([](TokenGroup G){ return G.LeadingGlob; });
  auto Trailing = Groups.drop_front(Leading.size());
  return make<ButterflyGlobPattern>(
    wrap(compilePattern0Globs(Leading)),
    wrap(compilePattern0Globs(Trailing))
  );
}

Expected<Pattern*> SymbolMatcher::compilePatternNGlobs(ArrayRef<TokenGroup> Groups,
                                                       unsigned N) {
  assert(Groups.size() > 1);
  return MakeError("compilePatternNGlobs unimplemented!");
}

////////////////////////////////////////////////////////////////////////////////
// JSON Config

using JSONLoaderHandler = SymbolMatcher::JSONLoaderHandler;

class SymbolMatcher::JSONLoaderHandler {
  json::Value JSON;
  StringRef Filename;
  FilePropertyCache FPC;
  SymbolMatcher* P = nullptr;
  SmallVectorImpl<std::string>* OutFiles = nullptr;
  SmallVector<Pattern::Token> TokenBuf;

public:
  JSONLoaderHandler(JSONLoaderHandler&&) = default;
  /// Creates a new `JSONLoaderHandler` from `Filename`, otherwise returns error.
  static Expected<JSONLoaderHandler> New(StringRef Filename,
                                         SymbolMatcher* thiz,
                                         SmallVectorImpl<std::string>* OutFiles);
private:
  /// Internal default constructor.
  JSONLoaderHandler(json::Value&& JSON, StringRef Filename,
                    SymbolMatcher* thiz, SmallVectorImpl<std::string>* OutFiles)
   : JSON(std::move(JSON)), Filename(thiz->intern(Filename)),
     FPC(this->Filename), P(thiz), OutFiles(OutFiles) {
    assert(thiz != nullptr);
  }

  void addCtor(Pattern* Pat) {
    assert(Pat != nullptr);
    P->CtorPatterns.insert(Pat);
  }
  void addDtor(Pattern* Pat) {
    assert(Pat != nullptr);
    P->DtorPatterns.insert(Pat);
  }
  void addAll(Pattern* Pat) {
    this->addCtor(Pat);
    this->addDtor(Pat);
  }

public:
  Error load();
  Error loadFiles(json::Array& files);
  Error loadPatterns(json::Object& patterns);
  Error loadPatterns(json::Array& patterns);
  Error loadPattern(StringRef pattern);

  Error loadSubpatterns(json::Object& patterns, StringRef name,
                        SmallVectorImpl<Pattern*>& Out);

  Error report(const Twine& Msg) const {
    return MakeError(Twine("In ") + Filename + ": " + Msg);
  }
};

Expected<JSONLoaderHandler> JSONLoaderHandler::New(StringRef Filename,
                                                   SymbolMatcher* thiz,
                                                   SmallVectorImpl<std::string>* OutFiles) {
  outs() << Filename << '\n';
  ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrErr =
      MemoryBuffer::getFile(Filename);
  if (std::error_code EC = FileOrErr.getError())
    return llvm::errorCodeToError(EC);
  // Parse JSON
  StringRef FileContents = (*FileOrErr)->getBuffer();
  Expected<json::Value> JSON = json::parse(FileContents);
  if (!JSON)
    return JSON.takeError();
  // Valid!
  return JSONLoaderHandler(std::move(*JSON), Filename, thiz, OutFiles);
}

Error JSONLoaderHandler::load() {
  if (json::Object* root = JSON.getAsObject()) {
    // Check if we even care
    if (this->OutFiles) {
      // "files": [...]
      if (json::Array* files = root->getArray("files")) {
        if (Error E = this->loadFiles(*files))
          return E;
      } else
        return report("'files' does not exist or is not an array");
    }

    // "patterns": { ... } or [...] or "..."
    if (json::Object* patterns = root->getObject("patterns"))
      return this->loadPatterns(*patterns);
    else if (json::Array* patterns = root->getArray("patterns"))
      return this->loadPatterns(*patterns);
    else if (auto pattern = root->getString("patterns"))
      return this->loadPattern(*pattern);
    else
      return report("'patterns' does not exist or is not an object/array/string");
  }
  return report("root node is not an object");
}

Error JSONLoaderHandler::loadFiles(json::Array& files) {
  SmallString<128> Buf;
  StringRef reldir = sys::path::parent_path(Filename);
  assert(this->OutFiles != nullptr);
  for (json::Value& _file : files) {
    auto file = _file.getAsString();
    if (LLVM_UNLIKELY(!file)) {
      if (P->Permissive)
        continue;
      return report("filename is not a string");
    }
    // Resolve the file
    // TODO: Make this fancier
    Buf = *file;
    sys::fs::make_absolute(reldir, Buf);
    // Make sure it's a real file!
    bool IsFile = true;
    if (auto EC = sys::fs::is_regular_file(Buf.str(), IsFile))
      return errorCodeToError(EC);
    if (IsFile)
      OutFiles->emplace_back(static_cast<std::string>(Buf));
  }
  return Error::success();
}

Error JSONLoaderHandler::loadSubpatterns(json::Object& patterns, StringRef name,
                                         SmallVectorImpl<Pattern*>& Out) {
  if (json::Value* field = patterns.get(name)) {
    if (json::Array* patterns = field->getAsArray()) {
      for (json::Value& _pattern : *patterns) {
        auto pattern = _pattern.getAsString();
        if (LLVM_UNLIKELY(!pattern)) {
          if (P->Permissive)
            continue;
          return report("pattern is not a string");
        }
        Expected<Pattern*> Pat = P->compilePattern(*pattern, &TokenBuf);
        if (LLVM_UNLIKELY(!Pat))
          return Pat.takeError();
        Out.push_back(*Pat);
      }
    } else if (auto pattern = field->getAsString()) {
      Expected<Pattern*> Pat = P->compilePattern(*pattern, &TokenBuf);
      if (LLVM_UNLIKELY(!Pat))
        return Pat.takeError();
      Out.push_back(*Pat);
    } else if (!P->Permissive)
      return report("field \"" + Twine(name) + "\" is not an array or string");
  }
  return Error::success();
}

Error JSONLoaderHandler::loadPatterns(json::Object& patterns) {
  SmallVector<Pattern*> Ctors;
  SmallVector<Pattern*> Dtors;
  SmallVector<Pattern*> All;
  // Load everything into their respective arrays
  if (Error E = loadSubpatterns(patterns, "ctor", Ctors))
    return E;
  if (Error E = loadSubpatterns(patterns, "dtor", Ctors))
    return E;
  if (Error E = loadSubpatterns(patterns, "all", All))
    return E;
  // Ensure we actually have values
  if (Ctors.empty() && Dtors.empty() && All.empty())
    return report("no patterns found in config (ctor/dtor/all)");
  // Add ctor patterns
  P->CtorPatterns.insert(Ctors.begin(), Ctors.end());
  P->CtorPatterns.insert(All.begin(), All.end());
  // Add dtor patterns
  P->DtorPatterns.insert(Dtors.begin(), Dtors.end());
  P->DtorPatterns.insert(All.begin(), All.end());
  // Lets gooo
  return Error::success();
}

Error JSONLoaderHandler::loadPatterns(json::Array& patterns) {
  for (auto& _pattern : patterns) {
    auto pattern = _pattern.getAsString();
    if (LLVM_UNLIKELY(!pattern)) {
      if (P->Permissive)
        continue;
      return report("pattern is not a string");
    }
    // Now actually load the pattern.
    if (Error E = loadPattern(*pattern)) {
      if (!P->Permissive)
        return E;
    }
  }
  return Error::success();
}

Error JSONLoaderHandler::loadPattern(StringRef pattern) {
  Expected<Pattern*> Pat = P->compilePattern(pattern, &TokenBuf);
  if (LLVM_UNLIKELY(!Pat))
    return Pat.takeError();
  this->addAll(*Pat);
  return Error::success();
}

Error SymbolMatcher::loadSymbolsFromJSONFile(
    StringRef ConfigFile, SmallVectorImpl<std::string>* OutFiles) {
  SmallString<80> ConfigFileReal = ConfigFile;
  //sys::fs::make_absolute(ConfigFileReal);
  if (auto EC = sys::fs::make_absolute(ConfigFileReal))
    return errorCodeToError(EC);
  Expected<JSONLoaderHandler> JSON =
      JSONLoaderHandler::New(ConfigFileReal.str(), this, OutFiles);
  if (!JSON)
    return JSON.takeError();
  return JSON->load();
}
