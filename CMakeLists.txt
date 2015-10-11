CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(fltkc)

if(EXISTS "${FLTK_HOME}/lib/libfltk_z.a")
  SET(FLTK_Z "${FLTK_HOME}/lib/libfltk_z.a")
else()
  find_library(HAVE_Z z) 
  SET(FLTK_Z "${HAVE_Z}")
endif()

if(EXISTS "${FLTK_HOME}/lib/libfltk_jpeg.a")
  SET(FLTK_JPEG "${FLTK_HOME}/lib/libfltk_jpeg.a")
else()
  find_library(HAVE_JPEG jpeg)
  SET(FLTK_JPEG "${HAVE_JPEG}")
endif()

if(EXISTS "${FLTK_HOME}/lib/libfltk_png.a")
  SET(FLTK_PNG "${FLTK_HOME}/lib/libfltk_png.a")
else()
  find_library(HAVE_PNG png)
  SET(FLTK_PNG "${HAVE_PNG}")
endif()

SET(FLTKCONFIGCOMMAND "${FLTK_HOME}/lib/libfltk.a ${FLTK_HOME}/lib/libfltk_gl.a ${FLTK_HOME}/lib/libfltk_images.a ${FLTK_PNG} ${FLTK_JPEG} ${FLTK_Z} ${FLTK_HOME}/lib/libfltk_forms.a")
SET(FLTKCONFIGCOMMAND "${FLTKCONFIGCOMMAND} -mwindows -lglu32 -lopengl32 -lole32 -luuid -lcomctl32")
MESSAGE("${FLTKCONFIGCOMMAND}")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo.in
               ${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo)
FIND_PACKAGE(OpenGL REQUIRED)
set_directory_properties(PROPERTIES
                         ADDITIONAL_MAKE_CLEAN_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake_install.cmake;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles")
ADD_SUBDIRECTORY(c-src)
