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
option(DEBASE_GENERATE_TARGET_FUNCTION "Generate debase_library(...)." OFF)
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

  if(DEBASE_RUNTIME_ONLY)
    add_custom_target(debase_pseudodriver DEPENDS ${DEBASE_BINARY})
  else()
    add_custom_target(debase_pseudodriver DEPENDS ${PROJECT_NAME})
  endif()

  message(STATUS "Generating debase_library() with \"${DEBASE_BINARY}\"")
  find_package(Python3 QUIET COMPONENTS Interpreter)
  if(NOT TARGET Python3::Interpreter)
    message(FATAL_ERROR "Python3 could not be found!")
  endif()

  set(DEBASE_PY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/py" CACHE FILEPATH "")
  set(DEBASE_DUMMY_FILE "${DEBASE_PY_DIR}/Dummy.cpp" CACHE FILEPATH "")
  set(DEBASE_BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
  set(DEBASE_GENERATE_PY "${CMAKE_CURRENT_BINARY_DIR}/debase-generate.py")
  configure_file(debase-generate.py.in ${DEBASE_GENERATE_PY} @ONLY)

  # This is used to force codegen so we can use the library directly.
  # Without a sink, any custom_commands won't run.
  add_executable(__debase_sink ${DEBASE_DUMMY_FILE})
  target_compile_definitions(__debase_sink PRIVATE -DDEBASE_DUMMY_MAIN=1)

  macro(print_var)
    message(STATUS "${ARGV}: ${${ARGV}}")
  endmacro(print_var)

  # Takes in source files to be debased, produces a target which can be linked to.
  #  debase_library(<target>
  #                 [CONFIG <config>]
  #                 [OUTPUT <output-dir>]
  #                 [FILES <file>...]
  #                 [IRFILES <file>...]
  #                 [PATTERNS <pattern>...]
  #                 [DUMP]
  #                 [PASSTHROUGH args...])
  function(debase_library target)
    cmake_parse_arguments(arg
      "DUMP" "CONFIG;OUTPUT;TIMEOUT"
      "FILES;IRFILES;PATTERNS;PASSTHROUGH" ${ARGN})
    #set(DEBASE_target ${target}__sources)
    set(DEBASE_target ${target})

    if(NOT arg_FILES)
      message(SEND_ERROR "No files provided for ${target}!")
      return()
    endif()

    if(NOT arg_OUTPUT)
      set(arg_OUTPUT ${CMAKE_CURRENT_BINARY_DIR})
    elseif(NOT IS_ABSOLUTE "${arg_OUTPUT}")
      set(arg_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${arg_OUTPUT}")
      file(MAKE_DIRECTORY "${arg_OUTPUT}")
    endif()
    if(arg_CONFIG)
      list(APPEND arg_PASSTHROUGH --config ${arg_CONFIG})
    endif()
    if(arg_IRFILES)
      list(APPEND arg_PASSTHROUGH ${arg_IRFILES})
    endif()
    if(arg_PATTERNS)
      list(APPEND arg_PASSTHROUGH --patterns ${arg_PATTERNS})
    endif()

    if(arg_TIMEOUT)
      set(cmd_TIMEOUT "--timeout=${arg_TIMEOUT}")
    endif()

    if(arg_DUMP)
      set(arg_DUMP "-D")
    else()
      set(arg_DUMP "")
    endif()

    if(CMAKE_MESSAGE_LOG_LEVEL MATCHES "VERBOSE|DEBUG|TRACE")
      list(APPEND arg_PASSTHROUGH "--verbose")
    endif()
    if(CMAKE_BUILD_TYPE MATCHES "Release|MinSizeRel")
      list(APPEND arg_PASSTHROUGH "--strip-debug")
    endif()

    if(NOT arg_FILES)
      set(arg_FILES py/Dummy.cpp)
    endif()

    add_library(${target} STATIC ${arg_FILES})
    target_compile_options(${target} PRIVATE
      -S -emit-llvm -Xclang -disable-llvm-passes
    )
    # -fms-compatibility-version=19
    target_link_libraries(${target} PRIVATE debase::runtime)
    set_target_properties(${target} PROPERTIES
      ARCHIVE_OUTPUT_DIRECTORY ${arg_OUTPUT}
      LIBRARY_OUTPUT_DIRECTORY ${arg_OUTPUT}
      PREFIX "" SUFFIX ".ar"
    )

    # llvm-ar x ir/example-lib__sources.lib --output=lib
    # llc -O=3 --regalloc=pbqp -filetype=obj -o ./Class.o lib/Class.ll

    if(DEBASE_MSVC_LIKE)
      set(ar_name "${target}-out.lib")
    else()
      set(ar_name "${target}-out.a")
    endif()
    set(ar_output "${arg_OUTPUT}/${ar_name}")

    set(rsp_name "${target}-out.rsp")
    set(rsp_output "${arg_OUTPUT}/${rsp_name}")

    add_custom_target(${target}__target DEPENDS ${target})
    add_custom_command(
      TARGET ${target}__target PRE_BUILD
      COMMAND Python3::Interpreter ${DEBASE_GENERATE_PY}
        ${arg_DUMP}
        --target-name=$<TARGET_FILE_NAME:${DEBASE_target}>
        --archive-name="${ar_name}"
        --rsp-name="${rsp_output}"
        --build-type="${CMAKE_BUILD_TYPE}"
        --output-dir="${arg_OUTPUT}"
        --output-filename="${target}-out.json"
        "--passthrough=\"${arg_PASSTHROUGH}\""
        #$<TARGET_PROPERTY:${DEBASE_target},SOURCES>
      BYPRODUCTS ${rsp_output}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating ${target} IR")
    
    set_source_files_properties(${rsp_output}
      TARGET_DIRECTORY ${target}__target
      PROPERTIES GENERATED 1
    )

    # Tie to the sink to get around circular dependencies.
    add_dependencies(__debase_sink ${target}__target)
    target_link_options(${target} PUBLIC "@${rsp_output}")
  endfunction(debase_library)

  function(debase_depends lib debased_target)
    get_target_property(alias_target ${lib} ALIASED_TARGET)
    if(alias_target)
      set(lib ${alias_target})
    endif()
    add_dependencies(${lib} ${debased_target}__target)
    get_target_property(type ${lib} TYPE)
    if (${type} STREQUAL "INTERFACE_LIBRARY")
      target_link_libraries(${lib} INTERFACE ${debased_target})
    else()
      target_link_libraries(${lib} PUBLIC ${debased_target})
    endif()
  endfunction(debase_depends)

  # Forwards to target_include_directories
  function(debase_include_directories target)
    #target_include_directories(${target}__sources ${ARGN})
    target_include_directories(${target} ${ARGN})
  endfunction(debase_include_directories)

  # Forwards to target_compile_definitions
  function(debase_compile_definitions target)
    #target_compile_definitions(${target}__sources ${ARGN})
    target_compile_definitions(${target} ${ARGN})
  endfunction(debase_compile_definitions)

  # Forwards to target_compile_features
  function(debase_compile_features target)
    #target_compile_features(${target}__sources ${ARGN})
    target_compile_features(${target} ${ARGN})
  endfunction(debase_compile_features)

  # Forwards to target_compile_options
  function(debase_compile_options target)
    #target_compile_options(${target}__sources ${ARGN})
    target_compile_options(${target} ${ARGN})
  endfunction(debase_compile_options)

  # Forwards to target_link_libraries
  function(debase_link_libraries target)
    #target_link_libraries(${target}__sources ${ARGN})
    target_link_libraries(${target} ${ARGN})
  endfunction(debase_link_libraries)

  # Forwards to target_link_directories
  function(debase_link_directories target)
    #target_link_directories(${target}__sources ${ARGN})
    target_link_directories(${target} ${ARGN})
  endfunction(debase_link_directories)

  # Forwards to target_sources
  function(debase_sources target)
    #target_sources(${target}__sources ${ARGN})

    target_sources(${target} ${ARGN})
  endfunction(debase_sources)
endif()

# Build example driver
if (DEBASE_EXAMPLES)
  include(Examples.cmake)
endif()
