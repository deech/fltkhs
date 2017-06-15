AC_MSG_NOTICE([$host])
AC_PREREQ([2.60])
AC_INIT([fltkc], [0.1], [aditya dawt siram ayt gmail dawt com])
AC_CONFIG_SRCDIR([c-src/Fl_C.h])

# Checks for programs.
AC_PROG_CC([clang gcc cc])
AC_PROG_CXX([clang++ g++ c++])

# Checks for libraries.
AC_CHECK_PROG(FLTKCONFIG,fltk-config,[fltk-config],[no])
test "$FLTKCONFIG" == "no" && AC_MSG_ERROR([Cannot find the fltk-config executable. Is FLTK installed?])

# Checks for header files.
AC_CHECK_HEADERS([stddef.h stdint.h stdlib.h string.h unistd.h])
AC_CHECK_LIB([dl], [main])

AC_SUBST(FLTKCONFIGCOMMAND,"$(fltk-config --ldstaticflags --use-images --use-forms) -lstdc++")
AC_DEFINE([HAVE_GL], [], [Support OpenGL]),
AC_SUBST([GLSUPPORT],"")

dnl Example of default-disabled feature
AC_ARG_ENABLE([gl],
AS_HELP_STRING([--enable-gl], [Enable feature OpenGL support]))

AS_IF([test "x$enable_gl" = "xyes"], [
   AC_SUBST([GLSUPPORT], 1)
   AC_DEFINE([HAVE_GL], [1], [Support OpenGL]),
   AC_SUBST(FLTKCONFIGCOMMAND,"$(fltk-config --ldstaticflags --use-gl --use-glut --use-images --use-forms) -lstdc++")
])


AC_SUBST(FLTK_HOME,`fltk-config --includedir`)
# Checks for typedefs, structures, and compiler characteristics.
AC_CONFIG_HEADER(config.h:configh.in)

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([select strdup strerror strrchr strtol])

AC_SUBST([FLTKCONFIG],"fltk-config")
AC_CONFIG_FILES([Makefile c-src/Makefile c-examples/Makefile fltkhs.buildinfo])
AC_OUTPUT
