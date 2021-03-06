# - Try to find Assimp
# Once done, this will define
#
#  ASSIMP_FOUND - system has Assimp
#  ASSIMP_INCLUDE_DIR - the Assimp include directories
#  ASSIMP_LIBRARIES - link these to use Assimp

# The following files were modified by Robert Hildebrandt to allow finding assimp also in other directories
FIND_PATH( ASSIMP_INCLUDE_DIR assimp/mesh.h
  HINTS
  ${ASSIMP_ROOT}
  $ENV{ASSIMP_ROOT}
  $ENV{HOME}/.local
  PATHS
  /usr
  /usr/local
  /opt/local
  PATH_SUFFIXES
  include
)

FIND_LIBRARY( ASSIMP_LIBRARY assimp
  HINTS
  ${ASSIMP_ROOT}
  $ENV{ASSIMP_ROOT}
  $ENV{HOME}/.local
  PATHS
  /usr
  /usr/local
  /opt/local
  PATH_SUFFIXES
  lib64
  lib
  build/code
)
# End of modifications

IF(ASSIMP_INCLUDE_DIR AND ASSIMP_LIBRARY)
  SET( ASSIMP_FOUND TRUE )
  SET( ASSIMP_LIBRARIES ${ASSIMP_LIBRARY} )
ENDIF(ASSIMP_INCLUDE_DIR AND ASSIMP_LIBRARY)

IF(ASSIMP_FOUND)
   IF(NOT ASSIMP_FIND_QUIETLY)
      MESSAGE(STATUS "Found ASSIMP: ${ASSIMP_LIBRARY}")
   ENDIF(NOT ASSIMP_FIND_QUIETLY)
ELSE(ASSIMP_FOUND)
   IF(ASSIMP_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find libASSIMP")
   ENDIF(ASSIMP_FIND_REQUIRED)
ENDIF(ASSIMP_FOUND)

# The following lines were modified by Robert Hildebrandt to allow finding assimp to provide a target interface
if(NOT TARGET assimp)
  add_library(assimp INTERFACE)
  target_include_directories(assimp INTERFACE ${ASSIMP_INCLUDE_DIR})
  target_link_libraries(assimp INTERFACE ${ASSIMP_LIBRARY})
endif()
# End of modifications
