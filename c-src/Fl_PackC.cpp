#include "Fl_PackC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedPack::Fl_DerivedPack(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Pack(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedPack::Fl_DerivedPack(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Pack(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedPack::~Fl_DerivedPack(){
    free(overriddenFuncs);
  }
  void Fl_DerivedPack::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Pack) this);
    }
    else {
      Fl_Pack::draw();
    }
  }

  void Fl_DerivedPack::draw_super(){
    Fl_Pack::draw();
  }

  int Fl_DerivedPack::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Pack) this,event);
    }
    else {
      i = Fl_Pack::handle(event);
    }
    return i;
  }
  int Fl_DerivedPack::handle_super(int event){
    return Fl_Pack::handle(event);
  }

  void Fl_DerivedPack::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Pack) this,x,y,w,h);
    }
    else {
      Fl_Pack::resize(x,y,w,h);
    }
  }

  void Fl_DerivedPack::resize_super(int x, int y, int w, int h){
    Fl_Pack::resize(x,y,w,h);
  }
  void Fl_DerivedPack::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Pack) this);
    }
    else {
      Fl_Pack::show();
    }
  }
  void Fl_DerivedPack::show_super(){
    Fl_Pack::show();
  }

  void Fl_DerivedPack::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Pack) this);
    }
    else {
      Fl_Pack::hide();
    }
  }
  void Fl_DerivedPack::hide_super(){
    Fl_Pack::hide();
  }


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
  FL_EXPORT_C(uchar,Fl_Pack_type)(fl_Pack win){
    return (static_cast<Fl_Pack*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Pack_set_type)(fl_Pack win,uchar t){
    (static_cast<Fl_Pack*>(win))->type(t);
  }
  FL_EXPORT_C(fl_Pack,    Fl_Pack_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedPack* w = new Fl_DerivedPack(X,Y,W,H,fs);
    return (fl_Pack)w;
  }
  FL_EXPORT_C(fl_Pack,    Fl_Pack_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedPack* w = new Fl_DerivedPack(X,Y,W,H,label,fs);
    return (fl_Pack)w;
  }
  FL_EXPORT_C(fl_Pack,    Fl_OverriddenPack_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedPack* w = new Fl_DerivedPack(X,Y,W,H,fs);
    return (fl_Pack)w;
  }
  FL_EXPORT_C(fl_Pack,    Fl_OverriddenPack_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedPack* w = new Fl_DerivedPack(X,Y,W,H,label,fs);
    return (fl_Pack)w;
  }
  FL_EXPORT_C(void, Fl_Pack_draw)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Pack_draw_super)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Pack_handle)(fl_Pack o, int event){
    return (static_cast<Fl_DerivedPack*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Pack_handle_super)(fl_Pack o, int event){
    return (static_cast<Fl_DerivedPack*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Pack_resize)(fl_Pack o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedPack*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Pack_resize_super)(fl_Pack o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedPack*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Pack_show)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Pack_show_super)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Pack_hide)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Pack_hide_super)(fl_Pack o){
    (static_cast<Fl_DerivedPack*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
