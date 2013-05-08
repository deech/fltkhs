#ifndef __FL_WINDOW_C__
#define __FL_WINDOW_C__
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
EXPORT {
#endif

  FL_EXPORT_C(void*,Fl_Window_New_WithTitle)(int x, int y, int w, int h, const char* title);
  FL_EXPORT_C(void*, Fl_Window_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void*, Fl_Window_show_with_args)(void* win, int argc, char** argv);
  
#ifdef __cplusplus
}
#endif

#endif /* __FL_WINDOW_C__ */
