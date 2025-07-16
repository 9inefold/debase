cmake_minimum_required(VERSION 3.18)
include_guard(DIRECTORY)
include(Setup.cmake)

project(
  debase
  VERSION 0.0.1
  LANGUAGES CXX C
)

include(SetFlags)
include(SetOptions)

# option(ENABLE_FOO "Enable some setting..." OFF)
# valued_option(MAX_BAR "Maximum amount of ..." 8)

add_executable(debase-driver Driver.cpp)
