#ifndef __FL_WINDOW_C__
#define __FL_WINDOW_C__
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void*, Fl_Window_fullscreen)(void* win);
  FL_EXPORT_C(void*, Fl_Window_fullscreen_off)(void* win);
  FL_EXPORT_C(void*, Fl_Window_fullscreen_off_with_resize)(void* win,int X,int Y,int W,int H);
  FL_EXPORT_C(void*, Fl_Window_New_WithTitle)(int x, int y, const char* title);
  FL_EXPORT_C(void*, Fl_Window_New)(int x, int y);
  FL_EXPORT_C(void*,Fl_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title);
  FL_EXPORT_C(void*, Fl_Window_NewWH)(int x, int y, int w, int h);
  FL_EXPORT_C(void*, Fl_Window_hide)(void* win);
  FL_EXPORT_C(void*, Fl_Window_show)(void* win);
  FL_EXPORT_C(void*, Fl_Window_show_with_args)(void* win, int argc, char** argv);
  FL_EXPORT_C(void*, Fl_Window_destroy)(void* win);
  FL_EXPORT_C(void*, Fl_Window_resize)(void* win, int X, int Y, int W, int H);
  FL_EXPORT_C(void*, Fl_Window_iconize)(void* win);
#ifdef __cplusplus
}
#endif

#endif /* __FL_WINDOW_C__ */
