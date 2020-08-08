#include "Fl_JPEG_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_JPEG_Image,Fl_JPEG_Image_New_WithData)(const char* name, const unsigned char* data){
    Fl_JPEG_Image* image = new Fl_JPEG_Image(name, data);
    return (static_cast<fl_JPEG_Image>(image));
  }
  FL_EXPORT_C(fl_JPEG_Image,Fl_JPEG_Image_New)(const char* filename){
    Fl_JPEG_Image* image = new Fl_JPEG_Image(filename);
    return (static_cast<fl_JPEG_Image>(image));
  }
#ifdef __cplusplus
}
#endif
