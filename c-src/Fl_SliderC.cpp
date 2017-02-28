#include "Fl_SliderC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedSlider::Fl_DerivedSlider(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Slider(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSlider::Fl_DerivedSlider(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Slider(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSlider::~Fl_DerivedSlider(){
    free(overriddenFuncs);
  }
  void Fl_DerivedSlider::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Slider) this);
    }
    else {
      Fl_Slider::draw();
    }
  }

  void Fl_DerivedSlider::draw_super(){
    Fl_Slider::draw();
  }

  int Fl_DerivedSlider::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Slider) this,event);
    }
    else {
      i = Fl_Slider::handle(event);
    }
    return i;
  }
  int Fl_DerivedSlider::handle_super(int event){
    return Fl_Slider::handle(event);
  }

  void Fl_DerivedSlider::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Slider) this,x,y,w,h);
    }
    else {
      Fl_Slider::resize(x,y,w,h);
    }
  }

  void Fl_DerivedSlider::resize_super(int x, int y, int w, int h){
    Fl_Slider::resize(x,y,w,h);
  }
  void Fl_DerivedSlider::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Slider) this);
    }
    else {
      Fl_Slider::show();
    }
  }
  void Fl_DerivedSlider::show_super(){
    Fl_Slider::show();
  }

  void Fl_DerivedSlider::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Slider) this);
    }
    else {
      Fl_Slider::hide();
    }
  }
  void Fl_DerivedSlider::hide_super(){
    Fl_Slider::hide();
  }
