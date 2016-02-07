#ifndef __FL_RGB_IMAGE_C__
#define __FL_RGB_IMAGE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  #include <stdlib.h>
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New)(uchar* bits, int W, int H);
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_D)(uchar* bits, int W, int H, int D);
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_LD)(uchar* bits, int W, int H, int LD);
  FL_EXPORT_C(fl_RGB_Image, Fl_RGB_Image_New_With_D_LD)(uchar* bits, int W, int H, int D, int LD);
  FL_EXPORT_C(void, Fl_RGB_Image_Destroy)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(int, Fl_RGB_Image_w)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(int, Fl_RGB_Image_h)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(int, Fl_RGB_Image_d)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(int, Fl_RGB_Image_ld)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(int, Fl_RGB_Image_count)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(fl_Image, Fl_RGB_Image_copy_with_w_h)(fl_RGB_Image rgb_image,int W, int H);
  FL_EXPORT_C(fl_Image, Fl_RGB_Image_copy)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(void, Fl_RGB_Image_color_average)(fl_RGB_Image rgb_image,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_RGB_Image_inactive)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(void, Fl_RGB_Image_desaturate)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(void, Fl_RGB_Image_label)(fl_RGB_Image rgb_image,fl_Widget w);
  FL_EXPORT_C(void, Fl_RGB_Image_label_with_menu_item)(fl_RGB_Image rgb_image,fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_RGB_Image_draw_with_cx_cy)(fl_RGB_Image rgb_image,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_RGB_Image_draw_with_cx)(fl_RGB_Image rgb_image,int X, int Y, int W, int H, int cx);
  FL_EXPORT_C(void, Fl_RGB_Image_draw_with_cy)(fl_RGB_Image rgb_image,int X, int Y, int W, int H, int cy);
  FL_EXPORT_C(void, Fl_RGB_Image_draw_with)(fl_RGB_Image rgb_image,int X, int Y, int W, int H);
  FL_EXPORT_C(void, Fl_RGB_Image_draw)(fl_RGB_Image rgb_image,int X, int Y);
  FL_EXPORT_C(void, Fl_RGB_Image_uncache)(fl_RGB_Image rgb_image);
  FL_EXPORT_C(void, Fl_RGB_Image_set_max_size)(size_t size);
  FL_EXPORT_C(size_t, Fl_RGB_Image_max_size)();
#ifdef __cplusplus
}
#endif
#endif /* __FL_RGB_IMAGE_C__ */
