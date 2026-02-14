include_guard(DIRECTORY)

if(DEBASE_MSVC_LIKE)
  message(VERBOSE "Building debase with libcpmt compatibility")
  add_library(debase-msvc-compat STATIC vector_algorithms.cpp)
  target_compile_features(debase-msvc-compat PRIVATE cxx_std_20)
  if(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
    target_compile_options(debase-msvc-compat PRIVATE
      /arch:SSE2 /arch:SSE4.2 /arch:AVX /arch:AVX2)
  else()
    target_compile_options(debase-msvc-compat PRIVATE
      -Wno-ignored-pragmas -msse3 -msse4.2 -mavx -mavx2 -mlzcnt)
  endif()
else()
  add_library(debase-msvc-compat INTERFACE)
endif()
add_library(debase::msvc-compat ALIAS debase-msvc-compat)
