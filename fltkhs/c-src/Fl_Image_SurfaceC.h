#ifndef __FL_IMAGE_SURFACE_C__
#define __FL_IMAGE_SURFACE_C__
#include "Fl_Types.h"
#include "Fl_EnumerationsC.h"
#if FL_API_VERSION >= 10400
#include "FL/platform_types.h"
#endif
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "Fl_ExportMacros.h"
#include "FL/Fl_Image_Surface.H"
EXPORT {
#endif
  FL_EXPORT_C_HEADER(fl_Image_Surface,Fl_Image_Surface_New,(int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Image_Surface_Destroy,(fl_Image_Surface image_surface));
  FL_EXPORT_C_HEADER(void        ,Fl_Image_Surface_set_current,(fl_Image_Surface image_surface));
  FL_EXPORT_C_HEADER(void        ,Fl_Image_Surface_draw,(fl_Image_Surface image_surface, fl_Widget widget, int x, int y));
  FL_EXPORT_C_HEADER(fl_RGB_Image,Fl_Image_Surface_image,(fl_Image_Surface image_surface));
#if FL_API_VERSION >= 10400
  FL_EXPORT_C_HEADER(void ,Fl_Image_Surface_get_origin,(fl_Image_Surface i, int* x, int* y));
  FL_EXPORT_C_HEADER(void ,Fl_Image_Surface_set_origin,(fl_Image_Surface i, int x, int y));
  FL_EXPORT_C_HEADER(int,Fl_Image_Surface_printable_rect,(fl_Image_Surface i, int* w, int* h));
  FL_EXPORT_C_HEADER(Fl_Offscreen,Fl_Image_Surface_offscreen,(fl_Image_Surface i));
  FL_EXPORT_C_HEADER(void, Fl_Image_Surface_rescale,(fl_Image_Surface i));
#endif
#ifdef __cplusplus
}
#endif
#endif /* __FL_IMAGE_SURFACE_C__ */
