//===- driver/UnlinkRefs.cpp ----------------------------------------------===//
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
///
/// \file
/// Defines a handler that can compile, sort, and match against references.
///
//===----------------------------------------------------------------------===//

#include "UnlinkRefs.hpp"
#include "llvm/ADT/SmallString.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using namespace debase_tool;

LLVM_ATTRIBUTE_NOINLINE static
bool CompareSimpleNSSplit(StringRef FullName, ArrayRef<StringRef> Parts) {
  SmallVector<StringRef, 8> OtherParts;
  FullName.split(OtherParts, "::", -1, true);
  return Parts.equals(OtherParts);
}

void UnlinkRefs::failOrPrint(StringRef Msg) {
  if (!Permissive)
    this->Failed = true;
  else
    errs() << Msg;
}

void UnlinkRefs::addSimpleUnlink(ArrayRef<StringRef> Parts) {
  SmallString<128> MangledName;
  raw_svector_ostream OS(MangledName);

  OS << "_ZN";
  if (Parts.front() == "std") {
    OS << "St";
    Parts = Parts.drop_front();
  }
  for (StringRef Part : Parts)
    OS << Part.size() << Part;
#if 0
  // [deleting destructor]
  OS << "D0Ev";
  SimpleUnlinks.insert(MangledName);
  MangledName.pop_back_n(4);
#endif
  // [base object destructor]
  OS << "D2Ev";
  SimpleUnlinks.insert(MangledName);
}

void UnlinkRefs::compileSimpleUnlink(StringRef FullName) {
  SmallVector<StringRef, 8> Parts;
  FullName.split(Parts, "::", -1, false);
  if (Strict && !CompareSimpleNSSplit(FullName, Parts)) {
    errs() << "Invalid name: '" << FullName << "'. Contains empty parts.\n";
    this->Failed = true;
    return;
  }

  for (StringRef& Part : Parts)
    // Remove leading and trailing spaces.
    Part = Part.ltrim().rtrim();
  // Generate the mangled symbols.
  this->addSimpleUnlink(Parts);
}

void UnlinkRefs::compileUnlinks(ArrayRef<std::string> Unlinks) {
  for (StringRef FullName : Unlinks) {
    const auto FirstNonRegularChar
      = FullName.find_first_of("?*+@$[]<>");
    if (FirstNonRegularChar != StringRef::npos) {
      errs() << "Unimplemented identifier type: '"
        << FullName << "' (only simple IDs are supported). ";
      failOrPrint("Skipping.");
      errs() << '\n';
      continue;
    }
    this->compileSimpleUnlink(FullName);
  }
}
