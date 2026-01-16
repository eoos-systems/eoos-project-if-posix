# EOOS POSIX OPTIONS.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2020-2026, Sergey Baigudin, Baigudin Software

set(EOOS_CMAKE_ENABLE_TESTS          OFF     CACHE BOOL   "Enable building unit test")
set(EOOS_CMAKE_ENABLE_GCC_COVERAGE   OFF     CACHE BOOL   "Enable building unit tests with Gcov compiler flags")
set(EOOS_CMAKE_TARGET_OS             "POSIX" CACHE STRING "Define target OS for which EOOS is built")

set(EOOS_GLOBAL_ENABLE_NO_HEAP       OFF     CACHE BOOL   "Enable no using heap memory")
set(EOOS_GLOBAL_SYS_MUTEX_AMOUNT     "0"     CACHE STRING "Number of pre-allocated mutex resources, or unlimited if zero")
set(EOOS_GLOBAL_SYS_SEMAPHORE_AMOUNT "0"     CACHE STRING "Number of pre-allocated semaphore resources, or unlimited if zero")
set(EOOS_GLOBAL_SYS_THREAD_AMOUNT    "0"     CACHE STRING "Number of pre-allocated thread resources, or unlimited if zero")
