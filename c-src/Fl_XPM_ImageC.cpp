#include "Fl_XPM_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_XPM_Image,Fl_XPM_Image_New)(const char* filename){
    Fl_XPM_Image* image = new Fl_XPM_Image(filename);
    return (static_cast<fl_XPM_Image>(image));
  }
#ifdef __cplusplus
}
#endif
