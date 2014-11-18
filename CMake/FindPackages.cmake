# generated by Buildyard, do not edit.

include(System)
list(APPEND FIND_PACKAGES_DEFINES ${SYSTEM})
find_package(PkgConfig)

set(ENV{PKG_CONFIG_PATH} "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig:$ENV{PKG_CONFIG_PATH}")
if(PKG_CONFIG_EXECUTABLE)
  find_package(MPI )
  if((NOT MPI_FOUND) AND (NOT MPI_FOUND))
    pkg_check_modules(MPI MPI)
  endif()
  if((NOT MPI_FOUND) AND (NOT MPI_FOUND))
    message(FATAL_ERROR "Could not find MPI")
  endif()
else()
  find_package(MPI   REQUIRED)
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(OpenGL )
  if((NOT OpenGL_FOUND) AND (NOT OPENGL_FOUND))
    pkg_check_modules(OpenGL OpenGL)
  endif()
else()
  find_package(OpenGL  )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(GLUT )
  if((NOT GLUT_FOUND) AND (NOT GLUT_FOUND))
    pkg_check_modules(GLUT GLUT)
  endif()
else()
  find_package(GLUT  )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(PythonInterp )
  if((NOT PythonInterp_FOUND) AND (NOT PYTHONINTERP_FOUND))
    pkg_check_modules(PythonInterp PythonInterp)
  endif()
else()
  find_package(PythonInterp  )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(PythonLibs 2.6)
  if((NOT PythonLibs_FOUND) AND (NOT PYTHONLIBS_FOUND))
    pkg_check_modules(PythonLibs PythonLibs>=2.6)
  endif()
else()
  find_package(PythonLibs 2.6 )
endif()

if(PKG_CONFIG_EXECUTABLE)
  find_package(Threads )
  if((NOT Threads_FOUND) AND (NOT THREADS_FOUND))
    pkg_check_modules(Threads Threads)
  endif()
else()
  find_package(Threads  )
endif()


