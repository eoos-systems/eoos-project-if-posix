# EOOS Automotive POSIX
---
**EOOS copyrights reserved in [Rospatent Federal Service for Intellectual Property]( https://www1.fips.ru/registers-doc-view/fips_servlet?DB=EVM&DocNumber=2017664105&TypeFile=html), Russian Federation**

EOOS Automotive for POSIX based operating systems is a **C++ library for cross-platform development** of 
applications in automotive sphere. The library is developed in **C++98** programming language and supports 
features of **C++11** programming language depending on compiler options that 
**allows to consider wide criteria when selecting a suitable programming language** on initiation step 
of product development.

EOOS Automotive POSIX is developed within **ISO C++ standards**, complied with **MISRA C++:2008** and 
**AUTOSAR C++14 Coding Guidelines**, and relies on **ISO 26262** that means applications based on EOOS 
**can be used in critical and safety-related systems**.

---

## 1. How-to Build Project

EOOS is a static library for linkage with other POSIX based applications. This EOOS project based on CMake that builds 
the static library and installs it on an UNIX OS for being found by CMake projects of the applications.



#### 1.1. Prerequisites on Linux

The process described below is passed on Ubuntu 18.04 LTS (x86_64) and requires the next tool to be installed on it:

###### 1.1.1. Install [Git for Linux and Unix](https://git-scm.com/download/linux)


Get Git for Ubuntu following the commands below. For other UNIX OSs following the instruction from the web-site.

```
$ sudo apt-get update
$ sudo apt-get install git
 
$ git --version
git version 2.17.1
```

###### 1.1.2. Install [CMake 3.20 or higher](https://cmake.org/download/)

CMake minimum required version 3.20 for EOOS project.


Download and install CMake from the web-site. Check CMake version in Terminal.

```
C:\> cmake --version
cmake version 3.20.6

CMake suite maintained and supported by Kitware (kitware.com/cmake).
```

###### 1.1.3. Instal IDE and compiler for purposes that you need

EOOS is developed within ISO C++ standards and can be compiled with any compilers, 
which support ISO/IEC 14882:1998 standard and ISO/IEC 14882:2011 standard for new
features of C++ programming language.

To debug applications we are used to using [Eclipse IDE for C/C++ Developers](https://www.eclipse.org/downloads/packages/).
Compiler on Ubuntu 18.04 LTS is installed by default, and you can check it in Terminal.

```
$ gcc --version
gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0

$ g++ --version
g++ (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
```

###### 1.1.4. Optionally install Doxygen for future documentation creation

```
$ sudo apt-get install doxygen

$ doxygen -v
1.8.13
```

###### 1.1.5. Optionally install Graphviz for future documentation creation

```
$ sudo apt-get install graphviz

$ dot -version
dot - graphviz version 2.40.1 (20161225.0304)
```

###### 1.1.6. Optionally install [Python 3.7 or higher](https://www.python.org/downloads/) for future automation

Check your version is not 3.7

```
$ python3 -V
Python 3.6.9
```
 
Install version 3.7

```
$ sudo apt-get install python3.7
```
 
Update Python alternatives

```
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
$ sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
```
 
Configure vession 3.7 as default

```
$ sudo update-alternatives --config python3
``` 

Check your version is 3.7

```
$ python3 -V
Python 3.7.5
```



#### 1.2. Obtain Git Repository

###### 1.2.1. Create an empty directory somewhere on your disk. 

For instance we will create *~/REPOSITORY*.

```
~$ mkdir REPOSITORY
~$ cd REPOSITORY
~/REPOSITORY$
```

###### 1.2.2. Clone this repository. 

For instance we will clone it to *EOOS* directory by SSH.

```
~/REPOSITORY$ git clone --branch master git@gitflic.ru:baigudin-software/eoos-project-if-posix.git EOOS
```

###### 1.2.3. Go the EOOS directory

```
~/REPOSITORY$ cd EOOS
```

###### 1.2.4. Initialize and update all submodules of the repository

```
~/REPOSITORY/EOOS$ git submodule update --init
```



#### 1.3. Source Code Build and Installation

###### 1.3.1. Build and Installation for Developing on EOOS

To build and install EOOS on Linux, execute the commads below.

```
~/REPOSITORY/EOOS$ mkdir build
~/REPOSITORY/EOOS$ cd build
~/REPOSITORY/EOOS/build$ cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
~/REPOSITORY/EOOS/build$ make -j16 install
```

None that the *CMAKE_BUILD_TYPE* parameters can be one of *Release*, *Debug*, *RelWithDebInfo*, *MinSizeRel*, but for developing
purpose we recommend to pass *RelWithDebInfo*.

Having done all the steps, EOOS will be installed to the */usr/local* directory, and you will be able 
to find EOOS in by using `find_package()` command in your CMake project.

An example of your root *CMakeLists.txt* may be the next:

```
cmake_minimum_required(VERSION 3.20)
project(eoos-application VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(EOOS 0.9.0 REQUIRED)

add_executable(application)

target_sources(application
PRIVATE
    "${CMAKE_CURRENT_LIST_DIR}/Program.cpp"
)

target_link_libraries(application
PRIVATE
    eoos::main
)

set_target_properties(application PROPERTIES
    OUTPUT_NAME EoosApplication
)
```

Thus, you will build *EoosApplication* executable file.

> For more examples and fast start please see 
> the [EOOS Automotive Sample Applications](https://gitflic.ru/project/baigudin-software/eoos-project-sample-applications) repository

###### 1.3.2. Build for Testing EOOS

This chapter must be useful for EOOS developers and CI/CD engineers, but not prohibited to be used by any other for sure.

**Note:** Before building, if *build* directory exists, you can remove it by executing the command below.

```
~/REPOSITORY/EOOS$ rm -rf build
```

To build the project with Unit Tests you have to execute the commands below.

```
~/REPOSITORY/EOOS$ mkdir build
~/REPOSITORY/EOOS$ cd build
~/REPOSITORY/EOOS/build$ cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DEOOS_ENABLE_TESTS=ON ..
~/REPOSITORY/EOOS/build$ make all
```

To execute the Unit Tests run the commands below.

```
~/REPOSITORY/EOOS/build$ ./codebase/tests/EoosTests --gtest_shuffle
```

> On developing and intergation stages the *CMAKE_BUILD_TYPE* parameter must be checked for all the 
> *Release*, *Debug*, *RelWithDebInfo*, *MinSizeRel* configurations.

