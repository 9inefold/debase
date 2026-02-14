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
#include "llvm/Support/Allocator.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/ErrorOr.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Path.h"
#include "llvm/Support/WithColor.h"
#include "llvm/Support/raw_ostream.h"

using namespace debase_tool;
using namespace llvm;

static StringRef InternStringRef(BumpPtrAllocator& BP, StringRef S) {
  if (S.empty())
    return "";
  char* Out = BP.Allocate<char>(S.size() + 1);
  std::memcpy(Out, S.data(), S.size());
  Out[S.size()] = '\0';
  return {Out, S.size()};
}

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

////////////////////////////////////////////////////////////////////////////////

static Error extract(object::Archive* Archive, MemoryBufferRef MB,
                     std::vector<MemoryBufferRef>& Out,
                     llvm::BumpPtrAllocator& BP) {
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

    if (Data.empty()) {
      if (Verbose)
        WithColor::error(errs())
          << "Found empty file '" << Name << "' in archive\n";
      continue;
    }

    file_magic FileKind = identify_magic_ex(Data);
    // Basic filename check
    if (!Name.ends_with(".ll") && !Name.ends_with(".bc")) {
      // Check this is an ok filetype for us to handle
      if (FileKind != file_magic::bitcode) {
        auto FileKindName = file_magic_name(FileKind);
        if (!Permissive)
          return MBError(MB, "unsupported file type '" + Twine(FileKindName) + "'");
        else
          RecognizeError("unsupported file type '" + Twine(FileKindName) + "'");
        continue;
      }
    }

    // Intern because otherwise it tweaks the fuck out
    Data = InternStringRef(BP, Data);
    Name = InternStringRef(BP, Name);
    Out.emplace_back(Data, Name);
  }

  if (Err)
    return MBError(MB, std::move(Err));
  if (ErrCount > 0)
    return MBError(MB, "unable to handle archive contents.");
  return Error::success();
}

Error debase_tool::extractInMemoryARFile(MemoryBufferRef MB,
                                         std::vector<MemoryBufferRef>& Out,
                                         llvm::BumpPtrAllocator& BP) {
  auto ArchiveOrError = object::Archive::create(MB);
  if (!ArchiveOrError)
    return MBError(MB, ArchiveOrError.takeError());

  std::unique_ptr<object::Archive> Archive = std::move(ArchiveOrError.get());
  if (Archive->isThin())
    return MBError(MB, "extracting from a thin archive is not supported.");
  return extract(Archive.get(), MB, Out, BP);
}

Error debase_tool::extractARFile(const Twine& ArchiveName,
                                 std::unique_ptr<MemoryBuffer>& OutMB,
                                 std::vector<MemoryBufferRef>& Out,
                                 llvm::BumpPtrAllocator& BP) {
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
  return extractInMemoryARFile(MB, Out, BP);
}

////////////////////////////////////////////////////////////////////////////////

static constexpr SymtabWritingMode SymTab = SymtabWritingMode::NormalSymtab;
static constexpr bool Thin = false;
static constexpr bool Deterministic = false;

static Expected<NewArchiveMember> getArchiveMember(StringRef FileName) {
  Expected<NewArchiveMember> NMOrErr =
      NewArchiveMember::getFile(FileName, Deterministic);
  if (!NMOrErr)
    return createFileError(FileName, NMOrErr.takeError());
  NMOrErr->MemberName = sys::path::filename(NMOrErr->MemberName);
  return NMOrErr;
}

static Error performWriteOperation(StringRef ArchiveName,
                                   const UniqueStringVector& Files,
                                   std::unique_ptr<MemoryBuffer> OldArchiveBuf) {
  std::vector<NewArchiveMember> NewMembers;
  for (auto& FileName : Files) {
    Expected<NewArchiveMember> NMOrErr = getArchiveMember(FileName);
    if (!Permissive)
      return NMOrErr.takeError();
    NewMembers.push_back(std::move(*NMOrErr));
  }

  object::Archive::Kind Kind
      = !NewMembers.empty() ? NewMembers.front().detectKindFromObject()
                            : object::Archive::getDefaultKind();
  return llvm::writeArchive(ArchiveName, NewMembers, SymTab, Kind,
                            Deterministic, Thin, std::move(OldArchiveBuf));
}

Error debase_tool::createARFile(raw_fd_ostream& OS,
                                StringRef ArchiveName,
                                const UniqueStringVector& Files) {
  report_fatal_error("createARFile is unimplemented!");
}

Error debase_tool::createARFile(StringRef ArchiveName,
                                const UniqueStringVector& Files) {
  return performWriteOperation(ArchiveName, Files, /*OldArchiveBuf=*/nullptr);
}
