//===- driver/Pattern.hpp -------------------------------------------------===//
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

#pragma once

#include "llvm/ADT/PointerSumType.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/Regex.h"
#include "llvm/Support/TrailingObjects.h"
#include "LLVM.hpp"
#include "SymbolFeatures.hpp"
#include <concepts>
#include <optional>

#undef LLVM_ENABLE_DUMP
#define LLVM_ENABLE_DUMP 1

namespace debase_tool {

class FilePropertyCache;
class SymbolMatcher;
class Pattern;

#define PATTERN_CLASSOF(KIND)                 \
static bool classof(const class Pattern* P) { \
  return P->kind() == KIND;                   \
}

/// Utility to determine if a Pattern needs to have its destructor called to free memory.
template <std::derived_from<Pattern> Ty>
struct pattern_needs_destructor_called : std::false_type {};

template <class T, std::derived_from<Pattern> U = std::remove_cv_t<T>>
inline constexpr bool pattern_needs_destructor_called_v
    = pattern_needs_destructor_called<U>::value;

#define MARK_NEEDS_DESTRUCTOR(TYPE) \
template <> struct pattern_needs_destructor_called<TYPE> : std::true_type {}

/// Type of pattern.
enum class PatternKind : unsigned {
  Unknown,
  Simple,         // eg. `::x::y::Z`
  LeadingSimple,  // eg. `[x::y]::**::Z`
  LeadingGlob,    // eg. `**::y::Z`
  ButterflyGlob,  // eg. `x::**::Z`
  SingleSequence,
  AnySequence,
  Forwarding,
  Solo,
  Regex,
};

/// The base of symbol matching types.
class Pattern {
public:
  struct Token;
  /// Marks class as having a variable count.
  static constexpr unsigned VARIABLE_COUNT = unsigned(-1);

protected:
  /// The `Kind` of `Pattern` `this` is.
  const PatternKind Kind;
  /// The amount of patterns contained in `this`.
  unsigned Count = VARIABLE_COUNT;
  /// Constructs pattern with undefined count.
  Pattern(PatternKind K) : Kind(K) {}
  /// Constructs pattern with defined count.
  Pattern(PatternKind K, unsigned Count) : Kind(K), Count(Count) {}

public:
  /// Dispatches to type specific match functions.
  inline bool matchSymbol(ArrayRef<std::string> Syms) const;
  /// Returns the kind of `this`.
  PatternKind kind() const { return this->Kind; }
  /// Returns the pattern count.
  unsigned count() const { return Count; }
  /// Returrns the pattern count if fixed, otherwise nullopt.
  std::optional<unsigned> fixedCount() const {
    if (Count != VARIABLE_COUNT)
      return Count;
    else
      return std::nullopt;
  }
  /// Returns the current required count.
  virtual unsigned requiredCount() const {
    if (LLVM_LIKELY(Count != VARIABLE_COUNT))
      return Count;
    llvm_unreachable("got VARIABLE_COUNT in requiredCount(), override this");
  }

  /// Virtual destructor.
  virtual ~Pattern() = default;

