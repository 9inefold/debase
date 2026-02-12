//===- driver/Triple.cpp --------------------------------------------------===//
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

#include "Triple.hpp"
#include "llvm/TargetParser/Triple.h"

using namespace debase_tool;
using llvm::Triple;

/// Checks the demangler type required for a target.
/// @return `true` if itanium, `false` if MSVC, `nullopt` if invalid.
std::optional<bool> debase_tool::checkTripleTargetSymbolType(const Triple& T) {
  const Triple::ArchType Arch = T.getArch();
  const Triple::SubArchType SubArch = T.getSubArch();
  // Check Arch/SubArch
  switch (Arch) {
  case Triple::ArchType::aarch64:
  case Triple::ArchType::aarch64_be: {
    using enum Triple::SubArchType;
    if (SubArch != ARMSubArch_v7 && SubArch != ARMSubArch_v8)
      return std::nullopt;
  }
  case Triple::ArchType::arm:
  case Triple::ArchType::armeb:
  case Triple::ArchType::x86:
  case Triple::ArchType::x86_64:
    break;
  default:
    return std::nullopt;
  }

  if (isTripleAndroidOS(T)) {
    // Just sorta hope it's the correct version lol
    return T.isWindowsItaniumEnvironment();
  } else if (T.getVendor() == Triple::VendorType::Apple) {
    if (T.isiOS() || T.isTargetMachineMac())
      return true;
    // ?
    return std::nullopt;
  }

  return !T.isWindowsMSVCEnvironment();
}

////////////////////////////////////////////////////////////////////////////////
// Name Getters

StringRef debase_tool::get_triple_subarch(const llvm::Triple& T) {
  switch (T.getSubArch()) {
  case Triple::SubArchType::ARMSubArch_v9_5a:
    return "ARMSubArch_v9_5a";
  case Triple::SubArchType::ARMSubArch_v9_4a:
    return "ARMSubArch_v9_4a";
  case Triple::SubArchType::ARMSubArch_v9_3a:
    return "ARMSubArch_v9_3a";
  case Triple::SubArchType::ARMSubArch_v9_2a:
    return "ARMSubArch_v9_2a";
  case Triple::SubArchType::ARMSubArch_v9_1a:
    return "ARMSubArch_v9_1a";
  case Triple::SubArchType::ARMSubArch_v9:
    return "ARMSubArch_v9";
  case Triple::SubArchType::ARMSubArch_v8_9a:
    return "ARMSubArch_v8_9a";
  case Triple::SubArchType::ARMSubArch_v8_8a:
    return "ARMSubArch_v8_8a";
  case Triple::SubArchType::ARMSubArch_v8_7a:
    return "ARMSubArch_v8_7a";
  case Triple::SubArchType::ARMSubArch_v8_6a:
    return "ARMSubArch_v8_6a";
  case Triple::SubArchType::ARMSubArch_v8_5a:
    return "ARMSubArch_v8_5a";
  case Triple::SubArchType::ARMSubArch_v8_4a:
    return "ARMSubArch_v8_4a";
  case Triple::SubArchType::ARMSubArch_v8_3a:
    return "ARMSubArch_v8_3a";
  case Triple::SubArchType::ARMSubArch_v8_2a:
    return "ARMSubArch_v8_2a";
  case Triple::SubArchType::ARMSubArch_v8_1a:
    return "ARMSubArch_v8_1a";
  case Triple::SubArchType::ARMSubArch_v8:
    return "ARMSubArch_v8";
  case Triple::SubArchType::ARMSubArch_v8r:
    return "ARMSubArch_v8r";
  case Triple::SubArchType::ARMSubArch_v8m_baseline:
    return "ARMSubArch_v8m_baseline";
  case Triple::SubArchType::ARMSubArch_v8m_mainline:
    return "ARMSubArch_v8m_mainline";
  case Triple::SubArchType::ARMSubArch_v8_1m_mainline:
    return "ARMSubArch_v8_1m_mainline";
  case Triple::SubArchType::ARMSubArch_v7:
    return "ARMSubArch_v7";
  case Triple::SubArchType::ARMSubArch_v7em:
    return "ARMSubArch_v7em";
  case Triple::SubArchType::ARMSubArch_v7m:
    return "ARMSubArch_v7m";
  case Triple::SubArchType::ARMSubArch_v7s:
    return "ARMSubArch_v7s";
  case Triple::SubArchType::ARMSubArch_v7k:
    return "ARMSubArch_v7k";
  case Triple::SubArchType::ARMSubArch_v7ve:
    return "ARMSubArch_v7ve";
  case Triple::SubArchType::ARMSubArch_v6:
    return "ARMSubArch_v6";
  case Triple::SubArchType::ARMSubArch_v6m:
    return "ARMSubArch_v6m";
  case Triple::SubArchType::ARMSubArch_v6k:
    return "ARMSubArch_v6k";
  case Triple::SubArchType::ARMSubArch_v6t2:
    return "ARMSubArch_v6t2";
  case Triple::SubArchType::ARMSubArch_v5:
    return "ARMSubArch_v5";
  case Triple::SubArchType::ARMSubArch_v5te:
    return "ARMSubArch_v5te";
  case Triple::SubArchType::ARMSubArch_v4t:
    return "ARMSubArch_v4t";
  case Triple::SubArchType::AArch64SubArch_arm64e:
    return "AArch64SubArch_arm64e";
  case Triple::SubArchType::AArch64SubArch_arm64ec:
    return "AArch64SubArch_arm64ec";
  case Triple::SubArchType::KalimbaSubArch_v3:
    return "KalimbaSubArch_v3";
  case Triple::SubArchType::KalimbaSubArch_v4:
    return "KalimbaSubArch_v4";
  case Triple::SubArchType::KalimbaSubArch_v5:
    return "KalimbaSubArch_v5";
  case Triple::SubArchType::MipsSubArch_r6:
    return "MipsSubArch_r6";
  case Triple::SubArchType::PPCSubArch_spe:
    return "PPCSubArch_spe";
  case Triple::SubArchType::SPIRVSubArch_v10:
    return "SPIRVSubArch_v10";
  case Triple::SubArchType::SPIRVSubArch_v11:
    return "SPIRVSubArch_v11";
  case Triple::SubArchType::SPIRVSubArch_v12:
    return "SPIRVSubArch_v12";
  case Triple::SubArchType::SPIRVSubArch_v13:
    return "SPIRVSubArch_v13";
  case Triple::SubArchType::SPIRVSubArch_v14:
    return "SPIRVSubArch_v14";
  case Triple::SubArchType::SPIRVSubArch_v15:
    return "SPIRVSubArch_v15";
  case Triple::SubArchType::SPIRVSubArch_v16:
    return "SPIRVSubArch_v16";
  case Triple::SubArchType::NoSubArch:
    return "NoSubArch";
  default:
    return "Unknown";
  }

  llvm_unreachable("invalid subarch!");
}