#endif
  FL_EXPORT_C(fl_Window,Fl_Slider_as_window_super)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->Fl_Slider::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Slider_as_window )(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Slider_as_gl_window_super)(fl_Slider slider){
    return (fl_Gl_Window) (static_cast<Fl_Slider*>(slider))->Fl_Slider::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Slider_as_gl_window )(fl_Slider slider){
    return (fl_Gl_Window) (static_cast<Fl_Slider*>(slider))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Slider_parent)(fl_Slider slider){
    return (fl_Group) (static_cast<Fl_Slider*>(slider))->parent();
  }
  FL_EXPORT_C(void,Fl_Slider_set_parent)(fl_Slider slider,fl_Group grp){
    (static_cast<Fl_Slider*>(slider))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Slider_type)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->type();
  }
  FL_EXPORT_C(void,Fl_Slider_set_type)(fl_Slider slider,uchar t){
    (static_cast<Fl_Slider*>(slider))->type(t);
  }

  FL_EXPORT_C(int,Fl_Slider_x)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->x();
  }
  FL_EXPORT_C(int,Fl_Slider_y)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->y();
  }
  FL_EXPORT_C(int,Fl_Slider_w)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->w();
  }
  FL_EXPORT_C(int,Fl_Slider_h)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->h();
  }
  FL_EXPORT_C(void,Fl_Slider_set_align)(fl_Slider slider, Fl_Align alignment){
    (static_cast<Fl_Slider*>(slider))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Slider_align)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Slider_box)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->box();
  }
  FL_EXPORT_C(void,Fl_Slider_set_box)(fl_Slider slider,Fl_Boxtype new_box){
    (static_cast<Fl_Slider*>(slider))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Slider_color)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->color();
  }
  FL_EXPORT_C(void,Fl_Slider_set_color)(fl_Slider slider,Fl_Color bg){
    (static_cast<Fl_Slider*>(slider))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Slider_set_color_with_bg_sel)(fl_Slider slider,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Slider*>(slider))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Slider_selection_color)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Slider_set_selection_color)(fl_Slider slider,Fl_Color a){
    (static_cast<Fl_Slider*>(slider))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Slider_label)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->label();
  }
  FL_EXPORT_C(void,Fl_Slider_copy_label)(fl_Slider slider,const char* new_label){
    (static_cast<Fl_Slider*>(slider))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Slider_set_label)(fl_Slider slider,const char* text){
    (static_cast<Fl_Slider*>(slider))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Slider_labeltype)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Slider_set_labeltype)(fl_Slider slider,Fl_Labeltype a){
    (static_cast<Fl_Slider*>(slider))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Slider_labelcolor)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Slider_set_labelcolor)(fl_Slider slider,Fl_Color c){
    (static_cast<Fl_Slider*>(slider))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Slider_labelfont)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Slider_set_labelfont)(fl_Slider slider,Fl_Font c){
    (static_cast<Fl_Slider*>(slider))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Slider_labelsize)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Slider_set_labelsize)(fl_Slider slider,Fl_Fontsize pix){
    (static_cast<Fl_Slider*>(slider))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Slider_image)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->image();
  }
  FL_EXPORT_C(void,Fl_Slider_set_image)(fl_Slider slider,fl_Image pix){
    (static_cast<Fl_Slider*>(slider))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Slider_deimage)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->deimage();
  }
  FL_EXPORT_C(void,Fl_Slider_set_deimage)(fl_Slider slider,fl_Image pix){
    (static_cast<Fl_Slider*>(slider))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Slider_tooltip)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Slider_copy_tooltip)(fl_Slider slider,const char* text){
    (static_cast<Fl_Slider*>(slider))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Slider_set_tooltip)(fl_Slider slider,const char* text){
    (static_cast<Fl_Slider*>(slider))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Slider_set_callback_with_user_data)(fl_Slider slider,fl_Callback cb,void* p){
    Fl_Slider* castedBox = (static_cast<Fl_Slider*>(slider));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Slider_set_callback)(fl_Slider slider,fl_Callback cb){
    Fl_Slider* castedBox = (static_cast<Fl_Slider*>(slider));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Slider_user_data)(fl_Slider slider){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Slider*>(slider))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Slider*>(slider))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Slider_set_user_data)(fl_Slider slider,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Slider*>(slider))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Slider*>(slider))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Slider*>(slider))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Slider_argument)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->argument();
  }
  FL_EXPORT_C(void,Fl_Slider_set_argument)(fl_Slider slider,long v){
    (static_cast<Fl_Slider*>(slider))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Slider_when)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->when();
  }
  FL_EXPORT_C(void,Fl_Slider_set_when)(fl_Slider slider,uchar i){
    (static_cast<Fl_Slider*>(slider))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Slider_visible)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->visible();
  }
  FL_EXPORT_C(int,Fl_Slider_visible_r)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Slider_set_visible)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->visible();
  }
  FL_EXPORT_C(void,Fl_Slider_clear_visible)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Slider_active)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->active();
  }
  FL_EXPORT_C(int,Fl_Slider_active_r)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->active_r();
  }
  FL_EXPORT_C(void,Fl_Slider_activate)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->activate();
  }
  FL_EXPORT_C(void,Fl_Slider_deactivate)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Slider_output)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Slider_set_output)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Slider_clear_output)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Slider_takesevents)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Slider_set_changed)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->changed();
  }
  FL_EXPORT_C(void,Fl_Slider_clear_changed)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Slider_take_focus)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Slider_set_visible_focus)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Slider_clear_visible_focus)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Slider_modify_visible_focus)(fl_Slider slider,int v){
    (static_cast<Fl_Slider*>(slider))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Slider_visible_focus)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Slider_do_callback)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Slider_do_callback_with_widget_and_user_data)(fl_Slider slider,fl_Widget w,long arg){
    (static_cast<Fl_Slider*>(slider))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Slider_do_callback_with_widget_and_default_user_data)(fl_Slider slider,fl_Widget w){
    (static_cast<Fl_Slider*>(slider))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Slider_contains)(fl_Slider slider,fl_Widget w){
    return (static_cast<Fl_Slider*>(slider))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Slider_inside)(fl_Slider slider,fl_Widget w){
    return (static_cast<Fl_Slider*>(slider))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Slider_redraw)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->redraw();
  }
  FL_EXPORT_C(void,Fl_Slider_redraw_label)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Slider_damage)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->damage();
  }
  FL_EXPORT_C(void,Fl_Slider_clear_damage_with_bitmask)(fl_Slider slider,uchar c){
    (static_cast<Fl_Slider*>(slider))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Slider_clear_damage)(fl_Slider slider){
    (static_cast<Fl_Slider*>(slider))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Slider_damage_with_text)(fl_Slider slider,uchar c){
    (static_cast<Fl_Slider*>(slider))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Slider_damage_inside_widget)(fl_Slider slider,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Slider*>(slider))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Slider_draw_label_with_xywh_alignment)(fl_Slider slider,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Slider*>(slider))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Slider_measure_label)(fl_Slider slider,int* ww,int* hh){
    (static_cast<Fl_Slider*>(slider))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Slider_window)(fl_Slider slider){
    return (fl_Window) (static_cast<Fl_Slider*>(slider))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Slider_top_window)(fl_Slider slider){
    return (fl_Window) (static_cast<Fl_Slider*>(slider))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Slider_top_window_offset)(fl_Slider slider, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Slider*>(slider))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Slider_as_group)(fl_Slider slider){
    return (fl_Group) (static_cast<Fl_Slider*>(slider))->as_group();
  }
  FL_EXPORT_C(void,Fl_Slider_bounds)(fl_Slider slider,double a,double b){
    (static_cast<Fl_Slider*>(slider))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Slider_minimum)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->minimum();
  }
  FL_EXPORT_C(void,Fl_Slider_set_minimum)(fl_Slider slider,double a){
    (static_cast<Fl_Slider*>(slider))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Slider_maximum)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->maximum();
  }
  FL_EXPORT_C(void,Fl_Slider_set_maximum)(fl_Slider slider,double a){
    (static_cast<Fl_Slider*>(slider))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Slider_precision)(fl_Slider slider,int precision){
    (static_cast<Fl_Slider*>(slider))->precision(precision);
  }
  FL_EXPORT_C(void,Fl_Slider_range)(fl_Slider slider,double a,double b){
    (static_cast<Fl_Slider*>(slider))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Slider_set_step)(fl_Slider slider,int a){
    (static_cast<Fl_Slider*>(slider))->step(a);
  }
  FL_EXPORT_C(void,Fl_Slider_set_step_with_a_b)(fl_Slider slider,double a,int b){
    (static_cast<Fl_Slider*>(slider))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Slider_step_with_s)(fl_Slider slider,double s){
    (static_cast<Fl_Slider*>(slider))->step(s);
  }
  FL_EXPORT_C(double,Fl_Slider_step)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->step();
  }
  FL_EXPORT_C(double,Fl_Slider_value)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->value();
  }
  FL_EXPORT_C(int,Fl_Slider_set_value)(fl_Slider slider,double v){
    return (static_cast<Fl_Slider*>(slider))->value(v);
  }
  FL_EXPORT_C(int,Fl_Slider_format)(fl_Slider slider,char* format){
    return (static_cast<Fl_Slider*>(slider))->format(format);
  }
  FL_EXPORT_C(double,Fl_Slider_round)(fl_Slider slider,double v){
    return (static_cast<Fl_Slider*>(slider))->round(v);
  }
  FL_EXPORT_C(double,Fl_Slider_clamp)(fl_Slider slider,double v){
    return (static_cast<Fl_Slider*>(slider))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Slider_increment)(fl_Slider slider,double v,int n){
    return (static_cast<Fl_Slider*>(slider))->increment(v,n);
  }
  FL_EXPORT_C(fl_Slider,    Fl_Slider_New_WithT)(uchar t, int x, int y, int w, int h, const char* label){
    Fl_Slider* slider = new Fl_Slider(t,x,y,w,h,label);
    return (fl_Slider)slider;
  }
  FL_EXPORT_C(fl_Fill_Slider, Fl_Fill_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Fill_Slider* slider = new Fl_Fill_Slider(x,y,w,h,label);
    return (static_cast<fl_Fill_Slider>(slider));
  }
  FL_EXPORT_C(fl_Fill_Slider, Fl_Fill_Slider_New)(int x, int y, int w, int h) {
    Fl_Fill_Slider* slider = new Fl_Fill_Slider(x,y,w,h,0);
    return (fl_Fill_Slider)slider;
  }
  FL_EXPORT_C(fl_Hor_Slider, Fl_Hor_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hor_Slider* slider = new Fl_Hor_Slider(x,y,w,h,label);
    return (static_cast<fl_Hor_Slider>(slider));
  }
  FL_EXPORT_C(fl_Hor_Slider, Fl_Hor_Slider_New)(int x, int y, int w, int h) {
    Fl_Hor_Slider* slider = new Fl_Hor_Slider(x,y,w,h,0);
    return (fl_Hor_Slider)slider;
  }
  FL_EXPORT_C(fl_Hor_Nice_Slider, Fl_Hor_Nice_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hor_Nice_Slider* slider = new Fl_Hor_Nice_Slider(x,y,w,h,label);
    return (static_cast<fl_Hor_Nice_Slider>(slider));
  }
  FL_EXPORT_C(fl_Hor_Nice_Slider, Fl_Hor_Nice_Slider_New)(int x, int y, int w, int h) {
    Fl_Hor_Nice_Slider* slider = new Fl_Hor_Nice_Slider(x,y,w,h,0);
    return (fl_Hor_Nice_Slider)slider;
  }
  FL_EXPORT_C(fl_Hor_Fill_Slider, Fl_Hor_Fill_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hor_Fill_Slider* slider = new Fl_Hor_Fill_Slider(x,y,w,h,label);
    return (static_cast<fl_Hor_Fill_Slider>(slider));
  }
  FL_EXPORT_C(fl_Hor_Fill_Slider, Fl_Hor_Fill_Slider_New)(int x, int y, int w, int h) {
    Fl_Hor_Fill_Slider* slider = new Fl_Hor_Fill_Slider(x,y,w,h,0);
    return (fl_Hor_Fill_Slider)slider;
  }
  FL_EXPORT_C(fl_Nice_Slider, Fl_Nice_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Nice_Slider* slider = new Fl_Nice_Slider(x,y,w,h,label);
    return (static_cast<fl_Nice_Slider>(slider));
  }
  FL_EXPORT_C(fl_Nice_Slider, Fl_Nice_Slider_New)(int x, int y, int w, int h) {
    Fl_Nice_Slider* slider = new Fl_Nice_Slider(x,y,w,h,0);
    return (fl_Nice_Slider)slider;
  }
  FL_EXPORT_C(void,      Fl_Slider_Destroy)(fl_Slider slider){
    delete (static_cast<Fl_Slider*>(slider));
  }
  FL_EXPORT_C(int,Fl_Slider_scrollvalue)(fl_Slider slider,int pos,int size,int first,int total){
    return (static_cast<Fl_Slider*>(slider))->scrollvalue(pos,size,first,total);
  }
  FL_EXPORT_C(float,Fl_Slider_set_slider_size)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->slider_size();
  }
  FL_EXPORT_C(void,Fl_Slider_slider_size)(fl_Slider slider,double v){
    (static_cast<Fl_Slider*>(slider))->slider_size(v);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Slider_slider)(fl_Slider slider){
    return (static_cast<Fl_Slider*>(slider))->slider();
  }
  FL_EXPORT_C(void,Fl_Slider_set_slider)(fl_Slider slider,Fl_Boxtype c){
    (static_cast<Fl_Slider*>(slider))->slider(c);
  }
  FL_EXPORT_C(fl_Slider,    Fl_Slider_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSlider* w = new Fl_DerivedSlider(X,Y,W,H,fs);
    return (fl_Slider)w;
  }
  FL_EXPORT_C(fl_Slider,    Fl_Slider_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSlider* w = new Fl_DerivedSlider(X,Y,W,H,label,fs);
    return (fl_Slider)w;
  }
  FL_EXPORT_C(fl_Slider,    Fl_OverriddenSlider_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSlider* w = new Fl_DerivedSlider(X,Y,W,H,fs);
    return (fl_Slider)w;
  }
  FL_EXPORT_C(fl_Slider,    Fl_OverriddenSlider_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSlider* w = new Fl_DerivedSlider(X,Y,W,H,label,fs);
    return (fl_Slider)w;
  }
  FL_EXPORT_C(void, Fl_Slider_draw)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Slider_draw_super)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Slider_handle)(fl_Slider o, int event){
    return (static_cast<Fl_DerivedSlider*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Slider_handle_super)(fl_Slider o, int event){
    return (static_cast<Fl_DerivedSlider*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Slider_resize)(fl_Slider o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSlider*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Slider_resize_super)(fl_Slider o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSlider*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Slider_show)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Slider_show_super)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Slider_hide)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Slider_hide_super)(fl_Slider o){
    (static_cast<Fl_DerivedSlider*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
