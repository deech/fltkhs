#include "Fl_ScrollC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedScroll::Fl_DerivedScroll(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Scroll(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedScroll::Fl_DerivedScroll(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Scroll(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedScroll::~Fl_DerivedScroll(){
    free(overriddenFuncs);
  }
  void Fl_DerivedScroll::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Scroll) this);
    }
    else {
      Fl_Scroll::draw();
    }
  }

  void Fl_DerivedScroll::draw_super(){
    Fl_Scroll::draw();
  }

  int Fl_DerivedScroll::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Scroll) this,event);
    }
    else {
      i = Fl_Scroll::handle(event);
    }
    return i;
  }
  int Fl_DerivedScroll::handle_super(int event){
    return Fl_Scroll::handle(event);
  }

  void Fl_DerivedScroll::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Scroll) this,x,y,w,h);
    }
    else {
      Fl_Scroll::resize(x,y,w,h);
    }
  }

  void Fl_DerivedScroll::resize_super(int x, int y, int w, int h){
    Fl_Scroll::resize(x,y,w,h);
  }
  void Fl_DerivedScroll::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Scroll) this);
    }
    else {
      Fl_Scroll::show();
    }
  }
  void Fl_DerivedScroll::show_super(){
    Fl_Scroll::show();
  }

  void Fl_DerivedScroll::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Scroll) this);
    }
    else {
      Fl_Scroll::hide();
    }
  }
  void Fl_DerivedScroll::hide_super(){
    Fl_Scroll::hide();
  }
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
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedScroll* w = new Fl_DerivedScroll(X,Y,W,H,fs);
    return (fl_Scroll)w;
  }
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedScroll* w = new Fl_DerivedScroll(X,Y,W,H,label,fs);
    return (fl_Scroll)w;
  }
  FL_EXPORT_C(fl_Scroll,    Fl_OverriddenScroll_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedScroll* w = new Fl_DerivedScroll(X,Y,W,H,fs);
    return (fl_Scroll)w;
  }
  FL_EXPORT_C(fl_Scroll,    Fl_OverriddenScroll_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedScroll* w = new Fl_DerivedScroll(X,Y,W,H,label,fs);
    return (fl_Scroll)w;
  }
  FL_EXPORT_C(void, Fl_Scroll_draw)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Scroll_draw_super)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Scroll_handle)(fl_Scroll o, int event){
    return (static_cast<Fl_DerivedScroll*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Scroll_handle_super)(fl_Scroll o, int event){
    return (static_cast<Fl_DerivedScroll*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Scroll_resize)(fl_Scroll o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedScroll*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Scroll_resize_super)(fl_Scroll o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedScroll*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Scroll_show)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Scroll_show_super)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Scroll_hide)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Scroll_hide_super)(fl_Scroll o){
    (static_cast<Fl_DerivedScroll*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
