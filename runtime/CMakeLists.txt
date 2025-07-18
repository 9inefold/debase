include_guard(DIRECTORY)

add_library(debase-rt INTERFACE)
add_library(debase::rt ALIAS debase-rt)

target_compile_definitions(debase-rt INTERFACE DEBASE_VERSION=)
target_include_directories(debase-rt INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
