#include "Fl_SpinnerC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedSpinner::Fl_DerivedSpinner(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Spinner(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSpinner::Fl_DerivedSpinner(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Spinner(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSpinner::~Fl_DerivedSpinner(){
    free(overriddenFuncs);
  }
  void Fl_DerivedSpinner::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Spinner) this);
    }
    else {
      Fl_Spinner::draw();
    }
  }

  void Fl_DerivedSpinner::draw_super(){
    Fl_Spinner::draw();
  }

  int Fl_DerivedSpinner::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Spinner) this,event);
    }
    else {
      i = Fl_Spinner::handle(event);
    }
    return i;
  }
  int Fl_DerivedSpinner::handle_super(int event){
    return Fl_Spinner::handle(event);
  }

  void Fl_DerivedSpinner::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Spinner) this,x,y,w,h);
    }
    else {
      Fl_Spinner::resize(x,y,w,h);
    }
  }

  void Fl_DerivedSpinner::resize_super(int x, int y, int w, int h){
    Fl_Spinner::resize(x,y,w,h);
  }
  void Fl_DerivedSpinner::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Spinner) this);
    }
    else {
      Fl_Spinner::show();
    }
  }
  void Fl_DerivedSpinner::show_super(){
    Fl_Spinner::show();
  }

  void Fl_DerivedSpinner::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Spinner) this);
    }
    else {
      Fl_Spinner::hide();
    }
  }
  void Fl_DerivedSpinner::hide_super(){
    Fl_Spinner::hide();
  }
#endif
  FL_EXPORT_C(Fl_Color,Fl_Spinner_color)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->color();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_color)(fl_Spinner spinner,Fl_Color bg){
    (static_cast<Fl_Spinner*>(spinner))->color(bg);
  }
  FL_EXPORT_C(Fl_Color,Fl_Spinner_selection_color)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_selection_color)(fl_Spinner spinner,Fl_Color a){
    (static_cast<Fl_Spinner*>(spinner))->selection_color(a);
  }
  FL_EXPORT_C(uchar,Fl_Spinner_type)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->type();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_type)(fl_Spinner spinner,uchar t){
    (static_cast<Fl_Spinner*>(spinner))->type(t);
  }
  FL_EXPORT_C(double,Fl_Spinner_minimum)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->minimum();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_minimum)(fl_Spinner spinner,double a){
    (static_cast<Fl_Spinner*>(spinner))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Spinner_maximum)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->maximum();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_maximum)(fl_Spinner spinner,double a){
    (static_cast<Fl_Spinner*>(spinner))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Spinner_range)(fl_Spinner spinner,double a,double b){
    (static_cast<Fl_Spinner*>(spinner))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Spinner_set_step)(fl_Spinner spinner,double s){
    (static_cast<Fl_Spinner*>(spinner))->step(s);
  }
  FL_EXPORT_C(double,Fl_Spinner_step)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->step();
  }
  FL_EXPORT_C(double,Fl_Spinner_value)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->value();
  }
  FL_EXPORT_C(void ,Fl_Spinner_set_value)(fl_Spinner spinner,double v){
    return (static_cast<Fl_Spinner*>(spinner))->value(v);
  }
  FL_EXPORT_C(const char*,Fl_Spinner_format)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->format();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_format)(fl_Spinner spinner,const char* format){
    (static_cast<Fl_Spinner*>(spinner))->format(format);
  }
  FL_EXPORT_C(void,Fl_Spinner_set_textfont)(fl_Spinner spinner,Fl_Font text){
    (static_cast<Fl_Spinner*>(spinner))->textfont(text);
  }
  FL_EXPORT_C(Fl_Font,Fl_Spinner_textfont)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->textfont();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_textsize)(fl_Spinner spinner,Fl_Fontsize text){
    (static_cast<Fl_Spinner*>(spinner))->textsize(text);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Spinner_textsize)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->textsize();
  }
  FL_EXPORT_C(void,Fl_Spinner_set_textcolor)(fl_Spinner spinner,Fl_Color text){
    (static_cast<Fl_Spinner*>(spinner))->textcolor(text);
  }
  FL_EXPORT_C(Fl_Color,Fl_Spinner_textcolor)(fl_Spinner spinner){
    return (static_cast<Fl_Spinner*>(spinner))->textcolor();
  }
  FL_EXPORT_C(fl_Spinner,    Fl_Spinner_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSpinner* w = new Fl_DerivedSpinner(X,Y,W,H,fs);
    return (fl_Spinner)w;
  }
  FL_EXPORT_C(fl_Spinner,    Fl_Spinner_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSpinner* w = new Fl_DerivedSpinner(X,Y,W,H,label,fs);
    return (fl_Spinner)w;
  }
  FL_EXPORT_C(fl_Spinner,    Fl_OverriddenSpinner_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSpinner* w = new Fl_DerivedSpinner(X,Y,W,H,fs);
    return (fl_Spinner)w;
  }
  FL_EXPORT_C(fl_Spinner,    Fl_OverriddenSpinner_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSpinner* w = new Fl_DerivedSpinner(X,Y,W,H,label,fs);
    return (fl_Spinner)w;
  }
  FL_EXPORT_C(void, Fl_Spinner_draw)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Spinner_draw_super)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Spinner_handle)(fl_Spinner o, int event){
    return (static_cast<Fl_DerivedSpinner*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Spinner_handle_super)(fl_Spinner o, int event){
    return (static_cast<Fl_DerivedSpinner*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Spinner_resize)(fl_Spinner o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSpinner*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Spinner_resize_super)(fl_Spinner o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSpinner*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Spinner_show)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Spinner_show_super)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Spinner_hide)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Spinner_hide_super)(fl_Spinner o){
    (static_cast<Fl_DerivedSpinner*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
