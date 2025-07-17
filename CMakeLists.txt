cmake_minimum_required(VERSION 3.18)
include_guard(DIRECTORY)
include(Setup.cmake)

if(NOT APPLE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--as-needed" )
endif()

project(
  debaser
  VERSION 0.0.1
  LANGUAGES CXX C
)

include(SetFlags)
include(SetOptions)
include(LLVM)

# option(ENABLE_FOO "Enable some setting..." OFF)
# valued_option(MAX_BAR "Maximum amount of ..." 8)

################################################################################
## Debaser Runtime
################################################################################

add_library(debase-rt INTERFACE)
add_library(debase::rt ALIAS debase-rt)

add_executable(${PROJECT_NAME} Driver.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE debase::LLVM)
if(WIN32)
	target_compile_definitions(${PROJECT_NAME} PUBLIC -D_HAS_ITERATOR_DEBUGGING=0)
endif(WIN32)