  virtual void print(raw_ostream& OS) const = 0;
private:
  virtual void anchor();
};

/// Pattern that operates over multiple pieces at once.
class MultiPattern : public Pattern {
protected:
  MultiPattern(PatternKind K) : Pattern(K) {}
  MultiPattern(PatternKind K, unsigned Count) : Pattern(K, Count) {}

public:
  static bool classof(const class Pattern* P) {
    const PatternKind K = P->kind();
    return K != PatternKind::Solo
        && K != PatternKind::Regex;
  }
  /// Match against a (possibly partial) set of features.
  virtual bool match(ArrayRef<std::string> Names) const = 0;
  /// Match against a set of features.
  LLVM_ATTRIBUTE_ALWAYS_INLINE bool match(this auto& self,
                                          const SymbolFeatures& F) {
    return self.match(F.NestedNames);
  }
private:
  void anchor() override;
};

/// Implements the interface for a trailing class.
#define PATTERN_TRAILING_I(VALUE_T, ...)                        \
private:                                                        \
  friend class __VA_ARGS__;                                     \
  using __VA_ARGS__::getPatterns;                               \
  using __VA_ARGS__::MultiTrailingPattern;                      \
public:                                                         \
  using __VA_ARGS__::New;                                       \
  using __VA_ARGS__::OverloadToken;                             \
  unsigned numTrailingObjects(OverloadToken<VALUE_T>) const {   \
    return Pattern::Count;                                      \
  }                                                             \
private:
/// Defines the interface for a trailing class.
#define PATTERN_TRAILING_X(TYPE, KIND, VALUE_T)                 \
 PATTERN_TRAILING_I(VALUE_T,                                    \
  MultiTrailingPattern<TYPE, KIND, VALUE_T>)
/// Defines the interface for a trailing class.
#define PATTERN_TRAILING(KIND, VALUE_T)                         \
 PATTERN_TRAILING_X(KIND##Pattern, PatternKind::KIND, VALUE_T)

/// Helper type for creating `MultiPattern`s with trailing objects.
template <class Derived, PatternKind KIND, typename ValT>
class MultiTrailingPattern
    : public MultiPattern,
      protected llvm::TrailingObjects<Derived, ValT> {
  using BaseT = llvm::TrailingObjects<Derived, ValT>;
public:
  friend class llvm::TrailingObjects<Derived, ValT>;
  using llvm::TrailingObjects<Derived, ValT>::OverloadToken;
protected:
  MultiTrailingPattern(ArrayRef<ValT> P) : MultiPattern(KIND, P.size()) {
    assert(Derived::classof(this) && "Wrong setup!");
    assert(P.size() == Pattern::Count);
    ValT* Trailing = BaseT::template getTrailingObjects<ValT>();
    std::copy(P.begin(), P.end(), Trailing);
  }
  ArrayRef<ValT> getPatterns() const {
    const ValT* Trailing = BaseT::template getTrailingObjects<ValT>();
    return ArrayRef(Trailing, Trailing + Pattern::Count);
  }
public:
  static Derived* New(llvm::BumpPtrAllocator& BP, ArrayRef<ValT> P) {
    assert(!P.empty() && "Invalid Pattern!");
    void* Mem = BP.Allocate(
      BaseT::template totalSizeToAlloc<ValT>(P.size()),
      alignof(Derived));
    return new (Mem) Derived(P);
  }
  unsigned requiredCount() const override { return Pattern::Count; }
};

/// Pattern that operates on a single piece.
class SinglePattern : public Pattern {
  //friend class SymbolMatcher;
  using Pattern::Count;
protected:
  SinglePattern(PatternKind K) : Pattern(K, 1) {}
public:
  static bool classof(const class Pattern* P) {
    const PatternKind K = P->kind();
    return K == PatternKind::Solo
        || K == PatternKind::Regex;
  }
  /// Match against a single feature.
  virtual bool match(StringRef Name) const = 0;
  /// Returns the current required count.
  unsigned requiredCount() const override final { return 1; }
private:
  void anchor() override;
};

bool Pattern::matchSymbol(ArrayRef<std::string> Syms) const {
  if (LLVM_UNLIKELY(Syms.empty()))
    return false;
  if (auto* SP = dyn_cast<SinglePattern>(this)) {
    if (Syms.size() != 1)
      return false;
    return SP->match(StringRef(Syms[0]));
  }
  return cast<MultiPattern>(this)->match(Syms);
}

////////////////////////////////////////////////////////////////////////////////
// Multi

/// The simplest pattern type.
class SimplePattern final
    : public MultiTrailingPattern<
               SimplePattern, PatternKind::Simple,
               StringRef> {
  PATTERN_TRAILING(Simple, StringRef)
public:
  PATTERN_CLASSOF(PatternKind::Simple)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
};

/// A pattern type for cases such as `[x::y]::**::Z`. Assumes that there will be
/// more patterns following it, and so it will fail to match if there isn't.
class LeadingSimplePattern final
    : public MultiTrailingPattern<
               LeadingSimplePattern, PatternKind::LeadingSimple,
               StringRef> {
  PATTERN_TRAILING(LeadingSimple, StringRef)
public:
  PATTERN_CLASSOF(PatternKind::LeadingSimple)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
};

/// Matches against multiple single operation patterns.
class SingleSequencePattern final
    : public MultiTrailingPattern<
               SingleSequencePattern, PatternKind::SingleSequence,
               SinglePattern*> {
  PATTERN_TRAILING(SingleSequence, SinglePattern*)
public:
  PATTERN_CLASSOF(PatternKind::SingleSequence)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
};

/// Matches against multiple operation patterns.
class AnySequencePattern final
    : public MultiTrailingPattern<
               AnySequencePattern, PatternKind::AnySequence,
               Pattern*> {
  unsigned RealCount = 0;
  PATTERN_TRAILING(AnySequence, Pattern*)
  AnySequencePattern(ArrayRef<Pattern*> Patterns);
public:
  PATTERN_CLASSOF(PatternKind::AnySequence)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
  unsigned requiredCount() const override final { return RealCount; }
};

/// Matches against multiple operation patterns.
class ForwardingPattern final : public MultiPattern {
  friend class SymbolMatcher;
  SinglePattern* ThePattern = nullptr;
  ForwardingPattern(SinglePattern* P)
   : MultiPattern(PatternKind::Forwarding, 1), ThePattern(P) {}
public:
  PATTERN_CLASSOF(PatternKind::Forwarding)
  bool match(ArrayRef<std::string> Names) const override {
    if (LLVM_UNLIKELY(Names.size() != 1))
      return false;
    return ThePattern->match(StringRef(Names[0]));
  }
  void print(raw_ostream& OS) const override;
  unsigned requiredCount() const override final { return 1; }
};

/// Base for globbing patterns. Globs from the left hand side.
class GlobPattern : public MultiPattern {
  friend class SymbolMatcher;
protected:
  GlobPattern(PatternKind K) : MultiPattern(K) {}
  GlobPattern(PatternKind K, unsigned Count) : MultiPattern(K, Count) {}
public:
  static bool classof(const class Pattern* P) {
    const PatternKind K = P->kind();
    return K == PatternKind::LeadingGlob
        || K == PatternKind::ButterflyGlob;
  }
private:
  void anchor() override;
};

/// Glob for things such as `**::y::Z`.
class LeadingGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  MultiPattern* Trailing;
protected:
  LeadingGlobPattern(MultiPattern* P)
   : GlobPattern(PatternKind::LeadingGlob), Trailing(P) {
    assert(this->Trailing != nullptr);
  }
public:
  PATTERN_CLASSOF(PatternKind::LeadingGlob)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
  unsigned requiredCount() const override { return Trailing->requiredCount(); }
};

/// Glob for things such as `x::**::Z`.
class ButterflyGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  MultiPattern* Leading;
  MultiPattern* Trailing;
protected:
  ButterflyGlobPattern(MultiPattern* L, MultiPattern* T)
   : GlobPattern(PatternKind::ButterflyGlob), Leading(L), Trailing(T) {
    assert(this->Leading && this->Trailing);
    assert(Leading->count() != VARIABLE_COUNT);
    assert(Trailing->count() != VARIABLE_COUNT);
  }
public:
  PATTERN_CLASSOF(PatternKind::ButterflyGlob)
  bool match(ArrayRef<std::string> Names) const override;
  void print(raw_ostream& OS) const override;
  unsigned requiredCount() const override {
    return Leading->requiredCount() + Trailing->requiredCount();
  }
};

