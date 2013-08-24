#ifndef __FL_SHARED_IMAGE_C__
#define __FL_SHARED_IMAGE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "DerivedShared_Image.h"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(int, Fl_Shared_Image_w)(fl_Shared_Image shared_image);
  FL_EXPORT_C(int, Fl_Shared_Image_h)(fl_Shared_Image shared_image);
  FL_EXPORT_C(int, Fl_Shared_Image_d)(fl_Shared_Image shared_image);
  FL_EXPORT_C(int, Fl_Shared_Image_ld)(fl_Shared_Image shared_image);
  FL_EXPORT_C(int, Fl_Shared_Image_count)(fl_Shared_Image shared_image);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_copy_with_w_h)(fl_Shared_Image shared_image,int W, int H);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_copy)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_color_average)(fl_Shared_Image shared_image,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_Shared_Image_inactive)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_desaturate)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_label)(fl_Shared_Image shared_image,fl_Widget w);
  FL_EXPORT_C(void, Fl_Shared_Image_label_with_menu_item)(fl_Shared_Image shared_image,fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Shared_Image_uncache)(fl_Shared_Image shared_image);
  FL_EXPORT_C(const char*, Fl_Shared_Image_name)(fl_Shared_Image shared_image);
  FL_EXPORT_C(int, Fl_Shared_Image_refcount)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_release)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_reload)(fl_Shared_Image shared_image);
  FL_EXPORT_C(fl_Image, Fl_Shared_Image_copy_with_WH)(fl_Shared_Image shared_image,int W, int H);
  FL_EXPORT_C(fl_Image, Fl_Shared_Image_copy)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_color_average)(fl_Shared_Image shared_image,Fl_Color c, float i);
  FL_EXPORT_C(void, Fl_Shared_Image_desaturate)(fl_Shared_Image shared_image);
  FL_EXPORT_C(void, Fl_Shared_Image_draw_with_XYWHcxcy)(fl_Shared_Image shared_image,int X, int Y, int W, int H, int cx, int cy);
  FL_EXPORT_C(void, Fl_Shared_Image_draw)(fl_Shared_Image shared_image,int X, int Y);
  FL_EXPORT_C(void, Fl_Shared_Image_uncache)(fl_Shared_Image shared_image);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_find)(const char* n);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_find_W)(const char* n, int H);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_find_H)(const char* n, int H); /* int W = 0, */
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_find_WH)(const char* n, int W, int H);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_get)(const char* n);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_get_W)(const char* n, int H);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_get_H)(const char* n, int H);
  FL_EXPORT_C(fl_Shared_Image, Fl_Shared_Image_get_WH)(const char* n, int W, int H);
  FL_EXPORT_C(fl_Shared_Image*, Fl_Shared_Image_images)();
  FL_EXPORT_C(int, Fl_Shared_Image_num_images)();
  FL_EXPORT_C(void, Fl_Shared_Image_add_handler)(fl_Shared_Image_Handler f);
  FL_EXPORT_C(void, Fl_Shared_Image_remove_handler)(fl_Shared_Image_Handler f);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SHARED_IMAGE_C__ */
