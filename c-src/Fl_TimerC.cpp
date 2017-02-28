#include "Fl_TimerC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedTimer::Fl_DerivedTimer(uchar t,int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Timer(t,X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedTimer::~Fl_DerivedTimer(){
    free(overriddenFuncs);
  }
  void Fl_DerivedTimer::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Timer) this);
    }
    else {
      Fl_Timer::draw();
    }
  }

  void Fl_DerivedTimer::draw_super(){
    Fl_Timer::draw();
  }

  int Fl_DerivedTimer::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Timer) this,event);
    }
    else {
      i = Fl_Timer::handle(event);
    }
    return i;
  }
  int Fl_DerivedTimer::handle_super(int event){
    return Fl_Timer::handle(event);
  }

  void Fl_DerivedTimer::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Timer) this,x,y,w,h);
    }
    else {
      Fl_Timer::resize(x,y,w,h);
    }
  }

  void Fl_DerivedTimer::resize_super(int x, int y, int w, int h){
    Fl_Timer::resize(x,y,w,h);
  }
  void Fl_DerivedTimer::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Timer) this);
    }
    else {
      Fl_Timer::show();
    }
  }
  void Fl_DerivedTimer::show_super(){
    Fl_Timer::show();
  }

  void Fl_DerivedTimer::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Timer) this);
    }
    else {
      Fl_Timer::hide();
    }
  }
  void Fl_DerivedTimer::hide_super(){
    Fl_Timer::hide();
  }
