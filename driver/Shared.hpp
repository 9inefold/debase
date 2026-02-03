//===- driver/Shared.hpp --------------------------------------------------===//
//
// Copyright (C) 2025-2026 Ninefold
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

#include "LLVM.hpp"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Error.h"

namespace debase_tool {

/// The category to put debase options under.
extern llvm::cl::OptionCategory DebaseToolCategory;
/// Enabled if and only if `-mode=strict`.
extern bool Strict;
/// Enabled if and only if `-mode=permissive`.
extern bool Permissive;

/// Creates a new string error by forwarding the arguments to
/// `llvm::createStringError`.
template <typename...ArgsT>
inline llvm::Error MakeError(ArgsT&&...Args) {
  return llvm::createStringError(
    llvm::inconvertibleErrorCode(),
    std::forward<ArgsT>(Args)...
  );
}

} // namespace debase_tool
