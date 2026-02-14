include_guard(DIRECTORY)

CPMAddPackage(
  NAME zlib 
  URL  https://github.com/madler/zlib/releases/download/v1.3.1/zlib131.zip
  OPTIONS
    "ZLIB_BUILD_TESTING OFF"
    "ZLIB_BUILD_SHARED OFF"
    "ZLIB_BUILD_STATIC ON"
    "ZLIB_INSTALL ON"
)

find_package(ZLIB REQUIRED)
if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" AND DEBASE_MSVC_LIKE)
  target_compile_definitions(zlibstatic PRIVATE -D_CRT_SECURE_NO_WARNINGS=1)
  target_compile_options(zlibstatic PRIVATE -Wno-deprecated-declarations)
endif()

if(NOT TARGET ZLIB::ZLIB)
  add_library(ZLIB::ZLIB ALIAS zlibstatic)
endif()
if(NOT TARGET ZLIB::ZLIBSTATIC)
  add_library(ZLIB::ZLIBSTATIC ALIAS zlibstatic)
endif()

find_package(LLVM REQUIRED CONFIG)
debase_set_binary(DEBASE_LLC "${LLVM_TOOLS_BINARY_DIR}/llc")
separate_arguments(LLVM_DEFS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
llvm_map_components_to_libnames(llvm_libs
  ${DEBASE_TARGETS} #${llvm_components}
  Core BinaryFormat BitReader BitWriter Demangle Object Option Support
  IPO Passes TransformUtils
  AggressiveInstCombine InstCombine ScalarOpts
)

function(dump_llvm_libs lib_var)
  list(TRANSFORM ${lib_var}
		REPLACE "^LLVM" ""
		REGEX "^LLVM[A-Za-z].*"
		OUTPUT_VARIABLE LLVM_SHORT_AVAILABLE_LIBS)
	list(JOIN LLVM_SHORT_AVAILABLE_LIBS ", " LLVM_SHORT_AVAILABLE_LIBS)
	message(STATUS "LLVM libs: ${LLVM_SHORT_AVAILABLE_LIBS}")
endfunction(dump_llvm_libs)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
if(DEFINED DUMP_LIBS AND DUMP_LIBS)
  message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
  message(STATUS "LLVM libraries: ${LLVM_LIBRARIES}")
  message(STATUS "LLVM includes: ${LLVM_INCLUDE_DIRS}")
  message(STATUS "LLVM definitions: ${LLVM_DEFINITIONS}")
  message(STATUS "LLVM tools: ${LLVM_TOOLS_BINARY_DIR}")
	#dump_llvm_libs(LLVM_AVAILABLE_LIBS)
	dump_llvm_libs(llvm_libs)
endif()

add_library(debase-llvm INTERFACE)
add_library(debase::llvm ALIAS debase-llvm)

target_include_directories(debase-llvm SYSTEM INTERFACE ${LLVM_INCLUDE_DIRS})
#target_link_libraries(debase-llvm INTERFACE ${LLVM_AVAILABLE_LIBS})
target_link_libraries(debase-llvm INTERFACE ${llvm_libs})
target_compile_definitions(debase-llvm INTERFACE ${LLVM_DEFS_LIST} -DNOMINMAX)
target_compile_options(debase-llvm INTERFACE -Wno-deprecated-declarations)
