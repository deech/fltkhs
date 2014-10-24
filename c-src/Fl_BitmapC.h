#ifndef __FL_BITMAP_C__
#define __FL_BITMAP_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Bitmap.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(void*, Fl_Bitmap_other_data)(fl_Bitmap bitmap);
  FL_EXPORT_C(void, Fl_Bitmap_set_other_data)(fl_Bitmap bitmap, void* v);
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_New)(const char* bits, int H, int D);
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_New_WithUchar)(const uchar* bits, int H, int D);
  FL_EXPORT_C(void, Fl_Bitmap_Destroy)(fl_Bitmap bitmap);
  FL_EXPORT_C(int, Fl_Bitmap_w)(fl_Bitmap bitmap);
  FL_EXPORT_C(int, Fl_Bitmap_h)(fl_Bitmap bitmap);
  FL_EXPORT_C(int, Fl_Bitmap_d)(fl_Bitmap bitmap);
  FL_EXPORT_C(int, Fl_Bitmap_ld)(fl_Bitmap bitmap);
  FL_EXPORT_C(int, Fl_Bitmap_count)(fl_Bitmap bitmap);
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_copy_with_w_h)(fl_Bitmap bitmap,int W, int H);
  FL_EXPORT_C(fl_Bitmap, Fl_Bitmap_copy)(fl_Bitmap bitmap);
  FL_EXPORT_C(void, Fl_Bitmap_color_average)(fl_Bitmap bitmap,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_Bitmap_inactive)(fl_Bitmap bitmap);
  FL_EXPORT_C(void, Fl_Bitmap_desaturate)(fl_Bitmap bitmap);
  FL_EXPORT_C(void, Fl_Bitmap_label)(fl_Bitmap bitmap,fl_Widget w);
  FL_EXPORT_C(void, Fl_Bitmap_label_with_menu_item)(fl_Bitmap bitmap,fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Bitmap_draw_with_cx_cy)(fl_Bitmap bitmap,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_Bitmap_draw_with_cx)(fl_Bitmap bitmap,int X, int Y, int W, int H, int cx);
  FL_EXPORT_C(void, Fl_Bitmap_draw_with_cy)(fl_Bitmap bitmap,int X, int Y, int W, int H, int cy);
  FL_EXPORT_C(void, Fl_Bitmap_draw_with)(fl_Bitmap bitmap,int X,int Y,int W,int H);
  FL_EXPORT_C(void, Fl_Bitmap_draw)(fl_Bitmap bitmap,int X, int Y);
  FL_EXPORT_C(void, Fl_Bitmap_uncache)(fl_Bitmap bitmap);
#ifdef __cplusplus
}
#endif
#endif /* __FL_BITMAP_C__ */
