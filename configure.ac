AC_PREREQ([2.60])
AC_INIT([fltkc], [0.1], [aditya dawt siram ayt gmail dawt com])
AC_CONFIG_SRCDIR([c-src/Fl_C.h])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC

# Checks for libraries.
AC_CHECK_PROG(FLTKCONFIG,fltk-config,fltk-config,AC_MSG_ERROR(Cannot find the fltk-config executable. Is FLTK installed?))
# Checks for header files.
AC_CHECK_HEADERS([stddef.h stdint.h stdlib.h string.h unistd.h])
AC_CHECK_LIB([dl], [main])
AC_CHECK_LIB([fltk], [fl_alphasort])
AC_CHECK_LIB([fltk_gl],
             [main],
             GlFlag='--use-gl --use-glut',
             GlFlag='')
AC_CHECK_LIB([fltk_images],
             [main],
             ImagesFlag='--use-images',
             ImagesFlag='')
AC_CHECK_LIB([fltk_cairo],
             [main],
             CairoFlag='--use-cairo',
             CairoFlag='')
AC_CHECK_LIB([fltk_forms],
             [main],
             FormsFlag='--use-forms',
             FormsFlag='')

AC_SUBST(FLTKCONFIGCOMMAND,`fltk-config --ldstaticflags $GlFlag $ImagesFlag $CairoFlag $FormsFlag`)
# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([select strdup strerror strrchr strtol])

AC_SUBST([FLTKCONFIG],"fltk-config")
AC_CONFIG_FILES([Makefile c-src/Makefile c-examples/Makefile fltkhs.buildinfo])
AC_OUTPUT
