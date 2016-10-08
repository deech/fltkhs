#include "Fl_Gl_WindowC.h"

#ifdef __cplusplus
Fl_DerivedGl_Window::Fl_DerivedGl_Window(int X, int Y, int W, int H, const char *l, fl_Gl_Window_Virtual_Funcs* funcs) : Fl_Gl_Window(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedGl_Window::Fl_DerivedGl_Window(int X, int Y, int W, int H, fl_Gl_Window_Virtual_Funcs* funcs):Fl_Gl_Window(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedGl_Window::Fl_DerivedGl_Window(int W, int H, const char *l, fl_Gl_Window_Virtual_Funcs* funcs) : Fl_Gl_Window(W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedGl_Window::Fl_DerivedGl_Window(int W, int H, fl_Gl_Window_Virtual_Funcs* funcs):Fl_Gl_Window(W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedGl_Window::~Fl_DerivedGl_Window(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedGl_Window::get_other_data(){
  return this->other_data;
}
void Fl_DerivedGl_Window::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedGl_Window::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Gl_Window) this);
  }
}
void Fl_DerivedGl_Window::draw_box(){
  Fl_Gl_Window::draw_box();
}
void Fl_DerivedGl_Window::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Gl_Window::draw_box(t,c);
}
void Fl_DerivedGl_Window::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Gl_Window::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedGl_Window::draw_backdrop(){
  Fl_Gl_Window::draw_backdrop();
}
void Fl_DerivedGl_Window::draw_focus(){
  Fl_Gl_Window::draw_focus();
}
void Fl_DerivedGl_Window::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Gl_Window::draw_focus(t,x,y,w,h);
}
void Fl_DerivedGl_Window::draw_label(){
  Fl_Gl_Window::draw_label();
}
void Fl_DerivedGl_Window::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Gl_Window::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedGl_Window::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Gl_Window) this,event);
  }
  else {
    i = Fl_Gl_Window::handle(event);
  }
  return i;
}
void Fl_DerivedGl_Window::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Gl_Window) this,x,y,w,h);
  }
  else {
    Fl_Gl_Window::resize(x,y,w,h);
  }
}
void Fl_DerivedGl_Window::resize_super(int x, int y, int w, int h){
  Fl_Gl_Window::resize(x,y,w,h);
}

void Fl_DerivedGl_Window::flush(){
  if (this->overriddenFuncs->flush != NULL) {
    this->overriddenFuncs->flush((fl_Gl_Window) this);
  }
  else {
    Fl_Gl_Window::flush();
  }
}
void Fl_DerivedGl_Window::flush_super(){
  Fl_Gl_Window::flush();
}

