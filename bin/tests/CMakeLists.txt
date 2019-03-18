# We need somewhere to dump the output of these tests. Let's keep it neat.
#
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/outputs)

# Find all input files
#
file(GLOB test_cases RELATIVE ${CMAKE_CURRENT_SOURCE_DIR}/inputs ${CMAKE_CURRENT_SOURCE_DIR}/inputs/*.pf)

# Create a test for each test input
#
foreach(case ${test_cases})
  get_filename_component(base ${case} NAME_WE)

  add_test(process_system_test_${base}
           ${CMAKE_COMMAND}
           -Ddirectory=${CMAKE_CURRENT_SOURCE_DIR}
           -Dbase=${base}
           -P ${CMAKE_CURRENT_SOURCE_DIR}/run-test.cmake)
endforeach()
