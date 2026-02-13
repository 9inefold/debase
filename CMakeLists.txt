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

option(DEBASE_EXAMPLES "Build examples." OFF)
option(DEBASE_TESTS "Run tests." OFF)
option(DEBASE_RUNTIME_ONLY "Only add the debase runtime." OFF)
option(DEBASE_GENERATE_TARGET_FUNCTION "Generate debase_sources(...)." OFF)
option(DEBASE_VERBOSE_LINKER "Run linker with '-v'." OFF)
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

if(DEBASE_GENERATE_TARGET_FUNCTION AND NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  message(SEND_ERROR "DEBASE_GENERATE_TARGET_FUNCTION can only be enabled on Clang!")
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

if(DEBASE_GENERATE_TARGET_FUNCTION)
  if(NOT DEFINED DEBASE_LLC)
    debase_set_binary(DEBASE_LLC "${DEBASE_BINARY_DIR}/llc")
  endif()
  debase_set_binary(DEBASE_BINARY "${DEBASE_BINARY_DIR}/debase")

  message(STATUS "Generating debase_sources() for \"${DEBASE_BINARY}\"")
  find_package(Python3 QUIET COMPONENTS Interpreter)
  if(NOT TARGET Python3::Interpreter)
    message(FATAL_ERROR "Python3 could not be found!")
  endif()

  set(DEBASE_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  set(DEBASE_GENERATE_PY "${CMAKE_CURRENT_BINARY_DIR}/debase-generate.py")
  configure_file(
    debase-generate.py.in
    ${DEBASE_GENERATE_PY}
    @ONLY
  )

  macro(print_var)
    message(STATUS "${ARGV}: ${${ARGV}}")
  endmacro(print_var)

  # Takes in source files to be debased, produces a target which can be linked to.
  #  debase_sources(<target>
  #                 [CONFIG <config>]
  #                 [OUTPUT <output-dir>]
  #                 [FILES <files>...]
  #                 [PASSTHROUGH <args>...])
  function(debase_sources target)
    cmake_parse_arguments(arg "" "CONFIG;OUTPUT" "FILES;PASSTHROUGH" ${ARGN})
    set(DEBASE_target ${target}__sources)

    if(NOT arg_CONFIG AND NOT arg_FILES)
      message(SEND_ERROR "No files provided for ${target}!")
      return()
    endif()

    if(NOT arg_OUTPUT)
      set(arg_OUTPUT ${CMAKE_CURRENT_BINARY_DIR})
    elseif(NOT IS_ABSOLUTE "${arg_OUTPUT}")
      set(arg_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${arg_OUTPUT}")
    endif()

    if(CMAKE_MESSAGE_LOG_LEVEL MATCHES "VERBOSE|DEBUG|TRACE")
      list(APPEND arg_PASSTHROUGH "--verbose")
    endif()
    if(CMAKE_BUILD_TYPE MATCHES "Debug|MinSizeRel")
      list(APPEND arg_PASSTHROUGH "--strip-debug")
    endif()

    message(STATUS "CONFIG: ${arg_CONFIG}")
    message(STATUS "FILES: ${arg_FILES}")
    message(STATUS "OUTPUT: ${arg_OUTPUT}")

    if(NOT arg_FILES)
      set(arg_FILES "${DEBASE_BASE_DIR}/Dummy.cpp")
    endif()

    add_library(${DEBASE_target} STATIC ${arg_FILES})
    target_compile_options(${DEBASE_target} PRIVATE -S -emit-llvm -Xclang -disable-llvm-passes)
    target_link_libraries(${DEBASE_target} PRIVATE debase::runtime)
    set_target_properties(${DEBASE_target} PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY "${arg_OUTPUT}"
      LIBRARY_OUTPUT_DIRECTORY "${arg_OUTPUT}"
      #RUNTIME_OUTPUT_DIRECTORY "${arg_OUTPUT}"
    )

    #get_target_property(output_name ${DEBASE_target} OUTPUT_NAME)
    #get_target_property(suffix ${DEBASE_target} SUFFIX)
    #message(STATUS "OUTPUT_NAME: ${output_name}")
    #message(STATUS "SUFFIX: ${suffix}")

    #print_var(CMAKE_CXX_FLAGS)
    #print_var(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)
    #print_var(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES)
  endfunction(debase_sources)
endif()

################# DONT INCLUDE THE REST OF THIS ################################

debase_sources(example-lib
  CONFIG examples/Filename/Config.json
  FILES
    XYZ.hidden.cpp
    examples/Filename/Class.cpp
  OUTPUT ir
)
