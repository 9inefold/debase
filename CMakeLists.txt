cmake_minimum_required(VERSION 3.18)
include_guard(DIRECTORY)
include(Setup.cmake)

project(
  debase
  VERSION 1.0.0
  LANGUAGES CXX C
)

if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
  set(DEBASE_MSVC_LIKE ON CACHE BOOL "")
elseif(CMAKE_CXX_SIMULATE_ID MATCHES "MSVC")
  set(DEBASE_MSVC_LIKE ON CACHE BOOL "")
else()
  set(DEBASE_MSVC_LIKE OFF CACHE BOOL "")
endif()

if(NOT APPLE AND NOT DEBASE_MSVC_LIKE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--as-needed" )
endif()

include(SetFlags)
include(SetOptions)
include(cmake/CPM.cmake)

option(DEBASE_RUNTIME_ONLY "Only add the debase runtime." OFF)
option(DEBASE_TESTS "Run tests." OFF)
valued_option(DEBASE_VENDOR_NAME "Name used in --version." "Debaser")

add_subdirectory(runtime)
if(DEBASE_RUNTIME_ONLY)
  message(STATUS "Only providing debase::runtime")
else()
  set(DEBASE_TARGETS AArch64 ARM X86)
  include(DebaseLLVM)
  add_subdirectory(driver)
endif()
