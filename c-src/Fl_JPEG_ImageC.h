#ifndef __FL_JPEG_IMAGE_C__
#define __FL_JPEG_IMAGE_C__
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_JPEG_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_JPEG_Image, Fl_JPEG_Image_New_WithData)(const char* name, const unsigned char* data);
  FL_EXPORT_C(fl_JPEG_Image, Fl_JPEG_Image_New)(const char* filename);
#ifdef __cplusplus
}
#endif
#endif
