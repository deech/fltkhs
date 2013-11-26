#                                               -*- Autoconf -*
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([fltkc], [0.1], [aditya dawt siram ayt gmail dawt com])
AC_CONFIG_SRCDIR([c-src/Fl_C.h])
AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC

# Checks for libraries.
AC_CHECK_LIB([dl], [main])
AC_CHECK_LIB([fltk], [fl_alphasort])
AC_CHECK_LIB([fltk_gl], [main])
AC_CHECK_LIB([fltk_images], [main])
AC_CHECK_PROG(FLTKCONFIG,fltk-config,fltk-config,AC_MSG_ERROR(Cannot find the fltk-config executable. Is FLTK installed?))
# Checks for header files.
AC_CHECK_HEADERS([stddef.h stdint.h stdlib.h string.h unistd.h])
LIBS=""
# Check for FLTK header files
# The following headers are ignored:
#       FL/Fl_FormsBitmap.H
#       FL/Fl_FormsPixmap.H
#       FL/Fl_Multi_Label.H
#       FL/fl_show_colormap.H
# because configure throws errors:
# configure: WARNING: <header>: present but cannot be compiled
# configure: WARNING: <header>:     check for missing prerequisite headers?
# configure: WARNING: <header>: see the Autoconf documentation
# configure: WARNING: <header>:     section "Present But Cannot Be Compiled"
# configure: WARNING: <header>: proceeding with the compiler's result
dnl AC_LANG_PUSH([C++])
dnl AC_ARG_ENABLE(xdbe, [  --enable-xdbe           turn on Xdbe support [default=yes]])
dnl if test x$enable_xdbe != xno; then
dnl    AC_CHECK_HEADER(X11/extensions/Xdbe.h, AC_DEFINE(HAVE_XDBE),,
dnl       [#include <X11/Xlib.h>])
dnl    AC_CHECK_LIB(Xext, XdbeQueryExtension,
dnl       LIBS="-lXext $LIBS")
dnl fi
dnl AC_ARG_ENABLE(multibuf, [  --enable-multibuf       turn on Multibuf support [default=yes]])
dnl if test x$enable_multibuf != xno; then
dnl    AC_CHECK_HEADER(X11/extensions/multibuf.h, AC_DEFINE(HAVE_MULTIBUF),,[#include <X11/Xlib.h>])
dnl fi
# AC_CHECK_HEADERS([FL/dirent.h FL/Enumerations.H FL/filename.H FL/Fl_Adjuster.H FL/fl_ask.H FL/Fl_Bitmap.H FL/Fl_BMP_Image.H FL/Fl_Box.H FL/Fl_Browser_.H FL/Fl_Browser.H FL/Fl_Button.H FL/Fl_Cairo.H FL/Fl_Cairo_Window.H FL/Fl_Chart.H FL/Fl_Check_Browser.H FL/Fl_Check_Button.H FL/Fl_Choice.H FL/Fl_Clock.H FL/Fl_Color_Chooser.H FL/Fl_Counter.H FL/Fl_Device.H FL/Fl_Dial.H FL/Fl_Double_Window.H FL/fl_draw.H FL/Fl_Export.H FL/Fl_File_Browser.H FL/Fl_File_Chooser.H FL/Fl_File_Icon.H FL/Fl_File_Input.H FL/Fl_Fill_Dial.H FL/Fl_Fill_Slider.H FL/Fl_Float_Input.H  FL/Fl_Free.H FL/Fl_GIF_Image.H FL/Fl_Gl_Window.H FL/Fl_Group.H FL/Fl.H FL/Fl_Help_Dialog.H FL/Fl_Help_View.H FL/Fl_Hold_Browser.H FL/Fl_Hor_Fill_Slider.H FL/Fl_Hor_Nice_Slider.H FL/Fl_Hor_Slider.H FL/Fl_Hor_Value_Slider.H FL/Fl_Image.H FL/Fl_Input_Choice.H FL/Fl_Input_.H FL/Fl_Input.H FL/Fl_Int_Input.H FL/Fl_JPEG_Image.H FL/Fl_Light_Button.H FL/Fl_Line_Dial.H FL/Fl_Menu_Bar.H FL/Fl_Menu_Button.H FL/Fl_Menu_.H FL/Fl_Menu.H FL/Fl_Menu_Item.H FL/Fl_Menu_Window.H FL/fl_message.H FL/Fl_Multi_Browser.H FL/Fl_Multiline_Input.H FL/Fl_Multiline_Output.H FL/Fl_Native_File_Chooser.H FL/Fl_Nice_Slider.H FL/Fl_Object.H FL/Fl_Output.H FL/Fl_Overlay_Window.H FL/Fl_Pack.H FL/Fl_Paged_Device.H FL/Fl_Pixmap.H FL/Fl_Plugin.H FL/Fl_PNG_Image.H FL/Fl_PNM_Image.H FL/Fl_Positioner.H FL/Fl_PostScript.H FL/Fl_Preferences.H FL/Fl_Printer.H FL/Fl_Progress.H FL/Fl_Radio_Button.H FL/Fl_Radio_Light_Button.H FL/Fl_Radio_Round_Button.H FL/Fl_Repeat_Button.H FL/Fl_Return_Button.H FL/Fl_RGB_Image.H FL/Fl_Roller.H FL/Fl_Round_Button.H FL/Fl_Round_Clock.H FL/Fl_Scrollbar.H FL/Fl_Scroll.H FL/Fl_Secret_Input.H FL/Fl_Select_Browser.H FL/Fl_Shared_Image.H FL/fl_show_input.H FL/Fl_Simple_Counter.H FL/Fl_Single_Window.H FL/Fl_Slider.H FL/Fl_Spinner.H FL/Fl_Sys_Menu_Bar.H FL/Fl_Table.H FL/Fl_Table_Row.H FL/Fl_Tabs.H FL/Fl_Text_Buffer.H FL/Fl_Text_Display.H FL/Fl_Text_Editor.H FL/Fl_Tiled_Image.H FL/Fl_Tile.H FL/Fl_Timer.H FL/Fl_Toggle_Button.H FL/Fl_Toggle_Light_Button.H FL/Fl_Toggle_Round_Button.H FL/Fl_Tooltip.H FL/Fl_Tree.H FL/Fl_Tree_Item_Array.H FL/Fl_Tree_Item.H FL/Fl_Tree_Prefs.H FL/fl_types.h FL/fl_utf8.h FL/Fl_Valuator.H FL/Fl_Value_Input.H FL/Fl_Value_Output.H FL/Fl_Value_Slider.H FL/Fl_Widget.H FL/Fl_Window.H FL/Fl_Wizard.H FL/Fl_XBM_Image.H FL/Fl_XPM_Image.H FL/forms.H FL/gl2opengl.h FL/gl_draw.H FL/gl.h FL/glu.h FL/glut.H FL/mac.H FL/math.h FL/names.h FL/win32.H FL/x.H])
dnl AC_LANG_POP([C++])
AC_CHECK_HEADER(dlfcn.h, AC_DEFINE(HAVE_DLFCN_H))
# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([select strdup strerror strrchr strtol])

AC_SUBST([FLTKCONFIG],"fltk-config")
AC_CONFIG_FILES([Makefile c-src/Makefile c-examples/Makefile])
AC_OUTPUT
