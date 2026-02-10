//===- driver/SymbolFeatures.hpp ------------------------------------------===//
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
/// Provide utilities to parse symbol names from itanium/microsoft ABIs.
///
//===----------------------------------------------------------------------===//

#pragma once

#include "NameClassifier.hpp"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringRef.h"

namespace debase_tool {

/// The useful features found in a function symbol.
struct SymbolFeatures {
  //std::string BaseName;
  SmallVector<std::string> NestedNames;
  SymbolKind SymKind = SymbolKind::Invalid;
  int Variant = -1; // For itanium compat
  bool HasBaseName = false;

public:
  template <typename ArgT> void setBase(ArgT&& arg) {
    if (LLVM_UNLIKELY(HasBaseName))
      NestedNames.pop_back();
    NestedNames.emplace_back(std::forward<ArgT>(arg));
    HasBaseName = true;
  }
  template <typename ArgT> void addNested(ArgT&& arg) {
    if (LLVM_LIKELY(!HasBaseName))
      NestedNames.emplace_back(std::forward<ArgT>(arg));
  }

  StringRef baseName() const {
    assert(HasBaseName && !NestedNames.empty());
    return StringRef(NestedNames.back());
  }
  ArrayRef<std::string> nestedNames() const {
    assert(!NestedNames.empty());
    return ArrayRef(NestedNames).drop_back();
  }

  bool isCtor() const { return SymKind == SymbolKind::Constructor; }
  bool isDtor() const { return SymKind == SymbolKind::Destructor; }
  bool isCtorDtor() const { return isCtor() || isDtor(); }
  bool isOther() const { return SymKind == SymbolKind::Other; }
  bool isIgnorable() const { return SymKind == SymbolKind::Ignorable; }
  bool isInvalid() const { return SymKind == SymbolKind::Invalid; }
  
  void clear() {
    //BaseName.clear();
    NestedNames.clear();
    SymKind = SymbolKind::Invalid;
    Variant = -1;
    HasBaseName = false;
  }
};

} // namespace debase_tool
