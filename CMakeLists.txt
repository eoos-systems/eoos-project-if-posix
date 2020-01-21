# EOOS ARM ARM926PXP Versatile/AB Board.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Baigudin Software
# @license   http://embedded.team/license/

cmake_minimum_required(VERSION 3.15)
project(eoos-if-posix VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(NOT DEFINED CMAKE_INSTALL_BINDIR)
  message(STATUS "PROJECT MESSAGE: CMAKE_INSTALL_BINDIR IS NOT DEFINED AND SET TO BIN")
  set(CMAKE_INSTALL_BINDIR "bin" CACHE PATH "User executables go to the bin directory")
endif()

add_subdirectory(codebase)
