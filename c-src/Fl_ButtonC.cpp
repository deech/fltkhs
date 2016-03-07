#include "Fl_ButtonC.h"
#ifdef __cplusplus
Fl_DerivedButton::Fl_DerivedButton(int X, int Y, int W, int H, const char *l, fl_Button_Virtual_Funcs* funcs) : Fl_Button(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedButton::Fl_DerivedButton(int X, int Y, int W, int H, fl_Button_Virtual_Funcs* funcs):Fl_Button(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedButton::~Fl_DerivedButton(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedButton::get_other_data(){
  return this->other_data;
}
void Fl_DerivedButton::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedButton::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Button) this);
  }
}
void Fl_DerivedButton::draw_box(){
  Fl_Button::draw_box();
}
void Fl_DerivedButton::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Button::draw_box(t,c);
}
void Fl_DerivedButton::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Button::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedButton::draw_backdrop(){
  Fl_Button::draw_backdrop();
}
void Fl_DerivedButton::draw_focus(){
  Fl_Button::draw_focus();
}
void Fl_DerivedButton::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Button::draw_focus(t,x,y,w,h);
}
void Fl_DerivedButton::draw_label(){
  Fl_Button::draw_label();
}
void Fl_DerivedButton::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Button::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedButton::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Button) this,event);
  }
  else {
    i = Fl_Button::handle(event);
  }
  return i;
}
void Fl_DerivedButton::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Button) this,x,y,w,h);
  }
  else {
    Fl_Button::resize(x,y,w,h);
  }
}
void Fl_DerivedButton::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Button) this);
  }
  else {
    Fl_Button::show();
  }
}
void Fl_DerivedButton::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Button) this);
  }
  else {
    Fl_Button::hide();
  }
}
void Fl_DerivedButton::draw_super(){
  Fl_Button::draw();
}
void Fl_DerivedButton::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Button) this);
  }
  else {
    Fl_Button::draw();
  }
}
Fl_Window* Fl_DerivedButton::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Button) this)));
  }
  else {
    win = Fl_Button::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedButton::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Button) this)));
  }
  else {
    win = Fl_Button::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Button_Virtual_Funcs*, Fl_Button_default_virtual_funcs)(){
    fl_Button_Virtual_Funcs* ptr = (fl_Button_Virtual_Funcs*)malloc(sizeof(fl_Button_Virtual_Funcs));
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
  FL_EXPORT_C(void,         Fl_Button_draw_super)(fl_Button button){
    (static_cast<Fl_DerivedButton*>(button))->draw_super();
  }
  FL_EXPORT_C(int,Fl_Button_handle_super )(fl_Button button,int event){
    return (static_cast<Fl_Button*>(button))->Fl_Button::handle(event);
  }
  FL_EXPORT_C(int,Fl_Button_handle )(fl_Button button, int event){
    return (static_cast<Fl_DerivedButton*>(button))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Button_resize_super )(fl_Button button,int x, int y, int w, int h){
    (static_cast<Fl_Button*>(button))->Fl_Button::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Button_resize )(fl_Button button,int x, int y, int w, int h){
    (static_cast<Fl_DerivedButton*>(button))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Button_show_super)(fl_Button button){
    (static_cast<Fl_Button*>(button))->Fl_Button::show();
  }
  FL_EXPORT_C(void,Fl_Button_show )(fl_Button button){
    (static_cast<Fl_DerivedButton*>(button))->show();
  }
  FL_EXPORT_C(void,Fl_Button_hide_super)(fl_Button button){
    (static_cast<Fl_Button*>(button))->Fl_Button::hide();
  }
  FL_EXPORT_C(void,Fl_Button_hide )(fl_Button button){
    (static_cast<Fl_DerivedButton*>(button))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Button_as_window_super)(fl_Button button){
    return (static_cast<Fl_Button*>(button))->Fl_Button::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Button_as_window )(fl_Button button){
    return (static_cast<Fl_DerivedButton*>(button))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Button_as_gl_window_super)(fl_Button button){
    return (fl_Gl_Window) (static_cast<Fl_Button*>(button))->Fl_Button::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Button_as_gl_window )(fl_Button button){
    return (fl_Gl_Window) (static_cast<Fl_DerivedButton*>(button))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Button_parent)(fl_Button b){
    return (fl_Group) (static_cast<Fl_DerivedButton*>(b))->parent();
  }
  FL_EXPORT_C(void,Fl_Button_set_parent)(fl_Button b,fl_Group grp){
    (static_cast<Fl_DerivedButton*>(b))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Button_type)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->type();
  }
  FL_EXPORT_C(void,Fl_Button_set_type)(fl_Button b,uchar t){
    (static_cast<Fl_DerivedButton*>(b))->type(t);
  }

