#ifndef __FL_SVG_IMAGE_C__
#define __FL_SVG_IMAGE_C__
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_SVG_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C_HEADER(fl_SVG_Image,Fl_SVG_Image_New_WithData,(const char* name, const char* data));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_Destroy,(fl_PNM_Image image));
  FL_EXPORT_C_HEADER(fl_SVG_Image,Fl_SVG_Image_copy_with_w_h,(fl_SVG_Image image,int W, int H));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_color_average,(fl_SVG_Image image,Fl_Color c, float i));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_desaturate,(fl_SVG_Image image));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_draw_with_cx_cy,(fl_SVG_Image image,int X, int Y, int W, int H, int cx, int cy));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_draw_with_cx,(fl_SVG_Image image,int X, int Y, int W, int H, int cx));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_draw_with_cy,(fl_SVG_Image image,int X, int Y, int W, int H, int cy));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_draw_with,(fl_Image image,int X,int Y,int W,int H));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_draw,(fl_SVG_Image image,int X, int Y));
  FL_EXPORT_C_HEADER(void,Fl_SVG_Image_resize,(fl_SVG_Image image,int width, int height));
#ifdef __cplusplus
}
#endif
#endif
