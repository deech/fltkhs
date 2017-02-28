#include "Fl_ClockC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedClock::Fl_DerivedClock(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Clock(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedClock::Fl_DerivedClock(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Clock(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedClock::~Fl_DerivedClock(){
    free(overriddenFuncs);
  }
  void Fl_DerivedClock::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Clock) this);
    }
    else {
      Fl_Clock::draw();
    }
  }

  void Fl_DerivedClock::draw_super(){
    Fl_Clock::draw();
  }

  int Fl_DerivedClock::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Clock) this,event);
    }
    else {
      i = Fl_Clock::handle(event);
    }
    return i;
  }
  int Fl_DerivedClock::handle_super(int event){
    return Fl_Clock::handle(event);
  }

  void Fl_DerivedClock::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Clock) this,x,y,w,h);
    }
    else {
      Fl_Clock::resize(x,y,w,h);
    }
  }

  void Fl_DerivedClock::resize_super(int x, int y, int w, int h){
    Fl_Clock::resize(x,y,w,h);
  }
  void Fl_DerivedClock::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Clock) this);
    }
    else {
      Fl_Clock::show();
    }
  }
  void Fl_DerivedClock::show_super(){
    Fl_Clock::show();
  }

  void Fl_DerivedClock::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Clock) this);
    }
    else {
      Fl_Clock::hide();
    }
  }
  void Fl_DerivedClock::hide_super(){
    Fl_Clock::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Clock_parent)(fl_Clock b){
    return (fl_Group) (static_cast<Fl_Clock*>(b))->parent();
  }
  FL_EXPORT_C(void,Fl_Clock_set_parent)(fl_Clock b,fl_Group grp){
    (static_cast<Fl_Clock*>(b))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Clock_type)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->type();
  }
  FL_EXPORT_C(void,Fl_Clock_set_type)(fl_Clock b,uchar t){
    (static_cast<Fl_Clock*>(b))->type(t);
  }

  FL_EXPORT_C(int,Fl_Clock_x)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->x();
  }
  FL_EXPORT_C(int,Fl_Clock_y)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->y();
  }
  FL_EXPORT_C(int,Fl_Clock_w)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->w();
  }
  FL_EXPORT_C(int,Fl_Clock_h)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->h();
  }
  FL_EXPORT_C(void,Fl_Clock_set_align)(fl_Clock clock, Fl_Align alignment){
    (static_cast<Fl_Clock*>(clock))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Clock_align)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Clock_box)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->box();
  }
  FL_EXPORT_C(void,Fl_Clock_set_box)(fl_Clock b,Fl_Boxtype new_box){
    (static_cast<Fl_Clock*>(b))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Clock_color)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->color();
  }
  FL_EXPORT_C(void,Fl_Clock_set_color)(fl_Clock b,Fl_Color bg){
    (static_cast<Fl_Clock*>(b))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Clock_set_color_with_bg_sel)(fl_Clock b,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Clock*>(b))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Clock_selection_color)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Clock_set_selection_color)(fl_Clock b,Fl_Color a){
    (static_cast<Fl_Clock*>(b))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Clock_label)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->label();
  }
  FL_EXPORT_C(void,Fl_Clock_copy_label)(fl_Clock b,const char* new_label){
    (static_cast<Fl_Clock*>(b))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Clock_set_label)(fl_Clock b,const char* text){
    (static_cast<Fl_Clock*>(b))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Clock_labeltype)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Clock_set_labeltype)(fl_Clock b,Fl_Labeltype a){
    (static_cast<Fl_Clock*>(b))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Clock_set_labelcolor)(fl_Clock b,Fl_Color c){
    (static_cast<Fl_Clock*>(b))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Clock_labelcolor)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Clock_labelfont)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Clock_set_labelfont)(fl_Clock b,Fl_Font c){
    (static_cast<Fl_Clock*>(b))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Clock_labelsize)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Clock_set_labelsize)(fl_Clock b,Fl_Fontsize pix){
    (static_cast<Fl_Clock*>(b))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Clock_image)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->image();
  }
  FL_EXPORT_C(void,Fl_Clock_set_image)(fl_Clock b,fl_Image pix){
    (static_cast<Fl_Clock*>(b))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Clock_deimage)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->deimage();
  }
  FL_EXPORT_C(void,Fl_Clock_set_deimage)(fl_Clock b,fl_Image pix){
    (static_cast<Fl_Clock*>(b))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Clock_tooltip)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Clock_copy_tooltip)(fl_Clock b,const char* text){
    (static_cast<Fl_Clock*>(b))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Clock_set_tooltip)(fl_Clock b,const char* text){
    (static_cast<Fl_Clock*>(b))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Clock_set_callback_with_user_data)(fl_Clock b,fl_Callback* cb,void* p){
    Fl_Clock* castedClock = (static_cast<Fl_Clock*>(b));
    new C_to_Fl_Callback(castedClock, cb, p);
  }
  FL_EXPORT_C(void,Fl_Clock_set_callback)(fl_Clock b,fl_Callback* cb){
    Fl_Clock* castedClock = (static_cast<Fl_Clock*>(b));
    new C_to_Fl_Callback(castedClock, cb);
  }
  FL_EXPORT_C(void*,Fl_Clock_user_data)(fl_Clock b){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Clock*>(b))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Clock*>(b))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Clock_set_user_data)(fl_Clock b,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Clock*>(b))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Clock*>(b))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Clock*>(b))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Clock_argument)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->argument();
  }
  FL_EXPORT_C(void,Fl_Clock_set_argument)(fl_Clock b,long v){
    (static_cast<Fl_Clock*>(b))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Clock_when)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->when();
  }
  FL_EXPORT_C(void,Fl_Clock_set_when)(fl_Clock b,uchar i){
    (static_cast<Fl_Clock*>(b))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Clock_visible)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->visible();
  }
  FL_EXPORT_C(int,Fl_Clock_visible_r)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Clock_set_visible)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->visible();
  }
  FL_EXPORT_C(void,Fl_Clock_clear_visible)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Clock_active)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->active();
  }
  FL_EXPORT_C(int,Fl_Clock_active_r)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->active_r();
  }
  FL_EXPORT_C(void,Fl_Clock_activate)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->activate();
  }
  FL_EXPORT_C(void,Fl_Clock_deactivate)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Clock_output)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Clock_set_output)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Clock_clear_output)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Clock_takesevents)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Clock_set_changed)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->changed();
  }
  FL_EXPORT_C(void,Fl_Clock_clear_changed)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Clock_take_focus)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Clock_set_visible_focus)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Clock_clear_visible_focus)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Clock_modify_visible_focus)(fl_Clock b,int v){
    (static_cast<Fl_Clock*>(b))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Clock_visible_focus)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Clock_do_callback)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Clock_do_callback_with_widget_and_user_data)(fl_Clock b,fl_Widget w,long arg){
    (static_cast<Fl_Clock*>(b))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Clock_do_callback_with_widget_and_default_user_data)(fl_Clock b,fl_Widget w){
    (static_cast<Fl_Clock*>(b))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Clock_contains)(fl_Clock b,fl_Widget w){
    return (static_cast<Fl_Clock*>(b))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Clock_inside)(fl_Clock b,fl_Widget w){
    return (static_cast<Fl_Clock*>(b))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Clock_redraw)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->redraw();
  }
  FL_EXPORT_C(void,Fl_Clock_redraw_label)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Clock_damage)(fl_Clock b){
    return (static_cast<Fl_Clock*>(b))->damage();
  }
  FL_EXPORT_C(void,Fl_Clock_clear_damage_with_bitmask)(fl_Clock b,uchar c){
    (static_cast<Fl_Clock*>(b))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Clock_clear_damage)(fl_Clock b){
    (static_cast<Fl_Clock*>(b))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Clock_damage_with_text)(fl_Clock b,uchar c){
    (static_cast<Fl_Clock*>(b))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Clock_damage_inside_widget)(fl_Clock b,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Clock*>(b))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Clock_draw_label_with_xywh_alignment)(fl_Clock b,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Clock*>(b))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Clock_measure_label)(fl_Clock b,int* ww,int* hh){
    (static_cast<Fl_Clock*>(b))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Clock_window)(fl_Clock clock){
    return (fl_Window) (static_cast<Fl_Clock*>(clock))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Clock_top_window)(fl_Clock clock){
    return (fl_Window) (static_cast<Fl_Clock*>(clock))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Clock_top_window_offset)(fl_Clock clock, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Clock*>(clock))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Clock_as_group)(fl_Clock clock){
    return (fl_Group) (static_cast<Fl_Clock*>(clock))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Clock_as_gl_window)(fl_Clock clock){
    return (fl_Gl_Window) (static_cast<Fl_Clock*>(clock))->as_gl_window();
  }
  FL_EXPORT_C(fl_Clock, Fl_Clock_New_WithClockType)(uchar t, int x, int y, int w, int h, const char* label) {
    Fl_Clock* clock = new Fl_Clock(t,x,y,w,h,label);
    return (fl_Clock)clock;
  }
  FL_EXPORT_C(void,Fl_Clock_Destroy)(fl_Clock clock){
    delete (static_cast<Fl_Clock*>(clock));
  }
  FL_EXPORT_C(void,Fl_Clock_set_value)(fl_Clock clock,ulong v){
    return (static_cast<Fl_Clock*>(clock))->value(v);
  }
  FL_EXPORT_C(void,Fl_Clock_set_value_with_hms)(fl_Clock clock,int H,int m,int s){
    return (static_cast<Fl_Clock*>(clock))->value(H,m,s);
  }
  FL_EXPORT_C(ulong,Fl_Clock_value)(fl_Clock clock){
    return (static_cast<Fl_Clock*>(clock))->value();
  }
  FL_EXPORT_C(int,Fl_Clock_hour)(fl_Clock clock){
    return (static_cast<Fl_Clock*>(clock))->hour();
  }
  FL_EXPORT_C(int,Fl_Clock_minute)(fl_Clock clock){
    return (static_cast<Fl_Clock*>(clock))->minute();
  }
  FL_EXPORT_C(int,Fl_Clock_second)(fl_Clock clock){
    return (static_cast<Fl_Clock*>(clock))->second();
  }
  FL_EXPORT_C(void, Fl_Clock_draw)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Clock_draw_super)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Clock_handle)(fl_Clock o, int event){
    return (static_cast<Fl_DerivedClock*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Clock_handle_super)(fl_Clock o, int event){
    return (static_cast<Fl_DerivedClock*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Clock_resize)(fl_Clock o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedClock*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Clock_resize_super)(fl_Clock o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedClock*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Clock_show)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Clock_show_super)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Clock_hide)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Clock_hide_super)(fl_Clock o){
    (static_cast<Fl_DerivedClock*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Clock,    Fl_Clock_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedClock* w = new Fl_DerivedClock(X,Y,W,H,fs);
    return (fl_Clock)w;
  }
  FL_EXPORT_C(fl_Clock,    Fl_Clock_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedClock* w = new Fl_DerivedClock(X,Y,W,H,label,fs);
    return (fl_Clock)w;
  }
  FL_EXPORT_C(fl_Clock,    Fl_OverriddenClock_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedClock* w = new Fl_DerivedClock(X,Y,W,H,fs);
    return (fl_Clock)w;
  }
  FL_EXPORT_C(fl_Clock,    Fl_OverriddenClock_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedClock* w = new Fl_DerivedClock(X,Y,W,H,label,fs);
    return (fl_Clock)w;
  }
#ifdef __cplusplus
}
#endif
