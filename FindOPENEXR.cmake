pkg_check_modules(OPENEXR OpenEXR)

if(NOT TARGET open_exr)
  add_library(open_exr INTERFACE)
  target_include_directories(open_exr INTERFACE ${OPENEXR_INCLUDE_DIRS})
  target_link_libraries(open_exr INTERFACE ${OPENEXR_LIBRARIES})
endif()
