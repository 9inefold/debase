//===- driver/PatternLex.hpp ----------------------------------------------===//
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
/// Implements the lexer for patterns.
///
//===----------------------------------------------------------------------===//

#pragma once

#include "Pattern.hpp"
#include "llvm/ADT/STLFunctionalExtras.h"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "LLVM.hpp"
#include <cstdint>
#include <optional>

namespace debase_tool {
  
class FilePropertyCache;
/// `function_ref` that does a `StringRef` to `StringRef` transformation.
using StringTransformer = llvm::function_ref<StringRef(StringRef)>;

/// Represents a single token of a pattern.
struct Pattern::Token {
  enum Kind : uint32_t {
    KUnknown,
    KSimple,    // eg. `::x::y::Z`
    KAnonymous, // `@`
    KGlob,      // `**`
    KThis,      // `{this.*}`
    KLateBind,  // `{file.*}`
    KSimpleFmt, // `I{file.stem}v{...}` => `"I%0v%1" + [file.stem, ...]`
    KRegex,     // eg. `I*X+0?[...]`
    KRegexFmt,  // `I?{file.stem}+` => `"I?(%0)+" + [file.stem]`
  };

  /// The string `stem`.
  static const char kStem[];
  /// The string `dir`.
  static const char kDir[];
  /// The string `ext`.
  static const char kExt[];

  enum FilePropertyKind {
    FPKUnknown,
    FPKFile,
    FPKStem,
    FPKDir,
    FPKExt,
  };

  /// Checks if value is a global id, and returns the enum.
  static FilePropertyKind GetFilePropertyKind(const char* Str);

  /// Max amount of trailing values.
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

  /// Return the data held by the token.
  StringRef str() const { return StringRef(data, size); }
  /// Check if data contains a simple literal.
  bool isLiteral() const { return kind == KSimple || kind == KAnonymous; }
  /// Check if simple replacement type.
  bool isSimpleReplacement() const {
    return kind == KThis || kind == KLateBind || kind == KSimpleFmt;
  }
  /// Check if replacement type.
  bool isReplacement() const {
    return kind == KRegexFmt || isSimpleReplacement();
  }
};

/// Lexes `Token`s for a `Pattern` from `Pat`.
/// @param Intern Function that returns a copy of the input string with a managed lifetime.
llvm::Error lexTokensForPattern(StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks,
                                StringTransformer Intern, FilePropertyCache* This = nullptr);

/// Lexes `Token`s for a `Pattern` from `Pat`.
/// @param BP The allocator for the strings. Must live at least as long as the final patterns.
llvm::Error lexTokensForPattern(StringRef Pat, SmallVectorImpl<Pattern::Token>& Toks,
                                llvm::BumpPtrAllocator& BP, FilePropertyCache* This = nullptr);

raw_ostream& operator<<(raw_ostream& OS, Pattern::Token Tok);
void printTokenGroup(raw_ostream& OS, ArrayRef<Pattern::Token> Toks);

} // namespace debase_tool
