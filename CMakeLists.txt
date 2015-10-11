CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(fltkc)
find_file(HAVE_FLTK_Z ${FLTK_HOME}/lib/libfltk_z.a)
find_file(HAVE_FLTK_JPEG ${FLTK_HOME}/lib/libfltk_jpeg.a)
find_file(HAVE_FLTK_PNG ${FLTK_HOME}/lib/libfltk_png.a)

if(HAVE_FLTK_Z)
  SET(FLTK_Z HAVE_FLTK_Z)
else()
  find_library(HAVE_Z z)
  SET(FLTK_Z HAVE_Z)
endif()

if(HAVE_FLTK_JPEG)
  SET(FLTK_JPEG HAVE_FLTK_JPEG)
else()
  find_library(HAVE_JPEG jpeg)
  SET(FLTK_JPEG HAVE_JPEG)
endif()

if(HAVE_FLTK_PNG)
  SET(FLTK_PNG HAVE_FLTK_PNG)
else()
  find_library(HAVE_PNG png)
  SET(FLTK_PNG HAVE_PNG)
endif()

SET(FLTKCONFIGCOMMAND "${FLTK_HOME}/lib/libfltk.a ${FLTK_HOME}/lib/libfltk_gl.a ${FLTK_HOME}/lib/libfltk_images.a ${FLTK_JPEG} ${FLTK_Z} ${FLTK_PNG} ${FLTK_HOME}/lib/libfltk_forms.a")
SET(FLTKCONFIGCOMMAND "${FLTKCONFIGCOMMAND} -mwindows -lglu32 -lopengl32 -lole32 -luuid -lcomctl32")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo.in
               ${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo)
FIND_PACKAGE(OpenGL REQUIRED)
set_directory_properties(PROPERTIES
                         ADDITIONAL_MAKE_CLEAN_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake_install.cmake;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles")
ADD_SUBDIRECTORY(c-src)
