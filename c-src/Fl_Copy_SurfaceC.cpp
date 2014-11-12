#include "Fl_Copy_SurfaceC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(const char*,Fl_Copy_Surface_class_name)(fl_Copy_Surface copy_surface){
    return (static_cast<Fl_Copy_Surface*>(copy_surface))->class_name();
  }
  FL_EXPORT_C(void,Fl_Copy_Surface_set_current)(fl_Copy_Surface copy_surface){
    (static_cast<Fl_Copy_Surface*>(copy_surface))->set_current();
  }
  FL_EXPORT_C(void,Fl_Copy_Surface_draw)(fl_Copy_Surface copy_surface,fl_Widget widget,int delta_x,int delta_y){
    (static_cast<Fl_Copy_Surface*>(copy_surface))->draw((static_cast<Fl_Widget*>(widget)),delta_x,delta_y);
  }
  FL_EXPORT_C(fl_Copy_Surface, Fl_Copy_Surface_New)(int w, int h) {
    Fl_Copy_Surface* s = new Fl_Copy_Surface(w,h);
    return (fl_Copy_Surface)s;
  }
  FL_EXPORT_C(void, Fl_Copy_Surface_Destroy)(fl_Copy_Surface copy_surface){
    delete (static_cast<Fl_Copy_Surface*>(copy_surface));
  }

#ifdef __cplusplus
}
#endif
