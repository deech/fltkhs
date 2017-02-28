#include "Fl_Value_OutputC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedValue_Output::Fl_DerivedValue_Output(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Value_Output(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedValue_Output::Fl_DerivedValue_Output(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Value_Output(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedValue_Output::~Fl_DerivedValue_Output(){
    free(overriddenFuncs);
  }
  void Fl_DerivedValue_Output::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Value_Output) this);
    }
    else {
      Fl_Value_Output::draw();
    }
  }

  void Fl_DerivedValue_Output::draw_super(){
    Fl_Value_Output::draw();
  }

  int Fl_DerivedValue_Output::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Value_Output) this,event);
    }
    else {
      i = Fl_Value_Output::handle(event);
    }
    return i;
  }
  int Fl_DerivedValue_Output::handle_super(int event){
    return Fl_Value_Output::handle(event);
  }

  void Fl_DerivedValue_Output::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Value_Output) this,x,y,w,h);
    }
    else {
      Fl_Value_Output::resize(x,y,w,h);
    }
  }

  void Fl_DerivedValue_Output::resize_super(int x, int y, int w, int h){
    Fl_Value_Output::resize(x,y,w,h);
  }
  void Fl_DerivedValue_Output::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Value_Output) this);
    }
    else {
      Fl_Value_Output::show();
    }
  }
  void Fl_DerivedValue_Output::show_super(){
    Fl_Value_Output::show();
  }

  void Fl_DerivedValue_Output::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Value_Output) this);
    }
    else {
      Fl_Value_Output::hide();
    }
  }
  void Fl_DerivedValue_Output::hide_super(){
    Fl_Value_Output::hide();
  }


