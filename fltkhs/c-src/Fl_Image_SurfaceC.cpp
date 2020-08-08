#include "Fl_Image_SurfaceC.h"
#ifdef __cplusplus
EXPORT {
#endif
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
#if FL_API_VERSION >= 10400
  FL_EXPORT_C(void ,Fl_Image_Surface_get_origin)(fl_Image_Surface i, int* x, int* y){
    (static_cast<Fl_Image_Surface*>(i))->origin(*x,*y);
  }
  FL_EXPORT_C(void ,Fl_Image_Surface_set_origin)(fl_Image_Surface i, int x, int y){
    (static_cast<Fl_Image_Surface*>(i))->origin(x,y);
  }
  FL_EXPORT_C(int,Fl_Image_Surface_printable_rect)(fl_Image_Surface i, int* w, int* h){
    return (static_cast<Fl_Image_Surface*>(i))->printable_rect(w, h);
  }
  FL_EXPORT_C(Fl_Offscreen,Fl_Image_Surface_offscreen)(fl_Image_Surface i){
    return (static_cast<Fl_Image_Surface*>(i))->offscreen();
  }
  FL_EXPORT_C(void, Fl_Image_Surface_rescale)(fl_Image_Surface i){
    Fl_Image_Surface* s = static_cast<Fl_Image_Surface*>(i);
    s->rescale();
  }
#endif

#ifdef __cplusplus
}
#endif
