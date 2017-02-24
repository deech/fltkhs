#include "Fl_Menu_C.h"
#include "UtilsC.h"
#ifdef __cplusplus
Fl_DerivedMenu_::Fl_DerivedMenu_(int X, int Y, int W, int H, const char *l, fl_Menu__Virtual_Funcs* funcs) : Fl_Menu_(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedMenu_::Fl_DerivedMenu_(int X, int Y, int W, int H, fl_Menu__Virtual_Funcs* funcs):Fl_Menu_(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedMenu_::~Fl_DerivedMenu_(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedMenu_::get_other_data(){
  return this->other_data;
}
void Fl_DerivedMenu_::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedMenu_::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Menu_) this);
  }
}

const Fl_Menu_Item* Fl_DerivedMenu_::get_menu_item_by_index(int i) {
  return &menu()[i];
}
int Fl_DerivedMenu_::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Menu_) this,event);
  }
  else {
    i = Fl_Menu_::handle(event);
  }
  return i;
}
void Fl_DerivedMenu_::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Menu_) this,x,y,w,h);
  }
  else {
    Fl_Menu_::resize(x,y,w,h);
  }
}
void Fl_DerivedMenu_::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Menu_) this);
  }
  else {
    Fl_Menu_::show();
  }
}
void Fl_DerivedMenu_::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Menu_) this);
  }
  else {
    Fl_Menu_::hide();
  }
}
void Fl_DerivedMenu_::draw(){
  this->overriddenFuncs->draw((fl_Menu_) this);
}
void Fl_DerivedMenu_::draw_box(){
  Fl_Widget::draw_box();
}
Fl_Window* Fl_DerivedMenu_::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Menu_) this)));
  }
  else {
    win = Fl_Menu_::as_window();
  }
  return win;
}
Fl_Group* Fl_DerivedMenu_::as_group(){
  Fl_Group* win;
  if (this->overriddenFuncs->as_group != NULL) {
    win = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Menu_) this)));
  }
  else {
    win = Fl_Menu_::as_group();
  }
  return win;
}
Fl_Group* Fl_DerivedMenu_::as_group_super(){
  return Fl_Menu_::as_group();
}
Fl_Gl_Window* Fl_DerivedMenu_::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Menu_) this)));
  }
  else {
    win = Fl_Menu_::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Menu__Virtual_Funcs*, Fl_Menu__default_virtual_funcs)(){
    fl_Menu__Virtual_Funcs* ptr = (fl_Menu__Virtual_Funcs*)malloc(sizeof(fl_Menu__Virtual_Funcs));
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
  FL_EXPORT_C(int,Fl_Menu__handle_super )(fl_Menu_ menu_,int event){
    return (static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::handle(event);
  }
  FL_EXPORT_C(int,Fl_Menu__handle )(fl_Menu_ menu_, int event){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Menu__resize_super )(fl_Menu_ menu_,int x, int y, int w, int h){
    (static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu__resize )(fl_Menu_ menu_,int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_*>(menu_))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu__show_super)(fl_Menu_ menu_){
    (static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::show();
  }
  FL_EXPORT_C(void,Fl_Menu__show )(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->show();
  }
  FL_EXPORT_C(void,Fl_Menu__hide_super)(fl_Menu_ menu_){
    (static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::hide();
  }
  FL_EXPORT_C(void,Fl_Menu__hide )(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Menu__as_window_super)(fl_Menu_ menu_){
    return (fl_Window)(static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Menu__as_window )(fl_Menu_ menu_){
    return (fl_Window)(static_cast<Fl_DerivedMenu_*>(menu_))->as_window();
  }
  FL_EXPORT_C(fl_Group,Fl_Menu__as_group_super)(fl_Menu_ menu_){
    return (fl_Group)(static_cast<Fl_DerivedMenu_*>(menu_))->as_group_super();
  }
  FL_EXPORT_C(fl_Group,Fl_Menu__as_group )(fl_Menu_ menu_){
    return (fl_Group)(static_cast<Fl_DerivedMenu_*>(menu_))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Menu__as_gl_window_super)(fl_Menu_ menu_){
    return (fl_Gl_Window) (static_cast<Fl_Menu_*>(menu_))->Fl_Menu_::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Menu__as_gl_window )(fl_Menu_ menu_){
    return (fl_Gl_Window) (static_cast<Fl_DerivedMenu_*>(menu_))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Menu__parent)(fl_Menu_ menu_){
    return (fl_Group) (static_cast<Fl_DerivedMenu_*>(menu_))->parent();
  }
  FL_EXPORT_C(void,Fl_Menu__set_parent)(fl_Menu_ menu_,fl_Group grp){
    (static_cast<Fl_DerivedMenu_*>(menu_))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Menu__type)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->type();
  }
  FL_EXPORT_C(void,Fl_Menu__set_type)(fl_Menu_ menu_,uchar t){
    (static_cast<Fl_DerivedMenu_*>(menu_))->type(t);
  }

// FL_EXPORT_C(void, Fl_Menu__draw_box)(fl_Menu_ Menu_){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_box();
// }
// FL_EXPORT_C(void, Fl_Menu__draw_box_with_tc)(fl_Menu_ Menu_,Fl_Boxtype t, Fl_Color c){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_box(t,c);
// }
// FL_EXPORT_C(void, Fl_Menu__draw_box_with_txywhc)(fl_Menu_ Menu_,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_box(t,x,y,w,h,c);
// }
// FL_EXPORT_C(void, Fl_Menu__draw_backdrop)(fl_Menu_ Menu_){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_backdrop();
// }
// FL_EXPORT_C(void, Fl_Menu__draw_focus)(fl_Menu_ Menu_){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_focus();
// }
// FL_EXPORT_C(void, Fl_Menu__draw_focus_with_txywh)(fl_Menu_ Menu_,Fl_Boxtype t, int x,int y,int w,int h){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_focus(t,x,y,w,h);
// }
// FL_EXPORT_C(void, Fl_Menu__draw_label)(fl_Menu_ Menu_){
//  (static_cast<Fl_DerivedMenu_*>(Menu_))->draw_label();
// }
  FL_EXPORT_C(int,Fl_Menu__x)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->x();
  }
  FL_EXPORT_C(int,Fl_Menu__y)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->y();
  }
  FL_EXPORT_C(int,Fl_Menu__w)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->w();
  }
  FL_EXPORT_C(int,Fl_Menu__h)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->h();
  }
  FL_EXPORT_C(void,Fl_Menu__set_align)(fl_Menu_ menu_, Fl_Align alignment){
    (static_cast<Fl_DerivedMenu_*>(menu_))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Menu__align)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu__box)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->box();
  }
  FL_EXPORT_C(void,Fl_Menu__set_box)(fl_Menu_ menu_,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedMenu_*>(menu_))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu__color)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->color();
  }
  FL_EXPORT_C(void,Fl_Menu__set_color)(fl_Menu_ menu_,Fl_Color bg){
    (static_cast<Fl_DerivedMenu_*>(menu_))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Menu__set_color_with_bg_sel)(fl_Menu_ menu_,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedMenu_*>(menu_))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu__selection_color)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Menu__set_selection_color)(fl_Menu_ menu_,Fl_Color a){
    (static_cast<Fl_DerivedMenu_*>(menu_))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Menu__label)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->label();
  }
  FL_EXPORT_C(void,Fl_Menu__copy_label)(fl_Menu_ menu_,const char* new_label){
    (static_cast<Fl_DerivedMenu_*>(menu_))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Menu__set_label)(fl_Menu_ menu_,const char* text){
    (static_cast<Fl_DerivedMenu_*>(menu_))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Menu__labeltype)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Menu__set_labeltype)(fl_Menu_ menu_,Fl_Labeltype a){
    (static_cast<Fl_DerivedMenu_*>(menu_))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Menu__set_labelcolor)(fl_Menu_ menu_,Fl_Color c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Menu__labelcolor)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu__labelfont)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Menu__set_labelfont)(fl_Menu_ menu_,Fl_Font c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu__labelsize)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Menu__set_labelsize)(fl_Menu_ menu_,Fl_Fontsize pix){
    (static_cast<Fl_DerivedMenu_*>(menu_))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu__image)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->image();
  }
  FL_EXPORT_C(void,Fl_Menu__set_image)(fl_Menu_ menu_,fl_Image pix){
    (static_cast<Fl_DerivedMenu_*>(menu_))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu__deimage)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->deimage();
  }
  FL_EXPORT_C(void,Fl_Menu__set_deimage)(fl_Menu_ menu_,fl_Image pix){
    (static_cast<Fl_DerivedMenu_*>(menu_))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Menu__tooltip)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Menu__copy_tooltip)(fl_Menu_ menu_,const char* text){
    (static_cast<Fl_DerivedMenu_*>(menu_))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu__set_tooltip)(fl_Menu_ menu_,const char* text){
    (static_cast<Fl_DerivedMenu_*>(menu_))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu__set_callback_with_user_data)(fl_Menu_ menu_,fl_Callback cb,void* p){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_DerivedMenu_*>(menu_));
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Menu__set_callback)(fl_Menu_ menu_,fl_Callback cb){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_DerivedMenu_*>(menu_));
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Menu__user_data)(fl_Menu_ menu_){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedMenu_*>(menu_))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedMenu_*>(menu_))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Menu__set_user_data)(fl_Menu_ menu_,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_*>(menu_))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Menu_*>(menu_))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Menu_*>(menu_))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Menu__argument)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->argument();
  }
  FL_EXPORT_C(void,Fl_Menu__set_argument)(fl_Menu_ menu_,long v){
    (static_cast<Fl_DerivedMenu_*>(menu_))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Menu__when)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->when();
  }
  FL_EXPORT_C(void,Fl_Menu__set_when)(fl_Menu_ menu_,uchar i){
    (static_cast<Fl_DerivedMenu_*>(menu_))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu__visible)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->visible();
  }
  FL_EXPORT_C(int,Fl_Menu__visible_r)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Menu__set_visible)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->visible();
  }
  FL_EXPORT_C(void,Fl_Menu__clear_visible)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu__active)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->active();
  }
  FL_EXPORT_C(int,Fl_Menu__active_r)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->active_r();
  }
  FL_EXPORT_C(void,Fl_Menu__activate)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->activate();
  }
  FL_EXPORT_C(void,Fl_Menu__deactivate)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu__output)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->output();
  }
  FL_EXPORT_C(void,Fl_Menu__set_output)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->output();
  }
  FL_EXPORT_C(void,Fl_Menu__clear_output)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu__takesevents)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Menu__set_changed)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->changed();
  }
  FL_EXPORT_C(void,Fl_Menu__clear_changed)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Menu__take_focus)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Menu__set_visible_focus)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu__clear_visible_focus)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu__modify_visible_focus)(fl_Menu_ menu_,int v){
    (static_cast<Fl_DerivedMenu_*>(menu_))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu__visible_focus)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu__do_callback)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Menu__do_callback_with_widget_and_user_data)(fl_Menu_ menu_,fl_Widget w,long arg){
    (static_cast<Fl_DerivedMenu_*>(menu_))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Menu__do_callback_with_widget_and_default_user_data)(fl_Menu_ menu_,fl_Widget w){
    (static_cast<Fl_DerivedMenu_*>(menu_))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu__contains)(fl_Menu_ menu_,fl_Widget w){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu__inside)(fl_Menu_ menu_,fl_Widget w){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Menu__redraw)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->redraw();
  }
  FL_EXPORT_C(void,Fl_Menu__redraw_label)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Menu__damage)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->damage();
  }
  FL_EXPORT_C(void,Fl_Menu__clear_damage_with_bitmask)(fl_Menu_ menu_,uchar c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu__clear_damage)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Menu__damage_with_text)(fl_Menu_ menu_,uchar c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu__damage_inside_widget)(fl_Menu_ menu_,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedMenu_*>(menu_))->damage(c,x,y,w,h);
  }
  // FL_EXPORT_C(void,Fl_Menu__draw_label_with_xywh_alignment)(fl_Menu_ menu_,int x,int y,int w,int h,Fl_Align alignment){
  //   (static_cast<Fl_DerivedMenu_*>(menu_))->draw_label(x,y,w,h,alignment);
  // }
  FL_EXPORT_C(void,Fl_Menu__measure_label)(fl_Menu_ menu_,int* ww,int* hh){
    (static_cast<Fl_DerivedMenu_*>(menu_))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void*, Fl_Menu__other_data)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Menu__set_other_data)(fl_Menu_ menu_, void* v){
    (static_cast<Fl_DerivedMenu_*>(menu_))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Menu_, Fl_Menu__New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Menu__Virtual_Funcs* funcs = Fl_Menu__default_virtual_funcs();
    Fl_DerivedMenu_* menu_ = new Fl_DerivedMenu_(x,y,w,h,label,funcs);
    return (static_cast<fl_Menu_>(menu_));
  }
  FL_EXPORT_C(fl_Menu_, Fl_OverriddenMenu__New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Menu__Virtual_Funcs* funcs) {
    Fl_DerivedMenu_* box = new Fl_DerivedMenu_(x,y,w,h,label,funcs);
    return (static_cast<fl_Menu_>(box));
  }
  FL_EXPORT_C(fl_Menu_, Fl_Menu__New)(int x, int y, int w, int h) {
    fl_Menu__Virtual_Funcs* funcs = Fl_Menu__default_virtual_funcs();
    Fl_DerivedMenu_* menu_ = new Fl_DerivedMenu_(x,y,w,h,0,funcs);
    return (fl_Menu_)menu_;
  }
  FL_EXPORT_C(fl_Menu_   , Fl_OverriddenMenu__New)(int x, int y, int w, int h, fl_Menu__Virtual_Funcs* funcs){
    Fl_DerivedMenu_* menu_ = new Fl_DerivedMenu_(x,y,w,h,0,funcs);
    return (fl_Menu_)menu_;
  }
  FL_EXPORT_C(void   , Fl_Menu__Destroy)(fl_Menu_ menu_){
    delete (static_cast<Fl_DerivedMenu_*>(menu_));
  }
  FL_EXPORT_C(int,Fl_Menu__item_pathname_with_finditem)(fl_Menu_ menu_,char* name,int namelen,fl_Menu_Item finditem){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
  }
  FL_EXPORT_C(int,Fl_Menu__item_pathname)(fl_Menu_ menu_,char* name,int namelen){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->item_pathname(name,namelen);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu__picked)(fl_Menu_ menu_,fl_Menu_Item item){
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_))->picked((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu__find_item_with_name)(fl_Menu_ menu_,char* name){
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_))->find_item(name);
  }
  FL_EXPORT_C(int,Fl_Menu__find_index_with_name)(fl_Menu_ menu_,char* name){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->find_index(name);
  }
  FL_EXPORT_C(int,Fl_Menu__find_index_with_item)(fl_Menu_ menu_,fl_Menu_Item item){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->find_index((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu__test_shortcut)(fl_Menu_ menu_){
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_))->test_shortcut();
  }
  FL_EXPORT_C(void,Fl_Menu__global)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->global();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu__menu)(fl_Menu_ menu_){
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_))->menu();
  }
  FL_EXPORT_C(void,Fl_Menu__menu_with_m)(fl_Menu_ menu_,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted_item = convert(item, size);
    return (static_cast<Fl_DerivedMenu_*>(menu_))->menu(converted_item);
  }
  FL_EXPORT_C(void,Fl_Menu__copy)(fl_Menu_ menu_,fl_Menu_Item m){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->copy((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Menu__copy_with_user_data)(fl_Menu_ menu_,fl_Menu_Item m,void* user_data){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
  }
  FL_EXPORT_C(int,Fl_Menu__insert)(fl_Menu_ menu_,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_DerivedMenu_*>(menu_)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu__insert_with_flags)(fl_Menu_ menu_,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_DerivedMenu_*>(menu_)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Menu__insert_with_shortcutname)(fl_Menu_ menu_,int index,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_DerivedMenu_*>(menu_)),index, name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu__insert_with_shortcutname_flags)(fl_Menu_ menu_,int index,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_DerivedMenu_*>(menu_)),index, name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu__insert_with_user_data_flags)(fl_Menu_ menu_,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_DerivedMenu_*>(menu_)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_user_data)(fl_Menu_ menu_,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_flags)(fl_Menu_ menu_,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_user_data_flags)(fl_Menu_ menu_,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_shortcutname)(fl_Menu_ menu_,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_shortcutname_user_data)(fl_Menu_ menu_,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_shortcutname_flags)(fl_Menu_ menu_,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu__add_with_shortcutname_user_data_flags)(fl_Menu_ menu_,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_DerivedMenu_*>(menu_)),name,shortcut,flags);
  }
  FL_EXPORT_C(int, Fl_Menu__add_with_name)(fl_Menu_ menu_,  char* name){
    return (static_cast<Fl_Menu_*>(menu_))->add(name);
  }
  FL_EXPORT_C(int,Fl_Menu__size)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->size();
  }
  FL_EXPORT_C(void,Fl_Menu__set_size)(fl_Menu_ menu_,int W,int H){
    (static_cast<Fl_DerivedMenu_*>(menu_))->size(W,H);
  }
  FL_EXPORT_C(void,Fl_Menu__clear)(fl_Menu_ menu_){
    (static_cast<Fl_DerivedMenu_*>(menu_))->clear();
  }
  FL_EXPORT_C(int,Fl_Menu__clear_submenu)(fl_Menu_ menu_,int index){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->clear_submenu(index);
  }
  FL_EXPORT_C(void,Fl_Menu__replace)(fl_Menu_ menu_,int i,char* name){
    (static_cast<Fl_DerivedMenu_*>(menu_))->replace(i,name);
  }
  FL_EXPORT_C(void,Fl_Menu__remove)(fl_Menu_ menu_,int i ){
    (static_cast<Fl_DerivedMenu_*>(menu_))->remove(i);
  }
  FL_EXPORT_C(void,Fl_Menu__shortcut)(fl_Menu_ menu_,int i,int s){
    (static_cast<Fl_DerivedMenu_*>(menu_))->shortcut(i,s);
  }
  FL_EXPORT_C(void,Fl_Menu__set_mode)(fl_Menu_ menu_,int i,int fl){
    (static_cast<Fl_DerivedMenu_*>(menu_))->mode(i,fl);
  }
  FL_EXPORT_C(int,Fl_Menu__mode)(fl_Menu_ menu_,int i){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->mode(i);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu__mvalue)(fl_Menu_ menu_){
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_))->mvalue();
  }
  FL_EXPORT_C(int,Fl_Menu__value)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->value();
  }
  FL_EXPORT_C(int,Fl_Menu__value_with_item)(fl_Menu_ menu_,fl_Menu_Item item){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->value(static_cast<Fl_Menu_Item*>(item));
  }
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu__get_menu_item_by_index)(fl_Menu_ menu_,  int i) {
    return (fl_Menu_Item)(static_cast<Fl_DerivedMenu_*>(menu_)->get_menu_item_by_index(i));
  }
  FL_EXPORT_C(int,Fl_Menu__value_with_index)(fl_Menu_ menu_,int index){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->value(index);
  }
  FL_EXPORT_C(char*,Fl_Menu__text)(fl_Menu_ menu_){
    return (char*)(static_cast<Fl_DerivedMenu_*>(menu_))->text();
  }
  FL_EXPORT_C(char*,Fl_Menu__text_with_index)(fl_Menu_ menu_,int i){
    return (char*)(static_cast<Fl_DerivedMenu_*>(menu_))->text(i);
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu__textfont)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->textfont();
  }
  FL_EXPORT_C(void,Fl_Menu__set_textfont)(fl_Menu_ menu_,Fl_Font c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->textfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu__textsize)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->textsize();
  }
  FL_EXPORT_C(void,Fl_Menu__set_textsize)(fl_Menu_ menu_,Fl_Fontsize c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->textsize(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu__textcolor)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Menu__set_textcolor)(fl_Menu_ menu_,Fl_Color c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->textcolor(c);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu__down_box)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->down_box();
  }
  FL_EXPORT_C(void,Fl_Menu__set_down_box)(fl_Menu_ menu_,Fl_Boxtype b){
    (static_cast<Fl_DerivedMenu_*>(menu_))->down_box(b);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu__down_color)(fl_Menu_ menu_){
    return (static_cast<Fl_DerivedMenu_*>(menu_))->down_color();
  }
  FL_EXPORT_C(void,Fl_Menu__set_down_color)(fl_Menu_ menu_,unsigned c){
    (static_cast<Fl_DerivedMenu_*>(menu_))->down_color(c);
  }
#if FL_API_VERSION == 10304
  FL_EXPORT_C(void, Fl_Menu__set_only)(fl_Menu_ menu_, fl_Menu_Item m){
    (static_cast<Fl_DerivedMenu_*>(menu_))->setonly(static_cast<Fl_Menu_Item*>(m));
  }
#endif
#ifdef __cplusplus
}
#endif