#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Value_Output_parent)(fl_Value_Output value_output){
    return (fl_Group) (static_cast<Fl_Value_Output*>(value_output))->parent();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_parent)(fl_Value_Output value_output,fl_Group grp){
    (static_cast<Fl_Value_Output*>(value_output))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Value_Output_type)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->type();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_type)(fl_Value_Output value_output,uchar t){
    (static_cast<Fl_Value_Output*>(value_output))->type(t);
  }

  FL_EXPORT_C(int,Fl_Value_Output_x)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->x();
  }
  FL_EXPORT_C(int,Fl_Value_Output_y)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->y();
  }
  FL_EXPORT_C(int,Fl_Value_Output_w)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->w();
  }
  FL_EXPORT_C(int,Fl_Value_Output_h)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->h();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_align)(fl_Value_Output value_output, Fl_Align alignment){
    (static_cast<Fl_Value_Output*>(value_output))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Value_Output_align)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Value_Output_box)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->box();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_box)(fl_Value_Output value_output,Fl_Boxtype new_box){
    (static_cast<Fl_Value_Output*>(value_output))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Output_color)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->color();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_color)(fl_Value_Output value_output,Fl_Color bg){
    (static_cast<Fl_Value_Output*>(value_output))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_color_with_bg_sel)(fl_Value_Output value_output,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Value_Output*>(value_output))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Output_selection_color)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_selection_color)(fl_Value_Output value_output,Fl_Color a){
    (static_cast<Fl_Value_Output*>(value_output))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Value_Output_label)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->label();
  }
  FL_EXPORT_C(void,Fl_Value_Output_copy_label)(fl_Value_Output value_output,const char* new_label){
    (static_cast<Fl_Value_Output*>(value_output))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_label)(fl_Value_Output value_output,const char* text){
    (static_cast<Fl_Value_Output*>(value_output))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Value_Output_labeltype)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_labeltype)(fl_Value_Output value_output,Fl_Labeltype a){
    (static_cast<Fl_Value_Output*>(value_output))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_labelcolor)(fl_Value_Output value_output,Fl_Color c){
    (static_cast<Fl_Value_Output*>(value_output))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Value_Output_labelcolor)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Value_Output_labelfont)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_labelfont)(fl_Value_Output value_output,Fl_Font c){
    (static_cast<Fl_Value_Output*>(value_output))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Value_Output_labelsize)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_labelsize)(fl_Value_Output value_output,Fl_Fontsize pix){
    (static_cast<Fl_Value_Output*>(value_output))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Output_image)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->image();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_image)(fl_Value_Output value_output,fl_Image pix){
    (static_cast<Fl_Value_Output*>(value_output))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Output_deimage)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->deimage();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_deimage)(fl_Value_Output value_output,fl_Image pix){
    (static_cast<Fl_Value_Output*>(value_output))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Value_Output_tooltip)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Value_Output_copy_tooltip)(fl_Value_Output value_output,const char* text){
    (static_cast<Fl_Value_Output*>(value_output))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_tooltip)(fl_Value_Output value_output,const char* text){
    (static_cast<Fl_Value_Output*>(value_output))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_callback_with_user_data)(fl_Value_Output value_output,fl_Callback* cb,void* p){
    Fl_Value_Output* castedButton = (static_cast<Fl_Value_Output*>(value_output));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_callback)(fl_Value_Output value_output,fl_Callback* cb){
    Fl_Value_Output* castedButton = (static_cast<Fl_Value_Output*>(value_output));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Value_Output_user_data)(fl_Value_Output value_output){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Value_Output*>(value_output))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Value_Output*>(value_output))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_user_data)(fl_Value_Output value_output,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Value_Output*>(value_output))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Value_Output*>(value_output))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Value_Output*>(value_output))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Value_Output_argument)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->argument();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_argument)(fl_Value_Output value_output,long v){
    (static_cast<Fl_Value_Output*>(value_output))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Value_Output_when)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->when();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_when)(fl_Value_Output value_output,uchar i){
    (static_cast<Fl_Value_Output*>(value_output))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Output_visible)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->visible();
  }
  FL_EXPORT_C(int,Fl_Value_Output_visible_r)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_visible)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->visible();
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_visible)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Output_active)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->active();
  }
  FL_EXPORT_C(int,Fl_Value_Output_active_r)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->active_r();
  }
  FL_EXPORT_C(void,Fl_Value_Output_activate)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->activate();
  }
  FL_EXPORT_C(void,Fl_Value_Output_deactivate)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Output_output)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_output)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_output)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Output_takesevents)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_changed)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->changed();
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_changed)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Value_Output_take_focus)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_visible_focus)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_visible_focus)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Output_modify_visible_focus)(fl_Value_Output value_output,int v){
    (static_cast<Fl_Value_Output*>(value_output))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Output_visible_focus)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Output_do_callback)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Value_Output_do_callback_with_widget_and_user_data)(fl_Value_Output value_output,fl_Widget w,long arg){
    (static_cast<Fl_Value_Output*>(value_output))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Value_Output_do_callback_with_widget_and_default_user_data)(fl_Value_Output value_output,fl_Widget w){
    (static_cast<Fl_Value_Output*>(value_output))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Output_contains)(fl_Value_Output value_output,fl_Widget w){
    return (static_cast<Fl_Value_Output*>(value_output))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Output_inside)(fl_Value_Output value_output,fl_Widget w){
    return (static_cast<Fl_Value_Output*>(value_output))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Value_Output_redraw)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->redraw();
  }
  FL_EXPORT_C(void,Fl_Value_Output_redraw_label)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Value_Output_damage)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->damage();
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_damage_with_bitmask)(fl_Value_Output value_output,uchar c){
    (static_cast<Fl_Value_Output*>(value_output))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Output_clear_damage)(fl_Value_Output value_output){
    (static_cast<Fl_Value_Output*>(value_output))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Value_Output_damage_with_text)(fl_Value_Output value_output,uchar c){
    (static_cast<Fl_Value_Output*>(value_output))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Output_damage_inside_widget)(fl_Value_Output value_output,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Value_Output*>(value_output))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Value_Output_draw_label_with_xywh_alignment)(fl_Value_Output value_output,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Value_Output*>(value_output))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Value_Output_measure_label)(fl_Value_Output value_output,int* ww,int* hh){
    (static_cast<Fl_Value_Output*>(value_output))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Value_Output_window)(fl_Value_Output value_output){
    return (fl_Window) (static_cast<Fl_Value_Output*>(value_output))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Value_Output_top_window)(fl_Value_Output value_output){
    return (fl_Window) (static_cast<Fl_Value_Output*>(value_output))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Value_Output_top_window_offset)(fl_Value_Output value_output, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Value_Output*>(value_output))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Value_Output_as_group)(fl_Value_Output value_output){
    return (fl_Group) (static_cast<Fl_Value_Output*>(value_output))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Value_Output_as_gl_window)(fl_Value_Output value_output){
    return (fl_Gl_Window) (static_cast<Fl_Value_Output*>(value_output))->as_gl_window();
  }
  /* Inherited from Fl_Valuator */

  FL_EXPORT_C(void,Fl_Value_Output_bounds)(fl_Value_Output value_output,double a,double b){
    (static_cast<Fl_Value_Output*>(value_output))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Value_Output_minimum)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->minimum();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_minimum)(fl_Value_Output value_output,double a){
    (static_cast<Fl_Value_Output*>(value_output))->minimum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_maximum)(fl_Value_Output value_output,double a){
    (static_cast<Fl_Value_Output*>(value_output))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Output_range)(fl_Value_Output value_output,double a,double b){
    (static_cast<Fl_Value_Output*>(value_output))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_step_with_a)(fl_Value_Output value_output,int a){
    (static_cast<Fl_Value_Output*>(value_output))->step(a);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_step_with_a_b)(fl_Value_Output value_output,double a,int b){
    (static_cast<Fl_Value_Output*>(value_output))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_step_with_s)(fl_Value_Output value_output,double s){
    (static_cast<Fl_Value_Output*>(value_output))->step(s);
  }
  FL_EXPORT_C(double,Fl_Value_Output_step)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->step();
  }
  FL_EXPORT_C(void,Fl_Value_Output_precision)(fl_Value_Output value_output, int p){
    (static_cast<Fl_Value_Output*>(value_output))->precision(p);
  }
  FL_EXPORT_C(double,Fl_Value_Output_value)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->value();
  }
  FL_EXPORT_C(int,Fl_Value_Output_set_value)(fl_Value_Output value_output,double v){
    return (static_cast<Fl_Value_Output*>(value_output))->value(v);
  }
  FL_EXPORT_C(double,Fl_Value_Output_round)(fl_Value_Output value_output,double v){
    return (static_cast<Fl_Value_Output*>(value_output))->round(v);
  }
  FL_EXPORT_C(double,Fl_Value_Output_clamp)(fl_Value_Output value_output,double v){
    return (static_cast<Fl_Value_Output*>(value_output))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Value_Output_increment)(fl_Value_Output value_output,double v,int n){
    return (static_cast<Fl_Value_Output*>(value_output))->increment(v,n);
  }
  FL_EXPORT_C(void,Fl_Value_Output_Destroy)(fl_Value_Output value_output){
    delete (static_cast<Fl_Value_Output*>(value_output));
  }
  FL_EXPORT_C(char,Fl_Value_Output_soft)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->soft();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_soft)(fl_Value_Output value_output,char s){
    (static_cast<Fl_Value_Output*>(value_output))->soft(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Value_Output_textfont)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->textfont();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_textfont)(fl_Value_Output value_output,int v){
    (static_cast<Fl_Value_Output*>(value_output))->textfont(v);
  }
  FL_EXPORT_C(int,Fl_Value_Output_textsize)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->textsize();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_textsize)(fl_Value_Output value_output,int v){
    (static_cast<Fl_Value_Output*>(value_output))->textsize(v);
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Output_textcolor)(fl_Value_Output value_output){
    return (static_cast<Fl_Value_Output*>(value_output))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Value_Output_set_textcolor)(fl_Value_Output value_output,int v){
    (static_cast<Fl_Value_Output*>(value_output))->textcolor(v);
  }
  FL_EXPORT_C(fl_Value_Output,    Fl_Value_Output_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedValue_Output* w = new Fl_DerivedValue_Output(X,Y,W,H,fs);
    return (fl_Value_Output)w;
  }
  FL_EXPORT_C(fl_Value_Output,    Fl_Value_Output_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedValue_Output* w = new Fl_DerivedValue_Output(X,Y,W,H,label,fs);
    return (fl_Value_Output)w;
  }
  FL_EXPORT_C(fl_Value_Output,    Fl_OverriddenValue_Output_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedValue_Output* w = new Fl_DerivedValue_Output(X,Y,W,H,fs);
    return (fl_Value_Output)w;
  }
  FL_EXPORT_C(fl_Value_Output,    Fl_OverriddenValue_Output_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedValue_Output* w = new Fl_DerivedValue_Output(X,Y,W,H,label,fs);
    return (fl_Value_Output)w;
  }
  FL_EXPORT_C(void, Fl_Value_Output_draw)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Value_Output_draw_super)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Value_Output_handle)(fl_Value_Output o, int event){
    return (static_cast<Fl_DerivedValue_Output*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Value_Output_handle_super)(fl_Value_Output o, int event){
    return (static_cast<Fl_DerivedValue_Output*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Value_Output_resize)(fl_Value_Output o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedValue_Output*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Value_Output_resize_super)(fl_Value_Output o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedValue_Output*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Value_Output_show)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Value_Output_show_super)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Value_Output_hide)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Value_Output_hide_super)(fl_Value_Output o){
    (static_cast<Fl_DerivedValue_Output*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
