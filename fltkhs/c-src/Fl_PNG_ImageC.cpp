#include "Fl_PNG_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_PNG_Image,Fl_PNG_Image_New_WithData)(const char* name, const unsigned char* data, int datasize){
    Fl_PNG_Image* image = new Fl_PNG_Image(name, data, datasize);
    return (static_cast<fl_PNG_Image>(image));
  }
  FL_EXPORT_C(fl_PNG_Image,Fl_PNG_Image_New)(const char* filename){
    Fl_PNG_Image* image = new Fl_PNG_Image(filename);
    return (static_cast<fl_PNG_Image>(image));
  }
#ifdef __cplusplus
}
#endif
