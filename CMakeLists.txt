CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

PROJECT(fltkc)

# CMake doesn't like backslashes in path
STRING("REGEX" "REPLACE" "\\\\" "/" "FLTK_HOME" "${FLTK_HOME}")

if(EXISTS "${FLTK_HOME}/build/lib/libfltk_z.a")
  SET(FLTK_Z "${FLTK_HOME}/build/lib/libfltk_z.a")
else()
  find_library(HAVE_Z z)
  SET(FLTK_Z "${HAVE_Z}")
endif()

if(EXISTS "${FLTK_HOME}/build/lib/libfltk_jpeg.a")
  SET(FLTK_JPEG "${FLTK_HOME}/build/lib/libfltk_jpeg.a")
else()
  find_library(HAVE_JPEG jpeg)
  SET(FLTK_JPEG "${HAVE_JPEG}")
endif()

if(EXISTS "${FLTK_HOME}/build/lib/libfltk_png.a")
  SET(FLTK_PNG "${FLTK_HOME}/build/lib/libfltk_png.a")
else()
  find_library(HAVE_PNG png)
  SET(FLTK_PNG "${HAVE_PNG}")
endif()

INCLUDE_DIRECTORIES(${FLTK_HOME})
LINK_DIRECTORIES("${FLTK_HOME}/build/lib")
SET(FLTKLINKFLAGS "-Wl,-Bstatic")
SET(FLTKLINKFLAGS "${FLTKLINKFLAGS} -lfltk.a -lfltk_gl -lfltk_images.a ${FLTK_PNG} ${FLTK_JPEG} ${FLTK_Z} -lfltk_forms")
SET(FLTKLINKFLAGS "${FLTKLINKFLAGS} -Wl,-Bdynamic")

# target_link_libraries doesn't accept libraries as absolute path and
# find_library usually returns path to import library instead static one
# so replace any string in form of 'c:/dev/lib/libfoo.dll.a' with '-lfoo'
STRING(REGEX REPLACE "[^ ]*/lib" "-l" FLTKLINKFLAGS ${FLTKLINKFLAGS})
STRING(REGEX REPLACE "\\.dll\\.a|\\.a" "" FLTKLINKFLAGS ${FLTKLINKFLAGS})

SET(FLTKLINKFLAGS "${FLTKLINKFLAGS} -lglu32 -lopengl32 -lole32 -luuid -lcomctl32 -lComdlg32 -static-libstdc++ -static-libgcc")

# Newer versions of MinGW come with libwinpthread which gets linked dynamicaly by default
find_library (HAVE_PTHREAD pthread)
IF(HAVE_PTHREAD)
	SET(FLTKLINKFLAGS "${FLTKLINKFLAGS} -Wl,-Bstatic,-lstdc++,-lpthread,-Bdynamic")
else()
	SET(FLTKLINKFLAGS "${FLTKLINKFLAGS} -Wl,-Bstatic,-lstdc++,-Bdynamic")
endif()


SET(FLTKCONFIGCOMMAND "-Wl,-Bstatic,-whole-archive,-lfltkc,-no-whole-archive,-Bdynamic -L${FLTK_HOME}/build/lib -L${CMAKE_CURRENT_SOURCE_DIR}/c-lib ${FLTKLINKFLAGS}")

CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo.in
               ${CMAKE_CURRENT_SOURCE_DIR}/fltkhs.buildinfo)
FIND_PACKAGE(OpenGL REQUIRED)
set_directory_properties(PROPERTIES
                         ADDITIONAL_MAKE_CLEAN_FILES "${CMAKE_CURRENT_SOURCE_DIR}/cmake_install.cmake;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles")
ADD_SUBDIRECTORY(c-src)
