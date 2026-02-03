//===- driver/UniqueStringVector.hpp --------------------------------------===//
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
/// This file defines the UniqueStringVector class, which works the same as
/// llvm::UniqueVector but is specialized for StringRefs.
///
//===----------------------------------------------------------------------===//

#include "LLVM.hpp"
#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/SmallVector.h"

namespace debase_tool {

/// This class produces a sequential ID number (base 1) for each unique entry
/// that is added. Entries can be fetched using operator[] with the entry ID.
class UniqueStringVector {
public:
  using MapType = llvm::StringMap<unsigned>;
  using VectorType = SmallVector<StringRef, 1>;
  using iterator = typename VectorType::iterator;
  using const_iterator = typename VectorType::const_iterator;

private:
  // Map - Used to handle the correspondence of entry to ID.
  MapType Map;
  // Vector - ID ordered vector of entries. Entries can be indexed by ID - 1.
  VectorType Vector;

  unsigned getCurrentID() const {
    return unsigned(Vector.size()) + 1;
  }

public:
  /// insert - Append entry to the vector if it doesn't already exist.  Returns
  /// the entry's index + 1 to be used as a unique ID.
  unsigned insert(StringRef Entry) {
    // Check if the entry is already in the map.
    unsigned& ID = Map[Entry];
    // See if entry exists, if so return prior ID.
    if (ID != 0)
      return ID;
    // Compute ID for entry.
    ID = unsigned(Vector.size()) + 1u;
    // Insert in vector.
    Vector.push_back(Entry);
    return ID;
  }

  /// try_insert - Append entry to the vector if it doesn't already exist.
  /// Returns the entry's index + 1 to be used as a unique ID, along with a bool
  /// marking if it was inserted or not.
  std::pair<unsigned, bool> try_insert(StringRef Entry) {
    // Check if the entry is already in the map.
    auto [It, DidInsert] = Map.try_emplace(Entry, 0);
    // See if entry exists, if so return prior ID.
    if (!DidInsert)
      return {It->second, false};
    // Compute ID for entry.
    It->second = getCurrentID();
    // Insert in vector.
    Vector.push_back(Entry);
    return {It->second, true};
  }

  /// idFor - return the ID for an existing entry.  Returns 0 if the entry is
  /// not found.
  unsigned idFor(StringRef Entry) const {
    // Search for entry in the map.
    MapType::const_iterator MI = Map.find(Entry);
    // See if entry exists, if so return ID.
    if (MI != Map.end())
      return MI->second;
    // No luck.
    return 0;
  }

  /// operator[] - Returns a reference to the entry with the specified ID.
  StringRef operator[](unsigned ID) const {
    assert(ID - 1 < size() && "ID is 0 or out of range!");
    return Vector[ID - 1];
  }

  /// Return an iterator to the start of the vector.
  iterator begin() { return Vector.begin(); }

  /// Return an iterator to the start of the vector.
  const_iterator begin() const { return Vector.begin(); }

  /// Return an iterator to the end of the vector.
  iterator end() { return Vector.end(); }

  /// Return an iterator to the end of the vector.
  const_iterator end() const { return Vector.end(); }

  /// size - Returns the number of entries in the vector.
  size_t size() const { return Vector.size(); }

  /// empty - Returns true if the vector is empty.
  bool empty() const { return Vector.empty(); }

  /// reset - Clears all the entries.
  void reset() {
    Map.clear();
    if (!Vector.empty())
      Vector.truncate(0);
  }
};

} // namespace debase_tool
