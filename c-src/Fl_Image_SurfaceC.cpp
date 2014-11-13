#include "Fl_Image_SurfaceC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(const char*,Fl_Image_Surface_class_name)(fl_Image_Surface image_surface){
    return (static_cast<Fl_Image_Surface*>(image_surface))->class_name();
  }
  FL_EXPORT_C(void,Fl_Image_Surface_set_current)(fl_Image_Surface image_surface){
    (static_cast<Fl_Image_Surface*>(image_surface))->set_current();
  }
  FL_EXPORT_C(void,Fl_Image_Surface_draw)(fl_Image_Surface image_surface,fl_Widget widget,int delta_x,int delta_y){
    (static_cast<Fl_Image_Surface*>(image_surface))->draw((static_cast<Fl_Widget*>(widget)),delta_x,delta_y);
  }
  FL_EXPORT_C(fl_Image_Surface, Fl_Image_Surface_New)(int w, int h) {
    Fl_Image_Surface* s = new Fl_Image_Surface(w,h);
    return (fl_Image_Surface)s;
  }
  FL_EXPORT_C(void, Fl_Image_Surface_Destroy)(fl_Image_Surface image_surface){
    delete (static_cast<Fl_Image_Surface*>(image_surface));
  }
  FL_EXPORT_C(fl_RGB_Image, Fl_Image_Surface_image)(fl_Image_Surface image_surface) {
    return (fl_RGB_Image)(static_cast<Fl_Image_Surface*>(image_surface))->image();
  }
#ifdef __cplusplus
}
#endif