StringRef debase_tool::get_triple_vendor(const llvm::Triple& T) {
  switch (T.getVendor()) {
  case Triple::VendorType::Apple:
    return "Apple";
  case Triple::VendorType::PC:
    return "PC";
  case Triple::VendorType::SCEI:
    return "SCEI";
  case Triple::VendorType::Freescale:
    return "Freescale";
  case Triple::VendorType::IBM:
    return "IBM";
  case Triple::VendorType::ImaginationTechnologies:
    return "ImaginationTechnologies";
  case Triple::VendorType::MipsTechnologies:
    return "MipsTechnologies";
  case Triple::VendorType::NVIDIA:
    return "NVIDIA";
  case Triple::VendorType::CSR:
    return "CSR";
  case Triple::VendorType::AMD:
    return "AMD";
  case Triple::VendorType::Mesa:
    return "Mesa";
  case Triple::VendorType::SUSE:
    return "SUSE";
  case Triple::VendorType::OpenEmbedded:
    return "OpenEmbedded";
  default:
    return "UnknownVendor";
  }
}

StringRef debase_tool::get_triple_os(const llvm::Triple& T) {
  switch (T.getOS()) {
  case Triple::OSType::Darwin:
    return "Darwin";
  case Triple::OSType::DragonFly:
    return "DragonFly";
  case Triple::OSType::FreeBSD:
    return "FreeBSD";
  case Triple::OSType::Fuchsia:
    return "Fuchsia";
  case Triple::OSType::IOS:
    return "IOS";
  case Triple::OSType::KFreeBSD:
    return "KFreeBSD";
  case Triple::OSType::Linux:
    return "Linux";
  case Triple::OSType::Lv2:
    return "Lv2";
  case Triple::OSType::MacOSX:
    return "MacOSX";
  case Triple::OSType::NetBSD:
    return "NetBSD";
  case Triple::OSType::OpenBSD:
    return "OpenBSD";
  case Triple::OSType::Solaris:
    return "Solaris";
  case Triple::OSType::UEFI:
    return "UEFI";
  case Triple::OSType::Win32:
    return "Win32";
  case Triple::OSType::ZOS:
    return "ZOS";
  case Triple::OSType::Haiku:
    return "Haiku";
  case Triple::OSType::RTEMS:
    return "RTEMS";
  case Triple::OSType::NaCl:
    return "NaCl";
  case Triple::OSType::AIX:
    return "AIX";
  case Triple::OSType::CUDA:
    return "CUDA";
  case Triple::OSType::NVCL:
    return "NVCL";
  case Triple::OSType::AMDHSA:
    return "AMDHSA";
  case Triple::OSType::PS4:
    return "PS4";
  case Triple::OSType::PS5:
    return "PS5";
  case Triple::OSType::ELFIAMCU:
    return "ELFIAMCU";
  case Triple::OSType::TvOS:
    return "TvOS";
  case Triple::OSType::WatchOS:
    return "WatchOS";
  case Triple::OSType::DriverKit:
    return "DriverKit";
  case Triple::OSType::XROS:
    return "XROS";
  case Triple::OSType::Mesa3D:
    return "Mesa3D";
  case Triple::OSType::AMDPAL:
    return "AMDPAL";
  case Triple::OSType::HermitCore:
    return "HermitCore";
  case Triple::OSType::Hurd:
    return "Hurd";
  case Triple::OSType::WASI:
    return "WASI";
  case Triple::OSType::Emscripten:
    return "Emscripten";
  case Triple::OSType::ShaderModel:
    return "ShaderModel";
  case Triple::OSType::LiteOS:
    return "LiteOS";
  case Triple::OSType::Serenity:
    return "Serenity";
  case Triple::OSType::Vulkan:
    return "Vulkan";
  default:
    return "UnknownOS";
  }
}