/// **::x{file.stem}::**::y::/Zt?/
/// x{file.stem}::**::y::**::/Zt?/
/// w::/x+/::y::/Z+/

////////////////////////////////////////////////////////////////////////////////
// Single

class ProxySoloPattern;
template <class T> class ReplacerStorage;

/// Matches against a single expression.
class SoloPattern final : public SinglePattern {
  friend class SymbolMatcher;
  friend class ProxySoloPattern;
  template <class> friend class ReplacerStorage;
  StringRef P;
protected:
  SoloPattern() : SinglePattern(PatternKind::Solo) {}
  SoloPattern(StringRef P)
   : SinglePattern(PatternKind::Solo), P(P) {
    assert(!P.empty());
  }
public:
  PATTERN_CLASSOF(PatternKind::Solo)
  void replace(StringRef P) { this->P = P; }
  bool match(StringRef Name) const override {
    return this->P == Name;
  }
  void print(raw_ostream& OS) const override;
private:
  void anchor() override;
};

/// Matches against a regular expression.
class RegexPattern final : public SinglePattern {
  friend class SymbolMatcher;
  template <class> friend class ReplacerStorage;
  std::optional<llvm::Regex> RegExp;
protected:
  RegexPattern() : SinglePattern(PatternKind::Regex) {}
  RegexPattern(StringRef RegExp)
   : SinglePattern(PatternKind::Regex), RegExp(RegExp) {
    assert(!RegExp.empty());
  }
public:
  PATTERN_CLASSOF(PatternKind::Regex)
  void replace(StringRef RegExp) {
    this->RegExp.emplace(RegExp);
  }
  bool match(StringRef Name) const override {
    return RegExp->match(Name);
  }
  void print(raw_ostream& OS) const override;
private:
  void anchor() override;
};

