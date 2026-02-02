cmake_minimum_required(VERSION 3.18)
include_guard(DIRECTORY)
include(Setup.cmake)

if(NOT APPLE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--as-needed" )
endif()

project(
  debase
  VERSION 1.0.0
  LANGUAGES CXX C
)

include(SetFlags)
include(SetOptions)
include(cmake/CPM.cmake)

option(DEBASE_RUNTIME_ONLY "Only add the debase runtime." OFF)
valued_option(DEBASE_VENDOR_NAME "Name used in --version." "Debaser")

add_subdirectory(runtime)
if(DEBASE_RUNTIME_ONLY)
  message(STATUS "Only providing debase::runtime")
else()
  include(DebaseLLVM)
  add_subdirectory(driver)
endif()
