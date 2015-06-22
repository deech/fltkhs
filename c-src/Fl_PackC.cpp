#include "Fl_PackC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void ,Fl_Pack_set_spacing)(fl_Pack self, int pixels){
    (static_cast<Fl_Pack*>(self))->spacing(pixels);
  }
  FL_EXPORT_C(int,Fl_Pack_get_spacing)(fl_Pack self){
    return (static_cast<Fl_Pack*>(self))->spacing();
  }
  FL_EXPORT_C(uchar, Fl_Pack_horizontal)(fl_Pack self){
    return (static_cast<Fl_Pack*>(self))->horizontal();
  }
  FL_EXPORT_C(fl_Pack, Fl_Pack_New)(int x, int y, int w, int h){
    Fl_Pack* g = new Fl_Pack(x,y,w,h);
    return (fl_Pack)g;
  }
  FL_EXPORT_C(fl_Pack, Fl_Pack_New_WithLabel)(int x, int y, int w, int h, const char* t){
    Fl_Pack* g = new Fl_Pack(x,y,w,h,t);
    return (fl_Pack)g;
  }
  FL_EXPORT_C(uchar,Fl_Pack_type)(fl_Pack win){
    return (static_cast<Fl_Pack*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Pack_set_type)(fl_Pack win,uchar t){
    (static_cast<Fl_Pack*>(win))->type(t);
  }

#ifdef __cplusplus
}
#endif
