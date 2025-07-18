//===- driver/UnlinkRefs.hpp ----------------------------------------------===//
//
// Copyright (C) 2025 Eightfold
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
/// Defines a handler that can compile, sort, and match against references.
///
//===----------------------------------------------------------------------===//

#pragma once

#include "Shared.hpp"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/Support/Allocator.h"
#include <string>

namespace debase_tool {

/// Holds all the unlink identifiers which can be searched through later.
// TODO: Update to sort into dtors/ctors.
class UnlinkRefs {
  llvm::BumpPtrAllocator BP;
  /// The set of simple names.
  llvm::StringSet<llvm::BumpPtrAllocator&> SimpleUnlinks;
  /// Blah blah
  bool Failed = false;

public:
  UnlinkRefs(ArrayRef<std::string> Unlinks) : SimpleUnlinks(BP) {
    this->compileUnlinks(Unlinks);
  }

  bool didFail() const { return Failed; }
  size_t simpleCount() const { return SimpleUnlinks.size(); }
  size_t complexCount() const { return 0; }

  /// Tries to match a function name against every ref.
  bool match(StringRef Name) {
    assert(!Failed);
    return SimpleUnlinks.contains(Name);
  }

private:
  /// "Compiles" the unlink data.
  void compileUnlinks(ArrayRef<std::string> Unlinks);
  /// Gets the symbol for a simple symbol.
  void compileSimpleUnlink(StringRef FullName);
  /// Writes a simple name to `SimpleUnlinks`.
  void addSimpleUnlink(ArrayRef<StringRef> Parts);
  
  /// If not permissive, sets `Failed` to `true`, otherwise prints `Msg` to `errs()`.
  void failOrPrint(StringRef Msg = "");
};

} // namespace debase_tool
