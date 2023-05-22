# EOOS POSIX.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019-2023, Sergey Baigudin, Baigudin Software

cmake_minimum_required(VERSION 3.10)
project(eoos-if-posix VERSION 0.11.0 LANGUAGES CXX)

include(cmake/EOOS.cmake)

if(EOOS_CMAKE_ENABLE_GCC_COVERAGE)
# @todo Rework this CMake module or avoid its usage, as
# it warnings on CMakeCCompilerId.gcno produced by GCOV
# and cannot open source CMakeCCompilerId.c
include(cmake/CodeCoverage.cmake)
append_coverage_compiler_flags()
endif()

message(STATUS "EOOS option EOOS_CMAKE_ENABLE_TESTS=" ${EOOS_CMAKE_ENABLE_TESTS})
message(STATUS "EOOS option EOOS_CMAKE_ENABLE_GCC_COVERAGE=" ${EOOS_CMAKE_ENABLE_GCC_COVERAGE})

message(STATUS "EOOS definition EOOS_GLOBAL_ENABLE_NO_HEAP=" ${EOOS_GLOBAL_ENABLE_NO_HEAP})
message(STATUS "EOOS definition EOOS_GLOBAL_NUMBER_OF_MUTEXS=" ${EOOS_GLOBAL_NUMBER_OF_MUTEXS})
message(STATUS "EOOS definition EOOS_GLOBAL_NUMBER_OF_SEMAPHORES=" ${EOOS_GLOBAL_NUMBER_OF_SEMAPHORES})
message(STATUS "EOOS definition EOOS_GLOBAL_NUMBER_OF_THREADS=" ${EOOS_GLOBAL_NUMBER_OF_THREADS})

enable_testing()

set(CMAKE_CXX_STANDARD 98)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_compile_options(-Wall)

add_subdirectory(extern)
add_subdirectory(codebase)

if(EOOS_CMAKE_ENABLE_GCC_COVERAGE)
setup_target_for_coverage_gcovr_html(
    NAME coverage
    EXECUTABLE ctest
    DEPENDENCIES target-eoos-unit-tests
    EXCLUDE "${PROJECT_SOURCE_DIR}/build/*"
            "${PROJECT_SOURCE_DIR}/extern/*" 
            "${PROJECT_SOURCE_DIR}/codebase/tests/*" 
            "${PROJECT_SOURCE_DIR}/codebase/system/source/sys.Main.cpp"
)
endif()
