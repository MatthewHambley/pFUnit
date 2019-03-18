find_package(PythonInterp REQUIRED)

add_test(NAME processor_unit_tests
         COMMAND ${PYTHON_EXECUTABLE} -m unittest discover ${CMAKE_CURRENT_SOURCE_DIR}/..)

install(FILES pFUnitParser.py parseDirectiveArgs.py DESTINATION ${dest}/bin/funit)

