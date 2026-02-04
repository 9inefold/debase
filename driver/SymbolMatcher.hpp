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

#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/StringSaver.h"
#include "LLVM.hpp"
#include "Pattern.hpp"
#include <optional>
#include <utility>

namespace debase_tool {

class SymbolMatcher {
  llvm::BumpPtrAllocator BP;
  llvm::UniqueStringSaver SS;

  /// The type used to store patterns.
  using PatternVec = SmallVector<Pattern*, 0>;
  PatternVec CtorPatterns;
  PatternVec DtorPatterns;

  std::optional<StringRef> CurrentFilename;

public:
  SymbolMatcher() : SS(BP) {}

  /// Loads symbol patterns and filenames from a JSON config file.
  llvm::Error loadSymbolsFromJSONFile(StringRef Filename);

  /// Creates a new node of type `NodeT`.
  template <class NodeT, typename...Args> NodeT* make(Args&&...args) {
    return new (BP) NodeT(std::forward<Args>(args)...);
  }

  /// Saves string with BP.
  StringRef intern(StringRef S);
  /// Checks data was allocated by this matcher.
  bool ownsThisData(const void* Ptr);
  /// Checks string was allocated by this matcher.
  bool ownsThisData(StringRef S) { return ownsThisData(S.data()); }
};

} // namespace debase_tool
