//===- driver/Pattern.hpp -------------------------------------------------===//
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
/// Implements patterns used to check symbols.
///
//===----------------------------------------------------------------------===//

#pragma once

#include "llvm/Support/Error.h"
#include "LLVM.hpp"
#include <optional>

namespace debase_tool {

struct SymbolFeatures;
class SymbolMatcher;

class NestedNameGlobPattern;

/// The base of symbol matching types.
class Pattern {
public:
  struct Token;
  virtual ~Pattern() = default;
  /// Match against a set of features.
  virtual bool match(const SymbolFeatures& F) const = 0;
  /// If the class has any complex behaviour.
  virtual bool isSimple() const { return false; }
  /// If the class needs to be regenerated for every file.
  virtual bool isFinal() const { return true; }
private:
  virtual void anchor();
};

/// The simplest pattern type.
class SimplePattern final : public Pattern {
  friend class SymbolMatcher;
  friend class NestedNameGlobPattern;
  SmallVector<StringRef, 2> Patterns;
protected:
  SimplePattern(ArrayRef<StringRef> P) : Patterns(P) {
    assert(!Patterns.empty());
  }
public:
  bool match(const SymbolFeatures& F) const override;
  bool matchImpl(ArrayRef<std::string> Names) const;
  bool isSimple() const override { return true; }
};

/// Base for globbing patterns. Globs from the left hand side.
class GlobPattern : public Pattern {
  void anchor() override;
};

/// Simplest glob pattern. For things such as `**::ClassName`.
class BaseNameOnlyGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  StringRef Pattern;
protected:
  BaseNameOnlyGlobPattern(StringRef P) : Pattern(P) {}
public:
  bool match(const SymbolFeatures& F) const override;
};

/// Glob for things such as `**::x::ClassName`.
class NestedNameGlobPattern final : public GlobPattern {
  friend class SymbolMatcher;
  SimplePattern Nested;
protected:
  NestedNameGlobPattern(ArrayRef<StringRef> P) : Nested(P) {}
public:
  bool match(const SymbolFeatures& F) const override;
};

} // namespace debase_tool
