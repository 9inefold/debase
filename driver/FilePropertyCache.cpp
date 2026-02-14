//===- driver/FilePropertyCache.cpp ---------------------------------------===//
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

#include "FilePropertyCache.hpp"
#include "llvm/Support/Path.h"
#include "PatternLex.hpp"

using namespace debase_tool;
using namespace llvm::sys;

using Token = Pattern::Token;

static StringRef get_stem(StringRef filename) {
  return path::filename(filename).split('.').first;
}

Expected<StringRef> FilePropertyCache::getPropertyRaw(const char* prop) {
  using enum Token::FilePropertyKind;
  Token::FilePropertyKind K = Token::GetFilePropertyKind(prop);
  if (K == FPKUnknown)
    return llvm::createStringError(
        llvm::inconvertibleErrorCode(),
        "Unknown file property '" + Twine(prop) + "'");
  // Get the property
  switch (K) {
  case FPKFile:
    return this->filename;
  case FPKStem:
    if (LLVM_LIKELY(stem))
      return *stem;
    stem = get_stem(filename);
    return *stem;
  case FPKDir:
    if (dir)
      return *dir;
    dir = path::parent_path(filename);
    return *dir;
  case FPKExt:
    if (ext)
      return *ext;
    ext = path::extension(filename);
    return *ext;
  case FPKUnknown:
    llvm_unreachable("FPKUnknown here?");
  }
  llvm_unreachable("invalid property name");
}

Expected<StringRef> FilePropertyCache::getProperty(StringRef prop) {
  return getPropertyRaw(prop.data());
}
