#!/bin/sh

# This script builds a program.
#
# @param $1    --rebuild - rebuilds the project by removing the 'build' directory.
# @param $2    --nomake  - prohibits to call 'make'.
# @param $2/$3 --memdump - dumps information about memory sections.
#
# SDIR: REPOSITORY/scripts$
# EDIR: REPOSITORY/scripts$
source ./functions.sh

TOOLCHAIN_PREFIX_PATH=/opt/gcc-linaro-7.3.1-2018.05-x86_64_arm-eabi/bin/arm-eabi
ELF_FILE_PATH=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.elf
BIN_FILE_PATH=./CMakeInstallDir/bin/eoos-app-arm926pxp-versatile.bin

# CDIR: REPOSITORY/scripts$
cd ..

# CDIR: REPOSITORY$
if [ "$1" == "--rebuild" ]; then
    if [ -d "build" ]; then
    	outMessage "REBUILD ALL FLAG IS SET. REMOVING PREVIOUSLY BUILT DIRECTORY..." "INF" -blocked
        rm -r build
    fi
fi
if [ ! -d "build" ]; then
    mkdir build
	mkdir build/CMakeInstallDir
fi
cd build
# CDIR: REPOSITORY/build$
outMessage "CALLING CMAKE..." "INF" -blocked
cmake .. -DCMAKE_INSTALL_PREFIX=CMakeInstallDir

if [ "$2" != "--nomake" ]; then
    outMessage "CALLING MAKE..." "INF" -blocked
    make install
        # DESTDIR=./CMakeInstallDir
        # VERBOSE=1
        # -j16
        # install

#    outMessage "CALLING OBJCOPY..." "INF" -blocked
#    outMessage "Creating a binary file of the project..." "CYAN"
#    $TOOLCHAIN_PREFIX_PATH-objcopy -O binary $ELF_FILE_PATH $BIN_FILE_PATH
#    outMessage "-- Created: $BIN_FILE_PATH"
fi

#if [ "$2" == "--memdump" -o "$3" == "--memdump" ]; then
#    outMessage "ELF INFO..." "INF" -blocked
#    $TOOLCHAIN_PREFIX_PATH-readelf -S $ELF_FILE_PATH
#fi

outMessage "BUILDING COMPLETED" "OK" -blocked
cd ../scripts/
# CDIR: REPOSITORY/scripts$
