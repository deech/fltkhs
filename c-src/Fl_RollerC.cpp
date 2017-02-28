#include "Fl_RollerC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedRoller::Fl_DerivedRoller(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Roller(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedRoller::Fl_DerivedRoller(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Roller(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedRoller::~Fl_DerivedRoller(){
    free(overriddenFuncs);
  }
  void Fl_DerivedRoller::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Roller) this);
    }
    else {
      Fl_Roller::draw();
    }
  }

  void Fl_DerivedRoller::draw_super(){
    Fl_Roller::draw();
  }

  int Fl_DerivedRoller::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Roller) this,event);
    }
    else {
      i = Fl_Roller::handle(event);
    }
    return i;
  }
  int Fl_DerivedRoller::handle_super(int event){
    return Fl_Roller::handle(event);
  }

  void Fl_DerivedRoller::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Roller) this,x,y,w,h);
    }
    else {
      Fl_Roller::resize(x,y,w,h);
    }
  }

  void Fl_DerivedRoller::resize_super(int x, int y, int w, int h){
    Fl_Roller::resize(x,y,w,h);
  }
  void Fl_DerivedRoller::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Roller) this);
    }
    else {
      Fl_Roller::show();
    }
  }
  void Fl_DerivedRoller::show_super(){
    Fl_Roller::show();
  }

  void Fl_DerivedRoller::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Roller) this);
    }
    else {
      Fl_Roller::hide();
    }
  }
  void Fl_DerivedRoller::hide_super(){
    Fl_Roller::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Roller_parent)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->parent();
  }
  FL_EXPORT_C(void,Fl_Roller_set_parent)(fl_Roller roller,fl_Group grp){
    (static_cast<Fl_Roller*>(roller))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Roller_type)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->type();
  }
  FL_EXPORT_C(void,Fl_Roller_set_type)(fl_Roller roller,uchar t){
    (static_cast<Fl_Roller*>(roller))->type(t);
  }
  FL_EXPORT_C(int,Fl_Roller_x)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->x();
  }
  FL_EXPORT_C(int,Fl_Roller_y)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->y();
  }
  FL_EXPORT_C(int,Fl_Roller_w)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->w();
  }
  FL_EXPORT_C(int,Fl_Roller_h)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->h();
  }
  FL_EXPORT_C(void,Fl_Roller_set_align)(fl_Roller roller,Fl_Align alignment){
    (static_cast<Fl_Roller*>(roller))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Roller_align)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Roller_box)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->box();
  }
  FL_EXPORT_C(void,Fl_Roller_set_box)(fl_Roller roller,Fl_Boxtype new_box){
    (static_cast<Fl_Roller*>(roller))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Roller_color)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->color();
  }
  FL_EXPORT_C(void,Fl_Roller_set_color)(fl_Roller roller,Fl_Color bg){
    (static_cast<Fl_Roller*>(roller))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Roller_set_color_with_bg_sel)(fl_Roller roller,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Roller*>(roller))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Roller_selection_color)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Roller_set_selection_color)(fl_Roller roller,Fl_Color a){
    (static_cast<Fl_Roller*>(roller))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Roller_label)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->label();
  }
  FL_EXPORT_C(void,Fl_Roller_copy_label)(fl_Roller roller,const char* new_label){
    (static_cast<Fl_Roller*>(roller))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Roller_set_label)(fl_Roller roller,const char* text){
    (static_cast<Fl_Roller*>(roller))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Roller_labeltype)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Roller_set_labeltype)(fl_Roller roller,Fl_Labeltype a){
    (static_cast<Fl_Roller*>(roller))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Roller_labelcolor)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Roller_set_labelcolor)(fl_Roller roller,Fl_Color c){
    (static_cast<Fl_Roller*>(roller))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Roller_labelfont)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Roller_set_labelfont)(fl_Roller roller,Fl_Font c){
    (static_cast<Fl_Roller*>(roller))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Roller_labelsize)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Roller_set_labelsize)(fl_Roller roller,Fl_Fontsize pix){
    (static_cast<Fl_Roller*>(roller))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Roller_image)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->image();
  }
  FL_EXPORT_C(void,Fl_Roller_set_image)(fl_Roller roller,fl_Image pix){
    (static_cast<Fl_Roller*>(roller))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Roller_deimage)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->deimage();
  }
  FL_EXPORT_C(void,Fl_Roller_set_deimage)(fl_Roller roller,fl_Image pix){
    (static_cast<Fl_Roller*>(roller))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Roller_tooltip)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Roller_copy_tooltip)(fl_Roller roller,const char* text){
    (static_cast<Fl_Roller*>(roller))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Roller_set_tooltip)(fl_Roller roller,const char* text){
    (static_cast<Fl_Roller*>(roller))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Roller_set_callback_with_user_data)(fl_Roller roller,fl_Callback* cb,void* p){
    Fl_Roller* castedRoller = (static_cast<Fl_Roller*>(roller));
    new C_to_Fl_Callback(castedRoller, cb, p);
  }
  FL_EXPORT_C(void,Fl_Roller_set_callback)(fl_Roller roller,fl_Callback* cb){
    Fl_Roller* castedRoller = (static_cast<Fl_Roller*>(roller));
    new C_to_Fl_Callback(castedRoller, cb);
  }
  FL_EXPORT_C(void*,Fl_Roller_user_data)(fl_Roller roller){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Roller*>(roller))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Roller*>(roller))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Roller_set_user_data)(fl_Roller roller,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Roller*>(roller))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Roller*>(roller))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Roller*>(roller))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Roller_argument)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->argument();
  }
  FL_EXPORT_C(void,Fl_Roller_set_argument)(fl_Roller roller,long v){
    (static_cast<Fl_Roller*>(roller))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Roller_when)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->when();
  }
  FL_EXPORT_C(void,Fl_Roller_set_when)(fl_Roller roller,uchar i){
    (static_cast<Fl_Roller*>(roller))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Roller_visible)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->visible();
  }
  FL_EXPORT_C(int,Fl_Roller_visible_r)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Roller_set_visible)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->visible();
  }
  FL_EXPORT_C(void,Fl_Roller_clear_visible)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Roller_active)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->active();
  }
  FL_EXPORT_C(int,Fl_Roller_active_r)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->active_r();
  }
  FL_EXPORT_C(void,Fl_Roller_activate)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->activate();
  }
  FL_EXPORT_C(void,Fl_Roller_deactivate)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Roller_output)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->output();
  }
  FL_EXPORT_C(void,Fl_Roller_set_output)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->output();
  }
  FL_EXPORT_C(void,Fl_Roller_clear_output)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Roller_takesevents)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Roller_set_changed)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->changed();
  }
  FL_EXPORT_C(void,Fl_Roller_clear_changed)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Roller_take_focus)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Roller_set_visible_focus)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Roller_clear_visible_focus)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Roller_modify_visible_focus)(fl_Roller roller,int v){
    (static_cast<Fl_Roller*>(roller))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Roller_visible_focus)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Roller_contains)(fl_Roller roller,fl_Widget w){
    return (static_cast<Fl_Roller*>(roller))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Roller_inside)(fl_Roller roller,fl_Widget w){
    return (static_cast<Fl_Roller*>(roller))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Roller_redraw)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->redraw();
  }
  FL_EXPORT_C(void,Fl_Roller_redraw_label)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Roller_damage)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->damage();
  }
  FL_EXPORT_C(void,Fl_Roller_clear_damage_with_bitmask)(fl_Roller roller,uchar c){
    (static_cast<Fl_Roller*>(roller))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Roller_clear_damage)(fl_Roller roller){
    (static_cast<Fl_Roller*>(roller))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Roller_damage_with_text)(fl_Roller roller,uchar c){
    (static_cast<Fl_Roller*>(roller))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Roller_damage_inside_widget)(fl_Roller roller,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Roller*>(roller))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Roller_draw_label_with_xywh_alignment)(fl_Roller roller,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Roller*>(roller))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Roller_measure_label)(fl_Roller roller,int* ww,int* hh){
    (static_cast<Fl_Roller*>(roller))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Roller_window)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Roller_top_window)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Roller_top_window_offset)(fl_Roller roller,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Roller*>(roller))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Roller_as_gl_window)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Roller_bounds)(fl_Roller roller,double a,double b){
    (static_cast<Fl_Roller*>(roller))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Roller_minimum)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->minimum();
  }
  FL_EXPORT_C(void,Fl_Roller_set_minimum)(fl_Roller roller,double a){
    (static_cast<Fl_Roller*>(roller))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Roller_maximum)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->maximum();
  }
  FL_EXPORT_C(void,Fl_Roller_set_maximum)(fl_Roller roller,double a){
    (static_cast<Fl_Roller*>(roller))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Roller_range)(fl_Roller roller,double a,double b){
    (static_cast<Fl_Roller*>(roller))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Roller_set_step)(fl_Roller roller,int a){
    (static_cast<Fl_Roller*>(roller))->step(a);
  }
  FL_EXPORT_C(void,Fl_Roller_set_step_with_a_b)(fl_Roller roller,double a,int b){
    (static_cast<Fl_Roller*>(roller))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Roller_step_with_s)(fl_Roller roller,double s){
    (static_cast<Fl_Roller*>(roller))->step(s);
  }
  FL_EXPORT_C(double,Fl_Roller_step)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->step();
  }
  FL_EXPORT_C(void,Fl_Roller_precision)(fl_Roller roller,int precision){
    (static_cast<Fl_Roller*>(roller))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Roller_value)(fl_Roller roller){
    return (static_cast<Fl_Roller*>(roller))->value();
  }
  FL_EXPORT_C(int,Fl_Roller_set_value)(fl_Roller roller,double v){
    return (static_cast<Fl_Roller*>(roller))->value(v);
  }
  FL_EXPORT_C(int,Fl_Roller_format)(fl_Roller roller,char* format){
    return (static_cast<Fl_Roller*>(roller))->format(format);
  }
  FL_EXPORT_C(double,Fl_Roller_round)(fl_Roller roller,double v){
    return (static_cast<Fl_Roller*>(roller))->round(v);
  }
  FL_EXPORT_C(double,Fl_Roller_clamp)(fl_Roller roller,double v){
    return (static_cast<Fl_Roller*>(roller))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Roller_increment)(fl_Roller roller,double v,int n){
    return (static_cast<Fl_Roller*>(roller))->increment(v,n);
  }
  FL_EXPORT_C(void,Fl_Roller_Destroy)(fl_Roller roller){
    delete (static_cast<Fl_Roller*>(roller));
  }
  FL_EXPORT_C(fl_Roller,    Fl_Roller_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedRoller* w = new Fl_DerivedRoller(X,Y,W,H,fs);
    return (fl_Roller)w;
  }
  FL_EXPORT_C(fl_Roller,    Fl_Roller_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedRoller* w = new Fl_DerivedRoller(X,Y,W,H,label,fs);
    return (fl_Roller)w;
  }
  FL_EXPORT_C(fl_Roller,    Fl_OverriddenRoller_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedRoller* w = new Fl_DerivedRoller(X,Y,W,H,fs);
    return (fl_Roller)w;
  }
  FL_EXPORT_C(fl_Roller,    Fl_OverriddenRoller_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedRoller* w = new Fl_DerivedRoller(X,Y,W,H,label,fs);
    return (fl_Roller)w;
  }
  FL_EXPORT_C(void, Fl_Roller_draw)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Roller_draw_super)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Roller_handle)(fl_Roller o, int event){
    return (static_cast<Fl_DerivedRoller*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Roller_handle_super)(fl_Roller o, int event){
    return (static_cast<Fl_DerivedRoller*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Roller_resize)(fl_Roller o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedRoller*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Roller_resize_super)(fl_Roller o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedRoller*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Roller_show)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Roller_show_super)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Roller_hide)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Roller_hide_super)(fl_Roller o){
    (static_cast<Fl_DerivedRoller*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
