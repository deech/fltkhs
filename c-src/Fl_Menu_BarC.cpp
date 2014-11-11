#include "Fl_Menu_BarC.h"
#include "Utils.h"
#ifdef __cplusplus
Fl_DerivedMenu_Bar::Fl_DerivedMenu_Bar(int X, int Y, int W, int H, const char *l, fl_Menu_Bar_Virtual_Funcs* funcs) : Fl_Menu_Bar(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedMenu_Bar::Fl_DerivedMenu_Bar(int X, int Y, int W, int H, fl_Menu_Bar_Virtual_Funcs* funcs):Fl_Menu_Bar(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedMenu_Bar::~Fl_DerivedMenu_Bar(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedMenu_Bar::get_other_data(){
  return this->other_data;
}
void Fl_DerivedMenu_Bar::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedMenu_Bar::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Menu_) this);
  }
}
void Fl_DerivedMenu_Bar::draw_box(){
  Fl_Menu_Bar::draw_box();
}
void Fl_DerivedMenu_Bar::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Menu_Bar::draw_box(t,c);
}
void Fl_DerivedMenu_Bar::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Menu_Bar::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedMenu_Bar::draw_backdrop(){
  Fl_Menu_Bar::draw_backdrop();
}
void Fl_DerivedMenu_Bar::draw_focus(){
  Fl_Menu_Bar::draw_focus();
}
void Fl_DerivedMenu_Bar::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Menu_Bar::draw_focus(t,x,y,w,h);
}
void Fl_DerivedMenu_Bar::draw_label(){
  Fl_Menu_Bar::draw_label();
}
void Fl_DerivedMenu_Bar::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Menu_Bar::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedMenu_Bar::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Menu_) this,event);
  }
  else {
    i = Fl_Menu_Bar::handle(event);
  }
  return i;
}
void Fl_DerivedMenu_Bar::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Menu_) this,x,y,w,h);
  }
  else {
    Fl_Menu_Bar::resize(x,y,w,h);
  }
}
void Fl_DerivedMenu_Bar::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Menu_) this);
  }
  else {
    Fl_Menu_Bar::show();
  }
}
void Fl_DerivedMenu_Bar::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Menu_) this);
  }
  else {
    Fl_Menu_Bar::hide();
  }
}
void Fl_DerivedMenu_Bar::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Menu_) this);
  }
  else {
    Fl_Menu_Bar::draw();
  }
}
Fl_Window* Fl_DerivedMenu_Bar::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Menu_) this)));
  }
  else {
    win = Fl_Menu_Bar::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedMenu_Bar::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Menu_) this)));
  }
  else {
    win = Fl_Menu_Bar::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Menu_Bar_Virtual_Funcs*, Fl_Menu_Bar_default_virtual_funcs)(){
    fl_Menu_Bar_Virtual_Funcs* ptr = (fl_Menu_Bar_Virtual_Funcs*)malloc(sizeof(fl_Menu_Bar_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_handle_super )(fl_Menu_Bar menu_bar,int event){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->handle(event);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_handle )(fl_Menu_Bar menu_bar, int event){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_resize_super )(fl_Menu_Bar menu_bar,int x, int y, int w, int h){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_resize )(fl_Menu_Bar menu_bar,int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_show_super)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->show();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_show )(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->show();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_hide_super)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->hide();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_hide )(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Menu_Bar_as_window_super)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Menu_Bar_as_window )(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Menu_Bar_as_gl_window_super)(fl_Menu_Bar menu_bar){
    return (fl_Gl_Window) (static_cast<Fl_Menu_Bar*>(menu_bar))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Menu_Bar_as_gl_window )(fl_Menu_Bar menu_bar){
    return (fl_Gl_Window) (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Menu_Bar_parent)(fl_Menu_Bar menu_bar){
    return (fl_Group) (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->parent();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_parent)(fl_Menu_Bar menu_bar,fl_Group grp){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Menu_Bar_type)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->type();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_type)(fl_Menu_Bar menu_bar,uchar t){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->type(t);
  }

FL_EXPORT_C(void, Fl_Menu_Bar_draw_box)(fl_Menu_Bar Menu_Bar){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_box();
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_box_with_tc)(fl_Menu_Bar Menu_Bar,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_box_with_txywhc)(fl_Menu_Bar Menu_Bar,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_backdrop)(fl_Menu_Bar Menu_Bar){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_focus)(fl_Menu_Bar Menu_Bar){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_focus();
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_focus_with_txywh)(fl_Menu_Bar Menu_Bar,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Menu_Bar_draw_label)(fl_Menu_Bar Menu_Bar){
 (static_cast<Fl_DerivedMenu_Bar*>(Menu_Bar))->draw_label();
}
  FL_EXPORT_C(int,Fl_Menu_Bar_x)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->x();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_y)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->y();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_w)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->w();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_h)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->h();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_align)(fl_Menu_Bar menu_bar, Fl_Align alignment){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Menu_Bar_align)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu_Bar_box)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->box();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_box)(fl_Menu_Bar menu_bar,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Bar_color)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->color();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_color)(fl_Menu_Bar menu_bar,Fl_Color bg){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_color_with_bg_sel)(fl_Menu_Bar menu_bar,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Bar_selection_color)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_selection_color)(fl_Menu_Bar menu_bar,Fl_Color a){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Menu_Bar_label)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->label();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_copy_label)(fl_Menu_Bar menu_bar,const char* new_label){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_label)(fl_Menu_Bar menu_bar,const char* text){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Menu_Bar_labeltype)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_labeltype)(fl_Menu_Bar menu_bar,Fl_Labeltype a){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_labelcolor)(fl_Menu_Bar menu_bar,Fl_Color c){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Menu_Bar_labelcolor)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu_Bar_labelfont)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_labelfont)(fl_Menu_Bar menu_bar,Fl_Font c){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu_Bar_labelsize)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_labelsize)(fl_Menu_Bar menu_bar,Fl_Fontsize pix){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu_Bar_image)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->image();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_image)(fl_Menu_Bar menu_bar,fl_Image pix){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu_Bar_deimage)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->deimage();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_deimage)(fl_Menu_Bar menu_bar,fl_Image pix){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Menu_Bar_tooltip)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_copy_tooltip)(fl_Menu_Bar menu_bar,const char* text){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_tooltip)(fl_Menu_Bar menu_bar,const char* text){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_callback_with_user_data)(fl_Menu_Bar menu_bar,fl_Callback cb,void* p){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_DerivedMenu_Bar*>(menu_bar));
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_callback)(fl_Menu_Bar menu_bar,fl_Callback cb){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_DerivedMenu_Bar*>(menu_bar));
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Menu_Bar_user_data)(fl_Menu_Bar menu_bar){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_user_data)(fl_Menu_Bar menu_bar,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Bar*>(menu_bar))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Menu_Bar*>(menu_bar))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Menu_Bar*>(menu_bar))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Menu_Bar_argument)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->argument();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_argument)(fl_Menu_Bar menu_bar,long v){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Menu_Bar_when)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->when();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_when)(fl_Menu_Bar menu_bar,uchar i){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Bar_visible)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_visible_r)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_visible)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_visible)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Bar_active)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->active();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_active_r)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->active_r();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_activate)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->activate();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_deactivate)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Bar_output)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->output();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_output)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->output();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_output)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Bar_takesevents)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_changed)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->changed();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_changed)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_take_focus)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_visible_focus)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_visible_focus)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_modify_visible_focus)(fl_Menu_Bar menu_bar,int v){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Bar_visible_focus)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_do_callback)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_do_callback_with_widget_and_user_data)(fl_Menu_Bar menu_bar,fl_Widget w,long arg){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_do_callback_with_widget_and_default_user_data)(fl_Menu_Bar menu_bar,fl_Widget w){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_contains)(fl_Menu_Bar menu_bar,fl_Widget w){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_inside)(fl_Menu_Bar menu_bar,fl_Widget w){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_redraw)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->redraw();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_redraw_label)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Menu_Bar_damage)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->damage();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_damage_with_bitmask)(fl_Menu_Bar menu_bar,uchar c){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear_damage)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_damage_with_text)(fl_Menu_Bar menu_bar,uchar c){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_damage_inside_widget)(fl_Menu_Bar menu_bar,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_draw_label_with_xywh_alignment)(fl_Menu_Bar menu_bar,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_measure_label)(fl_Menu_Bar menu_bar,int* ww,int* hh){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void*, Fl_Menu_Bar_other_data)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Menu_Bar_set_other_data)(fl_Menu_Bar menu_bar, void* v){
    (static_cast<Fl_DerivedMenu_Bar*>(menu_bar))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Menu_Bar, Fl_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Menu_Bar_Virtual_Funcs* funcs = Fl_Menu_Bar_default_virtual_funcs();
    Fl_DerivedMenu_Bar* menu_bar = new Fl_DerivedMenu_Bar(x,y,w,h,label,funcs);
    return (static_cast<fl_Menu_Bar>(menu_bar));
  }
  FL_EXPORT_C(fl_Menu_Bar, Fl_Menu_Bar_New)(int x, int y, int w, int h) {
    fl_Menu_Bar_Virtual_Funcs* funcs = Fl_Menu_Bar_default_virtual_funcs();
    Fl_DerivedMenu_Bar* menu_bar = new Fl_DerivedMenu_Bar(x,y,w,h,0,funcs);
    return (fl_Menu_Bar)menu_bar;
  }
  FL_EXPORT_C(void   , Fl_Menu_Bar_Destroy)(fl_Menu_Bar menu_bar){
    delete (static_cast<Fl_DerivedMenu_Bar*>(menu_bar));
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_item_pathname_with_finditem)(fl_Menu_Bar menu_bar,char* name,int namelen,fl_Menu_Item finditem){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_item_pathname)(fl_Menu_Bar menu_bar,char* name,int namelen){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->item_pathname(name,namelen);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Bar_picked)(fl_Menu_Bar menu_bar,fl_Menu_Item item){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(menu_bar))->picked((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Bar_find_item_with_name)(fl_Menu_Bar menu_bar,char* name){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(menu_bar))->find_item(name);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_find_index_with_name)(fl_Menu_Bar menu_bar,char* name){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->find_index(name);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_find_index_with_item)(fl_Menu_Bar menu_bar,fl_Menu_Item item){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->find_index((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Bar_test_shortcut)(fl_Menu_Bar menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(menu_bar))->test_shortcut();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_global)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->global();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Bar_menu)(fl_Menu_Bar menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(menu_bar))->menu();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_menu_with_m)(fl_Menu_Bar menu_bar,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted = convert(item,size);
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->menu(converted);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_copy)(fl_Menu_Bar menu_bar,fl_Menu_Item m){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_copy_with_user_data)(fl_Menu_Bar menu_bar,fl_Menu_Item m,void* user_data){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_insert)(fl_Menu_Bar menu_bar,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(menu_bar)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_insert_with_flags)(fl_Menu_Bar menu_bar,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(menu_bar)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_insert_with_user_data_flags)(fl_Menu_Bar menu_bar,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(menu_bar)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add)(fl_Menu_Bar menu_bar,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_user_data)(fl_Menu_Bar menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_flags)(fl_Menu_Bar menu_bar,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_user_data_flags)(fl_Menu_Bar menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_shortcutname)(fl_Menu_Bar menu_bar,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_shortcutname_user_data)(fl_Menu_Bar menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_shortcutname_flags)(fl_Menu_Bar menu_bar,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_add_with_shortcutname_user_data_flags)(fl_Menu_Bar menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_size)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->size();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_size)(fl_Menu_Bar menu_bar,int W,int H){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->size(W,H);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_clear)(fl_Menu_Bar menu_bar){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->clear();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_clear_submenu)(fl_Menu_Bar menu_bar,int index){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->clear_submenu(index);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_replace)(fl_Menu_Bar menu_bar,int i,char* name){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->replace(i,name);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_remove)(fl_Menu_Bar menu_bar,int i ){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->remove(i);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_shortcut)(fl_Menu_Bar menu_bar,int i,int s){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->shortcut(i,s);
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_mode)(fl_Menu_Bar menu_bar,int i,int fl){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->mode(i,fl);
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_mode)(fl_Menu_Bar menu_bar,int i){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->mode(i);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Bar_mvalue)(fl_Menu_Bar menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(menu_bar))->mvalue();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_value)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->value();
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_value_with_item)(fl_Menu_Bar menu_bar,fl_Menu_Item item){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->value(static_cast<Fl_Menu_Item*>(item));
  }
  FL_EXPORT_C(int,Fl_Menu_Bar_value_with_index)(fl_Menu_Bar menu_bar,int index){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->value(index);
  }
  FL_EXPORT_C(char*,Fl_Menu_Bar_text)(fl_Menu_Bar menu_bar){
    return (char*)(static_cast<Fl_Menu_Bar*>(menu_bar))->text();
  }
  FL_EXPORT_C(char*,Fl_Menu_Bar_text_with_index)(fl_Menu_Bar menu_bar,int i){
    return (char*)(static_cast<Fl_Menu_Bar*>(menu_bar))->text(i);
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu_Bar_textfont)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->textfont();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_textfont)(fl_Menu_Bar menu_bar,Fl_Font c){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->textfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu_Bar_textsize)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->textsize();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_textsize)(fl_Menu_Bar menu_bar,Fl_Fontsize c){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->textsize(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Bar_textcolor)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_textcolor)(fl_Menu_Bar menu_bar,Fl_Color c){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->textcolor(c);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu_Bar_down_box)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->down_box();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_down_box)(fl_Menu_Bar menu_bar,Fl_Boxtype b){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->down_box(b);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Bar_down_color)(fl_Menu_Bar menu_bar){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->down_color();
  }
  FL_EXPORT_C(void,Fl_Menu_Bar_set_down_color)(fl_Menu_Bar menu_bar,unsigned c){
    (static_cast<Fl_Menu_Bar*>(menu_bar))->down_color(c);
  }
#ifdef __cplusplus
}
#endif
