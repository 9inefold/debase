include_guard(DIRECTORY)

Find_Package(LLVM REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

separate_arguments(LLVM_DEFS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})

message(STATUS "LLVM libraries: ${LLVM_LIBRARIES}")
message(STATUS "LLVM includes: ${LLVM_INCLUDE_DIRS}")
message(STATUS "LLVM definitions: ${LLVM_DEFINITIONS}")
message(STATUS "LLVM tools: ${LLVM_TOOLS_BINARY_DIR}")

if(DEFINED DUMP_LIBS AND DUMP_LIBS)
	list(TRANSFORM LLVM_AVAILABLE_LIBS
		REPLACE "^LLVM" ""
		REGEX "^LLVM.+"
		OUTPUT_VARIABLE LLVM_SHORT_AVAILABLE_LIBS)
	list(JOIN LLVM_SHORT_AVAILABLE_LIBS ", " LLVM_SHORT_AVAILABLE_LIBS)
	message(STATUS "LLVM libs: ${LLVM_SHORT_AVAILABLE_LIBS}")
	unset(LLVM_SHORT_AVAILABLE_LIBS)
endif()

add_library(debase-llvm INTERFACE)
add_library(debase::LLVM ALIAS debase-llvm)

target_include_directories(debase-llvm SYSTEM INTERFACE ${LLVM_INCLUDE_DIRS})
target_link_libraries(debase-llvm INTERFACE ${LLVM_AVAILABLE_LIBS})
target_compile_definitions(debase-llvm INTERFACE ${LLVM_DEFS_LIST} -DNOMINMAX)
