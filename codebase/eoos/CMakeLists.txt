# EOOS RT.
#
# @author    Sergey Baigudin, sergey@baigudin.software
# @copyright 2019, Sergey Baigudin, Baigudin Software
# @license   http://embedded.team/license/

add_library(target-eoos OBJECT "")

add_subdirectory(api)
add_subdirectory(library)
add_subdirectory(system)

# set_target_properties(target-eoos PROPERTIES PREFIX "")
# set_target_properties(target-eoos PROPERTIES OUTPUT_NAME "eoos-lib-if-posix")
# set_target_properties(target-eoos PROPERTIES SUFFIX ".a")
# install(TARGETS target-eoos LIBRARY DESTINATION ${CMAKE_INSTALL_BINDIR})
