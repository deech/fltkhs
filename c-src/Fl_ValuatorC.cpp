#include "Fl_ValuatorC.h"
#ifdef __cplusplus
Fl_DerivedValuator::Fl_DerivedValuator(int X, int Y, int W, int H, const char *l, fl_Valuator_Virtual_Funcs* funcs) : Fl_Valuator(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedValuator::Fl_DerivedValuator(int X, int Y, int W, int H, fl_Valuator_Virtual_Funcs* funcs):Fl_Valuator(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedValuator::~Fl_DerivedValuator(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedValuator::get_other_data(){
  return this->other_data;
}
void Fl_DerivedValuator::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedValuator::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Box) this);
  }
}
void Fl_DerivedValuator::draw_box(){
  Fl_Valuator::draw_box();
}
void Fl_DerivedValuator::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Valuator::draw_box(t,c);
}
void Fl_DerivedValuator::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Valuator::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedValuator::draw_backdrop(){
  Fl_Valuator::draw_backdrop();
}
void Fl_DerivedValuator::draw_focus(){
  Fl_Valuator::draw_focus();
}
void Fl_DerivedValuator::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Valuator::draw_focus(t,x,y,w,h);
}
void Fl_DerivedValuator::draw_label(){
  Fl_Valuator::draw_label();
}
void Fl_DerivedValuator::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Valuator::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedValuator::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Box) this,event);
  }
  else {
    i = Fl_Valuator::handle(event);
  }
  return i;
}
void Fl_DerivedValuator::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Box) this,x,y,w,h);
  }
  else {
    Fl_Valuator::resize(x,y,w,h);
  }
}
void Fl_DerivedValuator::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Box) this);
  }
  else {
    Fl_Valuator::show();
  }
}
void Fl_DerivedValuator::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Box) this);
  }
  else {
    Fl_Valuator::hide();
  }
}
void Fl_DerivedValuator::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Box) this);
  }
}
Fl_Window* Fl_DerivedValuator::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Box) this)));
  }
  else {
    win = Fl_Valuator::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedValuator::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Box) this)));
  }
  else {
    win = Fl_Valuator::as_gl_window();
  }
  return win;
}
int Fl_DerivedValuator::format(char* format){
  int result;
  if (this->overriddenFuncs->format != NULL) {
    result = ((this->overriddenFuncs->format((fl_Valuator) this, format)));
  }
  else {
    result = Fl_Valuator::format(format);
  }
  return result;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Valuator_Virtual_Funcs*, Fl_Valuator_default_virtual_funcs)(){
    fl_Valuator_Virtual_Funcs* ptr = (fl_Valuator_Virtual_Funcs*)malloc(sizeof(fl_Valuator_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    ptr->destroy_data = NULL;
    ptr->format = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Valuator_handle_super)(fl_Valuator valuator,int event){
    return (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::handle(event);
  }
  FL_EXPORT_C(int,Fl_Valuator_handle )(fl_Valuator valuator, int event){
    return (static_cast<Fl_DerivedValuator*>(valuator))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Valuator_resize_super )(fl_Valuator valuator,int x, int y, int w, int h){
    (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Valuator_resize )(fl_Valuator valuator,int x, int y, int w, int h){
    (static_cast<Fl_DerivedValuator*>(valuator))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Valuator_show_super)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::show();
  }
  FL_EXPORT_C(void,Fl_Valuator_show )(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->show();
  }
  FL_EXPORT_C(void,Fl_Valuator_hide_super)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::hide();
  }
  FL_EXPORT_C(void,Fl_Valuator_hide )(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Valuator_as_window_super)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Valuator_as_window )(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->as_window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Valuator_window)(fl_Valuator widget){
    return (fl_Window) (static_cast<Fl_DerivedValuator*>(widget))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Valuator_top_window)(fl_Valuator widget){
    return (fl_Window) (static_cast<Fl_DerivedValuator*>(widget))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Valuator_top_window_offset)(fl_Valuator widget, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedValuator*>(widget))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Valuator_as_gl_window_super)(fl_Valuator valuator){
    return (fl_Gl_Window) (static_cast<Fl_DerivedValuator*>(valuator))->Fl_Valuator::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Valuator_as_gl_window )(fl_Valuator valuator){
    return (fl_Gl_Window) (static_cast<Fl_DerivedValuator*>(valuator))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Valuator_parent)(fl_Valuator valuator){
    return (fl_Group) (static_cast<Fl_DerivedValuator*>(valuator))->parent();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_parent)(fl_Valuator valuator,fl_Group grp){
    (static_cast<Fl_DerivedValuator*>(valuator))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Valuator_type)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->type();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_type)(fl_Valuator valuator,uchar t){
    (static_cast<Fl_DerivedValuator*>(valuator))->type(t);
  }

