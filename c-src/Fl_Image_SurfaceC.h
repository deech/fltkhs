#ifndef __FL_IMAGE_SURFACE_C__
#define __FL_IMAGE_SURFACE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "FL/Fl_Image_Surface.H"
EXPORT {
#endif
  FL_EXPORT_C(const char* ,Fl_Image_Surface_class_name)(fl_Image_Surface image_surface);
  FL_EXPORT_C(void        ,Fl_Image_Surface_set_current)(fl_Image_Surface image_surface);
  FL_EXPORT_C(void        ,Fl_Image_Surface_draw)(fl_Image_Surface image_surface, fl_Widget widget, int x, int y);
  FL_EXPORT_C(fl_Image_Surface, Fl_Image_Surface_New)(int w, int h);
  FL_EXPORT_C(void, Fl_Image_Surface_Destroy)(fl_Image_Surface image_surface);
  FL_EXPORT_C(fl_Image, Fl_Image_Surface_image)(fl_Image_Surface image_surface);
#ifdef __cplusplus
}
#endif
#endif /* __FL_IMAGE_SURFACE_C__ */
