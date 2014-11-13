#ifndef __FL_PIXMAP_C__
#define __FL_PIXMAP_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Pixmap.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Pixmap, Fl_Pixmap_New)(char** bits);
  FL_EXPORT_C(fl_Pixmap, Fl_Pixmap_New_With_UChar)(uchar** bits);
  FL_EXPORT_C(void, Fl_Pixmap_Destroy)(fl_Pixmap pixmap);
  FL_EXPORT_C(int, Fl_Pixmap_w)(fl_Pixmap pixmap);
  FL_EXPORT_C(int, Fl_Pixmap_h)(fl_Pixmap pixmap);
  FL_EXPORT_C(int, Fl_Pixmap_d)(fl_Pixmap pixmap);
  FL_EXPORT_C(int, Fl_Pixmap_ld)(fl_Pixmap pixmap);
  FL_EXPORT_C(int, Fl_Pixmap_count)(fl_Pixmap pixmap);
  FL_EXPORT_C(fl_Image, Fl_Pixmap_copy_with_w_h)(fl_Pixmap pixmap,int w, int h);
  FL_EXPORT_C(fl_Image, Fl_Pixmap_copy)(fl_Pixmap pixmap);
  FL_EXPORT_C(void, Fl_Pixmap_color_average)(fl_Pixmap pixmap,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_Pixmap_inactive)(fl_Pixmap pixmap);
  FL_EXPORT_C(void, Fl_Pixmap_desaturate)(fl_Pixmap pixmap);
  FL_EXPORT_C(void, Fl_Pixmap_label)(fl_Pixmap pixmap,fl_Widget w);
  FL_EXPORT_C(void, Fl_Pixmap_label_with_menu_item)(fl_Pixmap pixmap,fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Pixmap_draw_with_cx_cy)(fl_Pixmap pixmap,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_Pixmap_draw_with_cx)(fl_Pixmap pixmap,int X, int Y, int W, int H, int cx);
  FL_EXPORT_C(void, Fl_Pixmap_draw_with_cy)(fl_Pixmap pixmap,int X, int Y, int W, int H, int cy);
  FL_EXPORT_C(void, Fl_Pixmap_draw_with)(fl_Pixmap pixmap,int X, int Y, int W, int H);
  FL_EXPORT_C(void, Fl_Pixmap_draw)(fl_Pixmap pixmap,int X, int Y);
  FL_EXPORT_C(void, Fl_Pixmap_uncache)(fl_Pixmap pixmap);
#ifdef __cplusplus
}
#endif
#endif /* __FL_PIXMAP_C__ */
