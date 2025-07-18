cmake_minimum_required(VERSION 3.18)
include_guard(DIRECTORY)
include(Setup.cmake)

if(NOT APPLE)
  set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--as-needed" )
endif()

project(
  debase
  VERSION 0.0.2
  LANGUAGES CXX C
)

include(SetFlags)
include(SetOptions)
include(LLVM)

valued_option(DEBASE_VENDOR_NAME "Name used in --version." "Debaser")

add_subdirectory(runtime)
add_subdirectory(driver)
