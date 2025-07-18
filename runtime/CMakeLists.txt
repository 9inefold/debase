include_guard(DIRECTORY)

include(ConfigureFiles)
include(SetVersion)

set_version(DEBASE PROJECT)
configure_inline(debase/Config.hpp.in)

add_library(debase-rt INTERFACE)
add_library(debase::rt ALIAS debase-rt)
target_include_directories(debase-rt INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