FL_EXPORT_C(void, Fl_Valuator_draw_box)(fl_Valuator Valuator){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_box();
}
FL_EXPORT_C(void, Fl_Valuator_draw_box_with_tc)(fl_Valuator Valuator,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Valuator_draw_box_with_txywhc)(fl_Valuator Valuator,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Valuator_draw_backdrop)(fl_Valuator Valuator){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Valuator_draw_focus)(fl_Valuator Valuator){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_focus();
}
FL_EXPORT_C(void, Fl_Valuator_draw_focus_with_txywh)(fl_Valuator Valuator,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Valuator_draw_label)(fl_Valuator Valuator){
 (static_cast<Fl_DerivedValuator*>(Valuator))->draw_label();
}
  FL_EXPORT_C(int,Fl_Valuator_x)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->x();
  }
  FL_EXPORT_C(int,Fl_Valuator_y)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->y();
  }
  FL_EXPORT_C(int,Fl_Valuator_w)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->w();
  }
  FL_EXPORT_C(int,Fl_Valuator_h)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->h();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_align)(fl_Valuator valuator, Fl_Align alignment){
    (static_cast<Fl_DerivedValuator*>(valuator))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Valuator_align)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Valuator_box)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->box();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_box)(fl_Valuator valuator,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedValuator*>(valuator))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Valuator_color)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->color();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_color)(fl_Valuator valuator,Fl_Color bg){
    (static_cast<Fl_DerivedValuator*>(valuator))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_color_with_bg_sel)(fl_Valuator valuator,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedValuator*>(valuator))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Valuator_selection_color)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_selection_color)(fl_Valuator valuator,Fl_Color a){
    (static_cast<Fl_DerivedValuator*>(valuator))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Valuator_label)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->label();
  }
  FL_EXPORT_C(void,Fl_Valuator_copy_label)(fl_Valuator valuator,const char* new_label){
    (static_cast<Fl_DerivedValuator*>(valuator))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_label)(fl_Valuator valuator,const char* text){
    (static_cast<Fl_DerivedValuator*>(valuator))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Valuator_labeltype)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_labeltype)(fl_Valuator valuator,Fl_Labeltype a){
    (static_cast<Fl_DerivedValuator*>(valuator))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_labelcolor)(fl_Valuator valuator,Fl_Color c){
    (static_cast<Fl_DerivedValuator*>(valuator))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Valuator_labelcolor)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Valuator_labelfont)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_labelfont)(fl_Valuator valuator,Fl_Font c){
    (static_cast<Fl_DerivedValuator*>(valuator))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Valuator_labelsize)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_labelsize)(fl_Valuator valuator,Fl_Fontsize pix){
    (static_cast<Fl_DerivedValuator*>(valuator))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Valuator_image)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->image();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_image)(fl_Valuator valuator,fl_Image pix){
    (static_cast<Fl_DerivedValuator*>(valuator))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Valuator_deimage)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->deimage();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_deimage)(fl_Valuator valuator,fl_Image pix){
    (static_cast<Fl_DerivedValuator*>(valuator))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Valuator_tooltip)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Valuator_copy_tooltip)(fl_Valuator valuator,const char* text){
    (static_cast<Fl_DerivedValuator*>(valuator))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_tooltip)(fl_Valuator valuator,const char* text){
    (static_cast<Fl_DerivedValuator*>(valuator))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_callback_with_user_data)(fl_Valuator valuator,fl_Callback cb,void* p){
    Fl_Valuator* castedBox = (static_cast<Fl_DerivedValuator*>(valuator));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_callback)(fl_Valuator valuator,fl_Callback cb){
    Fl_Valuator* castedBox = (static_cast<Fl_DerivedValuator*>(valuator));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Valuator_user_data)(fl_Valuator valuator){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedValuator*>(valuator))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedValuator*>(valuator))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Valuator_set_user_data)(fl_Valuator valuator,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Valuator*>(valuator))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Valuator*>(valuator))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Valuator*>(valuator))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Valuator_argument)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->argument();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_argument)(fl_Valuator valuator,long v){
    (static_cast<Fl_DerivedValuator*>(valuator))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Valuator_when)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->when();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_when)(fl_Valuator valuator,uchar i){
    (static_cast<Fl_DerivedValuator*>(valuator))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Valuator_visible)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->visible();
  }
  FL_EXPORT_C(int,Fl_Valuator_visible_r)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_visible)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->visible();
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_visible)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Valuator_active)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->active();
  }
  FL_EXPORT_C(int,Fl_Valuator_active_r)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->active_r();
  }
  FL_EXPORT_C(void,Fl_Valuator_activate)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->activate();
  }
  FL_EXPORT_C(void,Fl_Valuator_deactivate)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Valuator_output)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->output();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_output)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->output();
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_output)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Valuator_takesevents)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_changed)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->changed();
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_changed)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Valuator_take_focus)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_visible_focus)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_visible_focus)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Valuator_modify_visible_focus)(fl_Valuator valuator,int v){
    (static_cast<Fl_DerivedValuator*>(valuator))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Valuator_visible_focus)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Valuator_do_callback)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Valuator_do_callback_with_widget_and_user_data)(fl_Valuator valuator,fl_Widget w,long arg){
    (static_cast<Fl_DerivedValuator*>(valuator))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Valuator_do_callback_with_widget_and_default_user_data)(fl_Valuator valuator,fl_Widget w){
    (static_cast<Fl_DerivedValuator*>(valuator))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Valuator_contains)(fl_Valuator valuator,fl_Widget w){
    return (static_cast<Fl_DerivedValuator*>(valuator))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Valuator_inside)(fl_Valuator valuator,fl_Widget w){
    return (static_cast<Fl_DerivedValuator*>(valuator))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Valuator_redraw)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->redraw();
  }
  FL_EXPORT_C(void,Fl_Valuator_redraw_label)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Valuator_damage)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->damage();
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_damage_with_bitmask)(fl_Valuator valuator,uchar c){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Valuator_clear_damage)(fl_Valuator valuator){
    (static_cast<Fl_DerivedValuator*>(valuator))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Valuator_damage_with_text)(fl_Valuator valuator,uchar c){
    (static_cast<Fl_DerivedValuator*>(valuator))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Valuator_damage_inside_widget)(fl_Valuator valuator,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedValuator*>(valuator))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Valuator_draw_label_with_xywh_alignment)(fl_Valuator valuator,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedValuator*>(valuator))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Valuator_measure_label)(fl_Valuator valuator,int* ww,int* hh){
    (static_cast<Fl_DerivedValuator*>(valuator))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void*, Fl_Valuator_other_data)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Valuator_set_other_data)(fl_Valuator valuator, void* v){
    (static_cast<Fl_DerivedValuator*>(valuator))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Valuator, Fl_Valuator_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Valuator_Virtual_Funcs* funcs = Fl_Valuator_default_virtual_funcs();
    Fl_DerivedValuator* valuator = new Fl_DerivedValuator(x,y,w,h,label,funcs);
    return (static_cast<fl_Valuator>(valuator));
  }
  FL_EXPORT_C(fl_Valuator,    Fl_OverriddenValuator_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Valuator_Virtual_Funcs* funcs){
    Fl_DerivedValuator* valuator = new Fl_DerivedValuator(x,y,w,h,label,funcs);
    return (static_cast<fl_Valuator>(valuator));
  }
  FL_EXPORT_C(fl_Valuator, Fl_Valuator_New)(int x, int y, int w, int h) {
    fl_Valuator_Virtual_Funcs* funcs = Fl_Valuator_default_virtual_funcs();
    Fl_DerivedValuator* valuator = new Fl_DerivedValuator(x,y,w,h,0,funcs);
    return (fl_Valuator)valuator;
  }
  FL_EXPORT_C(fl_Valuator   , Fl_OverriddenValuator_New)(int x, int y, int w, int h, fl_Valuator_Virtual_Funcs* funcs){
    Fl_DerivedValuator* valuator = new Fl_DerivedValuator(x,y,w,h,0,funcs);
    return (fl_Valuator)valuator;
  }
  FL_EXPORT_C(void,      Fl_Valuator_Destroy)(fl_Valuator valuator){
    delete (static_cast<Fl_DerivedValuator*>(valuator));
  }
  FL_EXPORT_C(void,Fl_Valuator_bounds)(fl_Valuator valuator,double a,double b){
    (static_cast<Fl_DerivedValuator*>(valuator))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Valuator_minimum)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->minimum();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_minimum)(fl_Valuator valuator,double a){
    (static_cast<Fl_DerivedValuator*>(valuator))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Valuator_maximum)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->maximum();
  }
  FL_EXPORT_C(void,Fl_Valuator_set_maximum)(fl_Valuator valuator,double a){
    (static_cast<Fl_DerivedValuator*>(valuator))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Valuator_precision)(fl_Valuator valuator,int precision){
    (static_cast<Fl_DerivedValuator*>(valuator))->precision(precision);
  }
  FL_EXPORT_C(void,Fl_Valuator_range)(fl_Valuator valuator,double a,double b){
    (static_cast<Fl_DerivedValuator*>(valuator))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_step)(fl_Valuator valuator,int a){
    (static_cast<Fl_DerivedValuator*>(valuator))->step(a);
  }
  FL_EXPORT_C(void,Fl_Valuator_set_step_with_a_b)(fl_Valuator valuator,double a,int b){
    (static_cast<Fl_DerivedValuator*>(valuator))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Valuator_step_with_s)(fl_Valuator valuator,double s){
    (static_cast<Fl_DerivedValuator*>(valuator))->step(s);
  }
  FL_EXPORT_C(double,Fl_Valuator_step)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->step();
  }
  FL_EXPORT_C(double,Fl_Valuator_value)(fl_Valuator valuator){
    return (static_cast<Fl_DerivedValuator*>(valuator))->value();
  }
  FL_EXPORT_C(int,Fl_Valuator_set_value)(fl_Valuator valuator,double v){
    return (static_cast<Fl_DerivedValuator*>(valuator))->value(v);
  }
  FL_EXPORT_C(int,Fl_Valuator_format)(fl_Valuator valuator,char* format){
    return (static_cast<Fl_DerivedValuator*>(valuator))->format(format);
  }
  FL_EXPORT_C(double,Fl_Valuator_round)(fl_Valuator valuator,double v){
    return (static_cast<Fl_DerivedValuator*>(valuator))->round(v);
  }
  FL_EXPORT_C(double,Fl_Valuator_clamp)(fl_Valuator valuator,double v){
    return (static_cast<Fl_DerivedValuator*>(valuator))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Valuator_increment)(fl_Valuator valuator,double v,int n){
    return (static_cast<Fl_DerivedValuator*>(valuator))->increment(v,n);
  }
#ifdef __cplusplus
}
#endif
