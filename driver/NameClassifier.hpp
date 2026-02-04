//===- driver/NameClassifier.hpp ------------------------------------------===//
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

#include "llvm/Demangle/Demangle.h"
#include "llvm/Support/Allocator.h"
#include "LLVM.hpp"

namespace debase_tool {

enum class SymbolKind {
  Invalid,
  Constructor,
  Destructor,
  Other,
  Ignorable,
};

/// The useful features found in a function symbol.
struct Features {
  SymbolKind SymKind = SymbolKind::Invalid;
  int Variant = -1; // For itanium compat
  std::string BaseName;
  SmallVector<std::string, 2> NestedNames;
public:
  bool isCtor() const { return SymKind == SymbolKind::Constructor; }
  bool isDtor() const { return SymKind == SymbolKind::Destructor; }
  bool isCtorDtor() const { return isCtor() || isDtor(); }
  bool isOther() const { return SymKind == SymbolKind::Other; }
  bool isIgnorable() const { return SymKind == SymbolKind::Ignorable; }
  bool isInvalid() const { return SymKind == SymbolKind::Invalid; }
  
  void clear() {
    SymKind = SymbolKind::Invalid;
    Variant = -1;
    BaseName.clear();
    NestedNames.clear();
  }
};

/// Classifies symbols.
class Classifier {
public:
  virtual SymbolKind classify(const std::string& Sym, Features* Out) = 0;
  SymbolKind classify(const std::string& Sym) { return classify(Sym, nullptr); }
private:
  virtual void anchor();
};

/// Classifies symbols from the Itanium ABI.
class ItaniumClassifier final : public Classifier {
public:
  SymbolKind classify(const std::string& Sym, Features* Out) override;
  SymbolKind classify(const std::string& Sym) { return classify(Sym, nullptr); }
};

/// Classifies symbols from the Microsoft ABI.
class MSVCClassifier final : public Classifier {
public:
  SymbolKind classify(const std::string& Sym, Features* Out) override;
  SymbolKind classify(const std::string& Sym) { return classify(Sym, nullptr); }
};

} // namespace debase_tool
