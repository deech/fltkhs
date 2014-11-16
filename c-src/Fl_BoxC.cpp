#include "Fl_BoxC.h"
#ifdef __cplusplus
Fl_DerivedBox::Fl_DerivedBox(int X, int Y, int W, int H, const char *l, fl_Box_Virtual_Funcs* funcs) : Fl_Box(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
 }
Fl_DerivedBox::Fl_DerivedBox(int X, int Y, int W, int H, fl_Box_Virtual_Funcs* funcs):Fl_Box(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedBox::Fl_DerivedBox(Fl_Boxtype b, int X, int Y, int W, int H, const char* l, fl_Box_Virtual_Funcs* funcs):Fl_Box(b,X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = 0;
  }
Fl_DerivedBox::~Fl_DerivedBox(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedBox::get_other_data(){
  return this->other_data;
}
void Fl_DerivedBox::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedBox::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Box) this);
  }
}
void Fl_DerivedBox::draw_box(){
  Fl_Box::draw_box();
}
void Fl_DerivedBox::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Box::draw_box(t,c);
}
void Fl_DerivedBox::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Box::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedBox::draw_backdrop(){
  Fl_Box::draw_backdrop();
}
void Fl_DerivedBox::draw_focus(){
  Fl_Box::draw_focus();
}
void Fl_DerivedBox::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Box::draw_focus(t,x,y,w,h);
}
void Fl_DerivedBox::draw_label(){
  Fl_Box::draw_label();
}
void Fl_DerivedBox::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Box::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedBox::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Box) this,event);
  }
  else {
    i = Fl_Box::handle(event);
  }
  return i;
}
void Fl_DerivedBox::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Box) this,x,y,w,h);
  }
  else {
    Fl_Box::resize(x,y,w,h);
  }
}
void Fl_DerivedBox::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Box) this);
  }
  else {
    Fl_Box::show();
  }
}
void Fl_DerivedBox::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Box) this);
  }
  else {
    Fl_Box::hide();
  }
}


void Fl_DerivedBox::draw_super(){
  Fl_Box::draw();
}

void Fl_DerivedBox::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Box) this);
  }
  else {
    Fl_Box::draw();
  }
}

