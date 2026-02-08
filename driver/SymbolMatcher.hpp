//===- driver/SymbolMatcher.hpp -------------------------------------------===//
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

#pragma once

#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/StringSaver.h"
#include "LLVM.hpp"
#include "Pattern.hpp"
#include <optional>
#include <utility>

namespace debase_tool {

class FilePropertyCache;

/// Utility to help match symbols.
class SymbolMatcher {
  llvm::BumpPtrAllocator BP;
  /// Used to cache pattern mappings.
  llvm::StringMap<Pattern*, llvm::BumpPtrAllocator&> PatternMappings;

  /// The type used to store patterns.
  using PatternStorageTy = llvm::SmallPtrSet<Pattern*, 4>;
  /// Patterns used for matching constructors.
  PatternStorageTy CtorPatterns;
  /// Patterns used for matching destructors.
  PatternStorageTy DtorPatterns;

  /// Contains the Patterns which need to be destroyed.
  llvm::SmallPtrSet<Pattern*, 4> ToDestroy;
  /// Contains replacements
  SmallVector<Replacer*, 4> Replacements;

  /// Filename of the current module.
  std::optional<StringRef> CurrentFilename;

  /// If errors can be continued.
  bool Permissive = false;

public:
  class JSONLoaderHandler;
  friend class JSONLoaderHandler;

  SymbolMatcher(bool Permissive = false)
   : PatternMappings(BP), Permissive(Permissive) {}
  ~SymbolMatcher();

  /// Loads symbol patterns and filenames from a JSON config file.
  llvm::Error loadSymbolsFromJSONFile(StringRef ConfigFile,
                                      SmallVectorImpl<std::string>* OutFiles = nullptr);

  /// TODO: Remove
  llvm::Error setFilename(StringRef Filename);

  /// Creates a new `Pattern` object if uncached, otherwise returns cached.
  Expected<Pattern*> compilePattern(
   StringRef Pat, SmallVectorImpl<Pattern::Token>* ToksBuf = nullptr);

private:
  struct TokenGroup {
    const Pattern::Token* Tok = nullptr;
    unsigned Count = 0;
    bool AllSimple   : 1 = false;
    bool Replacement : 1 = false;
    bool LeadingGlob : 1 = false;
    //bool TrailingGlob : 1 = false;
  public:
    inline ArrayRef<Pattern::Token> arr() const;
  };

  /// Splits `Pattern::Token`s into `TokenGroup`s.
  /// @return The number of glob groups.
  Expected<unsigned> splitIntoGroups(ArrayRef<Pattern::Token> Toks,
                                     SmallVectorImpl<TokenGroup>& Groups);

  /// Creates a completely new `Pattern` object.
  Expected<Pattern*> compilePatternImpl(StringRef Pat);
  /// Creates a completely new `Pattern` object from tokens.
  Expected<Pattern*> compilePatternImpl(
      StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks);
  /// Creates a completely new `Pattern` object from tokens.
  Expected<Pattern*> compilePatternImpl(ArrayRef<Pattern::Token> Toks);

  /// Creates a completely new `Pattern` without globs.
  Pattern* compilePattern0Globs(ArrayRef<TokenGroup> Groups);
  /// Creates a completely new `Pattern` with a single glob.
  Expected<Pattern*> compilePattern1Globs(ArrayRef<TokenGroup> Groups);
  /// Creates a completely new `Pattern` with >1 globs.
  /// Uses a different, more complex method of matching.
  Expected<Pattern*> compilePatternNGlobs(ArrayRef<TokenGroup> Groups, unsigned N);

  /// Creates a `Pattern` from a `TokenGroup`.
  Pattern* makeDispatch(TokenGroup Group);
  /// Creates a `SimplePattern` from a `TokenGroup`.
  SimplePattern* makeSimple(TokenGroup Group);
  /// Creates a `SingleSequencePattern` from a `TokenGroup`.
  SingleSequencePattern* makeSingleSequence(TokenGroup Group);
  /// Creates a `SinglePattern` from a `TokenGroup`.
  SinglePattern* makeReplacement(TokenGroup Group);

  template <class NodeT>
  LLVM_ATTRIBUTE_ALWAYS_INLINE void addToDestroy(NodeT* Out) {
    if constexpr (std::derived_from<NodeT, Pattern>) {
      if (pattern_needs_destructor_called_v<NodeT>)
        ToDestroy.insert(static_cast<Pattern*>(Out));
    }
  }

public:
  /// Creates a new node of type `NodeT`.
  template <class NodeT, typename...Args> NodeT* make(Args&&...args) {
    NodeT* Out = new (BP) NodeT(std::forward<Args>(args)...);
    this->addToDestroy(Out);
    return Out;
  }
  /// Creates a new node of type `NodeT`.
  template <class NodeT, typename...Args> NodeT* makeNew(Args&&...args) {
    NodeT* Out = NodeT::New(BP, std::forward<Args>(args)...);
    this->addToDestroy(Out);
    return Out;
  }
  /// Creates a new `ReplacerStorage<NodeT>` and returns the held `NodeT`.
  template <class NodeT> auto* makeR(auto Toks) {
    auto* Rep = make<ReplacerStorage<NodeT>>(Toks);
    Replacements.push_back(Rep);
    return &Rep->ThePattern;
  }

private:
  template <class NodeT>
  LLVM_ATTRIBUTE_ALWAYS_INLINE MultiPattern* wrap(NodeT* Node) {
    constexpr bool IsSingle = std::derived_from<NodeT, SinglePattern>;
    if (IsSingle || isa<SinglePattern>(Node)) {
      return make<ForwardingPattern>(
               cast<SinglePattern>(Node));
    }
    return cast<MultiPattern>(Node);
  }

public:
  /// Saves string with BP.
  StringRef intern(StringRef S);
  /// Checks data was allocated by this matcher.
  bool ownsThisData(const void* Ptr);
  /// Checks string was allocated by this matcher.
  bool ownsThisData(StringRef S) { return ownsThisData(S.data()); }
};

} // namespace debase_tool
