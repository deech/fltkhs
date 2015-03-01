CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(fltkc)

SET(FLTKCONFIGCOMMAND "${FLTK_HOME}/lib/libfltk.a ${FLTK_HOME}/lib/libfltk_gl.a ${FLTK_HOME}/lib/libfltk_images.a ${FLTK_HOME}/lib/libfltk_jpeg.a ${FLTK_HOME}/lib/libfltk_png.a ${FLTK_HOME}/lib/libfltk_z.a ${FLTK_HOME}/lib/libfltk_forms.a")
SET(FLTKCONFIGCOMMAND "${FLTKCONFIGCOMMAND} -mwindows -lglu32 -lopengl32 -lole32 -luuid -lcomctl32")
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo.in
               ${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo)
FIND_PACKAGE(OpenGL REQUIRED)
set_directory_properties(PROPERTIES
                         ADDITIONAL_MAKE_CLEAN_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake_install.cmake;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles")
ADD_SUBDIRECTORY(c-src)
