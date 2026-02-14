//===- driver/Magic.hpp ---------------------------------------------------===//
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

#include "LLVM.hpp"
#include "llvm/BinaryFormat/Magic.h"

namespace debase_tool {

/// Identifies object types + standard .ll files
llvm::file_magic identify_magic_ex(StringRef MBRef);

/// Gets the name of a `file_magic`.
StringRef file_magic_name(llvm::file_magic::Impl FM);

} // namespace debase_tool
