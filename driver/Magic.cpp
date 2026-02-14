//===- driver/Magic.cpp ---------------------------------------------------===//
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

#include "Magic.hpp"
#include "Shared.hpp"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringRef.h"

using namespace debase_tool;
using llvm::file_magic;

llvm::file_magic debase_tool::identify_magic_ex(StringRef MBRef) {
  file_magic FM = llvm::identify_magic(MBRef);
  if (FM != file_magic::unknown)
    return FM;
  // Consume UTF8 BOM
  MBRef.consume_front("\xEF\xBB\xBF");
  // Check for IR start
  if (MBRef.starts_with_insensitive("; ModuleID"))
    return llvm::file_magic::bitcode;
  else if (Permissive && llvm::isASCII(MBRef))
    return llvm::file_magic::bitcode;
  // Some other kind of file
  return llvm::file_magic::unknown;
}

StringRef debase_tool::file_magic_name(llvm::file_magic::Impl FM) {
  using enum llvm::file_magic::Impl;
  switch (FM) {
  case bitcode:
    return "bitcode";
  case clang_ast:
    return "clang_ast";
  case archive:
    return "archive";
  case elf:
    return "elf";
  case elf_relocatable:
    return "elf_relocatable";
  case elf_executable:
    return "elf_executable";
  case elf_shared_object:
    return "elf_shared_object";
  case elf_core:
    return "elf_core";
  case goff_object:
    return "goff_object";
  case macho_object:
    return "macho_object";
  case macho_executable:
    return "macho_executable";
  case macho_fixed_virtual_memory_shared_lib:
    return "macho_fixed_virtual_memory_shared_lib";
  case macho_core:
    return "macho_core";
  case macho_preload_executable:
    return "macho_preload_executable";
  case macho_dynamically_linked_shared_lib:
    return "macho_dynamically_linked_shared_lib";
  case macho_dynamic_linker:
    return "macho_dynamic_linker";
  case macho_bundle:
    return "macho_bundle";
  case macho_dynamically_linked_shared_lib_stub:
    return "macho_dynamically_linked_shared_lib_stub";
  case macho_dsym_companion:
    return "macho_dsym_companion";
  case macho_kext_bundle:
    return "macho_kext_bundle";
  case macho_universal_binary:
    return "macho_universal_binary";
  case macho_file_set:
    return "macho_file_set";
  case minidump:
    return "minidump";
  case coff_cl_gl_object:
    return "coff_cl_gl_object";
  case coff_object:
    return "coff_object";
  case coff_import_library:
    return "coff_import_library";
  case pecoff_executable:
    return "pecoff_executable";
  case windows_resource:
    return "windows_resource";
  case xcoff_object_32:
    return "xcoff_object_32";
  case xcoff_object_64:
    return "xcoff_object_64";
  case wasm_object:
    return "wasm_object";
  case pdb:
    return "pdb";
  case tapi_file:
    return "tapi_file";
  case cuda_fatbinary:
    return "cuda_fatbinary";
  case offload_binary:
    return "offload_binary";
  case dxcontainer_object:
    return "dxcontainer_object";
  case offload_bundle:
    return "offload_bundle";
  case offload_bundle_compressed:
    return "offload_bundle_compressed";
  case spirv_object:
    return "spirv_object";
  default:
    return "unknown";
  }
}
