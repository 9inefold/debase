include_guard(DIRECTORY)

add_executable(${PROJECT_NAME} Driver.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE debase::LLVM)

if(WIN32)
  target_compile_definitions(${PROJECT_NAME} PUBLIC -D_HAS_ITERATOR_DEBUGGING=0)
endif(WIN32)
