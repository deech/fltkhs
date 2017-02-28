#include "Fl_Menu_BarC.h"
#include "UtilsC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedMenu_Bar::Fl_DerivedMenu_Bar(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Menu_Bar(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedMenu_Bar::Fl_DerivedMenu_Bar(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Menu_Bar(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedMenu_Bar::~Fl_DerivedMenu_Bar(){
    free(overriddenFuncs);
  }
  void Fl_DerivedMenu_Bar::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Menu_Bar) this);
    }
    else {
      Fl_Menu_Bar::draw();
    }
  }

  void Fl_DerivedMenu_Bar::draw_super(){
    Fl_Menu_Bar::draw();
  }

  int Fl_DerivedMenu_Bar::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Menu_Bar) this,event);
    }
    else {
      i = Fl_Menu_Bar::handle(event);
    }
    return i;
  }
  int Fl_DerivedMenu_Bar::handle_super(int event){
    return Fl_Menu_Bar::handle(event);
  }

  void Fl_DerivedMenu_Bar::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Menu_Bar) this,x,y,w,h);
    }
    else {
      Fl_Menu_Bar::resize(x,y,w,h);
    }
  }

  void Fl_DerivedMenu_Bar::resize_super(int x, int y, int w, int h){
    Fl_Menu_Bar::resize(x,y,w,h);
  }
  void Fl_DerivedMenu_Bar::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Menu_Bar) this);
    }
    else {
      Fl_Menu_Bar::show();
    }
  }
  void Fl_DerivedMenu_Bar::show_super(){
    Fl_Menu_Bar::show();
  }

  void Fl_DerivedMenu_Bar::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Menu_Bar) this);
    }
    else {
      Fl_Menu_Bar::hide();
    }
  }
  void Fl_DerivedMenu_Bar::hide_super(){
    Fl_Menu_Bar::hide();
  }


#endif
  FL_EXPORT_C(void   , Fl_Menu_Bar_Destroy)(fl_Menu_Bar menu_bar){
    delete (static_cast<Fl_Menu_Bar*>(menu_bar));
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_draw)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_draw_super)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Menu_Bar_handle)(fl_Menu_Bar o, int event){
    return (static_cast<Fl_DerivedMenu_Bar*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Menu_Bar_handle_super)(fl_Menu_Bar o, int event){
    return (static_cast<Fl_DerivedMenu_Bar*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_resize)(fl_Menu_Bar o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_resize_super)(fl_Menu_Bar o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_show)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_show_super)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_hide)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_hide_super)(fl_Menu_Bar o){
    (static_cast<Fl_DerivedMenu_Bar*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Menu_Bar,    Fl_Menu_Bar_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedMenu_Bar* w = new Fl_DerivedMenu_Bar(X,Y,W,H,fs);
    return (fl_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Menu_Bar,    Fl_Menu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedMenu_Bar* w = new Fl_DerivedMenu_Bar(X,Y,W,H,label,fs);
    return (fl_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Menu_Bar,    Fl_OverriddenMenu_Bar_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedMenu_Bar* w = new Fl_DerivedMenu_Bar(X,Y,W,H,fs);
    return (fl_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Menu_Bar,    Fl_OverriddenMenu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedMenu_Bar* w = new Fl_DerivedMenu_Bar(X,Y,W,H,label,fs);
    return (fl_Menu_Bar)w;
  }
#ifdef __cplusplus
}
#endif
