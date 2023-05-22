# EOOS.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019-2023, Sergey Baigudin, Baigudin Software

add_library(target-eoos STATIC
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.Call.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.Heap.cpp"    
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.Main.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.MemoryManager.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.MutexAllocator.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.MutexManager.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.NoAllocator.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.OutStream.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.Scheduler.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.SemaphoreAllocator.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.SemaphoreManager.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.StreamManager.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.System.cpp"
    "${CMAKE_CURRENT_LIST_DIR}/system/source/sys.ThreadAllocator.cpp"
)

target_include_directories(target-eoos
PUBLIC
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/interface/include/public>"
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/library/include/public>"
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/system/include/public>"
PRIVATE
    "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/system/include/private>"
)

if(EOOS_GLOBAL_ENABLE_NO_HEAP)
    target_compile_definitions(target-eoos
    PUBLIC
        "EOOS_GLOBAL_ENABLE_NO_HEAP"
    )
endif()

target_compile_definitions(target-eoos
PUBLIC
    "EOOS_GLOBAL_NUMBER_OF_MUTEXS=${EOOS_GLOBAL_NUMBER_OF_MUTEXS}"
    "EOOS_GLOBAL_NUMBER_OF_SEMAPHORES=${EOOS_GLOBAL_NUMBER_OF_SEMAPHORES}"
    "EOOS_GLOBAL_NUMBER_OF_THREADS=${EOOS_GLOBAL_NUMBER_OF_THREADS}"    
)

if(EOOS_CMAKE_ENABLE_TESTS)
    target_include_directories(target-eoos
    PUBLIC
        "$<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/system/include/private>"
    )
    
    add_subdirectory(tests)
endif()

# Load and run CMake code from a file or module
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# Set name for 'find_package' command
set(EOOS_CMAKE_PACKAGE_NAME "EOOS")

# Create *Config.cmake file
configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}Config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/${EOOS_CMAKE_PACKAGE_NAME}Config.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}"
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)
# Create *ConfigVersion.cmake file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/${EOOS_CMAKE_PACKAGE_NAME}ConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)
# Install *Config.cmake and *ConfigVersion.cmake files
install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${EOOS_CMAKE_PACKAGE_NAME}Config.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/${EOOS_CMAKE_PACKAGE_NAME}ConfigVersion.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}"
)

file(GLOB EOOS_CMAKE_PUBLIC_HEADERS "${CMAKE_CURRENT_LIST_DIR}/*/include/public/*.hpp")
set_target_properties(target-eoos PROPERTIES
    OUTPUT_NAME eoos
    PUBLIC_HEADER "${EOOS_CMAKE_PUBLIC_HEADERS}"
    EXPORT_NAME main
)

install(
    TARGETS target-eoos
    EXPORT target-exp-eoos
    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${EOOS_CMAKE_PACKAGE_NAME}"
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${EOOS_CMAKE_PACKAGE_NAME}"
)

install(
    EXPORT target-exp-eoos
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}"
    NAMESPACE eoos::                                                        # EXPORT_NAME added
    FILE ${EOOS_CMAKE_PACKAGE_NAME}Targets.cmake
)
