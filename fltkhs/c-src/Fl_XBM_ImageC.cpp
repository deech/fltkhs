#include "Fl_XBM_ImageC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_XBM_Image,Fl_XBM_Image_New)(const char* filename){
    Fl_XBM_Image* image = new Fl_XBM_Image(filename);
    return (static_cast<fl_XBM_Image>(image));
  }
#ifdef __cplusplus
}
#endif
