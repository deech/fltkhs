#ifndef __FL_IMAGE_C__
#define __FL_IMAGE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_PNM_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_PNM_Image, Fl_PNM_Image_New)(const char* filename);
  FL_EXPORT_C(void, Fl_PNM_Image_Destroy)(fl_PNM_Image image);
  FL_EXPORT_C(int, Fl_PNM_Image_w)(fl_PNM_Image image);
  FL_EXPORT_C(int, Fl_PNM_Image_h)(fl_PNM_Image image);
  FL_EXPORT_C(int, Fl_PNM_Image_d)(fl_PNM_Image image);
  FL_EXPORT_C(int, Fl_PNM_Image_ld)(fl_PNM_Image image);
  FL_EXPORT_C(int, Fl_PNM_Image_count)(fl_PNM_Image image);
  FL_EXPORT_C(fl_PNM_Image, Fl_PNM_Image_copy_with_w_h)(fl_PNM_Image image,int W, int H);
  FL_EXPORT_C(fl_PNM_Image, Fl_PNM_Image_copy)(fl_PNM_Image image);
  FL_EXPORT_C(void, Fl_PNM_Image_color_average)(fl_PNM_Image image,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_PNM_Image_inactive)(fl_PNM_Image image);
  FL_EXPORT_C(void, Fl_PNM_Image_desaturate)(fl_PNM_Image image);
  FL_EXPORT_C(void, Fl_PNM_Image_label)(fl_PNM_Image image,fl_Widget w);
  FL_EXPORT_C(void, Fl_PNM_Image_label_with_menu_item)(fl_PNM_Image image,fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_PNM_Image_draw_with_cx_cy)(fl_PNM_Image image,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_PNM_Image_draw_with_cx)(fl_PNM_Image image,int X, int Y, int W, int H, int cx);
  FL_EXPORT_C(void, Fl_PNM_Image_draw_with_cy)(fl_PNM_Image image,int X, int Y, int W, int H, int cy);
  FL_EXPORT_C(void, Fl_PNM_Image_draw)(fl_PNM_Image image,int X, int Y);
  FL_EXPORT_C(void, Fl_PNM_Image_uncache)(fl_PNM_Image image);
#ifdef __cplusplus
}
#endif
#endif /* __FL_xxx_C__ */
