# We are testing a Python tool so...
#
find_package(PythonInterp REQUIRED)

set(input_file ${directory}/inputs/${base}.pf)
set(output_file ${CMAKE_CURRENT_BINARY_DIR}/outputs/${base}.F90)
set(expected_file ${directory}/expected/${base}.F90)

execute_process(COMMAND ${directory}/../funitproc ${input_file}
                                                  ${output_file}
                RESULT_VARIABLE command_failure
                OUTPUT_VARIABLE log ERROR_VARIABLE log)
if(command_failure)
  message(SEND_ERROR "funitproc command failed: ${command_failure}, ${log}")
endif()

execute_process(COMMAND ${CMAKE_COMMAND} -E compare_files ${expected_file}
                                                          ${output_file}
                RESULT_VARIABLE check_failure
                OUTPUT_VARIABLE log ERROR_VARIABLE log)
if(check_failure)
  message(SEND_ERROR "${check_failure}, ${log}")
  message(SEND_ERROR "${output_file} does not match ${expected_file}")
endif()
