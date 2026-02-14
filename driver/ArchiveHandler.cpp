//===- driver/ArchiveHandler.cpp ------------------------------------------===//
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

#include "ArchiveHandler.hpp"
#include "Magic.hpp"
#include "Shared.hpp"
#include "llvm/Object/Archive.h"
#include "llvm/Object/ArchiveWriter.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/ErrorOr.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/WithColor.h"

using namespace debase_tool;
using namespace llvm;

static Error createFileError(const Twine& F, const Twine& Msg) {
  return createFileError(F, MakeError(Msg));
}

static Error MBError(MemoryBufferRef MB, const Twine& Msg) {
  return createFileError(MB.getBufferIdentifier(), Msg);
}

static Error MBError(MemoryBufferRef MB, Error OtherErr) {
  return joinErrors(
    MBError(MB, "unable to handle archive."),
    std::move(OtherErr)
  );
}

static Error extract(object::Archive* Archive, MemoryBufferRef MB,
                     std::vector<MemoryBufferRef>& Out) {
  assert(!Archive->isThin() && "Setup invalid?");
  int ErrCount = 0;
  auto RecognizeError = [&ErrCount, MB] (const Twine& Msg) {
    if (debase_tool::Verbose)
      WithColor::error(errs())
          << "Parsing '" << MB.getBufferIdentifier()
          << "': " << Msg << '\n';
    ++ErrCount;
  };

  Error Err = Error::success();
  for (const object::Archive::Child& C : Archive->children(Err)) {
    // Get original filename
    Expected<StringRef> NameOrErr = C.getName();
    if (!NameOrErr) {
      if (!Permissive)
        return MBError(MB, NameOrErr.takeError());
      RecognizeError(toString(NameOrErr.takeError()));
      continue;
    }
    StringRef Name = NameOrErr.get();
    
    // Get the data and its length
    Expected<StringRef> BufOrErr = C.getBuffer();
    if (!BufOrErr) {
      if (!Permissive)
        return MBError(MB, NameOrErr.takeError());
      RecognizeError(toString(NameOrErr.takeError()));
      continue;
    }
    StringRef Data = BufOrErr.get();

    // Basic filename check
    if (!Name.ends_with(".ll") && !Name.ends_with(".bc")) {
      // Check this is an ok filetype for us to handle
      file_magic FileKind = identify_magic_ex(Data);
      if (FileKind != file_magic::bitcode) {
        auto FileKindName = file_magic_name(FileKind);
        if (!Permissive)
          return MBError(MB, "unsupported file type '" + Twine(FileKindName) + "'");
        else
          RecognizeError("unsupported file type '" + Twine(FileKindName) + "'");
        continue;
      }
    }

    // Cooking...
    Out.emplace_back(Data, Name);
  }

  if (Err)
    return MBError(MB, std::move(Err));
  if (ErrCount > 0)
    return MBError(MB, "unable to handle archive contents.");
  return Error::success();
}

Error debase_tool::extractInMemoryARFile(MemoryBufferRef MB,
                                         std::vector<MemoryBufferRef>& Out) {
  auto ArchiveOrError = object::Archive::create(MB);
  if (!ArchiveOrError)
    return MBError(MB, ArchiveOrError.takeError());

  std::unique_ptr<object::Archive> Archive = std::move(ArchiveOrError.get());
  if (Archive->isThin())
    return MBError(MB, "extracting from a thin archive is not supported.");
  return extract(Archive.get(), MB, Out);
}

Error debase_tool::extractARFile(const Twine& ArchiveName,
                                 std::unique_ptr<MemoryBuffer>& OutMB,
                                 std::vector<MemoryBufferRef>& Out) {
  ErrorOr<std::unique_ptr<MemoryBuffer>> BufOrErr
      = MemoryBuffer::getFile(ArchiveName, /*IsText=*/false);
  if (auto EC = BufOrErr.getError()) {
    return MakeError(
        "unable to open archive '" +
        Twine(ArchiveName) + "': " + EC.message());
  }
  // Do the real stuff...
  MemoryBufferRef MB(**BufOrErr);
  OutMB = std::move(*BufOrErr);
  return extractInMemoryARFile(MB, Out);
}
