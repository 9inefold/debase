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

add_subdirectory(runtime)
add_subdirectory(driver)
