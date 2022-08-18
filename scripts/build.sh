#!/bin/sh
# This script builds a program.
#
# Case 1:
# @param $1         --clean     - Rebuilds the project by removing the 'build' directory.
# @param $1,$2      --build     - Compiles the project by calling 'make'.
# @param $1,$2,$3   --run       - Runs the project unit tests.
# @param $1,$2,$3   --coverage  - Creates coverage report.
#
# Case 2:
# @param $1         --sca   - Runs the SCA report creation.
# @param $2                 - IP address of SCA server.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

# CDIR: REPOSITORY/scripts$
outMessage "BUILDING OF PROJECT HAS BEEN INVOKED" "OK" -block

cd ..
# CDIR: REPOSITORY$

if [ "$1" == "--clean" ]; then
    outMessage "Clean flag is set" "INF"
    if [ -d "build" ]; then
    	outMessage "Remove built directory" "INF"
        rm -r build
    fi
fi
if [ ! -d "build" ]; then
    outMessage "Create built directory" "INF"
    mkdir build
	mkdir build/CMakeInstallDir
    mkdir build/sca
fi

cd build
# CDIR: REPOSITORY/build$

if [ "$1" == "--build" -o "$2" == "--build" ]; then
    outMessage "Generate CMake project" "INF"
    # -DCMAKE_BUILD_TYPE=RelWithDebInfo
    cmake -DEOOS_ENABLE_TESTS=ON -DEOOS_ENABLE_GCC_COVERAGE=ON -DCMAKE_BUILD_TYPE=Debug ..
    outMessage "Call Make" "INF" -blocked
    make all
        # DESTDIR=./CMakeInstallDir
        # VERBOSE=1
        # -j16
        # install
fi

if [ "$1" == "--coverage" -o "$2" == "--coverage" -o "$3" == "--coverage" ]; then
    outMessage "Run unit test coverage" "INF"
    make coverage
fi

if [ "$1" == "--run" -o "$2" == "--run" -o "$3" == "--run" ]; then
    outMessage "Run unit tests" "INF"
    # @note Remove --gtest_filter key if it set
    # --gtest_filter=lib_AlignTest*
    #
    # --gtest_shuffle    
    ./codebase/tests/EoosTests --gtest_shuffle
fi

cd ../scripts/
# CDIR: REPOSITORY/scripts$

if [ "$1" == "--sca" ]; then
    outMessage "Create SCA report" "INF"
    alauncher 7931616 -b -s "$2" --import ./../quality/sca/projects/absint/eoos-if-posix.dax --drop
fi

outMessage "BUILDING OF PROJECT HAS BEEN COMPLETED" "OK" -block