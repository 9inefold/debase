//===- driver/SymbolMatcher.cpp -------------------------------------------===//
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
/// Implements a structure to match symbols against.
///
//===----------------------------------------------------------------------===//

#include "SymbolMatcher.hpp"
#include "llvm/Support/JSON.h"
#include "llvm/Support/MemoryBuffer.h"

using namespace debase_tool;
using namespace llvm;

static Error MakeError(StringRef S) {
  return createStringError(llvm::inconvertibleErrorCode(), S);
}
static Error MakeError(const Twine& Msg) {
  return createStringError(llvm::inconvertibleErrorCode(), Msg);
}

StringRef SymbolMatcher::intern(StringRef S) {
  return SS.save(S);
}

bool SymbolMatcher::ownsThisData(const void* Ptr) {
  return BP.identifyObject(Ptr).has_value();
}

////////////////////////////////////////////////////////////////////////////////
// JSON Config

namespace {
class JSONLoaderHandler {
  json::Value JSON;
  StringRef Filename;
  SymbolMatcher* P = nullptr;

public:
  JSONLoaderHandler(JSONLoaderHandler&&) = default;
  /// Creates a new `JSONLoaderHandler` from `Filename`, otherwise returns error.
  static Expected<JSONLoaderHandler> New(StringRef Filename,
                                         SymbolMatcher* thiz);
private:
  /// Internal default constructor.
  JSONLoaderHandler(json::Value&& JSON, StringRef Filename, SymbolMatcher* thiz)
   : JSON(std::move(JSON)), Filename(thiz->intern(Filename)), P(thiz) {
  }

public:
  Error load();
  Error loadFiles(json::Array& files);
  Error loadPatterns(json::Object& files);
  Error loadPatterns(json::Array& files);
  Error loadPatterns(StringRef files);

  Error report(const Twine& Msg) const {
    return MakeError(Twine("In ") + Filename + ": " + Msg);
  }
};
} // namespace `anonymous`

Expected<JSONLoaderHandler> JSONLoaderHandler::New(StringRef Filename,
                                                   SymbolMatcher* thiz) {
  ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrErr =
      MemoryBuffer::getFile(Filename);
  if (std::error_code EC = FileOrErr.getError())
    return llvm::errorCodeToError(EC);
  // Parse JSON
  StringRef FileContents = (*FileOrErr)->getBuffer();
  Expected<json::Value> JSON = json::parse(FileContents);
  if (!JSON)
    return JSON.takeError();
  // Valid!
  return JSONLoaderHandler(std::move(*JSON), Filename, thiz);
}

Error JSONLoaderHandler::load() {
  if (json::Object* root = JSON.getAsObject()) {
    // "files": [...]
    if (json::Array* files = root->getArray("files")) {
      if (Error E = this->loadFiles(*files))
        return E;
    } else
      return report("'files' does not exist or is not an array");

    // "patterns": { ... } or [...] or "..."
    if (json::Object* patterns = root->getObject("patterns"))
      return this->loadPatterns(*patterns);
    else if (json::Array* patterns = root->getArray("patterns"))
      return this->loadPatterns(*patterns);
    else if (auto pattern = root->getString("patterns"))
      return this->loadPatterns(*pattern);
    else
      return report("'patterns' does not exist or is not an object/array/string");
  }
  return report("root node is not an object");
}

Error JSONLoaderHandler::loadFiles(json::Array& files) {
  for (json::Value& File : files) {

  }
  return Error::success();
}

Error JSONLoaderHandler::loadPatterns(json::Object& files) {

  return Error::success();
}

Error JSONLoaderHandler::loadPatterns(json::Array& files) {

  return Error::success();
}

Error JSONLoaderHandler::loadPatterns(StringRef files) {

  return Error::success();
}

Error SymbolMatcher::loadSymbolsFromJSONFile(StringRef Filename) {
  Expected<JSONLoaderHandler> JSON =
      JSONLoaderHandler::New(Filename, this);
  if (!JSON)
    return JSON.takeError();
  return JSON->load();
}