StringRef debase_tool::get_triple_env(const llvm::Triple& T) {
  switch (T.getEnvironment()) {
  case Triple::EnvironmentType::GNU:
    return "GNU";
  case Triple::EnvironmentType::GNUABIN32:
    return "GNUABIN32";
  case Triple::EnvironmentType::GNUABI64:
    return "GNUABI64";
  case Triple::EnvironmentType::GNUEABI:
    return "GNUEABI";
  case Triple::EnvironmentType::GNUEABIHF:
    return "GNUEABIHF";
  case Triple::EnvironmentType::GNUF32:
    return "GNUF32";
  case Triple::EnvironmentType::GNUF64:
    return "GNUF64";
  case Triple::EnvironmentType::GNUSF:
    return "GNUSF";
  case Triple::EnvironmentType::GNUX32:
    return "GNUX32";
  case Triple::EnvironmentType::GNUILP32:
    return "GNUILP32";
  case Triple::EnvironmentType::CODE16:
    return "CODE16";
  case Triple::EnvironmentType::EABI:
    return "EABI";
  case Triple::EnvironmentType::EABIHF:
    return "EABIHF";
  case Triple::EnvironmentType::Android:
    return "Android";
  case Triple::EnvironmentType::Musl:
    return "Musl";
  case Triple::EnvironmentType::MuslEABI:
    return "MuslEABI";
  case Triple::EnvironmentType::MuslEABIHF:
    return "MuslEABIHF";
  case Triple::EnvironmentType::MuslX32:
    return "MuslX32";
  case Triple::EnvironmentType::MSVC:
    return "MSVC";
  case Triple::EnvironmentType::Itanium:
    return "Itanium";
  case Triple::EnvironmentType::Cygnus:
    return "Cygnus";
  case Triple::EnvironmentType::CoreCLR:
    return "CoreCLR";
  case Triple::EnvironmentType::Simulator:
    return "Simulator";
  case Triple::EnvironmentType::MacABI:
    return "MacABI";
  case Triple::EnvironmentType::Pixel:
    return "Pixel";
  case Triple::EnvironmentType::Vertex:
    return "Vertex";
  case Triple::EnvironmentType::Geometry:
    return "Geometry";
  case Triple::EnvironmentType::Hull:
    return "Hull";
  case Triple::EnvironmentType::Domain:
    return "Domain";
  case Triple::EnvironmentType::Compute:
    return "Compute";
  case Triple::EnvironmentType::Library:
    return "Library";
  case Triple::EnvironmentType::RayGeneration:
    return "RayGeneration";
  case Triple::EnvironmentType::Intersection:
    return "Intersection";
  case Triple::EnvironmentType::AnyHit:
    return "AnyHit";
  case Triple::EnvironmentType::ClosestHit:
    return "ClosestHit";
  case Triple::EnvironmentType::Miss:
    return "Miss";
  case Triple::EnvironmentType::Callable:
    return "Callable";
  case Triple::EnvironmentType::Mesh:
    return "Mesh";
  case Triple::EnvironmentType::Amplification:
    return "Amplification";
  case Triple::EnvironmentType::OpenHOS:
    return "OpenHOS";
  default:
    return "UnknownEnvironment";
  }
}
