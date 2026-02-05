//===- driver/Character.hpp -----------------------------------------------===//
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

#pragma once

#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Support/Compiler.h"
#include <cstdint>

namespace debase_tool {

/// Utility class for identifying character types. 
struct Character {
  /// Character tokens for the `Pattern` regex subset.
  enum Kind : uint8_t {
    KUnsupported,
    KEnd,        // \0|$
    KWhitespace, // [ \t\n\r\0]
    KIdentifier, // [0-9a-zA-Z_$]
    KAnonymous,  // @
    KWildcard,   // .
    KZeroOrOne,  // ?
    KKleene,     // *
    KKleenePlus, // +
    KRange,      // -
    KNot,        // ^
    KEscape,     // [\]
    KOpenParen,  // (
    KCloseParen, // )
    KOpenBrace,  // [
    KCloseBrace, // ]
    KOpenCurly,  // {
    KCloseCurly, // }
    Last = KCloseCurly
  };

  /// Gets simple C++ identifiers.
  LLVM_ATTRIBUTE_ALWAYS_INLINE static bool isIdentifier(char C) {
    return llvm::isAlnum(C) || C == '_' || C == '$';
  }
  /// Checks if whole string uses C++ identifier characters.
  static bool isIdentifier(llvm::StringRef S) {
    for (const char C : S)
      if (LLVM_UNLIKELY(!isIdentifier(C)))
        return false;
    return true;
  }

  /// Returns the `Kind` of a character `C`.
  static inline Character::Kind identify(char C);
};

/// Returns the `Kind` of a character `C`.
Character::Kind Character::identify(char C) {
  switch (C) {
  case '@': return KAnonymous;
  case '.': return KWildcard;
  case '?': return KZeroOrOne;
  case '*': return KKleene;
  case '+': return KKleenePlus;
  case '-': return KRange;
  case '^': return KNot;
  case '(': return KOpenParen;
  case ')': return KCloseParen;
  case '[': return KOpenBrace;
  case ']': return KCloseBrace;
  case '{': return KOpenCurly;
  case '}': return KCloseCurly;
  case '\\': return KEscape;
  case '\0': return KEnd;
  default:
    if (LLVM_LIKELY(isIdentifier(C)))
      return KIdentifier;
    else if (llvm::isSpace(C))
      return KWhitespace;
    else
      return KUnsupported;
  }
}

} // namespace debase_tool
