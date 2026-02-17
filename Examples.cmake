################# EXAMPLE ######################################################

debase_library(example-lib
  #CONFIG
  #  examples/Filename/Config.json
  FILES
    examples/Filename/Class.cpp
  PATTERNS
    "**::/{file.stem}*/"
  OUTPUT ir
  DUMP
  PASSTHROUGH
    #--allow-no-builtins
    #--output-assembly
    #--verbose
)

debase_include_directories(example-lib PUBLIC examples/Filename)
add_executable(example-driver examples/Filename/Driver.cpp)
debase_depends(example-driver example-lib)

################# SIMPLE #######################################################

debase_library(simple-lib
  FILES
    examples/Simple/Simple.cpp
  PATTERNS
    "/[ABCE]/"
  OUTPUT ir
  DUMP
)

debase_include_directories(simple-lib PUBLIC examples/Simple)
add_executable(simple-driver examples/Simple/Driver.cpp)
debase_depends(simple-driver simple-lib)
