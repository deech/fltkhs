#include "Fl_DialC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedDial::Fl_DerivedDial(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Dial(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedDial::Fl_DerivedDial(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Dial(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedDial::~Fl_DerivedDial(){
    free(overriddenFuncs);
  }
  void Fl_DerivedDial::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Dial) this);
    }
    else {
      Fl_Dial::draw();
    }
  }

  void Fl_DerivedDial::draw_super(){
    Fl_Dial::draw();
  }

  int Fl_DerivedDial::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Dial) this,event);
    }
    else {
      i = Fl_Dial::handle(event);
    }
    return i;
  }
  int Fl_DerivedDial::handle_super(int event){
    return Fl_Dial::handle(event);
  }

  void Fl_DerivedDial::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Dial) this,x,y,w,h);
    }
    else {
      Fl_Dial::resize(x,y,w,h);
    }
  }

  void Fl_DerivedDial::resize_super(int x, int y, int w, int h){
    Fl_Dial::resize(x,y,w,h);
  }
  void Fl_DerivedDial::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Dial) this);
    }
    else {
      Fl_Dial::show();
    }
  }
  void Fl_DerivedDial::show_super(){
    Fl_Dial::show();
  }

  void Fl_DerivedDial::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Dial) this);
    }
    else {
      Fl_Dial::hide();
    }
  }
  void Fl_DerivedDial::hide_super(){
    Fl_Dial::hide();
  }
