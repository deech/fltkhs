AC_MSG_NOTICE([$host])
AC_PREREQ([2.60])
AC_INIT([fltkc], [0.1], [aditya dawt siram ayt gmail dawt com])
AC_CONFIG_SRCDIR([c-src/Fl_C.h])

# Checks for programs.
AC_PROG_CC([clang gcc cc])
AC_PROG_CXX([clang++ g++ c++])

# Checks for libraries.
# Checks for header files.
AC_CHECK_HEADERS([stddef.h stdint.h stdlib.h string.h unistd.h])
AC_CHECK_LIB([dl], [main])

AC_ARG_WITH(fltk-config,
            [AS_HELP_STRING([--with-fltk-config],[Set location of the fltk-config executable.])],
            fltk_config="$withval",
            fltk_config="fltk-config"
            )
AC_ARG_WITH(fltk-major-version,
            [AS_HELP_STRING([--with-fltk-major-version],[Set the FLTK major version, for example if version is 1.2.3, major version is 1.])],
            fltk_major_version="$withval",
            fltk_major_version=1
            )
AC_ARG_WITH(fltk-minor-version,
            [AS_HELP_STRING([--with-fltk-minor-version],[Set the FLTK minor version, for example if version is 1.2.3, minor version is 2.])],
            fltk_minor_version="$withval",
            fltk_minor_version=4
            )
AC_ARG_WITH(fltk-patch-version,
            [AS_HELP_STRING([--with-fltk-patch-version],[Set the FLTK patch version, for example if version is 1.2.3, patch version is 3.])],
            fltk_patch_version="$withval",
            fltk_patch_version=0
           )

AC_DEFINE_UNQUOTED([FLTK_CONFIG], $fltk_config, [fltk-config executable])
AC_DEFINE_UNQUOTED([FLTK_MAJOR_VERSION], $fltk_major_version, [Fltk Major Version])
AC_DEFINE_UNQUOTED([FLTK_MINOR_VERSION], $fltk_minor_version, [Fltk Minor Version])
AC_DEFINE_UNQUOTED([FLTK_PATCH_VERSION], $fltk_patch_version, [Fltk Patch Version])

AC_SUBST(FLTKCONFIGCOMMAND,"$($fltk_config --ldstaticflags --use-images --use-forms) -lstdc++")
AC_SUBST([GLSUPPORT],"")

dnl Example of default-disabled feature
AC_ARG_ENABLE([gl],
AS_HELP_STRING([--enable-gl], [Enable feature OpenGL support]))

AS_IF([test "x$enable_gl" = "xyes"], [
   AC_SUBST([GLSUPPORT], 1)
   AC_DEFINE([HAVE_GL], [1], [Support OpenGL]),
   AC_SUBST(FLTKCONFIGCOMMAND,"$($fltk_config --ldstaticflags --use-gl --use-glut --use-images --use-forms) -lstdc++")
])


AC_SUBST(FLTK_HOME,`$fltk_config --includedir`)
# Checks for typedefs, structures, and compiler characteristics.
AC_CONFIG_HEADER(config.h:configh.in)

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([select strdup strerror strrchr strtol])

AC_SUBST(FLTKCONFIG,$fltk_config)
AC_CONFIG_FILES([Makefile c-src/Makefile])
AC_OUTPUT
