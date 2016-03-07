#include "Fl_WindowC.h"

#ifdef __cplusplus
Fl_DerivedWindow::Fl_DerivedWindow(int X, int Y, int W, int H, const char *l, fl_Window_Virtual_Funcs* funcs) : Fl_Window(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedWindow::Fl_DerivedWindow(int X, int Y, int W, int H, fl_Window_Virtual_Funcs* funcs):Fl_Window(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedWindow::Fl_DerivedWindow(int W, int H, const char *l, fl_Window_Virtual_Funcs* funcs) : Fl_Window(W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedWindow::Fl_DerivedWindow(int W, int H, fl_Window_Virtual_Funcs* funcs):Fl_Window(W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedWindow::~Fl_DerivedWindow(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedWindow::get_other_data(){
  return this->other_data;
}
void Fl_DerivedWindow::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedWindow::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Window) this);
  }
}
void Fl_DerivedWindow::draw_box(){
  Fl_Window::draw_box();
}
void Fl_DerivedWindow::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Window::draw_box(t,c);
}
void Fl_DerivedWindow::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Window::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedWindow::draw_backdrop(){
  Fl_Window::draw_backdrop();
}
void Fl_DerivedWindow::draw_focus(){
  Fl_Window::draw_focus();
}
void Fl_DerivedWindow::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Window::draw_focus(t,x,y,w,h);
}
void Fl_DerivedWindow::draw_label(){
  Fl_Window::draw_label();
}
void Fl_DerivedWindow::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Window::draw_label(x,y,w,h,alignment);
}
void Fl_DerivedWindow::draw_child(Fl_Widget* widget){
  Fl_Window::draw_child(*widget);
}
void Fl_DerivedWindow::draw_children(){
  Fl_Window::draw_children();
}
void Fl_DerivedWindow::draw_outside_label(Fl_Widget* widget){
  Fl_Window::draw_outside_label(*widget);
}
void Fl_DerivedWindow::update_child(Fl_Widget* widget){
  Fl_Window::update_child(*widget);
}
int* Fl_DerivedWindow:: sizes(){
  return Fl_Window::sizes();
}
int Fl_DerivedWindow::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Window) this,event);
  }
  else {
    i = Fl_Window::handle(event);
  }
  return i;
}
Fl_Group* Fl_DerivedWindow::as_group(){
  Fl_Group* i;
  if (this->overriddenFuncs->as_group != NULL) {
    i = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Window) this)));
  }
  else {
    i = Fl_Window::as_group();
  }
  return i;
}
void Fl_DerivedWindow::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Window) this,x,y,w,h);
  }
  else {
    Fl_Window::resize(x,y,w,h);
  }
}

void Fl_DerivedWindow::flush(){
  if (this->overriddenFuncs->flush != NULL) {
    this->overriddenFuncs->flush((fl_Window) this);
  }
  else {
    Fl_Window::flush();
  }
}
void Fl_DerivedWindow::flush_super(){
  Fl_Window::flush();
}

