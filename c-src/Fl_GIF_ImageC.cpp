#include "Fl_GIF_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_GIF_Image,Fl_GIF_Image_New)(const char* filename){
    Fl_GIF_Image* image = new Fl_GIF_Image(filename);
    return (static_cast<fl_GIF_Image>(image));
  }
#ifdef __cplusplus
}
#endif
