# EOOS.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019-2020, Sergey Baigudin, Baigudin Software

add_library(target-eoos STATIC)

add_subdirectory(interface)
add_subdirectory(library)
add_subdirectory(system)
if(EOOS_ENABLE_TESTS)
    add_subdirectory(tests)
endif()

# Load and run CMake code from a file or module
include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

# Set name for 'find_package' command
set(EOOS_CMAKE_PACKAGE_NAME "EOOS")

# Create *Config.cmake file
configure_package_config_file(
    "${PROJECT_SOURCE_DIR}/cmake/EoosConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/EoosConfig.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}"
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)
# Create *ConfigVersion.cmake file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/EoosConfigVersion.cmake"
    COMPATIBILITY SameMajorVersion
)
# Install *Config.cmake and *ConfigVersion.cmake files
install(
    FILES
        "${CMAKE_CURRENT_BINARY_DIR}/EoosConfig.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/EoosConfigVersion.cmake"
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
    PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/eoos"
    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/eoos"
)

install(
    EXPORT target-exp-eoos
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/${EOOS_CMAKE_PACKAGE_NAME}"
    NAMESPACE eoos::                                                        # EXPORT_NAME added
    FILE EoosTargets.cmake
)
