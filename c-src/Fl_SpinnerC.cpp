#include "Fl_SpinnerC.h"
#ifdef __cplusplus
EXPORT {
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
  FL_EXPORT_C(void,Fl_Spinner_resize)(fl_Spinner spinner,int X,int Y,int W,int H){
    (static_cast<Fl_Spinner*>(spinner))->resize(X,Y,W,H);
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
  FL_EXPORT_C(int,Fl_Spinner_handle)(fl_Spinner spinner,int event){
    return (static_cast<Fl_Spinner*>(spinner))->handle(event);
  }
  FL_EXPORT_C(fl_Spinner,Fl_Spinner_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Spinner* counter = new Fl_Spinner(x,y,w,h,label);
    return (fl_Spinner) counter;
  }
  FL_EXPORT_C(fl_Spinner,Fl_Spinner_New)(int x,int y,int w,int h){
    Fl_Spinner* counter = new Fl_Spinner(x,y,w,h);
    return (fl_Spinner) counter;
  }
#ifdef __cplusplus
}
#endif
