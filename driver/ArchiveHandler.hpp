//===- driver/ArchiveHandler.hpp ------------------------------------------===//
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
/// Handles reading from and writing to x-archive files.
///
//===----------------------------------------------------------------------===//

#pragma once

#include "LLVM.hpp"
#include "UniqueStringVector.hpp"
#include "llvm/Support/Allocator.h"
#include "llvm/Support/MemoryBufferRef.h"
#include "llvm/Support/Error.h"
#include <memory>
#include <vector>

namespace llvm {
class MemoryBuffer;
class raw_fd_ostream;
} // namespace llvm

namespace debase_tool {

/// Extracts x-archive file contents into `Out`.
llvm::Error extractInMemoryARFile(llvm::MemoryBufferRef MB,
                                  std::vector<llvm::MemoryBufferRef>& Out,
                                  llvm::BumpPtrAllocator& BP);

/// Extracts x-archive file contents into `Out`.
llvm::Error extractARFile(const Twine& ArchiveName,
                          std::unique_ptr<llvm::MemoryBuffer>& OutMB,
                          std::vector<llvm::MemoryBufferRef>& Out,
                          llvm::BumpPtrAllocator& BP);

llvm::Error createARFile(llvm::raw_fd_ostream& OS,
                         StringRef ArchiveName,
                         const UniqueStringVector& Files);

llvm::Error createARFile(StringRef ArchiveName,
                         const UniqueStringVector& Files);

} // namespace debase_tool
