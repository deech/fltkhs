#include "Fl_Value_InputC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedValue_Input::Fl_DerivedValue_Input(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Value_Input(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedValue_Input::Fl_DerivedValue_Input(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Value_Input(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedValue_Input::~Fl_DerivedValue_Input(){
    free(overriddenFuncs);
  }
  void Fl_DerivedValue_Input::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Value_Input) this);
    }
    else {
      Fl_Value_Input::draw();
    }
  }

  void Fl_DerivedValue_Input::draw_super(){
    Fl_Value_Input::draw();
  }

  int Fl_DerivedValue_Input::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Value_Input) this,event);
    }
    else {
      i = Fl_Value_Input::handle(event);
    }
    return i;
  }
  int Fl_DerivedValue_Input::handle_super(int event){
    return Fl_Value_Input::handle(event);
  }

  void Fl_DerivedValue_Input::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Value_Input) this,x,y,w,h);
    }
    else {
      Fl_Value_Input::resize(x,y,w,h);
    }
  }

  void Fl_DerivedValue_Input::resize_super(int x, int y, int w, int h){
    Fl_Value_Input::resize(x,y,w,h);
  }
  void Fl_DerivedValue_Input::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Value_Input) this);
    }
    else {
      Fl_Value_Input::show();
    }
  }
  void Fl_DerivedValue_Input::show_super(){
    Fl_Value_Input::show();
  }

  void Fl_DerivedValue_Input::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Value_Input) this);
    }
    else {
      Fl_Value_Input::hide();
    }
  }
  void Fl_DerivedValue_Input::hide_super(){
    Fl_Value_Input::hide();
  }


