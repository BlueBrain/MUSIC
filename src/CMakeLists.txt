#
# This file is part of MUSIC.
# Copyright (c) 2014 Cajal Blue Brain, BBP/EPFL
#
# MUSIC is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# MUSIC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

include(files.cmake)

add_definitions(-DBUILDING_MUSIC_LIBRARY)

# We can't use CMake/common common_library because the project doesn't have
# an suitable file layout for it. We will mimic the essential parts that make
# target exports work
common_compiler_flags()
common_set_lib_name_postfix()

macro(library Name)
  string(TOUPPER ${Name} NAME)
  add_library(${Name} SHARED
    ${${NAME}_SOURCES} ${${NAME}_HEADERS} ${${NAME}_PUBLIC_HEADERS})
  set_target_properties(${Name} PROPERTIES
    VERSION ${VERSION} SOVERSION ${VERSION_ABI} FOLDER ${Name})
  target_link_libraries(${Name} ${${NAME}_LINK_LIBRARIES})
  target_include_directories(${Name} PUBLIC
        "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/src>"
        "$<BUILD_INTERFACE:${OUTPUT_INCLUDE_DIR}>"
        "$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}>")

  # SubProject.cmake helpers
  set_property(GLOBAL APPEND PROPERTY music_ALL_DEP_TARGETS ${Name})
  if(NOT TARGET music_ALIAS)
    add_library(music_ALIAS ALIAS ${Name})
  endif()

  install(TARGETS ${Name}
    EXPORT musicTargets
    ARCHIVE DESTINATION ${LIBRARY_DIR} COMPONENT dev
    RUNTIME DESTINATION bin COMPONENT lib
    LIBRARY DESTINATION ${LIBRARY_DIR} COMPONENT lib
    INCLUDES DESTINATION include)
  install_files(include FILES ${${NAME}_PUBLIC_HEADERS} COMPONENT dev)
endmacro()

set(MUSIC_LINK_LIBRARIES PUBLIC ${MPI_LIBRARIES} PRIVATE mpidep)
library(music)
# This header has be installed separately because it's path is not relative
# to this directory and it goes into the include/music subdirectory
install_files(include/music FILES ${PROJECT_BINARY_DIR}/music/music-config.hh
  COMPONENT dev)

set(MUSIC_C_LINK_LIBRARIES music)
library(music_c)
set_target_properties(music_c PROPERTIES OUTPUT_NAME "music-c")
