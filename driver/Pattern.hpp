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

#include "llvm/Support/Error.h"
#include "LLVM.hpp"
#include "SymbolFeatures.hpp"
#include <concepts>
#include <optional>

namespace debase_tool {

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
  Simple,           // eg. `::x::y::Z`
  BaseNameOnlyGlob, // eg. `**::Z`
  NestedNameGlob,   // eg. `**::y::Z`
};

/// The base of symbol matching types.
class Pattern {
public:
  struct Token;
  /// Marks class as having a variable count.
  static constexpr unsigned VARIABLE_COUNT = unsigned(-1);

protected:
  /// The `Kind` of `Pattern` `this` is.
  PatternKind Kind = PatternKind::Unknown;
  /// The amount of patterns contained in `this`.
  unsigned Count = VARIABLE_COUNT;
  /// Constructs pattern with undefined count.
  Pattern(PatternKind K) : Kind(K) {}
  /// Constructs pattern with defined count.
  Pattern(PatternKind K, unsigned Count) : Kind(K), Count(Count) {}

public:
  /// Match against a (possibly partial) set of features.
  virtual bool match(ArrayRef<std::string> Names) const = 0;
  /// Match against a set of features.
  bool match(this const Pattern& self, const SymbolFeatures& F) {
    return self.match(F.NestedNames);
  }

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

  /// If the class has any complex behaviour.
  //virtual bool isSimple() const { return false; }
  /// If the class needs to be regenerated for every file.
  //virtual bool isFinal() const { return true; }

  /// Virtual destructor.
  virtual ~Pattern() = default;

private:
  virtual void anchor();
};

/// The simplest pattern type.
class SimplePattern final : public Pattern {
  friend class SymbolMatcher;
  SmallVector<StringRef, 2> Patterns;
protected:
  SimplePattern(ArrayRef<StringRef> P)
   : Pattern(PatternKind::Simple, P.size()), Patterns(P) {
    assert(!Patterns.empty());
  }
public:
  PATTERN_CLASSOF(PatternKind::Simple)
  bool match(ArrayRef<std::string> Names) const override;
  unsigned requiredCount() const override { return Pattern::Count; }
  //bool isSimple() const override { return true; }
};

/// Base for globbing patterns. Globs from the left hand side.
class GlobPattern : public Pattern {
protected:
  GlobPattern(PatternKind K) : Pattern(K) {}
  GlobPattern(PatternKind K, unsigned Count) : Pattern(K, Count) {}
private:
  void anchor() override;
};

/// Simplest glob pattern. For things such as `**::ClassName`.
class BaseNameOnlyGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  StringRef Pattern;
protected:
  BaseNameOnlyGlobPattern(StringRef P)
   : GlobPattern(PatternKind::BaseNameOnlyGlob), Pattern(P) {}
public:
  PATTERN_CLASSOF(PatternKind::BaseNameOnlyGlob)
  bool match(ArrayRef<std::string> Names) const override;
  unsigned requiredCount() const override { return 1; }
};

/// Glob for things such as `**::x::ClassName`.
class NestedNameGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  SimplePattern* Nested;
protected:
  NestedNameGlobPattern(SimplePattern* P)
   : GlobPattern(PatternKind::NestedNameGlob), Nested(P) {
    assert(this->Nested != nullptr);
  }
public:
  PATTERN_CLASSOF(PatternKind::NestedNameGlob)
  bool match(ArrayRef<std::string> Names) const override;
  unsigned requiredCount() const override { return Nested->count(); }
};

MARK_NEEDS_DESTRUCTOR(SimplePattern);

static_assert(pattern_needs_destructor_called_v<SimplePattern>);
static_assert(pattern_needs_destructor_called_v<const SimplePattern>);
static_assert(!pattern_needs_destructor_called_v<NestedNameGlobPattern>);

#undef MARK_NEEDS_DESTRUCTOR
#undef PATTERN_CLASSOF

} // namespace debase_tool