/// Wrapper around `SoloPattern` for replacements.
class ProxySoloPattern final {
  SoloPattern P;
public:
  ProxySoloPattern() = default;
  ProxySoloPattern(StringRef P) : P(P) {}
  void replace(StringRef S) { P.replace(S); }
  SoloPattern* operator&() & { return &P; }
  const SoloPattern* operator&() const& { return &P; }
};

//MARK_NEEDS_DESTRUCTOR(SimplePattern);
//MARK_NEEDS_DESTRUCTOR(SingleSequencePattern);
MARK_NEEDS_DESTRUCTOR(RegexPattern);

#undef PATTERN_TRAILING
#undef PATTERN_TRAILING_X
#undef PATTERN_TRAILING_I

#undef MARK_NEEDS_DESTRUCTOR
#undef PATTERN_CLASSOF

////////////////////////////////////////////////////////////////////////////////
// Replacer

/// The interface for replacable data.
class Replacer {
public:
  virtual ~Replacer() = default;
  virtual llvm::Error replace(llvm::BumpPtrAllocator& BP,
                              FilePropertyCache& C) = 0;

protected:
  virtual void replaceData(StringRef S) = 0;
  virtual bool isRegex() const = 0;
  virtual void anchor();
};

/// The interface for formatting replacable data.
class FmtReplacer : public Replacer {
  struct ReplacerPiece {
    const char* Lit = nullptr;
    unsigned Size = 0;
    bool IsFormat = 0;
  };
  // Add format object.
  SmallVector<ReplacerPiece, 2> Pieces;
  /// Parses tokens into a replacement vector.
  static SmallVector<ReplacerPiece, 2>
   ParseToks(ArrayRef<Pattern::Token> Toks);
public:
  FmtReplacer(ArrayRef<Pattern::Token> Toks) : Pieces(ParseToks(Toks)) {}
  llvm::Error replace(llvm::BumpPtrAllocator& BP,
                      FilePropertyCache& C) override final;
private:
  void anchor() override;
};

/// Holds data for replacements.
template <class T>
class ReplacerStorage final : public FmtReplacer {
  friend class SymbolMatcher;
  static_assert(std::derived_from<T, SinglePattern>);
  T ThePattern;
  ReplacerStorage(ArrayRef<Pattern::Token> Toks)
   : FmtReplacer(Toks), ThePattern() {}
private:
  void replaceData(StringRef S) override {
    ThePattern.replace(S);
  }
  bool isRegex() const override {
    return std::same_as<T, RegexPattern>;
  }
};

/// Holds data for replacements.
template <>
class ReplacerStorage<ProxySoloPattern> final : public Replacer {
  friend class SymbolMatcher;
  const char* TheProp;
  ProxySoloPattern ThePattern;
  ReplacerStorage(Pattern::Token Tok);
private:
  llvm::Error replace(llvm::BumpPtrAllocator& BP,
                      FilePropertyCache& C) override;
  void replaceData(StringRef S) override {
    ThePattern.replace(S);
  }
  bool isRegex() const override {
    return false;
  }
};

} // namespace debase_tool
