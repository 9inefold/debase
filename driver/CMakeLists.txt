include_guard(DIRECTORY)

add_subdirectory(compat)

add_executable(${PROJECT_NAME}
  Driver.cpp
  FilePropertyCache.cpp
  NameClassifier.cpp
  Pattern.cpp
  SymbolMatcher.cpp
  Triple.cpp
  UnlinkRefs.cpp
)
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_23)
target_link_libraries(${PROJECT_NAME} PUBLIC
  debase::llvm debase::rt debase::msvc-compat)
if(WIN32)
  target_compile_definitions(${PROJECT_NAME} PUBLIC _HAS_ITERATOR_DEBUGGING=0)
endif(WIN32)
if(NOT DEBASE_MSVC_LIKE)
  target_compile_options(${PROJECT_NAME} PUBLIC
    -Wall -Wno-unused-private-field -Wno-unused-function -Wno-unused-variable
    #-fsanitize=address
  )
  #target_link_options(${PROJECT_NAME} PUBLIC -fsanitize=address)
endif()

foreach(target IN LISTS DEBASE_TARGETS)
  set(DEBASE_TARGETS_X "${DEBASE_TARGETS_X} X(${target})") 
endforeach()
configure_inline(LLVMTargets.hpp.in @ONLY)

add_custom_target(move-zlib ALL)
add_custom_command(
  TARGET move-zlib
  COMMAND ${CMAKE_COMMAND}
    -E copy "$<TARGET_FILE:zlib>" "${CMAKE_CURRENT_BINARY_DIR}/$<TARGET_FILE_NAME:zlib>"
  POST_BUILD
)
add_dependencies(${PROJECT_NAME} move-zlib)