#endif
  FL_EXPORT_C(fl_Group,Fl_Timer_parent)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->parent();
  }
  FL_EXPORT_C(void,Fl_Timer_set_parent)(fl_Timer adjuster,fl_Group grp){
    (static_cast<Fl_Timer*>(adjuster))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Timer_type)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->type();
  }
  FL_EXPORT_C(void,Fl_Timer_set_type)(fl_Timer adjuster,uchar t){
    (static_cast<Fl_Timer*>(adjuster))->type(t);
  }
  FL_EXPORT_C(int,Fl_Timer_x)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->x();
  }
  FL_EXPORT_C(int,Fl_Timer_y)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->y();
  }
  FL_EXPORT_C(int,Fl_Timer_w)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->w();
  }
  FL_EXPORT_C(int,Fl_Timer_h)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->h();
  }
  FL_EXPORT_C(void,Fl_Timer_set_align)(fl_Timer adjuster,Fl_Align alignment){
    (static_cast<Fl_Timer*>(adjuster))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Timer_align)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Timer_box)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->box();
  }
  FL_EXPORT_C(void,Fl_Timer_set_box)(fl_Timer adjuster,Fl_Boxtype new_box){
    (static_cast<Fl_Timer*>(adjuster))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Timer_color)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->color();
  }
  FL_EXPORT_C(void,Fl_Timer_set_color)(fl_Timer adjuster,Fl_Color bg){
    (static_cast<Fl_Timer*>(adjuster))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Timer_set_color_with_bg_sel)(fl_Timer adjuster,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Timer*>(adjuster))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Timer_selection_color)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Timer_set_selection_color)(fl_Timer adjuster,Fl_Color a){
    (static_cast<Fl_Timer*>(adjuster))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Timer_label)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->label();
  }
  FL_EXPORT_C(void,Fl_Timer_copy_label)(fl_Timer adjuster,const char* new_label){
    (static_cast<Fl_Timer*>(adjuster))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Timer_set_label)(fl_Timer adjuster,const char* text){
    (static_cast<Fl_Timer*>(adjuster))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Timer_labeltype)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Timer_set_labeltype)(fl_Timer adjuster,Fl_Labeltype a){
    (static_cast<Fl_Timer*>(adjuster))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Timer_labelcolor)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Timer_set_labelcolor)(fl_Timer adjuster,Fl_Color c){
    (static_cast<Fl_Timer*>(adjuster))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Timer_labelfont)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Timer_set_labelfont)(fl_Timer adjuster,Fl_Font c){
    (static_cast<Fl_Timer*>(adjuster))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Timer_labelsize)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Timer_set_labelsize)(fl_Timer adjuster,Fl_Fontsize pix){
    (static_cast<Fl_Timer*>(adjuster))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Timer_image)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->image();
  }
  FL_EXPORT_C(void,Fl_Timer_set_image)(fl_Timer adjuster,fl_Image pix){
    (static_cast<Fl_Timer*>(adjuster))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Timer_deimage)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->deimage();
  }
  FL_EXPORT_C(void,Fl_Timer_set_deimage)(fl_Timer adjuster,fl_Image pix){
    (static_cast<Fl_Timer*>(adjuster))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Timer_tooltip)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Timer_copy_tooltip)(fl_Timer adjuster,const char* text){
    (static_cast<Fl_Timer*>(adjuster))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Timer_set_tooltip)(fl_Timer adjuster,const char* text){
    (static_cast<Fl_Timer*>(adjuster))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Timer_set_callback_with_user_data)(fl_Timer adjuster,fl_Callback* cb,void* p){
    Fl_Timer* castedTimer = (static_cast<Fl_Timer*>(adjuster));
    new C_to_Fl_Callback(castedTimer, cb, p);
  }
  FL_EXPORT_C(void,Fl_Timer_set_callback)(fl_Timer adjuster,fl_Callback* cb){
    Fl_Timer* castedTimer = (static_cast<Fl_Timer*>(adjuster));
    new C_to_Fl_Callback(castedTimer, cb);
  }
  FL_EXPORT_C(void*,Fl_Timer_user_data)(fl_Timer adjuster){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Timer*>(adjuster))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Timer*>(adjuster))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Timer_set_user_data)(fl_Timer adjuster,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Timer*>(adjuster))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Timer*>(adjuster))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Timer*>(adjuster))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Timer_argument)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->argument();
  }
  FL_EXPORT_C(void,Fl_Timer_set_argument)(fl_Timer adjuster,long v){
    (static_cast<Fl_Timer*>(adjuster))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Timer_when)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->when();
  }
  FL_EXPORT_C(void,Fl_Timer_set_when)(fl_Timer adjuster,uchar i){
    (static_cast<Fl_Timer*>(adjuster))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Timer_visible)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->visible();
  }
  FL_EXPORT_C(int,Fl_Timer_visible_r)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Timer_set_visible)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->visible();
  }
  FL_EXPORT_C(void,Fl_Timer_clear_visible)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Timer_active)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->active();
  }
  FL_EXPORT_C(int,Fl_Timer_active_r)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->active_r();
  }
  FL_EXPORT_C(void,Fl_Timer_activate)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->activate();
  }
  FL_EXPORT_C(void,Fl_Timer_deactivate)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Timer_output)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->output();
  }
  FL_EXPORT_C(void,Fl_Timer_set_output)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->output();
  }
  FL_EXPORT_C(void,Fl_Timer_clear_output)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Timer_takesevents)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Timer_set_changed)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->changed();
  }
  FL_EXPORT_C(void,Fl_Timer_clear_changed)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Timer_take_focus)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Timer_set_visible_focus)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Timer_clear_visible_focus)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Timer_modify_visible_focus)(fl_Timer adjuster,int v){
    (static_cast<Fl_Timer*>(adjuster))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Timer_visible_focus)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Timer_contains)(fl_Timer adjuster,fl_Widget w){
    return (static_cast<Fl_Timer*>(adjuster))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Timer_inside)(fl_Timer adjuster,fl_Widget w){
    return (static_cast<Fl_Timer*>(adjuster))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Timer_redraw)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->redraw();
  }
  FL_EXPORT_C(void,Fl_Timer_redraw_label)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Timer_damage)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->damage();
  }
  FL_EXPORT_C(void,Fl_Timer_clear_damage_with_bitmask)(fl_Timer adjuster,uchar c){
    (static_cast<Fl_Timer*>(adjuster))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Timer_clear_damage)(fl_Timer adjuster){
    (static_cast<Fl_Timer*>(adjuster))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Timer_damage_with_text)(fl_Timer adjuster,uchar c){
    (static_cast<Fl_Timer*>(adjuster))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Timer_damage_inside_widget)(fl_Timer adjuster,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Timer*>(adjuster))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Timer_draw_label_with_xywh_alignment)(fl_Timer adjuster,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Timer*>(adjuster))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Timer_measure_label)(fl_Timer adjuster,int* ww,int* hh){
    (static_cast<Fl_Timer*>(adjuster))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Timer_window)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Timer_top_window)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Timer_top_window_offset)(fl_Timer adjuster,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Timer*>(adjuster))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Timer_as_gl_window)(fl_Timer adjuster){
    return (static_cast<Fl_Timer*>(adjuster))->as_gl_window();
  }
  FL_EXPORT_C(fl_Timer,Fl_Value_Timer_New)(int x,int y,int w,int h,const char* label){
    Fl_Timer* adjuster = new Fl_Timer(FL_VALUE_TIMER,x,y,w,h,label);
    return (fl_Timer) adjuster;
  }
  FL_EXPORT_C(fl_Timer,Fl_Hidden_Timer_New)(int x,int y,int w,int h,const char* label){
    Fl_Timer* adjuster = new Fl_Timer(FL_HIDDEN_TIMER,x,y,w,h,label);
    return (fl_Timer) adjuster;
  }
  FL_EXPORT_C(void,Fl_Timer_Destroy)(fl_Timer timer){
    delete (static_cast<Fl_Timer*>(timer));
  }
  FL_EXPORT_C(char,Fl_Timer_direction)(fl_Timer timer){
    return (static_cast<Fl_Timer*>(timer))->direction();
  }
  FL_EXPORT_C(void,Fl_Timer_set_direction)(fl_Timer timer,char d){
    (static_cast<Fl_Timer*>(timer))->direction(d);
  }
  FL_EXPORT_C(void,Fl_Timer_set_value)(fl_Timer timer, double value) {
    (static_cast<Fl_Timer*>(timer)->value(value));
  }
  FL_EXPORT_C(double, Fl_Timer_value)(fl_Timer timer){
    return (static_cast<Fl_Timer*>(timer)->value());
  }
  FL_EXPORT_C(char,Fl_Timer_suspended)(fl_Timer timer){
    return (static_cast<Fl_Timer*>(timer))->suspended();
  }
  FL_EXPORT_C(void,Fl_Timer_set_suspended)(fl_Timer timer,char s){
    (static_cast<Fl_Timer*>(timer))->suspended(s);
  }
  FL_EXPORT_C(fl_Timer,    Fl_Timer_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedTimer* w = new Fl_DerivedTimer(FL_NORMAL_TIMER,X,Y,W,H,label,fs);
    return (fl_Timer)w;
  }
  FL_EXPORT_C(fl_Timer,    Fl_OverriddenTimer_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTimer* w = new Fl_DerivedTimer(FL_NORMAL_TIMER,X,Y,W,H,label,fs);
    return (fl_Timer)w;
  }
  FL_EXPORT_C(void, Fl_Timer_draw)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Timer_draw_super)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Timer_handle)(fl_Timer o, int event){
    return (static_cast<Fl_DerivedTimer*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Timer_handle_super)(fl_Timer o, int event){
    return (static_cast<Fl_DerivedTimer*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Timer_resize)(fl_Timer o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTimer*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Timer_resize_super)(fl_Timer o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTimer*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Timer_show)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Timer_show_super)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Timer_hide)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Timer_hide_super)(fl_Timer o){
    (static_cast<Fl_DerivedTimer*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
