#include "Fl_BMP_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_BMP_Image,Fl_BMP_Image_New)(const char* filename){
    Fl_BMP_Image* image = new Fl_BMP_Image(filename);
    return (static_cast<fl_BMP_Image>(image));
  }
#ifdef __cplusplus
}
#endif
