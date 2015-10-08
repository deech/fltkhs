#include "Fl_WidgetC.h"
#ifdef __cplusplus
Fl_DerivedWidget::Fl_DerivedWidget(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Widget(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
}
Fl_DerivedWidget::Fl_DerivedWidget(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Widget(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
}
Fl_DerivedWidget::~Fl_DerivedWidget(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedWidget::get_other_data(){
  return this->other_data;
}
void Fl_DerivedWidget::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedWidget::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Widget) this);
  }
}
void Fl_DerivedWidget::draw(){
  // defined as virtual void draw = 0 in Fl_Widget.H, needs to be provided.
  this->overriddenFuncs->draw((fl_Widget) this);
}
void Fl_DerivedWidget::draw_box(){
  Fl_Widget::draw_box();
}
void Fl_DerivedWidget::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Widget::draw_box(t,c);
}
void Fl_DerivedWidget::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Widget::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedWidget::draw_backdrop(){
  Fl_Widget::draw_backdrop();
}
void Fl_DerivedWidget::draw_focus(){
  Fl_Widget::draw_focus();
}
void Fl_DerivedWidget::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Widget::draw_focus(t,x,y,w,h);
}
void Fl_DerivedWidget::draw_label(){
  Fl_Widget::draw_label();
}
void Fl_DerivedWidget::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Widget::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedWidget::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Widget) this,event);
  }
  else {
    i = Fl_Widget::handle(event);
  }
  return i;
}
void Fl_DerivedWidget::resize_super(int x, int y, int w, int h){
  Fl_Widget::resize(x,y,w,h);
}
void Fl_DerivedWidget::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Widget) this,x,y,w,h);
  }
  else {
    Fl_Widget::resize(x,y,w,h);
  }
}
void Fl_DerivedWidget::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Widget) this);
  }
  else {
    Fl_Widget::show();
  }
}
void Fl_DerivedWidget::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Widget) this);
  }
  else {
    Fl_Widget::hide();
  }
}
Fl_Group* Fl_DerivedWidget::as_group(){
  Fl_Group* grp;
  if (this->overriddenFuncs->as_group != NULL) {
    grp = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Widget) this)));
  }
  else {
    grp = Fl_Widget::as_group();
  }
  return grp;
}
Fl_Window* Fl_DerivedWidget::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Widget) this)));
  }
  else {
    win = Fl_Widget::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedWidget::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Widget) this)));
  }
  else {
    win = Fl_Widget::as_gl_window();
  }
  return win;
}
 EXPORT {
#endif
  FL_EXPORT_C(fl_Widget_Virtual_Funcs*, Fl_Widget_default_virtual_funcs)(){
    fl_Widget_Virtual_Funcs* ptr = (fl_Widget_Virtual_Funcs*)malloc(sizeof(fl_Widget_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    ptr->as_group = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Widget_handle)(fl_Widget self, int event){
    return (static_cast<Fl_DerivedWidget*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Widget_parent)(fl_Widget widget){
    return (fl_Group) (static_cast<Fl_DerivedWidget*>(widget))->parent();
  }
  FL_EXPORT_C(void,Fl_Widget_set_parent)(fl_Widget widget,fl_Group grp){
    (static_cast<Fl_DerivedWidget*>(widget))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Widget_type)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->type();
  }
  FL_EXPORT_C(void,Fl_Widget_set_type)(fl_Widget widget,uchar t){
    (static_cast<Fl_DerivedWidget*>(widget))->type(t);
  }

FL_EXPORT_C(void, Fl_Widget_draw_box)(fl_Widget Widget){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_box();
}
FL_EXPORT_C(void, Fl_Widget_draw_box_with_tc)(fl_Widget Widget,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Widget_draw_box_with_txywhc)(fl_Widget Widget,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Widget_draw_backdrop)(fl_Widget Widget){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Widget_draw_focus)(fl_Widget Widget){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_focus();
}
FL_EXPORT_C(void, Fl_Widget_draw_focus_with_txywh)(fl_Widget Widget,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Widget_draw_label)(fl_Widget Widget){
 (static_cast<Fl_DerivedWidget*>(Widget))->draw_label();
}
  FL_EXPORT_C(int,Fl_Widget_x)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->x();
  }
  FL_EXPORT_C(int,Fl_Widget_y)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->y();
  }
  FL_EXPORT_C(int,Fl_Widget_w)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->w();
  }
  FL_EXPORT_C(int,Fl_Widget_h)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->h();
  }
  FL_EXPORT_C(void,Fl_Widget_set_align)(fl_Widget widget, Fl_Align alignment){
    (static_cast<Fl_DerivedWidget*>(widget))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Widget_align)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Widget_box)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->box();
  }
  FL_EXPORT_C(void,Fl_Widget_set_box)(fl_Widget widget,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedWidget*>(widget))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Widget_color)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->color();
  }
  FL_EXPORT_C(void,Fl_Widget_set_color)(fl_Widget widget,Fl_Color bg){
    (static_cast<Fl_DerivedWidget*>(widget))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Widget_set_color_with_bg_sel)(fl_Widget widget,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedWidget*>(widget))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Widget_selection_color)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Widget_set_selection_color)(fl_Widget widget,Fl_Color a){
    (static_cast<Fl_DerivedWidget*>(widget))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Widget_label)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->label();
  }
  FL_EXPORT_C(void,Fl_Widget_copy_label)(fl_Widget widget,const char* new_label){
    (static_cast<Fl_DerivedWidget*>(widget))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Widget_set_label)(fl_Widget widget,const char* text){
    (static_cast<Fl_DerivedWidget*>(widget))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Widget_labeltype)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Widget_set_labeltype)(fl_Widget widget,Fl_Labeltype a){
    (static_cast<Fl_DerivedWidget*>(widget))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Widget_labelcolor)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Widget_set_labelcolor)(fl_Widget widget,Fl_Color c){
    (static_cast<Fl_DerivedWidget*>(widget))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Widget_labelfont)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Widget_set_labelfont)(fl_Widget widget,Fl_Font c){
    (static_cast<Fl_DerivedWidget*>(widget))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Widget_labelsize)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Widget_set_labelsize)(fl_Widget widget,Fl_Fontsize pix){
    (static_cast<Fl_DerivedWidget*>(widget))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Widget_image)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->image();
  }
  FL_EXPORT_C(void,Fl_Widget_set_image)(fl_Widget widget,fl_Image pix){
    (static_cast<Fl_DerivedWidget*>(widget))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Widget_deimage)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->deimage();
  }
  FL_EXPORT_C(void,Fl_Widget_set_deimage)(fl_Widget widget,fl_Image pix){
    (static_cast<Fl_DerivedWidget*>(widget))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Widget_tooltip)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Widget_copy_tooltip)(fl_Widget widget,const char* text){
    (static_cast<Fl_DerivedWidget*>(widget))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Widget_set_tooltip)(fl_Widget widget,const char* text){
    (static_cast<Fl_DerivedWidget*>(widget))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Widget_set_callback_with_user_data)(fl_Widget widget,fl_Callback* cb,void* p){
    Fl_DerivedWidget* castedWindow = (static_cast<Fl_DerivedWidget*>(widget));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Widget_do_callback)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Widget_set_callback)(fl_Widget widget,fl_Callback* cb){
    Fl_DerivedWidget* castedWindow = (static_cast<Fl_DerivedWidget*>(widget));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(int, Fl_Widget_has_callback)(fl_Widget widget){
    void* p = 0;
    p = (void*)(static_cast<Fl_DerivedWidget*>(widget)->callback());
    if (p == NULL) {
      return 0;
    }
    else {
      return 1;
    }
  }
  FL_EXPORT_C(void*,Fl_Widget_other_data)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->get_other_data();
  }
  FL_EXPORT_C(void,Fl_Widget_set_other_data)(fl_Widget widget,void* v){
    (static_cast<Fl_DerivedWidget*>(widget))->set_other_data(v);
  }
  FL_EXPORT_C(void*,Fl_Widget_user_data)(fl_Widget widget){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedWidget*>(widget))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedWidget*>(widget))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Widget_set_user_data)(fl_Widget widget,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Widget*>(widget))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Widget*>(widget))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Widget*>(widget))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Widget_argument)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->argument();
  }
  FL_EXPORT_C(void,Fl_Widget_set_argument)(fl_Widget widget,long v){
    (static_cast<Fl_DerivedWidget*>(widget))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Widget_when)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->when();
  }
  FL_EXPORT_C(void,Fl_Widget_set_when)(fl_Widget widget,uchar i){
    (static_cast<Fl_DerivedWidget*>(widget))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_visible)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->visible();
  }
  FL_EXPORT_C(int,Fl_Widget_visible_r)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Widget_show_super)(fl_Widget widget){
    return (static_cast<Fl_Widget*>(widget))->show();
  }
  FL_EXPORT_C(void,Fl_Widget_show)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->show();
  }
  FL_EXPORT_C(void,Fl_Widget_hide_super)(fl_Widget widget){
    return (static_cast<Fl_Widget*>(widget))->hide();
  }
  FL_EXPORT_C(void,Fl_Widget_hide)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->hide();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_visible)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_active)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->active();
  }
  FL_EXPORT_C(int,Fl_Widget_active_r)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->active_r();
  }
  FL_EXPORT_C(void,Fl_Widget_activate)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->activate();
  }
  FL_EXPORT_C(void,Fl_Widget_deactivate)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_output)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->output();
  }
  FL_EXPORT_C(void,Fl_Widget_set_output)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->output();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_output)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_takesevents)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Widget_set_changed)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->changed();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_changed)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_changed();
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_changed)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->changed();
  }
  FL_EXPORT_C(int,Fl_Widget_take_focus)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Widget_set_active)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->active();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_active)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_active();
  }
  FL_EXPORT_C(void,Fl_Widget_set_visible_focus)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Widget_set_visible)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->set_visible();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_visible_focus)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Widget_modify_visible_focus)(fl_Widget widget,int v){
    (static_cast<Fl_DerivedWidget*>(widget))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Widget_visible_focus)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Widget_contains)(fl_Widget widget,fl_Widget w){
    return (static_cast<Fl_DerivedWidget*>(widget))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Widget_inside)(fl_Widget widget,fl_Widget w){
    return (static_cast<Fl_DerivedWidget*>(widget))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Widget_redraw)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->redraw();
  }
  FL_EXPORT_C(void,Fl_Widget_redraw_label)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Widget_damage)(fl_Widget widget){
    return (static_cast<Fl_DerivedWidget*>(widget))->damage();
  }
  FL_EXPORT_C(void,Fl_Widget_clear_damage_with_bitmask)(fl_Widget widget,uchar c){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Widget_clear_damage)(fl_Widget widget){
    (static_cast<Fl_DerivedWidget*>(widget))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Widget_damage_with_text)(fl_Widget widget,uchar c){
    (static_cast<Fl_DerivedWidget*>(widget))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Widget_damage_inside_widget)(fl_Widget widget,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedWidget*>(widget))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Widget_draw_label_with_xywh_alignment)(fl_Widget widget,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedWidget*>(widget))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Widget_measure_label)(fl_Widget widget,int* ww,int* hh){
    (static_cast<Fl_DerivedWidget*>(widget))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Widget_window)(fl_Widget widget){
    return (fl_Window) (static_cast<Fl_DerivedWidget*>(widget))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Widget_top_window)(fl_Widget widget){
    return (fl_Window) (static_cast<Fl_DerivedWidget*>(widget))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Widget_top_window_offset)(fl_Widget widget, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedWidget*>(widget))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Widget_as_group_super)(fl_Widget widget){
    return (fl_Group) (static_cast<Fl_Widget*>(widget))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Widget_as_group)(fl_Widget widget){
    return (fl_Group) (static_cast<Fl_DerivedWidget*>(widget))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Widget_as_gl_window_super)(fl_Widget widget){
    return (fl_Gl_Window) (static_cast<Fl_Widget*>(widget))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Widget_as_gl_window)(fl_Widget widget){
    return (fl_Gl_Window) (static_cast<Fl_DerivedWidget*>(widget))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Widget_resize_super)(fl_Widget widget,int X,int Y,int W,int H){
    return (static_cast<Fl_DerivedWidget*>(widget))->resize_super(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Widget_resize)(fl_Widget widget,int X,int Y,int W,int H){
    return (static_cast<Fl_DerivedWidget*>(widget))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(fl_Widget,    Fl_Widget_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedWidget* w = new Fl_DerivedWidget(X,Y,W,H,fs);
    return (fl_Widget)w;
  }
  FL_EXPORT_C(fl_Widget,    Fl_Widget_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedWidget* w = new Fl_DerivedWidget(X,Y,W,H,label,fs);
    return (fl_Widget)w;
  }
  FL_EXPORT_C(fl_Widget,    Fl_OverriddenWidget_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedWidget* w = new Fl_DerivedWidget(X,Y,W,H,fs);
    return (fl_Widget)w;
  }
  FL_EXPORT_C(fl_Widget,    Fl_OverriddenWidget_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedWidget* w = new Fl_DerivedWidget(X,Y,W,H,label,fs);
    return (fl_Widget)w;
  }
  FL_EXPORT_C(void, Fl_Widget_Destroy)(fl_Widget widget){
    delete (static_cast<Fl_DerivedWidget*>(widget));
  }
#ifdef __cplusplus
 }
#endif
