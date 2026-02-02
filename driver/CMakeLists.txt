include_guard(DIRECTORY)

add_executable(${PROJECT_NAME} Driver.cpp UnlinkRefs.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE debase::llvm debase::rt)
target_compile_options(${PROJECT_NAME} PUBLIC
  -fno-exceptions -funwind-tables -stdlib=libc++
)

if(WIN32)
  target_compile_definitions(${PROJECT_NAME} PRIVATE -D_HAS_ITERATOR_DEBUGGING=0)
endif(WIN32)