FL_EXPORT_C(void, Fl_Button_draw_box)(fl_Button Button){
 (static_cast<Fl_DerivedButton*>(Button))->draw_box();
}
FL_EXPORT_C(void, Fl_Button_draw_box_with_tc)(fl_Button Button,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedButton*>(Button))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Button_draw_box_with_txywhc)(fl_Button Button,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedButton*>(Button))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Button_draw_backdrop)(fl_Button Button){
 (static_cast<Fl_DerivedButton*>(Button))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Button_draw_focus)(fl_Button Button){
 (static_cast<Fl_DerivedButton*>(Button))->draw_focus();
}
FL_EXPORT_C(void, Fl_Button_draw_focus_with_txywh)(fl_Button Button,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedButton*>(Button))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Button_draw_label)(fl_Button Button){
 (static_cast<Fl_DerivedButton*>(Button))->draw_label();
}
  FL_EXPORT_C(int,Fl_Button_x)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->x();
  }
  FL_EXPORT_C(int,Fl_Button_y)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->y();
  }
  FL_EXPORT_C(int,Fl_Button_w)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->w();
  }
  FL_EXPORT_C(int,Fl_Button_h)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->h();
  }
  FL_EXPORT_C(void,Fl_Button_set_align)(fl_Button button, Fl_Align alignment){
    (static_cast<Fl_Button*>(button))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Button_align)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Button_box)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->box();
  }
  FL_EXPORT_C(void,Fl_Button_set_box)(fl_Button b,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedButton*>(b))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Button_color)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->color();
  }
  FL_EXPORT_C(void,Fl_Button_set_color)(fl_Button b,Fl_Color bg){
    (static_cast<Fl_DerivedButton*>(b))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Button_set_color_with_bg_sel)(fl_Button b,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedButton*>(b))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Button_selection_color)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Button_set_selection_color)(fl_Button b,Fl_Color a){
    (static_cast<Fl_DerivedButton*>(b))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Button_label)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->label();
  }
  FL_EXPORT_C(void,Fl_Button_copy_label)(fl_Button b,const char* new_label){
    (static_cast<Fl_DerivedButton*>(b))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Button_set_label)(fl_Button b,const char* text){
    (static_cast<Fl_DerivedButton*>(b))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Button_labeltype)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Button_set_labeltype)(fl_Button b,Fl_Labeltype a){
    (static_cast<Fl_DerivedButton*>(b))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Button_set_labelcolor)(fl_Button b,Fl_Color c){
    (static_cast<Fl_DerivedButton*>(b))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Button_labelcolor)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Button_labelfont)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Button_set_labelfont)(fl_Button b,Fl_Font c){
    (static_cast<Fl_DerivedButton*>(b))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Button_labelsize)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Button_set_labelsize)(fl_Button b,Fl_Fontsize pix){
    (static_cast<Fl_DerivedButton*>(b))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Button_image)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->image();
  }
  FL_EXPORT_C(void,Fl_Button_set_image)(fl_Button b,fl_Image pix){
    (static_cast<Fl_DerivedButton*>(b))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Button_deimage)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->deimage();
  }
  FL_EXPORT_C(void,Fl_Button_set_deimage)(fl_Button b,fl_Image pix){
    (static_cast<Fl_DerivedButton*>(b))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Button_tooltip)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Button_copy_tooltip)(fl_Button b,const char* text){
    (static_cast<Fl_DerivedButton*>(b))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Button_set_tooltip)(fl_Button b,const char* text){
    (static_cast<Fl_DerivedButton*>(b))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Button_set_callback_with_user_data)(fl_Button b,fl_Callback* cb,void* p){
    Fl_Button* castedButton = (static_cast<Fl_DerivedButton*>(b));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Button_set_callback)(fl_Button b,fl_Callback* cb){
    Fl_Button* castedButton = (static_cast<Fl_DerivedButton*>(b));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Button_user_data)(fl_Button b){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedButton*>(b))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedButton*>(b))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Button_set_user_data)(fl_Button b,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Button*>(b))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Button*>(b))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Button*>(b))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Button_argument)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->argument();
  }
  FL_EXPORT_C(void,Fl_Button_set_argument)(fl_Button b,long v){
    (static_cast<Fl_DerivedButton*>(b))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Button_when)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->when();
  }
  FL_EXPORT_C(void,Fl_Button_set_when)(fl_Button b,uchar i){
    (static_cast<Fl_DerivedButton*>(b))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Button_visible)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->visible();
  }
  FL_EXPORT_C(int,Fl_Button_visible_r)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Button_set_visible)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->visible();
  }
  FL_EXPORT_C(void,Fl_Button_clear_visible)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Button_active)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->active();
  }
  FL_EXPORT_C(int,Fl_Button_active_r)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->active_r();
  }
  FL_EXPORT_C(void,Fl_Button_activate)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->activate();
  }
  FL_EXPORT_C(void,Fl_Button_deactivate)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Button_output)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Button_set_output)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Button_clear_output)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Button_takesevents)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Button_set_changed)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->changed();
  }
  FL_EXPORT_C(void,Fl_Button_clear_changed)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Button_take_focus)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Button_set_visible_focus)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Button_clear_visible_focus)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Button_modify_visible_focus)(fl_Button b,int v){
    (static_cast<Fl_DerivedButton*>(b))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Button_visible_focus)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Button_do_callback)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Button_do_callback_with_widget_and_user_data)(fl_Button b,fl_Widget w,long arg){
    (static_cast<Fl_DerivedButton*>(b))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Button_do_callback_with_widget_and_default_user_data)(fl_Button b,fl_Widget w){
    (static_cast<Fl_DerivedButton*>(b))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Button_contains)(fl_Button b,fl_Widget w){
    return (static_cast<Fl_DerivedButton*>(b))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Button_inside)(fl_Button b,fl_Widget w){
    return (static_cast<Fl_DerivedButton*>(b))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Button_redraw)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->redraw();
  }
  FL_EXPORT_C(void,Fl_Button_redraw_label)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Button_damage)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->damage();
  }
  FL_EXPORT_C(void,Fl_Button_clear_damage_with_bitmask)(fl_Button b,uchar c){
    (static_cast<Fl_DerivedButton*>(b))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Button_clear_damage)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Button_damage_with_text)(fl_Button b,uchar c){
    (static_cast<Fl_DerivedButton*>(b))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Button_damage_inside_widget)(fl_Button b,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedButton*>(b))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Button_draw_label_with_xywh_alignment)(fl_Button b,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedButton*>(b))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Button_measure_label)(fl_Button b,int* ww,int* hh){
    (static_cast<Fl_DerivedButton*>(b))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Button_window)(fl_Button button){
    return (fl_Window) (static_cast<Fl_DerivedButton*>(button))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Button_top_window)(fl_Button button){
    return (fl_Window) (static_cast<Fl_DerivedButton*>(button))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Button_top_window_offset)(fl_Button button, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedButton*>(button))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Button_as_group)(fl_Button button){
    return (fl_Group) (static_cast<Fl_DerivedButton*>(button))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Button_as_group_super)(fl_Button button){
    return (fl_Group) (static_cast<Fl_Button*>(button))->Fl_Button::as_group();
  }
  FL_EXPORT_C(void*, Fl_Button_other_data)(fl_Button button){
    return (static_cast<Fl_DerivedButton*>(button))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Button_set_other_data)(fl_Button button, void* v){
    (static_cast<Fl_DerivedButton*>(button))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Button, Fl_Button_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Button_Virtual_Funcs* funcs = Fl_Button_default_virtual_funcs();
    Fl_DerivedButton* button = new Fl_DerivedButton(x,y,w,h,label,funcs);
    return (static_cast<fl_Button>(button));
  }
  FL_EXPORT_C(fl_Button, Fl_Button_New)(int x, int y, int w, int h) {
    fl_Button_Virtual_Funcs* funcs = Fl_Button_default_virtual_funcs();
    Fl_DerivedButton* button = new Fl_DerivedButton(x,y,w,h,0,funcs);
    return (fl_Button)button;
  }
  FL_EXPORT_C(fl_Button, Fl_OverriddenButton_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Button_Virtual_Funcs* funcs) {
    Fl_DerivedButton* button = new Fl_DerivedButton(x,y,w,h,label,funcs);
    return (static_cast<fl_Button>(button));
  }
  FL_EXPORT_C(fl_Button, Fl_OverriddenButton_New)(int x, int y, int w, int h, fl_Button_Virtual_Funcs* funcs) {
    Fl_DerivedButton* button = new Fl_DerivedButton(x,y,w,h,0,funcs);
    return (fl_Button)button;
  }
  FL_EXPORT_C(void,Fl_Button_Destroy)(fl_Button button){
    delete (static_cast<Fl_DerivedButton*>(button));
  }
  FL_EXPORT_C(char,Fl_Button_value)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->value();
  }
  FL_EXPORT_C(int,Fl_Button_set)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->set();
  }
  FL_EXPORT_C(int,Fl_Button_set_value)(fl_Button b,int v){
    return (static_cast<Fl_DerivedButton*>(b))->value(v);
  }
  FL_EXPORT_C(int,Fl_Button_clear)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->clear();
  }
  FL_EXPORT_C(void,Fl_Button_setonly)(fl_Button b){
    (static_cast<Fl_DerivedButton*>(b))->setonly();
  }
  FL_EXPORT_C(int,Fl_Button_get_shortcut)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Button_set_shortcut)(fl_Button b,int s){
    (static_cast<Fl_DerivedButton*>(b))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Button_down_box)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->down_box();
  }
  FL_EXPORT_C(void,Fl_Button_set_down_box)(fl_Button b,Fl_Boxtype boxtype){
    (static_cast<Fl_DerivedButton*>(b))->down_box(boxtype);
  }
  FL_EXPORT_C(Fl_Color,Fl_Button_down_color)(fl_Button b){
    return (static_cast<Fl_DerivedButton*>(b))->down_color();
  }
  FL_EXPORT_C(void,Fl_Button_set_down_color)(fl_Button b,Fl_Color c){
    (static_cast<Fl_DerivedButton*>(b))->down_color(c);
  }
#ifdef __cplusplus
}
#endif
