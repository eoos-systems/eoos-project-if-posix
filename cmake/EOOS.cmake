# EOOS POSIX OPTIONS.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2020-2022, Sergey Baigudin, Baigudin Software

set(EOOS_CMAKE_ENABLE_TESTS OFF CACHE BOOL "Enable building unit test")
set(EOOS_CMAKE_ENABLE_GCC_COVERAGE OFF CACHE BOOL "Enable building unit tests with Gcov compiler flags")

set(EOOS_GLOBAL_ENABLE_NO_HEAP OFF CACHE BOOL "Enable no using heap memory")
set(EOOS_GLOBAL_SYS_NUMBER_OF_MUTEXS "0"  CACHE STRING "Number of pre-allocated mutex resources, or unlimited if zero")
set(EOOS_GLOBAL_SYS_NUMBER_OF_SEMAPHORES "0"  CACHE STRING "Number of pre-allocated semaphore resources, or unlimited if zero")
set(EOOS_GLOBAL_SYS_NUMBER_OF_THREADS "0"  CACHE STRING "Number of pre-allocated thread resources, or unlimited if zero")
