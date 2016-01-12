#ifndef __FL_PNG_IMAGE_C__
#define __FL_PNG_IMAGE_C__
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_PNG_Image.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_PNG_Image, Fl_PNG_Image_New_WithData)(const char* name, const unsigned char* data, int datasize);
  FL_EXPORT_C(fl_PNG_Image, Fl_PNG_Image_New)(const char* filename);
#ifdef __cplusplus
}
#endif
#endif