Fl_Window* Fl_DerivedBox::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Box) this)));
  }
  else {
    win = Fl_Box::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedBox::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Box) this)));
  }
  else {
    win = Fl_Box::as_gl_window();
  }
  return win;
}
EXPORT {
  FL_EXPORT_C(fl_Box_Virtual_Funcs*, Fl_Box_default_virtual_funcs)(){
#endif
    fl_Box_Virtual_Funcs* ptr = (fl_Box_Virtual_Funcs*)malloc(sizeof(fl_Box_Virtual_Funcs));
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
  FL_EXPORT_C(void, Fl_Box_draw_super)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->draw_super();
  }
  FL_EXPORT_C(int,Fl_Box_handle_super)(fl_Box box,int event){
    return (static_cast<Fl_DerivedBox*>(box))->Fl_Box::handle(event);
  }
  FL_EXPORT_C(int,Fl_Box_handle )(fl_Box box, int event){
    return (static_cast<Fl_DerivedBox*>(box))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Box_resize_super )(fl_Box box,int x, int y, int w, int h){
    (static_cast<Fl_DerivedBox*>(box))->Fl_Box::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Box_resize )(fl_Box box,int x, int y, int w, int h){
    (static_cast<Fl_DerivedBox*>(box))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Box_show_super)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->Fl_Box::show();
  }
  FL_EXPORT_C(void,Fl_Box_show )(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->show();
  }
  FL_EXPORT_C(void,Fl_Box_hide_super)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->Fl_Box::hide();
  }
  FL_EXPORT_C(void,Fl_Box_hide )(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Box_as_window_super)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->Fl_Box::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Box_as_window )(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Box_as_gl_window_super)(fl_Box box){
    return (fl_Gl_Window) (static_cast<Fl_DerivedBox*>(box))->Fl_Box::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Box_as_gl_window )(fl_Box box){
    return (fl_Gl_Window) (static_cast<Fl_DerivedBox*>(box))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Box_parent)(fl_Box box){
    return (fl_Group) (static_cast<Fl_DerivedBox*>(box))->parent();
  }
  FL_EXPORT_C(void,Fl_Box_set_parent)(fl_Box box,fl_Group grp){
    (static_cast<Fl_DerivedBox*>(box))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Box_type)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->type();
  }
  FL_EXPORT_C(void,Fl_Box_set_type)(fl_Box box,uchar t){
   (static_cast<Fl_DerivedBox*>(box))->type(t);
  }
  FL_EXPORT_C(int,Fl_Box_x)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->x();
  }
  FL_EXPORT_C(int,Fl_Box_y)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->y();
  }
  FL_EXPORT_C(int,Fl_Box_w)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->w();
  }
  FL_EXPORT_C(int,Fl_Box_h)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->h();
  }
  FL_EXPORT_C(void,Fl_Box_set_align)(fl_Box box, Fl_Align alignment){
    (static_cast<Fl_DerivedBox*>(box))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Box_align)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Box_box)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->box();
  }
  FL_EXPORT_C(void,Fl_Box_set_box)(fl_Box box,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedBox*>(box))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Box_color)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->color();
  }
  FL_EXPORT_C(void,Fl_Box_set_color)(fl_Box box,Fl_Color bg){
    (static_cast<Fl_DerivedBox*>(box))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Box_set_color_with_bg_sel)(fl_Box box,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedBox*>(box))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Box_selection_color)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Box_set_selection_color)(fl_Box box,Fl_Color a){
    (static_cast<Fl_DerivedBox*>(box))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Box_label)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->label();
  }
  FL_EXPORT_C(void,Fl_Box_copy_label)(fl_Box box,const char* new_label){
    (static_cast<Fl_DerivedBox*>(box))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Box_set_label)(fl_Box box,const char* text){
    (static_cast<Fl_DerivedBox*>(box))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Box_labeltype)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Box_set_labeltype)(fl_Box box,Fl_Labeltype a){
    (static_cast<Fl_DerivedBox*>(box))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Box_set_labelcolor)(fl_Box box,Fl_Color c){
    (static_cast<Fl_DerivedBox*>(box))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Box_labelcolor)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Box_labelfont)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Box_set_labelfont)(fl_Box box,Fl_Font c){
    (static_cast<Fl_DerivedBox*>(box))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Box_labelsize)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Box_set_labelsize)(fl_Box box,Fl_Fontsize pix){
    (static_cast<Fl_DerivedBox*>(box))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Box_image)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->image();
  }
  FL_EXPORT_C(void,Fl_Box_set_image)(fl_Box box,fl_Image pix){
    (static_cast<Fl_DerivedBox*>(box))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Box_deimage)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->deimage();
  }
  FL_EXPORT_C(void,Fl_Box_set_deimage)(fl_Box box,fl_Image pix){
    (static_cast<Fl_DerivedBox*>(box))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Box_tooltip)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Box_copy_tooltip)(fl_Box box,const char* text){
    (static_cast<Fl_DerivedBox*>(box))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Box_set_tooltip)(fl_Box box,const char* text){
    (static_cast<Fl_DerivedBox*>(box))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Box_set_callback_with_user_data)(fl_Box box,fl_Callback cb,void* p){
    Fl_Box* castedBox = (static_cast<Fl_DerivedBox*>(box));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Box_set_callback)(fl_Box box,fl_Callback cb){
    Fl_Box* castedBox = (static_cast<Fl_DerivedBox*>(box));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Box_user_data)(fl_Box box){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedBox*>(box))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedBox*>(box))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Box_set_user_data)(fl_Box box,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Box*>(box))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Box*>(box))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Box*>(box))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Box_argument)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->argument();
  }
  FL_EXPORT_C(void,Fl_Box_set_argument)(fl_Box box,long v){
    (static_cast<Fl_DerivedBox*>(box))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Box_when)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->when();
  }
  FL_EXPORT_C(void,Fl_Box_set_when)(fl_Box box,uchar i){
    (static_cast<Fl_DerivedBox*>(box))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Box_visible)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->visible();
  }
  FL_EXPORT_C(int,Fl_Box_visible_r)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Box_set_visible)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->visible();
  }
  FL_EXPORT_C(void,Fl_Box_clear_visible)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Box_active)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->active();
  }
  FL_EXPORT_C(int,Fl_Box_active_r)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->active_r();
  }
  FL_EXPORT_C(void,Fl_Box_activate)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->activate();
  }
  FL_EXPORT_C(void,Fl_Box_deactivate)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Box_output)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->output();
  }
  FL_EXPORT_C(void,Fl_Box_set_output)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->output();
  }
  FL_EXPORT_C(void,Fl_Box_clear_output)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Box_takesevents)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Box_set_changed)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->changed();
  }
  FL_EXPORT_C(void,Fl_Box_clear_changed)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Box_take_focus)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Box_set_visible_focus)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Box_clear_visible_focus)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Box_modify_visible_focus)(fl_Box box,int v){
    (static_cast<Fl_DerivedBox*>(box))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Box_visible_focus)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Box_do_callback)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Box_do_callback_with_widget_and_user_data)(fl_Box box,fl_Widget w,long arg){
    (static_cast<Fl_DerivedBox*>(box))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Box_do_callback_with_widget_and_default_user_data)(fl_Box box,fl_Widget w){
    (static_cast<Fl_DerivedBox*>(box))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Box_contains)(fl_Box box,fl_Widget w){
    return (static_cast<Fl_DerivedBox*>(box))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Box_inside)(fl_Box box,fl_Widget w){
    return (static_cast<Fl_DerivedBox*>(box))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Box_redraw)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->redraw();
  }
  FL_EXPORT_C(void,Fl_Box_redraw_label)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Box_damage)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->damage();
  }
  FL_EXPORT_C(void,Fl_Box_clear_damage_with_bitmask)(fl_Box box,uchar c){
    (static_cast<Fl_DerivedBox*>(box))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Box_clear_damage)(fl_Box box){
    (static_cast<Fl_DerivedBox*>(box))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Box_damage_with_text)(fl_Box box,uchar c){
    (static_cast<Fl_DerivedBox*>(box))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Box_damage_inside_widget)(fl_Box box,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedBox*>(box))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Box_draw_label_with_xywh_alignment)(fl_Box box,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedBox*>(box))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Box_measure_label)(fl_Box box,int* ww,int* hh){
    (static_cast<Fl_DerivedBox*>(box))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void*, Fl_Box_other_data)(fl_Box box){
    return (static_cast<Fl_DerivedBox*>(box))->get_other_data();
  }
  FL_EXPORT_C(void, Fl_Box_set_other_data)(fl_Box box, void* v){
    (static_cast<Fl_DerivedBox*>(box))->set_other_data(v);
  }
  FL_EXPORT_C(fl_Box, Fl_Box_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Box_Virtual_Funcs* funcs = Fl_Box_default_virtual_funcs();
    Fl_DerivedBox* box = new Fl_DerivedBox(x,y,w,h,label,funcs);
    return (static_cast<fl_Box>(box));
  }
  FL_EXPORT_C(fl_Box,    Fl_OverriddenBox_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Box_Virtual_Funcs* funcs){
    Fl_DerivedBox* box = new Fl_DerivedBox(x,y,w,h,label,funcs);
    return (static_cast<fl_Box>(box));
  }
  FL_EXPORT_C(fl_Box, Fl_Box_New)(int x, int y, int w, int h) {
    fl_Box_Virtual_Funcs* funcs = Fl_Box_default_virtual_funcs();
    Fl_DerivedBox* box = new Fl_DerivedBox(x,y,w,h,0,funcs);
    return (fl_Box)box;
  }
  FL_EXPORT_C(fl_Box   , Fl_OverriddenBox_New)(int x, int y, int w, int h, fl_Box_Virtual_Funcs* funcs){
    Fl_DerivedBox* box = new Fl_DerivedBox(x,y,w,h,0,funcs);
    return (fl_Box)box;
  }
  FL_EXPORT_C(fl_Box, Fl_Box_New_WithBoxtype)(Fl_Boxtype b, int x, int y, int w, int h, const char* label) {
    fl_Box_Virtual_Funcs* funcs = Fl_Box_default_virtual_funcs();
    Fl_DerivedBox* box = new Fl_DerivedBox(b,x,y,w,h,label,funcs);
    return (static_cast<fl_Box>(box));
  }
  FL_EXPORT_C(fl_Box,    Fl_OverriddenBox_New_WithBoxtype)(Fl_Boxtype b, int x, int y, int w, int h, const char* label, fl_Box_Virtual_Funcs* funcs){
    Fl_DerivedBox* box = new Fl_DerivedBox(b,x,y,w,h,label,funcs);
    return (static_cast<fl_Box>(box));
  }
  FL_EXPORT_C(void,      Fl_Box_Destroy)(fl_Box box){
    delete (static_cast<Fl_DerivedBox*>(box));
  }
#ifdef __cplusplus
}
#endif