void Fl_DerivedGl_Window::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Gl_Window) this);
  }
  else {
    Fl_Gl_Window::show();
  }
}
void Fl_DerivedGl_Window::show_super(){
  Fl_Gl_Window::show();
}
void Fl_DerivedGl_Window::show(int argc, char** argv){
  Fl_Gl_Window::show(argc,argv);
}
void Fl_DerivedGl_Window::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Gl_Window) this);
  }
  else {
    Fl_Gl_Window::hide();
  }
}
void Fl_DerivedGl_Window::hide_super(){
  Fl_Gl_Window::hide();
}
void Fl_DerivedGl_Window::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Gl_Window) this);
  }
  else {
    Fl_Gl_Window::draw();
  }
}
void Fl_DerivedGl_Window::draw_super(){
  Fl_Gl_Window::draw();
}
Fl_Group* Fl_DerivedGl_Window::as_group(){
  Fl_Group* grp;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    grp = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Gl_Window) this)));
  }
  else {
    grp = Fl_Gl_Window::as_group();
  }
  return grp;
}
Fl_Group* Fl_DerivedGl_Window::as_group_super(){
  return  Fl_Gl_Window::as_group();
}
Fl_Window* Fl_DerivedGl_Window::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Gl_Window) this)));
  }
  else {
    win = Fl_Gl_Window::as_window();
  }
  return win;
}
Fl_Window* Fl_DerivedGl_Window::as_window_super(){
  return Fl_Gl_Window::as_window();
}
Fl_Gl_Window* Fl_DerivedGl_Window::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Gl_Window) this)));
  }
  else {
    win = Fl_Gl_Window::as_gl_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedGl_Window::as_gl_window_super(){
  return Fl_Gl_Window::as_gl_window();
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Gl_Window_Virtual_Funcs*, Fl_Gl_Window_default_virtual_funcs)(){
    fl_Gl_Window_Virtual_Funcs* ptr = (fl_Gl_Window_Virtual_Funcs*)malloc(sizeof(fl_Gl_Window_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_gl_window = NULL;
    ptr->as_window = NULL;
    ptr->flush = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Gl_Window_handle)(fl_Gl_Window self, int event){
    return (static_cast<Fl_DerivedGl_Window*>(self))->handle(event);
  }
  FL_EXPORT_C(int,Fl_Gl_Window_handle_super)(fl_Gl_Window self, int event){
    return (static_cast<Fl_DerivedGl_Window*>(self))->Fl_Gl_Window::handle(event);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_draw_super)(fl_Gl_Window self){
    (static_cast<Fl_DerivedGl_Window*>(self))->draw_super();
  }
  FL_EXPORT_C(fl_Group,Fl_Gl_Window_parent)(fl_Gl_Window win){
    return (fl_Group) (static_cast<Fl_DerivedGl_Window*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_parent)(fl_Gl_Window win,fl_Group grp){
    (static_cast<Fl_DerivedGl_Window*>(win))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Gl_Window_type)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_type)(fl_Gl_Window win,uchar t){
    (static_cast<Fl_DerivedGl_Window*>(win))->type(t);
  }

FL_EXPORT_C(void, Fl_Gl_Window_draw_box)(fl_Gl_Window Gl_Window){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_box();
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_box_with_tc)(fl_Gl_Window Gl_Window,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_box_with_txywhc)(fl_Gl_Window Gl_Window,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_backdrop)(fl_Gl_Window Gl_Window){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_focus)(fl_Gl_Window Gl_Window){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_focus();
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_focus_with_txywh)(fl_Gl_Window Gl_Window,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Gl_Window_draw_label)(fl_Gl_Window Gl_Window){
 (static_cast<Fl_DerivedGl_Window*>(Gl_Window))->draw_label();
}
  FL_EXPORT_C(int,Fl_Gl_Window_x)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_y)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_w)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_h)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_align)(fl_Gl_Window gl_window, Fl_Align alignment){
    (static_cast<Fl_DerivedGl_Window*>(gl_window))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Gl_Window_align)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Gl_Window_box)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_box)(fl_Gl_Window win,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedGl_Window*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Gl_Window_color)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_color)(fl_Gl_Window win,Fl_Color bg){
    (static_cast<Fl_DerivedGl_Window*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_color_with_bg_sel)(fl_Gl_Window win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedGl_Window*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Gl_Window_selection_color)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_selection_color)(fl_Gl_Window win,Fl_Color a){
    (static_cast<Fl_DerivedGl_Window*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Gl_Window_label)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_copy_label)(fl_Gl_Window win,const char* new_label){
    (static_cast<Fl_DerivedGl_Window*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_label)(fl_Gl_Window win,const char* text){
    (static_cast<Fl_DerivedGl_Window*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Gl_Window_labeltype)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_labeltype)(fl_Gl_Window win,Fl_Labeltype a){
    (static_cast<Fl_DerivedGl_Window*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_labelcolor)(fl_Gl_Window win,Fl_Color c){
    (static_cast<Fl_DerivedGl_Window*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Gl_Window_labelcolor)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Gl_Window_labelfont)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_labelfont)(fl_Gl_Window win,Fl_Font c){
    (static_cast<Fl_DerivedGl_Window*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Gl_Window_labelsize)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_labelsize)(fl_Gl_Window win,Fl_Fontsize pix){
    (static_cast<Fl_DerivedGl_Window*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Gl_Window_image)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_image)(fl_Gl_Window win,fl_Image pix){
    (static_cast<Fl_DerivedGl_Window*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Gl_Window_deimage)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_deimage)(fl_Gl_Window win,fl_Image pix){
    (static_cast<Fl_DerivedGl_Window*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Gl_Window_tooltip)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_copy_tooltip)(fl_Gl_Window win,const char* text){
    (static_cast<Fl_DerivedGl_Window*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_tooltip)(fl_Gl_Window win,const char* text){
    (static_cast<Fl_DerivedGl_Window*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_callback_with_user_data)(fl_Gl_Window win,fl_Callback* cb,void* p){
    Fl_DerivedGl_Window* castedGl_Window = (static_cast<Fl_DerivedGl_Window*>(win));
    new C_to_Fl_Callback(castedGl_Window, cb, p);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_callback)(fl_Gl_Window win,fl_Callback* cb){
    Fl_DerivedGl_Window* castedGl_Window = (static_cast<Fl_DerivedGl_Window*>(win));
    new C_to_Fl_Callback(castedGl_Window, cb);
  }
  FL_EXPORT_C(void*,Fl_Gl_Window_user_data)(fl_Gl_Window win){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedGl_Window*>(win))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedGl_Window*>(win))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_user_data)(fl_Gl_Window win,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Gl_Window*>(win))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Gl_Window*>(win))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Gl_Window*>(win))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Gl_Window_argument)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_argument)(fl_Gl_Window win,long v){
    (static_cast<Fl_DerivedGl_Window*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Gl_Window_when)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_when)(fl_Gl_Window win,uchar i){
    (static_cast<Fl_DerivedGl_Window*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_visible)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_visible_r)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_visible)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_visible)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_active)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_active_r)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_activate)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_deactivate)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_output)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_output)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_output)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_takesevents)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_changed)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_changed)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_take_focus)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_visible_focus)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_visible_focus)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_modify_visible_focus)(fl_Gl_Window win,int v){
    (static_cast<Fl_DerivedGl_Window*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_visible_focus)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_do_callback)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_do_callback_with_widget_and_user_data)(fl_Gl_Window win,fl_Widget w,long arg){
    (static_cast<Fl_DerivedGl_Window*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_do_callback_with_widget_and_default_user_data)(fl_Gl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedGl_Window*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Gl_Window_contains)(fl_Gl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedGl_Window*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Gl_Window_inside)(fl_Gl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedGl_Window*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_redraw)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_redraw_label)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Gl_Window_damage)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_damage_with_bitmask)(fl_Gl_Window win,uchar c){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_damage)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_damage_with_text)(fl_Gl_Window win,uchar c){
    (static_cast<Fl_DerivedGl_Window*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_damage_inside_widget)(fl_Gl_Window win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedGl_Window*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_draw_label_with_xywh_alignment)(fl_Gl_Window win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedGl_Window*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_measure_label)(fl_Gl_Window win,int* ww,int* hh){
    (static_cast<Fl_DerivedGl_Window*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Group,Fl_Gl_Window_as_group)(fl_Gl_Window win){
    return (fl_Group) (static_cast<Fl_DerivedGl_Window*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Gl_Window_as_group_super)(fl_Gl_Window win){
    return (fl_Group) (static_cast<Fl_DerivedGl_Window*>(win))->as_group_super();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_window)(fl_Gl_Window win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGl_Window*>(win))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_window_super)(fl_Gl_Window win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGl_Window*>(win))->as_window_super();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_gl_window)(fl_Gl_Window win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGl_Window*>(win))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_gl_window_super)(fl_Gl_Window win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGl_Window*>(win))->as_gl_window_super();
  }
  FL_EXPORT_C(fl_Gl_Window,    Fl_Gl_Window_window)(fl_Gl_Window gl_window){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGl_Window*>(gl_window))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Gl_Window_top_window)(fl_Gl_Window gl_window){
    return (fl_Window) (static_cast<Fl_DerivedGl_Window*>(gl_window))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Gl_Window_top_window_offset)(fl_Gl_Window gl_window, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedGl_Window*>(gl_window))->top_window_offset(*xoff,*yoff);
  }

  FL_EXPORT_C(void,Fl_Gl_Window_begin)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_end)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_find)(fl_Gl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedGl_Window*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_add)(fl_Gl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedGl_Window*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_insert)(fl_Gl_Window win,fl_Widget w,int i){
    (static_cast<Fl_DerivedGl_Window*>(win))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_remove_index)(fl_Gl_Window win,int index){
    (static_cast<Fl_DerivedGl_Window*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_remove_widget)(fl_Gl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedGl_Window*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_resizable_by_reference)(fl_Gl_Window win,fl_Widget o){
    (static_cast<Fl_DerivedGl_Window*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_resizable)(fl_Gl_Window win,fl_Widget o){
    (static_cast<Fl_DerivedGl_Window*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Gl_Window_resizable)(fl_Gl_Window win){
    return (fl_Widget)(static_cast<Fl_DerivedGl_Window*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_add_resizable)(fl_Gl_Window win,fl_Widget o){
    return (static_cast<Fl_DerivedGl_Window*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Gl_Window_init_sizes)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_children)(fl_Gl_Window self){
    return (static_cast<Fl_DerivedGl_Window*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_clip_children)(fl_Gl_Window win,int c){
    return (static_cast<Fl_DerivedGl_Window*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_clip_children)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_focus)(fl_Gl_Window win, fl_Widget W){
    return (static_cast<Fl_DerivedGl_Window*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Gl_Window__ddfdesign_kludge)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Gl_Window_insert_with_before)(fl_Gl_Window self, fl_Widget w, fl_Widget before){
    (static_cast<Fl_DerivedGl_Window*>(self))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Gl_Window_array)(fl_Gl_Window self){
    return (fl_Widget*)(static_cast<Fl_DerivedGl_Window*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Gl_Window_child)(fl_Gl_Window self, int n){
    return (fl_Widget)(static_cast<Fl_DerivedGl_Window*>(self))->child(n);
  }
  // FL_EXPORT_C(void,Fl_Gl_Window_forms_end)(fl_Gl_Window win){
  //   return (static_cast<Fl_DerivedGl_Window*>(win))->forms_end();
  // }
  FL_EXPORT_C(void*, Fl_Gl_Window_other_data)(fl_Gl_Window gl_window){
    return (static_cast<Fl_DerivedGl_Window*>(gl_window))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Gl_Window_set_other_data)(fl_Gl_Window gl_window, void* v){
    (static_cast<Fl_DerivedGl_Window*>(gl_window))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_New_WithLabel)(int w, int h, const char* title) {
    fl_Gl_Window_Virtual_Funcs* funcs = Fl_Gl_Window_default_virtual_funcs();
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(w,h,title,funcs);
    return (static_cast<fl_Gl_Window>(gl_window));
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_New_WithLabel)(int w, int h, const char* title, fl_Gl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(w,h,title,funcs);
    return (static_cast<fl_Gl_Window>(gl_window));
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_New)(int w, int h) {
    fl_Gl_Window_Virtual_Funcs* funcs = Fl_Gl_Window_default_virtual_funcs();
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(w,h,0,funcs);
    return (fl_Gl_Window)gl_window;
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_New)(int w, int h,fl_Gl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(w,h,0,funcs);
    return (fl_Gl_Window)gl_window;
  }
FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title) {
    fl_Gl_Window_Virtual_Funcs* funcs = Fl_Gl_Window_default_virtual_funcs();
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(x,y,w,h,title,funcs);
    return (fl_Gl_Window)gl_window;
  }
FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title,fl_Gl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(x,y,w,h,title,funcs);
    return (fl_Gl_Window)gl_window;
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_NewXY)(int x, int y, int w, int h) {
    fl_Gl_Window_Virtual_Funcs* funcs = Fl_Gl_Window_default_virtual_funcs();
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(x,y,w,h,0,funcs);
    return (fl_Gl_Window)gl_window;
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_NewXY)(int x, int y, int w, int h,fl_Gl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedGl_Window* gl_window = new Fl_DerivedGl_Window(x,y,w,h,0,funcs);
    return (fl_Gl_Window)gl_window;
  }
  FL_EXPORT_C(void, Fl_Gl_Window_Destroy)(fl_Gl_Window gl_window){
    delete (static_cast<Fl_DerivedGl_Window*>(gl_window));
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_changed)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_fullscreen)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->fullscreen();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_fullscreen_off)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->fullscreen_off();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_fullscreen_off_with_resize)(fl_Gl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedGl_Window*>(win))->fullscreen_off(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hide)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->hide();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hide_super)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->hide_super();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_flush)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->flush();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_flush_super)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->flush_super();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_show)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->show();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_show_super)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->show_super();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_show_with_args)(fl_Gl_Window win,int argc,char** argv){
    (static_cast<Fl_DerivedGl_Window*>(win))->show(argc,argv);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_resize)(fl_Gl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedGl_Window*>(win))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_resize_super)(fl_Gl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedGl_Window*>(win))->resize_super(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_iconize)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->iconize();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_border)(fl_Gl_Window win,int b){
    (static_cast<Fl_DerivedGl_Window*>(win))->border(b);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_clear_border)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->clear_border();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_border)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->border();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_override)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_override();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_override)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->override();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_modal)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_modal)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->modal();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_non_modal)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_non_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_non_modal)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->non_modal();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_menu_window)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_menu_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_menu_window)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->menu_window();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_tooltip_window)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->set_tooltip_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_tooltip_window)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->tooltip_window();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hotspot_with_x_y)(fl_Gl_Window win,int x,int y){
    (static_cast<Fl_DerivedGl_Window*>(win))->hotspot(x,y,0);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hotspot_with_x_y_with_offscreen)(fl_Gl_Window win,int x,int y,int offscreen){
    (static_cast<Fl_DerivedGl_Window*>(win))->hotspot(x,y,offscreen);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hotspot_with_widget)(fl_Gl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedGl_Window*>(win))->hotspot((static_cast<Fl_Widget*>(w)),0);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hotspot_with_widget_with_offscreen)(fl_Gl_Window win,fl_Widget w,int offscreen){
    (static_cast<Fl_DerivedGl_Window*>(win))->hotspot((static_cast<Fl_Widget*>(w)),offscreen);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_free_position)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->free_position();
  }
  FL_EXPORT_C(fl_Window_size_range_args*,Fl_Gl_Window_default_size_range_args)(){
    fl_Window_size_range_args* ptr = (fl_Window_size_range_args*)malloc(sizeof(fl_Window_size_range_args));
    ptr->maxw = 0;
    ptr->maxh = 0;
    ptr->dw = 0;
    ptr->dh = 0;
    ptr->aspect = 0;
    return ptr;
  }
  FL_EXPORT_C(void,Fl_Gl_Window_size_range)(fl_Gl_Window win,int minw,int minh){
    fl_Window_size_range_args* ptr = Fl_Gl_Window_default_size_range_args();
    (static_cast<Fl_DerivedGl_Window*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_size_range_with_args)(fl_Gl_Window win,int minw,int minh,fl_Window_size_range_args* ptr){
    (static_cast<Fl_DerivedGl_Window*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(const char*,Fl_Gl_Window_iconlabel)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->iconlabel();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_iconlabel)(fl_Gl_Window win,const char* label){
    (static_cast<Fl_DerivedGl_Window*>(win))->iconlabel(label);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_label_with_iconlabel)(fl_Gl_Window win,const char* label,const char* iconlabel){
    (static_cast<Fl_DerivedGl_Window*>(win))->label(label,iconlabel);
  }
  FL_EXPORT_C(const char*,Fl_Gl_Window_xclass)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->xclass();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_xclass)(fl_Gl_Window win,const char* c){
    (static_cast<Fl_DerivedGl_Window*>(win))->xclass(c);
  }
  FL_EXPORT_C(const void*,Fl_Gl_Window_icon)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->icon();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_icon)(fl_Gl_Window win,const void * ic){
    (static_cast<Fl_DerivedGl_Window*>(win))->icon(ic);
  }
  FL_EXPORT_C(int,Fl_Gl_Window_shown)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->shown();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_x_root)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->x_root();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_y_root)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->y_root();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_make_current)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->make_current();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_cursor_with_bg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_DerivedGl_Window*>(win))->cursor(cursor,FL_BLACK, bg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_cursor_with_fg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_DerivedGl_Window*>(win))->cursor(cursor,fg,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_cursor_with_fg_bg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_DerivedGl_Window*>(win))->cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_cursor)(fl_Gl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_DerivedGl_Window*>(win))->cursor(cursor,FL_BLACK,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_default_cursor_with_bg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_DerivedGl_Window*>(win))->default_cursor(cursor,bg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_default_cursor_with_fg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_DerivedGl_Window*>(win))->default_cursor(cursor,fg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_default_cursor_with_fg_bg)(fl_Gl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_DerivedGl_Window*>(win))->default_cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_default_cursor)(fl_Gl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_DerivedGl_Window*>(win))->default_cursor(cursor);
  }
  FL_EXPORT_C(int,Fl_Gl_Window_decorated_w)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->decorated_w();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_decorated_h)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->decorated_h();
  }
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_xclass)(const char* label){
    Fl_Gl_Window::default_xclass(label);
  }
  FL_EXPORT_C(const char*, Fl_Gl_Window_default_xclass)(){
    return Fl_Gl_Window::default_xclass();
  }
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_current)(){
    return (fl_Gl_Window)Fl_Gl_Window::current();
  }
  FL_EXPORT_C(void, Fl_Gl_Window_default_callback)(fl_Gl_Window win, void* v){
    Fl_Gl_Window::default_callback((static_cast<Fl_DerivedGl_Window*>(win)), v);
  }
  FL_EXPORT_C(char,Fl_Gl_Window_valid)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->valid();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_valid)(fl_Gl_Window win, char valid) {
    (static_cast<Fl_DerivedGl_Window*>(win))->valid(valid);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_invalidate)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->invalidate();
  }
  FL_EXPORT_C(char,Fl_Gl_Window_context_valid)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->context_valid();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_context_valid)(fl_Gl_Window win,char v){
    (static_cast<Fl_DerivedGl_Window*>(win))->context_valid(v);
  }
  FL_EXPORT_C(int,Fl_Gl_Window_can_do_with_m)(int m){
    return Fl_DerivedGl_Window::can_do(m);
  }
  FL_EXPORT_C(int,Fl_Gl_Window_can_do)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->can_do();
  }
  FL_EXPORT_C(Fl_Mode,Fl_Gl_Window_mode)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->mode();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_set_mode)(fl_Gl_Window win,int a){
    return (static_cast<Fl_DerivedGl_Window*>(win))->mode(a);
  }
  FL_EXPORT_C(void*,Fl_Gl_Window_context)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->context();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_context)(fl_Gl_Window win,void* context){
    (static_cast<Fl_DerivedGl_Window*>(win))->context(context);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_set_context_with_destroy_flag)(fl_Gl_Window win,void* context, int flag){
    (static_cast<Fl_DerivedGl_Window*>(win))->context(context, flag);
  }
  FL_EXPORT_C(void,Fl_Gl_Window_swap_buffers)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->swap_buffers();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_ortho)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->ortho();
  }
  FL_EXPORT_C(int,Fl_Gl_Window_can_do_overlay)(fl_Gl_Window win){
    return (static_cast<Fl_DerivedGl_Window*>(win))->can_do_overlay();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_redraw_overlay)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->redraw_overlay();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_hide_overlay)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->hide_overlay();
  }
  FL_EXPORT_C(void,Fl_Gl_Window_make_overlay_current)(fl_Gl_Window win){
    (static_cast<Fl_DerivedGl_Window*>(win))->make_overlay_current();
  }
#ifdef __cplusplus
}
#endif
