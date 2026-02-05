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

#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "LLVM.hpp"
#include <cstdint>
#include <optional>

namespace debase_tool {

struct Features;
class SymbolMatcher;

/// The base of symbol matching types.
class Pattern {
public:
  struct Token;
  virtual ~Pattern() = default;
  virtual bool match(const Features& F) = 0;
  virtual bool isSimple() const { return false; }
private:
  void anchor();
};

/// Represents a single token of a pattern.
struct Pattern::Token {
  enum Kind : uint32_t {
    KUnknown,
    KSimple,    // eg. `::x::y::Z`
    KAnonymous, // `@`
    KGlob,      // `**`
    KThis,      // `{this.*}`
    KLateBind,  // `{file.*}`
    KRegex,     // eg. `I*X+0?[...]`
    KSimpleFmt, // `I{file.stem}v{...}` => `"I%0v%1" + [file.stem, ...]`
    KRegexFmt,  // `I?{file.stem}+` => `"I?(%0)+" + [file.stem]`
  };

  /// The string `stem`.
  static const char kStem[];
  /// The string `dir`.
  static const char kDir[];
  /// The string `ext`.
  static const char kExt[];

  static constexpr uint32_t kMaxTrailing = (1 << 3) - 1;

  /// The kind of the token.
  Kind kind = KSimple;
  /// The length of the token data.
  uint32_t size : 24 = 0;
  /// The number of trailing arguments (for a format group)
  /// Currently only 6 options, so it can be less bits.
  uint32_t trailing : 3 = 0;
  /// If this token should be grouped with the next.
  uint32_t grouped : 1 = 0;
  /// If this token's text has been modified.
  uint32_t modified : 1 = 0;
  /// The token data.
  const char* data = nullptr;

public:
  static Token New(Kind K, bool Grouped = false) {
    return { .kind = K, .grouped = uint32_t(Grouped) };
  }
  static Token New(Kind K, StringRef Data, bool Grouped = false) {
    return {
      .kind = K,
      .size = uint32_t(Data.size()),
      .grouped = uint32_t(Grouped),
      .data = Data.data()
    };
  }

  StringRef str() const { return StringRef(data, size); }
};

/// Lexes `Token`s for a `Pattern` from `Pat`.
llvm::Error lexTokensForPattern(StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks,
                                llvm::BumpPtrAllocator& BP);

} // namespace debase_tool
