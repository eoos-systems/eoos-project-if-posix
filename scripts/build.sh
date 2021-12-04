#!/bin/sh
# This script builds a program.
#
# @param $1    --clean   - rebuilds the project by removing the 'build' directory.
# @param $2    --build   - compile the project by calling 'make'.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

outMessage "BUILDING OF PROJECT HAS BEEN INVOKED" "OK" -block

# CDIR: REPOSITORY/scripts$
outMessage "Build is started" "INF" -block
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
fi
cd build

# CDIR: REPOSITORY/build$
outMessage "Generate CMake project" "INF"
cmake .. -DCMAKE_INSTALL_PREFIX=CMakeInstallDir

if [ "$1" == "--build" -o "$2" == "--build" ]; then
    outMessage "CALLING MAKE..." "INF" -blocked
    make all
        # DESTDIR=./CMakeInstallDir
        # VERBOSE=1
        # -j16
        # install
fi

if [ "$1" == "--run" -o "$2" == "--run" -o "$3" == "--run" ]; then
    outMessage "Run unit tests" "INF"
    ./codebase/tests/EoosTests
fi

outMessage "BUILDING OF PROJECT HAS BEEN COMPLETED" "OK" -block
cd ../scripts/
# CDIR: REPOSITORY/scripts$
