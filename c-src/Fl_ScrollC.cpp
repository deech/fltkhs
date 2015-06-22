#include "Fl_ScrollC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,Fl_Scroll_set_scrollbar_size)(fl_Scroll widget,int size){
    (static_cast<Fl_Scroll*>(widget))->scrollbar_size(size);
  }
  FL_EXPORT_C(int,Fl_Scroll_get_scrollbar_size)(fl_Scroll widget){
    return (static_cast<Fl_Scroll*>(widget))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Scroll_clear)(fl_Scroll widget){
    (static_cast<Fl_Scroll*>(widget))->clear();
  }
  FL_EXPORT_C(void,Fl_Scroll_scroll_to)(fl_Scroll widget,int x,int y){
    (static_cast<Fl_Scroll*>(widget))->scroll_to(x,y);
  }
  FL_EXPORT_C(int,Fl_Scroll_yposition)(fl_Scroll widget){
    return (static_cast<Fl_Scroll*>(widget))->yposition();
  }
  FL_EXPORT_C(int,Fl_Scroll_xposition)(fl_Scroll widget){
    return (static_cast<Fl_Scroll*>(widget))->xposition();
  }
  FL_EXPORT_C(uchar,Fl_Scroll_type)(fl_Scroll widget){
    return (static_cast<Fl_Scroll*>(widget))->type();
  }
  FL_EXPORT_C(void,Fl_Scroll_set_type)(fl_Scroll widget,uchar t){
    (static_cast<Fl_Scroll*>(widget))->type(t);
  }
  FL_EXPORT_C(void,Fl_Scroll_resize)(fl_Scroll scroll,int X,int Y,int W,int H){
    (static_cast<Fl_Scroll*>(scroll))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(int,Fl_Scroll_handle)(fl_Scroll self,int event){
    return (static_cast<Fl_Scroll*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Scroll,Fl_Scroll_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Scroll* scroll = new Fl_Scroll(x,y,w,h,label);
    return (static_cast<fl_Scroll>(scroll));
  }
  FL_EXPORT_C(fl_Scroll,Fl_Scroll_New)(int x,int y,int w,int h){
    Fl_Scroll* scroll = new Fl_Scroll(x,y,w,h);
    return (static_cast<fl_Scroll>(scroll));
  }
#ifdef __cplusplus
}
#endif
