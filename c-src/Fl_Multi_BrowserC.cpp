#include "Fl_Multi_BrowserC.h"
#ifdef __cplusplus
Fl_DerivedMulti_Browser::Fl_DerivedMulti_Browser(int X, int Y, int W, int H, const char *l, fl_Multi_Browser_Virtual_Funcs* funcs) : Fl_Multi_Browser(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
 }
Fl_DerivedMulti_Browser::Fl_DerivedMulti_Browser(int X, int Y, int W, int H, fl_Multi_Browser_Virtual_Funcs* funcs):Fl_Multi_Browser(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = (void*)0;
}
Fl_DerivedMulti_Browser::~Fl_DerivedMulti_Browser(){
  free(overriddenFuncs);
  free(other_data);
}
void* Fl_DerivedMulti_Browser::get_other_data(){
  return this->other_data;
}
void Fl_DerivedMulti_Browser::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedMulti_Browser::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Multi_Browser) this);
  }
  else {
    Fl_Multi_Browser::draw();
  }
}
void Fl_DerivedMulti_Browser::draw_box(){
  Fl_Multi_Browser::draw_box();
}
void Fl_DerivedMulti_Browser::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Multi_Browser::draw_box(t,c);
}
void Fl_DerivedMulti_Browser::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Multi_Browser::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedMulti_Browser::draw_backdrop(){
  Fl_Multi_Browser::draw_backdrop();
}
void Fl_DerivedMulti_Browser::draw_focus(){
  Fl_Multi_Browser::draw_focus();
}
void Fl_DerivedMulti_Browser::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Multi_Browser::draw_focus(t,x,y,w,h);
}
void Fl_DerivedMulti_Browser::draw_label(){
  Fl_Multi_Browser::draw_label();
}
void Fl_DerivedMulti_Browser::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Multi_Browser::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedMulti_Browser::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Multi_Browser) this,event);
  }
  else {
    i = Fl_Multi_Browser::handle(event);
  }
  return i;
}
void Fl_DerivedMulti_Browser::resize_super(int x, int y, int w, int h){
  Fl_Multi_Browser::resize(x,y,w,h);
}
void Fl_DerivedMulti_Browser::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Multi_Browser) this,x,y,w,h);
  }
  else {
    Fl_Multi_Browser::resize(x,y,w,h);
  }
}
void Fl_DerivedMulti_Browser::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Multi_Browser) this);
  }
  else {
    Fl_Multi_Browser::show();
  }
}
void Fl_DerivedMulti_Browser::show(int val){
  if (this->overriddenFuncs->show_with_line != NULL) {
    this->overriddenFuncs->show_with_line((fl_Multi_Browser) this, val);
  }
  else {
    Fl_Multi_Browser::show(val);
  }
}
void Fl_DerivedMulti_Browser::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Multi_Browser) this);
  }
  else {
    Fl_Multi_Browser::hide();
  }
}
void Fl_DerivedMulti_Browser::hide(int line){
  if (this->overriddenFuncs->hide_with_line != NULL) {
    this->overriddenFuncs->hide_with_line((fl_Multi_Browser) this, line);
  }
  else {
    Fl_Multi_Browser::hide(line);
  }
}
Fl_Group* Fl_DerivedMulti_Browser::as_group(){
  Fl_Group* grp;
  if (this->overriddenFuncs->as_group != NULL) {
    grp = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Multi_Browser) this)));
  }
  else {
    grp = Fl_Multi_Browser::as_group();
  }
  return grp;
}
Fl_Window* Fl_DerivedMulti_Browser::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Multi_Browser) this)));
  }
  else {
    win = Fl_Multi_Browser::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedMulti_Browser::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Multi_Browser) this)));
  }
  else {
    win = Fl_Multi_Browser::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Multi_Browser_Virtual_Funcs*, Fl_Multi_Browser_default_virtual_funcs)(){
    fl_Multi_Browser_Virtual_Funcs* ptr = (fl_Multi_Browser_Virtual_Funcs*)malloc(sizeof(fl_Multi_Browser_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->show_with_line = NULL;
    ptr->hide = NULL;
    ptr->hide_with_line = NULL;
    ptr->as_group = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_handle)(fl_Multi_Browser self, int event){
    return (static_cast<Fl_DerivedMulti_Browser*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Multi_Browser_parent)(fl_Multi_Browser multi_browser){
    return (fl_Group) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->parent();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_parent)(fl_Multi_Browser multi_browser,fl_Group grp){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Multi_Browser_type)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->type();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_type)(fl_Multi_Browser multi_browser,uchar t){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->type(t);
  }

FL_EXPORT_C(void, Fl_Multi_Browser_draw_box)(fl_Multi_Browser Multi_Browser){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_box();
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_box_with_tc)(fl_Multi_Browser Multi_Browser,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_box_with_txywhc)(fl_Multi_Browser Multi_Browser,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_backdrop)(fl_Multi_Browser Multi_Browser){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_focus)(fl_Multi_Browser Multi_Browser){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_focus();
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_focus_with_txywh)(fl_Multi_Browser Multi_Browser,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Multi_Browser_draw_label)(fl_Multi_Browser Multi_Browser){
 (static_cast<Fl_DerivedMulti_Browser*>(Multi_Browser))->draw_label();
}
  FL_EXPORT_C(int,Fl_Multi_Browser_x)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->x();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_y)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->y();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_w)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->w();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_h)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->h();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_align)(fl_Multi_Browser multi_browser, Fl_Align alignment){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Multi_Browser_align)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Multi_Browser_box)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->box();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_box)(fl_Multi_Browser multi_browser,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Multi_Browser_color)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->color();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_color)(fl_Multi_Browser multi_browser,Fl_Color bg){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_color_with_bg_sel)(fl_Multi_Browser multi_browser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Multi_Browser_selection_color)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_selection_color)(fl_Multi_Browser multi_browser,Fl_Color a){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Multi_Browser_label)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->label();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_copy_label)(fl_Multi_Browser multi_browser,const char* new_label){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_label)(fl_Multi_Browser multi_browser,const char* text){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Multi_Browser_labeltype)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_labeltype)(fl_Multi_Browser multi_browser,Fl_Labeltype a){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_labelcolor)(fl_Multi_Browser multi_browser,Fl_Color c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Multi_Browser_labelcolor)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Multi_Browser_labelfont)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_labelfont)(fl_Multi_Browser multi_browser,Fl_Font c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Multi_Browser_labelsize)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_labelsize)(fl_Multi_Browser multi_browser,Fl_Fontsize pix){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Multi_Browser_image)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->image();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_image)(fl_Multi_Browser multi_browser,fl_Image pix){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Multi_Browser_deimage)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->deimage();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_deimage)(fl_Multi_Browser multi_browser,fl_Image pix){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Multi_Browser_tooltip)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_copy_tooltip)(fl_Multi_Browser multi_browser,const char* text){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_tooltip)(fl_Multi_Browser multi_browser,const char* text){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_callback_with_user_data)(fl_Multi_Browser multi_browser,fl_Callback* cb,void* p){
    Fl_DerivedMulti_Browser* castedWindow = (static_cast<Fl_DerivedMulti_Browser*>(multi_browser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_callback)(fl_Multi_Browser multi_browser,fl_Callback* cb){
    Fl_DerivedMulti_Browser* castedWindow = (static_cast<Fl_DerivedMulti_Browser*>(multi_browser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Multi_Browser_other_data)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->get_other_data();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_other_data)(fl_Multi_Browser multi_browser,void* v){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->set_other_data(v);
  }
  FL_EXPORT_C(void*,Fl_Multi_Browser_user_data)(fl_Multi_Browser multi_browser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_user_data)(fl_Multi_Browser multi_browser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Multi_Browser*>(multi_browser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Multi_Browser*>(multi_browser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Multi_Browser*>(multi_browser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Multi_Browser_argument)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->argument();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_argument)(fl_Multi_Browser multi_browser,long v){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Multi_Browser_when)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->when();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_when)(fl_Multi_Browser multi_browser,uchar i){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->when(i);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_visible_r)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_show_super)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_Multi_Browser*>(multi_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_hide_super)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_Multi_Browser*>(multi_browser))->hide();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_visible)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Multi_Browser_active)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->active();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_active_r)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->active_r();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_activate)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->activate();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_deactivate)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Multi_Browser_output)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_output)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_output)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Multi_Browser_takesevents)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_changed)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->changed();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_changed)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_take_focus)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_visible_focus)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_visible_focus)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_modify_visible_focus)(fl_Multi_Browser multi_browser,int v){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Multi_Browser_visible_focus)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_contains)(fl_Multi_Browser multi_browser,fl_Widget w){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_inside)(fl_Multi_Browser multi_browser,fl_Widget w){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_redraw)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->redraw();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_redraw_label)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Multi_Browser_damage)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->damage();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_damage_with_bitmask)(fl_Multi_Browser multi_browser,uchar c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear_damage)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_damage_with_text)(fl_Multi_Browser multi_browser,uchar c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_damage_inside_widget)(fl_Multi_Browser multi_browser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_draw_label_with_xywh_alignment)(fl_Multi_Browser multi_browser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_measure_label)(fl_Multi_Browser multi_browser,int* ww,int* hh){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Multi_Browser_window)(fl_Multi_Browser multi_browser){
    return (fl_Window) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Multi_Browser_top_window)(fl_Multi_Browser multi_browser){
    return (fl_Window) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Multi_Browser_top_window_offset)(fl_Multi_Browser multi_browser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Multi_Browser_as_group_super)(fl_Multi_Browser multi_browser){
    return (fl_Group) (static_cast<Fl_Multi_Browser*>(multi_browser))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Multi_Browser_as_group)(fl_Multi_Browser multi_browser){
    return (fl_Group) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Multi_Browser_as_gl_window_super)(fl_Multi_Browser multi_browser){
    return (fl_Gl_Window) (static_cast<Fl_Multi_Browser*>(multi_browser))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Multi_Browser_as_gl_window)(fl_Multi_Browser multi_browser){
    return (fl_Gl_Window) (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_resizable_by_reference)(fl_Multi_Browser multi_browser,fl_Widget o){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_resizable)(fl_Multi_Browser multi_browser,fl_Widget o){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Multi_Browser_resizable)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->resizable();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_add_resizable)(fl_Multi_Browser multi_browser,fl_Widget o){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_clip_children)(fl_Multi_Browser multi_browser,int c){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Multi_Browser_clip_children)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_focus)(fl_Multi_Browser multi_browser, fl_Widget W){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Multi_Browser__ddfdesign_kludge)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->_ddfdesign_kludge();
  }
  // FL_EXPORT_C(void,Fl_Multi_Browser_forms_end)(fl_Multi_Browser self){
  //   (static_cast<Fl_DerivedMulti_Browser*>(self))->forms_end();
  // }

  FL_EXPORT_C(fl_Multi_Browser, Fl_Multi_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Multi_Browser_Virtual_Funcs* funcs = Fl_Multi_Browser_default_virtual_funcs();
    Fl_DerivedMulti_Browser* multi_browser = new Fl_DerivedMulti_Browser(x,y,w,h,label,funcs);
    return (static_cast<fl_Multi_Browser>(multi_browser));
  }
  FL_EXPORT_C(fl_Multi_Browser, Fl_Multi_Browser_New)(int x, int y, int w, int h) {
    fl_Multi_Browser_Virtual_Funcs* funcs = Fl_Multi_Browser_default_virtual_funcs();
    Fl_DerivedMulti_Browser* multi_browser = new Fl_DerivedMulti_Browser(x,y,w,h,0,funcs);
    return (fl_Multi_Browser)multi_browser;
  }
  FL_EXPORT_C(fl_Multi_Browser, Fl_OverriddenMulti_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Multi_Browser_Virtual_Funcs* funcs) {
    Fl_DerivedMulti_Browser* multi_browser = new Fl_DerivedMulti_Browser(x,y,w,h,label,funcs);
    return (static_cast<fl_Multi_Browser>(multi_browser));
  }
  FL_EXPORT_C(fl_Multi_Browser, Fl_OverriddenMulti_Browser_New)(int x, int y, int w, int h, fl_Multi_Browser_Virtual_Funcs* funcs) {
    Fl_DerivedMulti_Browser* multi_browser = new Fl_DerivedMulti_Browser(x,y,w,h,0,funcs);
    return (fl_Multi_Browser)multi_browser;
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_Destroy)(fl_Multi_Browser multi_browser){
    delete (static_cast<Fl_DerivedMulti_Browser*>(multi_browser));
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_remove)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->remove(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_add)(fl_Multi_Browser multi_browser,const char* newtext){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->add(newtext);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_add_with_d)(fl_Multi_Browser multi_browser,const char* newtext,void* d){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->add(newtext,d);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_insert)(fl_Multi_Browser multi_browser,int line,const char* newtext){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->insert(line,newtext);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_insert_with_d)(fl_Multi_Browser multi_browser,int line,const char* newtext,void* d){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->insert(line,newtext,d);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_move)(fl_Multi_Browser multi_browser,int to,int from){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->move(to,from);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_load)(fl_Multi_Browser multi_browser,const char* filename){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->load(filename);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_clear)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->clear();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_size)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->size();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_size)(fl_Multi_Browser multi_browser,int W,int H){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_topline)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->topline();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_lineposition)(fl_Multi_Browser multi_browser,int line,Fl_Line_Position pos){
    Fl_Multi_Browser::Fl_Line_Position p = (Fl_Multi_Browser::Fl_Line_Position)-1;
    switch(p){
    case TOP :    {p = Fl_Multi_Browser::TOP; break;}
    case BOTTOM : {p = Fl_Multi_Browser::BOTTOM; break;}
    case MIDDLE : {p = Fl_Multi_Browser::MIDDLE; break;}
    default:      {p = (Fl_Multi_Browser::Fl_Line_Position)-1; break;}
    }
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->lineposition(line,p);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_topline)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->topline(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_bottomline)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->bottomline(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_middleline)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->middleline(line);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_select)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->select(line);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_select_with_val)(fl_Multi_Browser multi_browser,int line,int val){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->select(line,val);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_selected)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->selected(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_show_with_line)(fl_Multi_Browser multi_browser,int line){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->show(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_show)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_hide_with_line)(fl_Multi_Browser multi_browser,int line){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->hide(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_hide)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->hide();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_visible)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->visible(line);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_value)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->value();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_value)(fl_Multi_Browser multi_browser,int line){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->value(line);
  }
  FL_EXPORT_C(const char*,Fl_Multi_Browser_text)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->text(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_text)(fl_Multi_Browser multi_browser,int line,const char* newtext){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->text(line,newtext);
  }
  FL_EXPORT_C(void*,Fl_Multi_Browser_data)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->data(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_data)(fl_Multi_Browser multi_browser,int line,void* d){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->data(line,d);
  }
  FL_EXPORT_C(char,Fl_Multi_Browser_format_char)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->format_char();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_format_char)(fl_Multi_Browser multi_browser,char c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->format_char(c);
  }
  FL_EXPORT_C(char,Fl_Multi_Browser_column_char)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->column_char();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_column_char)(fl_Multi_Browser multi_browser,char c){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->column_char(c);
  }
  FL_EXPORT_C(const int*,Fl_Multi_Browser_column_widths)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->column_widths();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_column_widths)(fl_Multi_Browser multi_browser,const int* arr){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->column_widths(arr);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_displayed)(fl_Multi_Browser multi_browser,int line){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->displayed(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_make_visible)(fl_Multi_Browser multi_browser,int line){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->make_visible(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_icon)(fl_Multi_Browser multi_browser,int line,fl_Image icon){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->icon(line,(static_cast<Fl_Image*>(icon)));
  }
  FL_EXPORT_C(fl_Image,Fl_Multi_Browser_icon)(fl_Multi_Browser multi_browser,int line){
    return (fl_Image)(static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->icon(line);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_remove_icon)(fl_Multi_Browser multi_browser,int line){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->remove_icon(line);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_select_only)(fl_Multi_Browser multi_browser,void *item){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->select_only(item);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_select_only_with_docallbacks)(fl_Multi_Browser multi_browser,void *item,int docallbacks){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->select_only(item,docallbacks);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_deselect)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->deselect();
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_deselect_with_docallbacks)(fl_Multi_Browser multi_browser,int docallbacks){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->deselect(docallbacks);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_position)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->position();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_position)(fl_Multi_Browser multi_browser,int pos){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->position(pos);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_hposition)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->hposition();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_hposition)(fl_Multi_Browser multi_browser,int ){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->hposition();
  }
  FL_EXPORT_C(uchar,Fl_Multi_Browser_has_scrollbar)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->has_scrollbar();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_has_scrollbar)(fl_Multi_Browser multi_browser,uchar mode){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->has_scrollbar(mode);
  }
  FL_EXPORT_C(Fl_Font,Fl_Multi_Browser_textfont)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textfont();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_textfont)(fl_Multi_Browser multi_browser,Fl_Font font){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textfont(font);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Multi_Browser_textsize)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textsize();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_textsize)(fl_Multi_Browser multi_browser,Fl_Fontsize newSize){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textsize(newSize);
  }
  FL_EXPORT_C(Fl_Color,Fl_Multi_Browser_textcolor)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_textcolor)(fl_Multi_Browser multi_browser,Fl_Color col){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->textcolor(col);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_scrollbar_size)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_scrollbar_size)(fl_Multi_Browser multi_browser,int newSize){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_size(newSize);
  }
  FL_EXPORT_C(int,Fl_Multi_Browser_scrollbar_width)(fl_Multi_Browser multi_browser){
    return (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_scrollbar_width)(fl_Multi_Browser multi_browser,int width){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_width(width);
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_scrollbar_right)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_right();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_set_scrollbar_left)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->scrollbar_left();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_sort)(fl_Multi_Browser multi_browser){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->sort();
  }
  FL_EXPORT_C(void,Fl_Multi_Browser_sort_with_flags)(fl_Multi_Browser multi_browser,int flags){
    (static_cast<Fl_DerivedMulti_Browser*>(multi_browser))->sort(flags);
  }
#ifdef __cplusplus
}
#endif