if(EXISTS ${PROJECT_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
  include(${PROJECT_SOURCE_DIR}/CMake/FindPackagesPost.cmake)
endif()

if(MPI_FOUND)
  set(MPI_name MPI)
  set(MPI_FOUND TRUE)
elseif(MPI_FOUND)
  set(MPI_name MPI)
  set(MPI_FOUND TRUE)
endif()
if(MPI_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_MPI)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} MPI")
  link_directories(${${MPI_name}_LIBRARY_DIRS})
  if(NOT "${${MPI_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(SYSTEM ${MPI_C_INCLUDE_PATH} ${${MPI_name}_INCLUDE_DIRS})
  endif()
endif()

if(OPENGL_FOUND)
  set(OpenGL_name OPENGL)
  set(OpenGL_FOUND TRUE)
elseif(OpenGL_FOUND)
  set(OpenGL_name OpenGL)
  set(OPENGL_FOUND TRUE)
endif()
if(OpenGL_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_OPENGL)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} OpenGL")
  link_directories(${${OpenGL_name}_LIBRARY_DIRS})
  if(NOT "${${OpenGL_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${OpenGL_name}_INCLUDE_DIRS})
  endif()
endif()

if(GLUT_FOUND)
  set(GLUT_name GLUT)
  set(GLUT_FOUND TRUE)
elseif(GLUT_FOUND)
  set(GLUT_name GLUT)
  set(GLUT_FOUND TRUE)
endif()
if(GLUT_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_GLUT)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} GLUT")
  link_directories(${${GLUT_name}_LIBRARY_DIRS})
  if(NOT "${${GLUT_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${GLUT_name}_INCLUDE_DIRS})
  endif()
endif()

if(PYTHONINTERP_FOUND)
  set(PythonInterp_name PYTHONINTERP)
  set(PythonInterp_FOUND TRUE)
elseif(PythonInterp_FOUND)
  set(PythonInterp_name PythonInterp)
  set(PYTHONINTERP_FOUND TRUE)
endif()
if(PythonInterp_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_PYTHONINTERP)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} PythonInterp")
  link_directories(${${PythonInterp_name}_LIBRARY_DIRS})
  if(NOT "${${PythonInterp_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${PythonInterp_name}_INCLUDE_DIRS})
  endif()
endif()

if(PYTHONLIBS_FOUND)
  set(PythonLibs_name PYTHONLIBS)
  set(PythonLibs_FOUND TRUE)
elseif(PythonLibs_FOUND)
  set(PythonLibs_name PythonLibs)
  set(PYTHONLIBS_FOUND TRUE)
endif()
if(PythonLibs_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_PYTHONLIBS)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} PythonLibs")
  link_directories(${${PythonLibs_name}_LIBRARY_DIRS})
  if(NOT "${${PythonLibs_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${PythonLibs_name}_INCLUDE_DIRS})
  endif()
endif()

if(THREADS_FOUND)
  set(Threads_name THREADS)
  set(Threads_FOUND TRUE)
elseif(Threads_FOUND)
  set(Threads_name Threads)
  set(THREADS_FOUND TRUE)
endif()
if(Threads_name)
  list(APPEND FIND_PACKAGES_DEFINES MUSIC_USE_THREADS)
  set(FIND_PACKAGES_FOUND "${FIND_PACKAGES_FOUND} Threads")
  link_directories(${${Threads_name}_LIBRARY_DIRS})
  if(NOT "${${Threads_name}_INCLUDE_DIRS}" MATCHES "-NOTFOUND")
    include_directories(${${Threads_name}_INCLUDE_DIRS})
  endif()
endif()

set(MUSIC_BUILD_DEBS autoconf;automake;cmake;doxygen;git;git-review;pkg-config;subversion)

set(MUSIC_DEPENDS MPI;OpenGL;GLUT;PythonInterp;PythonLibs;Threads)

# Write defines.h and options.cmake
if(NOT PROJECT_INCLUDE_NAME)
  message(WARNING "PROJECT_INCLUDE_NAME not set, old or missing Common.cmake?")
  set(PROJECT_INCLUDE_NAME ${PROJECT_NAME})
endif()
if(NOT OPTIONS_CMAKE)
  set(OPTIONS_CMAKE ${CMAKE_CURRENT_BINARY_DIR}/options.cmake)
endif()
set(DEFINES_FILE "${CMAKE_CURRENT_BINARY_DIR}/include/${PROJECT_INCLUDE_NAME}/defines${SYSTEM}.h")
list(APPEND COMMON_INCLUDES ${DEFINES_FILE})
set(DEFINES_FILE_IN ${DEFINES_FILE}.in)
file(WRITE ${DEFINES_FILE_IN}
  "// generated by CMake/FindPackages.cmake, do not edit.\n\n"
  "#ifndef ${PROJECT_NAME}_DEFINES_${SYSTEM}_H\n"
  "#define ${PROJECT_NAME}_DEFINES_${SYSTEM}_H\n\n")
file(WRITE ${OPTIONS_CMAKE} "# Optional modules enabled during build\n")
foreach(DEF ${FIND_PACKAGES_DEFINES})
  add_definitions(-D${DEF}=1)
  file(APPEND ${DEFINES_FILE_IN}
  "#ifndef ${DEF}\n"
  "#  define ${DEF} 1\n"
  "#endif\n")
if(NOT DEF STREQUAL SYSTEM)
  file(APPEND ${OPTIONS_CMAKE} "set(${DEF} ON)\n")
endif()
endforeach()
if(CMAKE_MODULE_INSTALL_PATH)
  install(FILES ${OPTIONS_CMAKE} DESTINATION ${CMAKE_MODULE_INSTALL_PATH}
    COMPONENT dev)
else()
  message(WARNING "CMAKE_MODULE_INSTALL_PATH not set, old or missing Common.cmake?")
endif()
file(APPEND ${DEFINES_FILE_IN}
  "\n#endif\n")

include(UpdateFile)
configure_file(${DEFINES_FILE_IN} ${DEFINES_FILE} COPYONLY)
if(Boost_FOUND) # another WAR for broken boost stuff...
  set(Boost_VERSION ${Boost_MAJOR_VERSION}.${Boost_MINOR_VERSION}.${Boost_SUBMINOR_VERSION})
endif()
if(CUDA_FOUND)
  string(REPLACE "-std=c++11" "" CUDA_HOST_FLAGS "${CUDA_HOST_FLAGS}")
  string(REPLACE "-std=c++0x" "" CUDA_HOST_FLAGS "${CUDA_HOST_FLAGS}")
endif()
if(OPENMP_FOUND)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()
if(QT4_FOUND)
  if(WIN32)
    set(QT_USE_QTMAIN TRUE)
  endif()
  # Configure a copy of the 'UseQt4.cmake' system file.
  if(NOT EXISTS ${QT_USE_FILE})
    message(WARNING "Can't find QT_USE_FILE!")
  else()
    set(_customUseQt4File "${CMAKE_CURRENT_BINARY_DIR}/UseQt4.cmake")
    file(READ ${QT_USE_FILE} content)
    # Change all include_directories() to use the SYSTEM option
    string(REPLACE "include_directories(" "include_directories(SYSTEM " content ${content})
    string(REPLACE "INCLUDE_DIRECTORIES(" "INCLUDE_DIRECTORIES(SYSTEM " content ${content})
    file(WRITE ${_customUseQt4File} ${content})
    set(QT_USE_FILE ${_customUseQt4File})
    include(${QT_USE_FILE})
  endif()
endif()
if(FIND_PACKAGES_FOUND)
  if(MSVC)
    message(STATUS "Configured ${PROJECT_NAME} with ${FIND_PACKAGES_FOUND}")
  else()
    message(STATUS "Configured ${PROJECT_NAME} with ${CMAKE_BUILD_TYPE}${FIND_PACKAGES_FOUND}")
  endif()
endif()