void Fl_DerivedWindow::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Window) this);
  }
  else {
    Fl_Window::show();
  }
}
void Fl_DerivedWindow::show_super(){
  Fl_Window::show();
}
void Fl_DerivedWindow::show(int argc, char** argv){
  Fl_Window::show(argc,argv);
}
void Fl_DerivedWindow::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Window) this);
  }
  else {
    Fl_Window::hide();
  }
}
void Fl_DerivedWindow::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Window) this);
  }
  else {
    Fl_Window::draw();
  }
}
void Fl_DerivedWindow::draw_super(){
  Fl_Window::draw();
}
Fl_Window* Fl_DerivedWindow::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Window) this)));
  }
  else {
    win = Fl_Window::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedWindow::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Window) this)));
  }
  else {
    win = Fl_Window::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Window_Virtual_Funcs*, Fl_Window_default_virtual_funcs)(){
    fl_Window_Virtual_Funcs* ptr = (fl_Window_Virtual_Funcs*)malloc(sizeof(fl_Window_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    ptr->flush = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Window_handle)(fl_Window self, int event){
    return (static_cast<Fl_DerivedWindow*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Window_parent)(fl_Window win){
    return (fl_Group) (static_cast<Fl_DerivedWindow*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Window_set_parent)(fl_Window win,fl_Group grp){
    (static_cast<Fl_DerivedWindow*>(win))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Window_type)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Window_set_type)(fl_Window win,uchar t){
    (static_cast<Fl_DerivedWindow*>(win))->type(t);
  }

FL_EXPORT_C(void, Fl_Window_draw_box)(fl_Window Window){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_box();
}
FL_EXPORT_C(void, Fl_Window_draw_box_with_tc)(fl_Window Window,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Window_draw_box_with_txywhc)(fl_Window Window,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Window_draw_backdrop)(fl_Window Window){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Window_draw_focus)(fl_Window Window){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_focus();
}
FL_EXPORT_C(void, Fl_Window_draw_focus_with_txywh)(fl_Window Window,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Window_draw_label)(fl_Window Window){
 (static_cast<Fl_DerivedWindow*>(Window))->draw_label();
}
  FL_EXPORT_C(int,Fl_Window_x)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Window_y)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Window_w)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Window_h)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Window_set_align)(fl_Window window, Fl_Align alignment){
    (static_cast<Fl_DerivedWindow*>(window))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Window_align)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Window_box)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Window_set_box)(fl_Window win,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedWindow*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Window_color)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Window_set_color)(fl_Window win,Fl_Color bg){
    (static_cast<Fl_DerivedWindow*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_color_with_bg_sel)(fl_Window win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedWindow*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Window_selection_color)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Window_set_selection_color)(fl_Window win,Fl_Color a){
    (static_cast<Fl_DerivedWindow*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Window_label)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Window_copy_label)(fl_Window win,const char* new_label){
    (static_cast<Fl_DerivedWindow*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Window_set_label)(fl_Window win,const char* text){
    (static_cast<Fl_DerivedWindow*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Window_labeltype)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Window_set_labeltype)(fl_Window win,Fl_Labeltype a){
    (static_cast<Fl_DerivedWindow*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Window_set_labelcolor)(fl_Window win,Fl_Color c){
    (static_cast<Fl_DerivedWindow*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Window_labelcolor)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Window_labelfont)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Window_set_labelfont)(fl_Window win,Fl_Font c){
    (static_cast<Fl_DerivedWindow*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Window_labelsize)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Window_set_labelsize)(fl_Window win,Fl_Fontsize pix){
    (static_cast<Fl_DerivedWindow*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Window_image)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Window_set_image)(fl_Window win,fl_Image pix){
    (static_cast<Fl_DerivedWindow*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Window_deimage)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Window_set_deimage)(fl_Window win,fl_Image pix){
    (static_cast<Fl_DerivedWindow*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Window_tooltip)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Window_copy_tooltip)(fl_Window win,const char* text){
    (static_cast<Fl_DerivedWindow*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Window_set_tooltip)(fl_Window win,const char* text){
    (static_cast<Fl_DerivedWindow*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Window_set_callback_with_user_data)(fl_Window win,fl_Callback* cb,void* p){
    Fl_DerivedWindow* castedWindow = (static_cast<Fl_DerivedWindow*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Window_set_callback)(fl_Window win,fl_Callback* cb){
    Fl_DerivedWindow* castedWindow = (static_cast<Fl_DerivedWindow*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Window_user_data)(fl_Window win){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedWindow*>(win))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedWindow*>(win))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Window_set_user_data)(fl_Window win,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Window*>(win))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Window*>(win))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Window*>(win))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Window_argument)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Window_set_argument)(fl_Window win,long v){
    (static_cast<Fl_DerivedWindow*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Window_when)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Window_set_when)(fl_Window win,uchar i){
    (static_cast<Fl_DerivedWindow*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_visible)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Window_visible_r)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Window_set_visible)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Window_clear_visible)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_active)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Window_active_r)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Window_activate)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Window_deactivate)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_output)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Window_set_output)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Window_clear_output)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_takesevents)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Window_set_changed)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Window_clear_changed)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Window_take_focus)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Window_set_visible_focus)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_clear_visible_focus)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_modify_visible_focus)(fl_Window win,int v){
    (static_cast<Fl_DerivedWindow*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_visible_focus)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_do_callback)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Window_do_callback_with_widget_and_user_data)(fl_Window win,fl_Widget w,long arg){
    (static_cast<Fl_DerivedWindow*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Window_do_callback_with_widget_and_default_user_data)(fl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedWindow*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Window_contains)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedWindow*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Window_inside)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedWindow*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_redraw)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Window_redraw_label)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Window_damage)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Window_clear_damage_with_bitmask)(fl_Window win,uchar c){
    (static_cast<Fl_DerivedWindow*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Window_clear_damage)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Window_damage_with_text)(fl_Window win,uchar c){
    (static_cast<Fl_DerivedWindow*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Window_damage_inside_widget)(fl_Window win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedWindow*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Window_draw_label_with_xywh_alignment)(fl_Window win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedWindow*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Window_measure_label)(fl_Window win,int* ww,int* hh){
    (static_cast<Fl_DerivedWindow*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Group,Fl_Window_as_group)(fl_Window win){
    return (fl_Group) (static_cast<Fl_DerivedWindow*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Window_as_gl_window)(fl_Window win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedWindow*>(win))->as_gl_window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Window_window)(fl_Window window){
    return (fl_Window) (static_cast<Fl_DerivedWindow*>(window))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Window_top_window)(fl_Window window){
    return (fl_Window) (static_cast<Fl_DerivedWindow*>(window))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Window_top_window_offset)(fl_Window window, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedWindow*>(window))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(void, Fl_Window_draw_child)(fl_Window Window,fl_Widget widget){
    (static_cast<Fl_DerivedWindow*>(Window))->draw_child(static_cast<Fl_Widget*>(widget));
  }
  FL_EXPORT_C(void, Fl_Window_draw_children)(fl_Window Window){
    (static_cast<Fl_DerivedWindow*>(Window))->draw_children();
  }
  FL_EXPORT_C(void, Fl_Window_draw_outside_label)(fl_Window Window,fl_Widget widget){
    (static_cast<Fl_DerivedWindow*>(Window))->draw_outside_label(static_cast<Fl_Widget*>(widget));
  }
  FL_EXPORT_C(void, Fl_Window_update_child)(fl_Window Window,fl_Widget widget){
    (static_cast<Fl_DerivedWindow*>(Window))->update_child(static_cast<Fl_Widget*>(widget));
  }
  FL_EXPORT_C(int*, Fl_Window_sizes)(fl_Window Window){
    return (static_cast<Fl_DerivedWindow*>(Window))->sizes();
  }
  FL_EXPORT_C(void,Fl_Window_begin)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Window_end)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Window_find)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_DerivedWindow*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Window_add)(fl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedWindow*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_insert)(fl_Window win,fl_Widget w,int i){
    (static_cast<Fl_DerivedWindow*>(win))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Window_remove_index)(fl_Window win,int index){
    (static_cast<Fl_DerivedWindow*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Window_remove_widget)(fl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedWindow*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_clear)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Window_set_resizable_by_reference)(fl_Window win,fl_Widget o){
    (static_cast<Fl_DerivedWindow*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Window_set_resizable)(fl_Window win,fl_Widget o){
    (static_cast<Fl_DerivedWindow*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Window_resizable)(fl_Window win){
    return (fl_Widget)(static_cast<Fl_DerivedWindow*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Window_add_resizable)(fl_Window win,fl_Widget o){
    return (static_cast<Fl_DerivedWindow*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Window_init_sizes)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Window_children)(fl_Window self){
    return (static_cast<Fl_DerivedWindow*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Window_set_clip_children)(fl_Window win,int c){
    return (static_cast<Fl_DerivedWindow*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_clip_children)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Window_focus)(fl_Window win, fl_Widget W){
    return (static_cast<Fl_DerivedWindow*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Window__ddfdesign_kludge)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Window_insert_with_before)(fl_Window self, fl_Widget w, fl_Widget before){
    (static_cast<Fl_DerivedWindow*>(self))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Window_array)(fl_Window self){
    return (fl_Widget*)(static_cast<Fl_DerivedWindow*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Window_child)(fl_Window self, int n){
    return (fl_Widget)(static_cast<Fl_DerivedWindow*>(self))->child(n);
  }
  // FL_EXPORT_C(void,Fl_Window_forms_end)(fl_Window win){
  //   return (static_cast<Fl_DerivedWindow*>(win))->forms_end();
  // }
  FL_EXPORT_C(void*, Fl_Window_other_data)(fl_Window window){
    return (static_cast<Fl_DerivedWindow*>(window))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Window_set_other_data)(fl_Window window, void* v){
    (static_cast<Fl_DerivedWindow*>(window))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Window, Fl_Window_New_WithLabel)(int w, int h, const char* title) {
    fl_Window_Virtual_Funcs* funcs = Fl_Window_default_virtual_funcs();
    Fl_DerivedWindow* window = new Fl_DerivedWindow(w,h,title,funcs);
    return (static_cast<fl_Window>(window));
  }
  FL_EXPORT_C(fl_Window, Fl_OverriddenWindow_New_WithLabel)(int w, int h, const char* title, fl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedWindow* window = new Fl_DerivedWindow(w,h,title,funcs);
    return (static_cast<fl_Window>(window));
  }
  FL_EXPORT_C(fl_Window, Fl_Window_New)(int w, int h) {
    fl_Window_Virtual_Funcs* funcs = Fl_Window_default_virtual_funcs();
    Fl_DerivedWindow* window = new Fl_DerivedWindow(w,h,0,funcs);
    return (fl_Window)window;
  }
  FL_EXPORT_C(fl_Window, Fl_OverriddenWindow_New)(int w, int h,fl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedWindow* window = new Fl_DerivedWindow(w,h,0,funcs);
    return (fl_Window)window;
  }
FL_EXPORT_C(fl_Window, Fl_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title) {
    fl_Window_Virtual_Funcs* funcs = Fl_Window_default_virtual_funcs();
    Fl_DerivedWindow* window = new Fl_DerivedWindow(x,y,w,h,title,funcs);
    return (fl_Window)window;
  }
FL_EXPORT_C(fl_Window, Fl_OverriddenWindow_NewXY_WithLabel)(int x, int y, int w, int h, const char* title,fl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedWindow* window = new Fl_DerivedWindow(x,y,w,h,title,funcs);
    return (fl_Window)window;
  }
  FL_EXPORT_C(fl_Window, Fl_Window_NewXY)(int x, int y, int w, int h) {
    fl_Window_Virtual_Funcs* funcs = Fl_Window_default_virtual_funcs();
    Fl_DerivedWindow* window = new Fl_DerivedWindow(x,y,w,h,0,funcs);
    return (fl_Window)window;
  }
  FL_EXPORT_C(fl_Window, Fl_OverriddenWindow_NewXY)(int x, int y, int w, int h,fl_Window_Virtual_Funcs* funcs) {
    Fl_DerivedWindow* window = new Fl_DerivedWindow(x,y,w,h,0,funcs);
    return (fl_Window)window;
  }
  FL_EXPORT_C(void, Fl_Window_Destroy)(fl_Window window){
    delete (static_cast<Fl_DerivedWindow*>(window));
  }
  FL_EXPORT_C(void, Fl_Window_draw_super)(fl_Window window){
    (static_cast<Fl_DerivedWindow*>(window))->draw_super();
  };
  FL_EXPORT_C(int,  Fl_Window_handle_super)(fl_Window window, int event){
    return (static_cast<Fl_Window*>(window))->Fl_Window::handle(event);
  };
  FL_EXPORT_C(fl_Group,  Fl_Window_as_group_super)(fl_Window window){
    return (fl_Group)(static_cast<Fl_Window*>(window))->Fl_Window::as_group();
  };
  FL_EXPORT_C(void, Fl_Window_resize_super)(fl_Window window, int x, int y, int w, int h){
    (static_cast<Fl_Window*>(window))->Fl_Window::resize(x, y, w, h);
  };
  FL_EXPORT_C(void, Fl_Window_show_super)(fl_Window window){
    (static_cast<Fl_Window*>(window))->Fl_Window::show();
  };
  FL_EXPORT_C(void, Fl_Window_hide_super)(fl_Window window){
    (static_cast<Fl_Window*>(window))->Fl_Window::hide();
  };
  FL_EXPORT_C(void, Fl_Window_flush_super)(fl_Window window){
    (static_cast<Fl_DerivedWindow*>(window))->flush_super();
  };
  FL_EXPORT_C(fl_Window, Fl_Window_as_window_super)(fl_Window window){
    return (fl_Window)(static_cast<Fl_Window*>(window))->as_window();
  };
  FL_EXPORT_C(fl_Window, Fl_Window_as_window)(fl_Window window){
    return (fl_Window)(static_cast<Fl_DerivedWindow*>(window))->as_window();
  };
  FL_EXPORT_C(fl_Gl_Window, Fl_Window_as_gl_window_super)(fl_Window window){
    return (fl_Gl_Window)(static_cast<Fl_Window*>(window))->as_gl_window();
  };
  FL_EXPORT_C(unsigned int,Fl_Window_changed)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->fullscreen();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen_off)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->fullscreen_off();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen_off_with_resize)(fl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedWindow*>(win))->fullscreen_off(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Window_hide)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->hide();
  }
  FL_EXPORT_C(void,Fl_Window_show)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->show();
  }
  FL_EXPORT_C(void,Fl_Window_show_with_args)(fl_Window win,int argc,char** argv){
    (static_cast<Fl_DerivedWindow*>(win))->show(argc,argv);
  }
  FL_EXPORT_C(void,Fl_Window_resize)(fl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedWindow*>(win))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Window_iconize)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->iconize();
  }
  FL_EXPORT_C(void,Fl_Window_set_border)(fl_Window win,int b){
    (static_cast<Fl_DerivedWindow*>(win))->border(b);
  }
  FL_EXPORT_C(void,Fl_Window_clear_border)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->clear_border();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_border)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->border();
  }
  FL_EXPORT_C(void,Fl_Window_set_override)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_override();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_override)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->override();
  }
  FL_EXPORT_C(void,Fl_Window_set_modal)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_modal)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->modal();
  }
  FL_EXPORT_C(void,Fl_Window_set_non_modal)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_non_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_non_modal)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->non_modal();
  }
  FL_EXPORT_C(void,Fl_Window_set_menu_window)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_menu_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_menu_window)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->menu_window();
  }
  FL_EXPORT_C(void,Fl_Window_set_tooltip_window)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->set_tooltip_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_tooltip_window)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->tooltip_window();
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_x_y)(fl_Window win,int x,int y){
    (static_cast<Fl_DerivedWindow*>(win))->hotspot(x,y,0);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_x_y_with_offscreen)(fl_Window win,int x,int y,int offscreen){
    (static_cast<Fl_DerivedWindow*>(win))->hotspot(x,y,offscreen);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_widget)(fl_Window win,fl_Widget w){
    (static_cast<Fl_DerivedWindow*>(win))->hotspot((static_cast<Fl_Widget*>(w)),0);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_widget_with_offscreen)(fl_Window win,fl_Widget w,int offscreen){
    (static_cast<Fl_DerivedWindow*>(win))->hotspot((static_cast<Fl_Widget*>(w)),offscreen);
  }
  FL_EXPORT_C(void,Fl_Window_free_position)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->free_position();
  }
  FL_EXPORT_C(fl_Window_size_range_args*,Fl_Window_default_size_range_args)(){
    fl_Window_size_range_args* ptr = (fl_Window_size_range_args*)malloc(sizeof(fl_Window_size_range_args));
    ptr->maxw = 0;
    ptr->maxh = 0;
    ptr->dw = 0;
    ptr->dh = 0;
    ptr->aspect = 0;
    return ptr;
  }
  FL_EXPORT_C(void,Fl_Window_size_range)(fl_Window win,int minw,int minh){
    fl_Window_size_range_args* ptr = Fl_Window_default_size_range_args();
    (static_cast<Fl_DerivedWindow*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(void,Fl_Window_size_range_with_args)(fl_Window win,int minw,int minh,fl_Window_size_range_args* ptr){
    (static_cast<Fl_DerivedWindow*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(const char*,Fl_Window_iconlabel)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->iconlabel();
  }
  FL_EXPORT_C(void,Fl_Window_set_iconlabel)(fl_Window win,const char* label){
    (static_cast<Fl_DerivedWindow*>(win))->iconlabel(label);
  }
  FL_EXPORT_C(void,Fl_Window_set_label_with_iconlabel)(fl_Window win,const char* label,const char* iconlabel){
    (static_cast<Fl_DerivedWindow*>(win))->label(label,iconlabel);
  }
  FL_EXPORT_C(const char*,Fl_Window_xclass)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->xclass();
  }
  FL_EXPORT_C(void,Fl_Window_set_xclass)(fl_Window win,const char* c){
    (static_cast<Fl_DerivedWindow*>(win))->xclass(c);
  }
  FL_EXPORT_C(const void*,Fl_Window_icon)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->icon();
  }
  FL_EXPORT_C(void,Fl_Window_set_icon)(fl_Window win,const void * ic){
    (static_cast<Fl_DerivedWindow*>(win))->icon(ic);
  }
  FL_EXPORT_C(int,Fl_Window_shown)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->shown();
  }
  FL_EXPORT_C(int,Fl_Window_x_root)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->x_root();
  }
  FL_EXPORT_C(int,Fl_Window_y_root)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->y_root();
  }
  FL_EXPORT_C(void,Fl_Window_make_current)(fl_Window win){
    (static_cast<Fl_DerivedWindow*>(win))->make_current();
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_DerivedWindow*>(win))->cursor(cursor,FL_BLACK, bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_fg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_DerivedWindow*>(win))->cursor(cursor,fg,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_fg_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_DerivedWindow*>(win))->cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor)(fl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_DerivedWindow*>(win))->cursor(cursor,FL_BLACK,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_DerivedWindow*>(win))->default_cursor(cursor,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_fg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_DerivedWindow*>(win))->default_cursor(cursor,fg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_fg_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_DerivedWindow*>(win))->default_cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor)(fl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_DerivedWindow*>(win))->default_cursor(cursor);
  }
  FL_EXPORT_C(int,Fl_Window_decorated_w)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->decorated_w();
  }
  FL_EXPORT_C(int,Fl_Window_decorated_h)(fl_Window win){
    return (static_cast<Fl_DerivedWindow*>(win))->decorated_h();
  }
  FL_EXPORT_C(void, Fl_Window_set_default_xclass)(const char* label){
    Fl_Window::default_xclass(label);
  }
  FL_EXPORT_C(const char*, Fl_Window_default_xclass)(){
    return Fl_Window::default_xclass();
  }
  FL_EXPORT_C(fl_Window, Fl_Window_current)(){
    return (fl_Window)Fl_Window::current();
  }
  FL_EXPORT_C(void, Fl_Window_default_callback)(fl_Window win, void* v){
    Fl_Window::default_callback((static_cast<Fl_DerivedWindow*>(win)), v);
  }
  FL_EXPORT_C(void, Fl_Window_wait_for_expose)(fl_Window win) {
    return (static_cast<Fl_Window*>(win))->wait_for_expose();
  }
#ifdef __cplusplus
}
#endif
