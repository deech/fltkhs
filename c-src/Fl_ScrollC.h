#ifndef __FL_SCROLL_C__
#define __FL_SCROLL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Scrollbar is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Scroll.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(void,        Fl_Scroll_set_scrollbar_size)(fl_Scroll widget, int size);
  FL_EXPORT_C(int,         Fl_Scroll_get_scrollbar_size)(fl_Scroll widget);
  FL_EXPORT_C(void,        Fl_Scroll_clear)(fl_Scroll widget);
  FL_EXPORT_C(void,        Fl_Scroll_scroll_to)(fl_Scroll widget, int x, int y);
  FL_EXPORT_C(int,         Fl_Scroll_yposition)(fl_Scroll widget);
  FL_EXPORT_C(int,         Fl_Scroll_xposition)(fl_Scroll widget);
  FL_EXPORT_C(uchar,        Fl_Scroll_type)(fl_Scroll widget);
  FL_EXPORT_C(void,         Fl_Scroll_set_type)(fl_Scroll widget, uchar t);
  FL_EXPORT_C(void,         Fl_Scroll_resize)(fl_Scroll scroll,int X, int Y, int W, int H);
  FL_EXPORT_C(int,Fl_Scroll_handle)(fl_Scroll scroll, int event);
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New)(int x, int y, int w, int h);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SCROLL_C__ */