#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Value_Input_parent)(fl_Value_Input value_input){
    return (fl_Group) (static_cast<Fl_Value_Input*>(value_input))->parent();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_parent)(fl_Value_Input value_input,fl_Group grp){
    (static_cast<Fl_Value_Input*>(value_input))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Value_Input_type)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->type();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_type)(fl_Value_Input value_input,uchar t){
    (static_cast<Fl_Value_Input*>(value_input))->type(t);
  }

  FL_EXPORT_C(int,Fl_Value_Input_x)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->x();
  }
  FL_EXPORT_C(int,Fl_Value_Input_y)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->y();
  }
  FL_EXPORT_C(int,Fl_Value_Input_w)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->w();
  }
  FL_EXPORT_C(int,Fl_Value_Input_h)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->h();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_align)(fl_Value_Input value_input, Fl_Align alignment){
    (static_cast<Fl_Value_Input*>(value_input))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Value_Input_align)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Value_Input_box)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->box();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_box)(fl_Value_Input value_input,Fl_Boxtype new_box){
    (static_cast<Fl_Value_Input*>(value_input))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Input_color)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->color();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_color)(fl_Value_Input value_input,Fl_Color bg){
    (static_cast<Fl_Value_Input*>(value_input))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_color_with_bg_sel)(fl_Value_Input value_input,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Value_Input*>(value_input))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Input_selection_color)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_selection_color)(fl_Value_Input value_input,Fl_Color a){
    (static_cast<Fl_Value_Input*>(value_input))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Value_Input_label)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->label();
  }
  FL_EXPORT_C(void,Fl_Value_Input_copy_label)(fl_Value_Input value_input,const char* new_label){
    (static_cast<Fl_Value_Input*>(value_input))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_label)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Value_Input_labeltype)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labeltype)(fl_Value_Input value_input,Fl_Labeltype a){
    (static_cast<Fl_Value_Input*>(value_input))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelcolor)(fl_Value_Input value_input,Fl_Color c){
    (static_cast<Fl_Value_Input*>(value_input))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Value_Input_labelcolor)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Value_Input_labelfont)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelfont)(fl_Value_Input value_input,Fl_Font c){
    (static_cast<Fl_Value_Input*>(value_input))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Value_Input_labelsize)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelsize)(fl_Value_Input value_input,Fl_Fontsize pix){
    (static_cast<Fl_Value_Input*>(value_input))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Input_image)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->image();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_image)(fl_Value_Input value_input,fl_Image pix){
    (static_cast<Fl_Value_Input*>(value_input))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Input_deimage)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->deimage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_deimage)(fl_Value_Input value_input,fl_Image pix){
    (static_cast<Fl_Value_Input*>(value_input))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Value_Input_tooltip)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Value_Input_copy_tooltip)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_tooltip)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_callback_with_user_data)(fl_Value_Input value_input,fl_Callback* cb,void* p){
    Fl_Value_Input* castedButton = (static_cast<Fl_Value_Input*>(value_input));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_callback)(fl_Value_Input value_input,fl_Callback* cb){
    Fl_Value_Input* castedButton = (static_cast<Fl_Value_Input*>(value_input));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Value_Input_user_data)(fl_Value_Input value_input){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Value_Input*>(value_input))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Value_Input*>(value_input))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_user_data)(fl_Value_Input value_input,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Value_Input*>(value_input))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Value_Input*>(value_input))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Value_Input*>(value_input))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Value_Input_argument)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->argument();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_argument)(fl_Value_Input value_input,long v){
    (static_cast<Fl_Value_Input*>(value_input))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Value_Input_when)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->when();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_when)(fl_Value_Input value_input,uchar i){
    (static_cast<Fl_Value_Input*>(value_input))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_visible)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible();
  }
  FL_EXPORT_C(int,Fl_Value_Input_visible_r)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_visible)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->visible();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_visible)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_active)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->active();
  }
  FL_EXPORT_C(int,Fl_Value_Input_active_r)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->active_r();
  }
  FL_EXPORT_C(void,Fl_Value_Input_activate)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->activate();
  }
  FL_EXPORT_C(void,Fl_Value_Input_deactivate)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_output)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_output)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_output)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_takesevents)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_changed)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->changed();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_changed)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Value_Input_take_focus)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_visible_focus)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_visible_focus)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_modify_visible_focus)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_visible_focus)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback_with_widget_and_user_data)(fl_Value_Input value_input,fl_Widget w,long arg){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback_with_widget_and_default_user_data)(fl_Value_Input value_input,fl_Widget w){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Input_contains)(fl_Value_Input value_input,fl_Widget w){
    return (static_cast<Fl_Value_Input*>(value_input))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Input_inside)(fl_Value_Input value_input,fl_Widget w){
    return (static_cast<Fl_Value_Input*>(value_input))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Value_Input_redraw)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->redraw();
  }
  FL_EXPORT_C(void,Fl_Value_Input_redraw_label)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Value_Input_damage)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->damage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_damage_with_bitmask)(fl_Value_Input value_input,uchar c){
    (static_cast<Fl_Value_Input*>(value_input))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_damage)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_damage_with_text)(fl_Value_Input value_input,uchar c){
    (static_cast<Fl_Value_Input*>(value_input))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Input_damage_inside_widget)(fl_Value_Input value_input,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Value_Input*>(value_input))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Value_Input_draw_label_with_xywh_alignment)(fl_Value_Input value_input,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Value_Input*>(value_input))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Value_Input_measure_label)(fl_Value_Input value_input,int* ww,int* hh){
    (static_cast<Fl_Value_Input*>(value_input))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Value_Input_window)(fl_Value_Input value_input){
    return (fl_Window) (static_cast<Fl_Value_Input*>(value_input))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Value_Input_top_window)(fl_Value_Input value_input){
    return (fl_Window) (static_cast<Fl_Value_Input*>(value_input))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Value_Input_top_window_offset)(fl_Value_Input value_input, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Value_Input*>(value_input))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Value_Input_as_group)(fl_Value_Input value_input){
    return (fl_Group) (static_cast<Fl_Value_Input*>(value_input))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Value_Input_as_gl_window)(fl_Value_Input value_input){
    return (fl_Gl_Window) (static_cast<Fl_Value_Input*>(value_input))->as_gl_window();
  }
  /* Inherited from Fl_Valuator */

  FL_EXPORT_C(void,Fl_Value_Input_bounds)(fl_Value_Input value_input,double a,double b){
    (static_cast<Fl_Value_Input*>(value_input))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Value_Input_minimum)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->minimum();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_minimum)(fl_Value_Input value_input,double a){
    (static_cast<Fl_Value_Input*>(value_input))->minimum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_maximum)(fl_Value_Input value_input,double a){
    (static_cast<Fl_Value_Input*>(value_input))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_range)(fl_Value_Input value_input,double a,double b){
    (static_cast<Fl_Value_Input*>(value_input))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_a)(fl_Value_Input value_input,int a){
    (static_cast<Fl_Value_Input*>(value_input))->step(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_a_b)(fl_Value_Input value_input,double a,int b){
    (static_cast<Fl_Value_Input*>(value_input))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_s)(fl_Value_Input value_input,double s){
    (static_cast<Fl_Value_Input*>(value_input))->step(s);
  }
  FL_EXPORT_C(double,Fl_Value_Input_step)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->step();
  }
  FL_EXPORT_C(void,Fl_Value_Input_precision)(fl_Value_Input value_input, int p){
    (static_cast<Fl_Value_Input*>(value_input))->precision(p);
  }
  FL_EXPORT_C(double,Fl_Value_Input_value)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->value();
  }
  FL_EXPORT_C(int,Fl_Value_Input_set_value)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->value(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_round)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->round(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_clamp)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_increment)(fl_Value_Input value_input,double v,int n){
    return (static_cast<Fl_Value_Input*>(value_input))->increment(v,n);
  }
  FL_EXPORT_C(void,Fl_Value_Input_Destroy)(fl_Value_Input value_input){
    delete (static_cast<Fl_Value_Input*>(value_input));
  }
  FL_EXPORT_C(char,Fl_Value_Input_soft)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->soft();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_soft)(fl_Value_Input value_input,char s){
    (static_cast<Fl_Value_Input*>(value_input))->soft(s);
  }
  FL_EXPORT_C(int,Fl_Value_Input_shortcut)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_shortcut)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->shortcut(v);
  }
  FL_EXPORT_C(Fl_Font,Fl_Value_Input_textfont)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->textfont();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_textfont)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->textfont(v);
  }
  FL_EXPORT_C(int,Fl_Value_Input_textsize)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->textsize();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_textsize)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->textsize(v);
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Input_textcolor)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_textcolor)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->textcolor(v);
  }
  FL_EXPORT_C(fl_Value_Input,    Fl_Value_Input_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedValue_Input* w = new Fl_DerivedValue_Input(X,Y,W,H,fs);
    return (fl_Value_Input)w;
  }
  FL_EXPORT_C(fl_Value_Input,    Fl_Value_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedValue_Input* w = new Fl_DerivedValue_Input(X,Y,W,H,label,fs);
    return (fl_Value_Input)w;
  }
  FL_EXPORT_C(fl_Value_Input,    Fl_OverriddenValue_Input_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedValue_Input* w = new Fl_DerivedValue_Input(X,Y,W,H,fs);
    return (fl_Value_Input)w;
  }
  FL_EXPORT_C(fl_Value_Input,    Fl_OverriddenValue_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedValue_Input* w = new Fl_DerivedValue_Input(X,Y,W,H,label,fs);
    return (fl_Value_Input)w;
  }
  FL_EXPORT_C(void, Fl_Value_Input_draw)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Value_Input_draw_super)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Value_Input_handle)(fl_Value_Input o, int event){
    return (static_cast<Fl_DerivedValue_Input*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Value_Input_handle_super)(fl_Value_Input o, int event){
    return (static_cast<Fl_DerivedValue_Input*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Value_Input_resize)(fl_Value_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedValue_Input*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Value_Input_resize_super)(fl_Value_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedValue_Input*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Value_Input_show)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Value_Input_show_super)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Value_Input_hide)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Value_Input_hide_super)(fl_Value_Input o){
    (static_cast<Fl_DerivedValue_Input*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
