//===- driver/Triple.hpp --------------------------------------------------===//
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

#include "llvm/TargetParser/Triple.h"
#include "LLVM.hpp"
#include <optional>

namespace debase_tool {

/// On some versions `Module::setTargetTriple` takes a `StringRef`, on others
/// it takes... a `Triple`. This utility helps keep things smooth.
class SetTargetTripleCtorCast {
  std::string Data;
public:
  SetTargetTripleCtorCast(StringRef Unnormalized) : 
    Data(llvm::Triple::normalize(Unnormalized)) {}
  SetTargetTripleCtorCast(const std::string& Unnormalized) :
    SetTargetTripleCtorCast(StringRef(Unnormalized)) {}
  
  operator StringRef() const { return StringRef(Data); }
  operator llvm::Triple() const { return llvm::Triple(Data); }
};

inline bool isTripleAndroidOS(const llvm::Triple& T) {
  if (T.isAndroid())
    return true;
  else
    return T.getOSName().starts_with_insensitive("android");
}

/// Checks the demangler type required for a target.
/// @return `true` if itanium, `false` if MSVC, `nullopt` if invalid.
std::optional<bool> checkTripleTargetSymbolType(const llvm::Triple& T);

inline StringRef get_triple_arch(const llvm::Triple& T) {
  using llvm::Triple;
  return Triple::getArchTypeName(T.getArch());
}

StringRef get_triple_subarch(const llvm::Triple& T);

StringRef get_triple_vendor(const llvm::Triple& T);

StringRef get_triple_os(const llvm::Triple& T);

StringRef get_triple_env(const llvm::Triple& T);

} // namespace debase_tool