#endif
  FL_EXPORT_C(fl_Group,Fl_Dial_parent)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->parent();
  }
  FL_EXPORT_C(void,Fl_Dial_set_parent)(fl_Dial dial,fl_Group grp){
    (static_cast<Fl_Dial*>(dial))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Dial_type)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->type();
  }
  FL_EXPORT_C(void,Fl_Dial_set_type)(fl_Dial dial,uchar t){
    (static_cast<Fl_Dial*>(dial))->type(t);
  }
  FL_EXPORT_C(int,Fl_Dial_x)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->x();
  }
  FL_EXPORT_C(int,Fl_Dial_y)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->y();
  }
  FL_EXPORT_C(int,Fl_Dial_w)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->w();
  }
  FL_EXPORT_C(int,Fl_Dial_h)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->h();
  }
  FL_EXPORT_C(void,Fl_Dial_set_align)(fl_Dial dial,Fl_Align alignment){
    (static_cast<Fl_Dial*>(dial))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Dial_align)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Dial_box)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->box();
  }
  FL_EXPORT_C(void,Fl_Dial_set_box)(fl_Dial dial,Fl_Boxtype new_box){
    (static_cast<Fl_Dial*>(dial))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Dial_color)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->color();
  }
  FL_EXPORT_C(void,Fl_Dial_set_color)(fl_Dial dial,Fl_Color bg){
    (static_cast<Fl_Dial*>(dial))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Dial_set_color_with_bg_sel)(fl_Dial dial,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Dial*>(dial))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Dial_selection_color)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Dial_set_selection_color)(fl_Dial dial,Fl_Color a){
    (static_cast<Fl_Dial*>(dial))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Dial_label)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->label();
  }
  FL_EXPORT_C(void,Fl_Dial_copy_label)(fl_Dial dial,const char* new_label){
    (static_cast<Fl_Dial*>(dial))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Dial_set_label)(fl_Dial dial,const char* text){
    (static_cast<Fl_Dial*>(dial))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Dial_labeltype)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Dial_set_labeltype)(fl_Dial dial,Fl_Labeltype a){
    (static_cast<Fl_Dial*>(dial))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Dial_labelcolor)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Dial_set_labelcolor)(fl_Dial dial,Fl_Color c){
    (static_cast<Fl_Dial*>(dial))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Dial_labelfont)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Dial_set_labelfont)(fl_Dial dial,Fl_Font c){
    (static_cast<Fl_Dial*>(dial))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Dial_labelsize)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Dial_set_labelsize)(fl_Dial dial,Fl_Fontsize pix){
    (static_cast<Fl_Dial*>(dial))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Dial_image)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->image();
  }
  FL_EXPORT_C(void,Fl_Dial_set_image)(fl_Dial dial,fl_Image pix){
    (static_cast<Fl_Dial*>(dial))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Dial_deimage)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->deimage();
  }
  FL_EXPORT_C(void,Fl_Dial_set_deimage)(fl_Dial dial,fl_Image pix){
    (static_cast<Fl_Dial*>(dial))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Dial_tooltip)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Dial_copy_tooltip)(fl_Dial dial,const char* text){
    (static_cast<Fl_Dial*>(dial))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Dial_set_tooltip)(fl_Dial dial,const char* text){
    (static_cast<Fl_Dial*>(dial))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Dial_set_callback_with_user_data)(fl_Dial dial,fl_Callback* cb,void* p){
    Fl_Dial* castedDial = (static_cast<Fl_Dial*>(dial));
    new C_to_Fl_Callback(castedDial, cb, p);
  }
  FL_EXPORT_C(void,Fl_Dial_set_callback)(fl_Dial dial,fl_Callback* cb){
    Fl_Dial* castedDial = (static_cast<Fl_Dial*>(dial));
    new C_to_Fl_Callback(castedDial, cb);
  }
  FL_EXPORT_C(void*,Fl_Dial_user_data)(fl_Dial dial){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Dial*>(dial))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Dial*>(dial))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Dial_set_user_data)(fl_Dial dial,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Dial*>(dial))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Dial*>(dial))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Dial*>(dial))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Dial_argument)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->argument();
  }
  FL_EXPORT_C(void,Fl_Dial_set_argument)(fl_Dial dial,long v){
    (static_cast<Fl_Dial*>(dial))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Dial_when)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->when();
  }
  FL_EXPORT_C(void,Fl_Dial_set_when)(fl_Dial dial,uchar i){
    (static_cast<Fl_Dial*>(dial))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Dial_visible)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->visible();
  }
  FL_EXPORT_C(int,Fl_Dial_visible_r)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Dial_set_visible)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->visible();
  }
  FL_EXPORT_C(void,Fl_Dial_clear_visible)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Dial_active)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->active();
  }
  FL_EXPORT_C(int,Fl_Dial_active_r)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->active_r();
  }
  FL_EXPORT_C(void,Fl_Dial_activate)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->activate();
  }
  FL_EXPORT_C(void,Fl_Dial_deactivate)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Dial_output)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->output();
  }
  FL_EXPORT_C(void,Fl_Dial_set_output)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->output();
  }
  FL_EXPORT_C(void,Fl_Dial_clear_output)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Dial_takesevents)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Dial_set_changed)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->changed();
  }
  FL_EXPORT_C(void,Fl_Dial_clear_changed)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Dial_take_focus)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Dial_set_visible_focus)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Dial_clear_visible_focus)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Dial_modify_visible_focus)(fl_Dial dial,int v){
    (static_cast<Fl_Dial*>(dial))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Dial_visible_focus)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Dial_contains)(fl_Dial dial,fl_Widget w){
    return (static_cast<Fl_Dial*>(dial))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Dial_inside)(fl_Dial dial,fl_Widget w){
    return (static_cast<Fl_Dial*>(dial))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Dial_redraw)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->redraw();
  }
  FL_EXPORT_C(void,Fl_Dial_redraw_label)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Dial_damage)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->damage();
  }
  FL_EXPORT_C(void,Fl_Dial_clear_damage_with_bitmask)(fl_Dial dial,uchar c){
    (static_cast<Fl_Dial*>(dial))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Dial_clear_damage)(fl_Dial dial){
    (static_cast<Fl_Dial*>(dial))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Dial_damage_with_text)(fl_Dial dial,uchar c){
    (static_cast<Fl_Dial*>(dial))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Dial_damage_inside_widget)(fl_Dial dial,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Dial*>(dial))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Dial_draw_label_with_xywh_alignment)(fl_Dial dial,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Dial*>(dial))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Dial_measure_label)(fl_Dial dial,int* ww,int* hh){
    (static_cast<Fl_Dial*>(dial))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Dial_window)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Dial_top_window)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Dial_top_window_offset)(fl_Dial dial,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Dial*>(dial))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Dial_as_gl_window)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Dial_bounds)(fl_Dial dial,double a,double b){
    (static_cast<Fl_Dial*>(dial))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Dial_minimum)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->minimum();
  }
  FL_EXPORT_C(void,Fl_Dial_set_minimum)(fl_Dial dial,double a){
    (static_cast<Fl_Dial*>(dial))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Dial_maximum)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->maximum();
  }
  FL_EXPORT_C(void,Fl_Dial_set_maximum)(fl_Dial dial,double a){
    (static_cast<Fl_Dial*>(dial))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Dial_range)(fl_Dial dial,double a,double b){
    (static_cast<Fl_Dial*>(dial))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Dial_set_step)(fl_Dial dial,int a){
    (static_cast<Fl_Dial*>(dial))->step(a);
  }
  FL_EXPORT_C(void,Fl_Dial_set_step_with_a_b)(fl_Dial dial,double a,int b){
    (static_cast<Fl_Dial*>(dial))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Dial_step_with_s)(fl_Dial dial,double s){
    (static_cast<Fl_Dial*>(dial))->step(s);
  }
  FL_EXPORT_C(double,Fl_Dial_step)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->step();
  }
  FL_EXPORT_C(void,Fl_Dial_precision)(fl_Dial dial,int precision){
    (static_cast<Fl_Dial*>(dial))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Dial_value)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->value();
  }
  FL_EXPORT_C(int,Fl_Dial_set_value)(fl_Dial dial,double v){
    return (static_cast<Fl_Dial*>(dial))->value(v);
  }
  FL_EXPORT_C(int,Fl_Dial_format)(fl_Dial dial,char* format){
    return (static_cast<Fl_Dial*>(dial))->format(format);
  }
  FL_EXPORT_C(double,Fl_Dial_round)(fl_Dial dial,double v){
    return (static_cast<Fl_Dial*>(dial))->round(v);
  }
  FL_EXPORT_C(double,Fl_Dial_clamp)(fl_Dial dial,double v){
    return (static_cast<Fl_Dial*>(dial))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Dial_increment)(fl_Dial dial,double v,int n){
    return (static_cast<Fl_Dial*>(dial))->increment(v,n);
  }
  FL_EXPORT_C(fl_Fill_Dial,Fl_Fill_Dial_New)(int x,int y,int w,int h,const char* label){
    Fl_Fill_Dial* dial = new Fl_Fill_Dial(x,y,w,h,label);
    return (fl_Fill_Dial) dial;
  }
  FL_EXPORT_C(fl_Line_Dial,Fl_Line_Dial_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Line_Dial* dial = new Fl_Line_Dial(x,y,w,h,label);
    return (fl_Line_Dial) dial;
  }
  FL_EXPORT_C(fl_Line_Dial,Fl_Line_Dial_New)(int x,int y,int w,int h){
    Fl_Line_Dial* dial = new Fl_Line_Dial(x,y,w,h);
    return (fl_Line_Dial) dial;
  }
  FL_EXPORT_C(void,Fl_Dial_Destroy)(fl_Dial dial){
    delete (static_cast<Fl_Dial*>(dial));
  }
  FL_EXPORT_C(void,Fl_Dial_set_angle1)(fl_Dial dial,short a){
    (static_cast<Fl_Dial*>(dial))->angle1(a);
  }
  FL_EXPORT_C(void,Fl_Dial_set_angle2)(fl_Dial dial,short a){
    (static_cast<Fl_Dial*>(dial))->angle2(a);
  }
  FL_EXPORT_C(short,Fl_Dial_angle1)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->angle1();
  }
  FL_EXPORT_C(short,Fl_Dial_angle2)(fl_Dial dial){
    return (static_cast<Fl_Dial*>(dial))->angle2();
  }
  FL_EXPORT_C(void, Fl_Dial_draw)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Dial_draw_super)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Dial_handle)(fl_Dial o, int event){
    return (static_cast<Fl_DerivedDial*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Dial_handle_super)(fl_Dial o, int event){
    return (static_cast<Fl_DerivedDial*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Dial_resize)(fl_Dial o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedDial*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Dial_resize_super)(fl_Dial o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedDial*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Dial_show)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Dial_show_super)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Dial_hide)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Dial_hide_super)(fl_Dial o){
    (static_cast<Fl_DerivedDial*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Dial,    Fl_Dial_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedDial* w = new Fl_DerivedDial(X,Y,W,H,fs);
    return (fl_Dial)w;
  }
  FL_EXPORT_C(fl_Dial,    Fl_Dial_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedDial* w = new Fl_DerivedDial(X,Y,W,H,label,fs);
    return (fl_Dial)w;
  }
  FL_EXPORT_C(fl_Dial,    Fl_OverriddenDial_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedDial* w = new Fl_DerivedDial(X,Y,W,H,fs);
    return (fl_Dial)w;
  }
  FL_EXPORT_C(fl_Dial,    Fl_OverriddenDial_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedDial* w = new Fl_DerivedDial(X,Y,W,H,label,fs);
    return (fl_Dial)w;
  }
#ifdef __cplusplus
}
#endif
