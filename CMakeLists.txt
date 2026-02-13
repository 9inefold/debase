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
option(DEBASE_VERBOSE_LINKER "Run linker with '-v'." OFF)
option(DEBASE_TESTS "Run tests." OFF)
option(DEBASE_GENERATE_TARGET_FUNCTION "Generate debase_sources(...)." OFF)
valued_option(DEBASE_VENDOR_NAME "Name used in --version." "Debaser")

if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
  macro(debase_set_binary varname path)
    set(${varname} "${path}.exe")
  endmacro(debase_set_binary)
else()
  macro(debase_set_binary varname path)
    set(${varname} "${path}")
  endmacro(debase_set_binary)
endif()

if(DEBASE_GENERATE_TARGET_FUNCTION AND DEBASE_RUNTIME_ONLY)
  if(NOT DEFINED DEBASE_BINARY_DIR)
    message(FATAL_ERROR "DEBASE_BINARY_DIR must be defined when DEBASE_RUNTIME_ONLY and DEBASE_GENERATE_TARGET_FUNCTION are set!")
  endif()
  if(NOT EXISTS "${DEBASE_BINARY_DIR}")
    message(FATAL_ERROR "\"${DEBASE_BINARY_DIR}\" is not a valid path!")
  endif()
endif()

add_subdirectory(runtime)
if(DEBASE_RUNTIME_ONLY)
  message(VERBOSE "Only providing debase::runtime")
else()
  set(DEBASE_TARGETS AArch64 ARM X86)
  include(DebaseLLVM)
  add_subdirectory(driver)
endif()
