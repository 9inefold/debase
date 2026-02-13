include_guard(DIRECTORY)

add_subdirectory(compat)
set(DEBASE_BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}" PARENT_SCOPE)

add_executable(${PROJECT_NAME}
  Driver.cpp
  FilePropertyCache.cpp
  NameClassifier.cpp
  Pattern.cpp
  SymbolMatcher.cpp
  Triple.cpp
)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_23)
target_link_libraries(${PROJECT_NAME} PUBLIC
  debase::llvm debase::rt debase::msvc-compat)
if(WIN32)
  target_compile_definitions(${PROJECT_NAME} PUBLIC
    _HAS_ITERATOR_DEBUGGING=0 _ALLOW_COMPILER_AND_STL_VERSION_MISMATCH=1)
  if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(${PROJECT_NAME} PUBLIC -Wno-deprecated-declarations)
  endif()
endif(WIN32)
if(NOT DEBASE_MSVC_LIKE)
  target_compile_options(${PROJECT_NAME}
    PRIVATE -Wall -Wno-unused-private-field -Wno-unused-function -Wno-unused-variable
    PUBLIC -fno-exceptions -fno-rtti -funwind-tables
  )
endif()

if(DEBASE_VERBOSE_LINKER)
  target_link_options(${PROJECT_NAME} PUBLIC -v)
endif()

foreach(target IN LISTS DEBASE_TARGETS)
  set(DEBASE_TARGETS_X "${DEBASE_TARGETS_X} X(${target})") 
endforeach()
configure_inline(LLVMTargets.hpp.in @ONLY)

target_link_libraries(${PROJECT_NAME} PUBLIC ZLIB::ZLIBSTATIC)
