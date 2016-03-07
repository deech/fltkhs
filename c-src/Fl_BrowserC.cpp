#include "Fl_BrowserC.h"
#ifdef __cplusplus
Fl_DerivedBrowser::Fl_DerivedBrowser(int X, int Y, int W, int H, const char *l, fl_Browser_Virtual_Funcs* funcs) : Fl_Browser(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
 }
Fl_DerivedBrowser::Fl_DerivedBrowser(int X, int Y, int W, int H, fl_Browser_Virtual_Funcs* funcs):Fl_Browser(X,Y,W,H,0){
    overriddenFuncs = funcs;
    other_data = (void*)0;
}
Fl_DerivedBrowser::~Fl_DerivedBrowser(){
  free(overriddenFuncs);
  free(other_data);
}
void* Fl_DerivedBrowser::get_other_data(){
  return this->other_data;
}
void Fl_DerivedBrowser::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedBrowser::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Browser) this);
  }
  else {
    Fl_Browser::draw();
  }
}
void Fl_DerivedBrowser::draw_box(){
  Fl_Browser::draw_box();
}
void Fl_DerivedBrowser::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Browser::draw_box(t,c);
}
void Fl_DerivedBrowser::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Browser::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedBrowser::draw_backdrop(){
  Fl_Browser::draw_backdrop();
}
void Fl_DerivedBrowser::draw_focus(){
  Fl_Browser::draw_focus();
}
void Fl_DerivedBrowser::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Browser::draw_focus(t,x,y,w,h);
}
void Fl_DerivedBrowser::draw_label(){
  Fl_Browser::draw_label();
}
void Fl_DerivedBrowser::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Browser::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedBrowser::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Browser) this,event);
  }
  else {
    i = Fl_Browser::handle(event);
  }
  return i;
}
void Fl_DerivedBrowser::resize_super(int x, int y, int w, int h){
  Fl_Browser::resize(x,y,w,h);
}
void Fl_DerivedBrowser::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Browser) this,x,y,w,h);
  }
  else {
    Fl_Browser::resize(x,y,w,h);
  }
}
void Fl_DerivedBrowser::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Browser) this);
  }
  else {
    Fl_Browser::show();
  }
}
void Fl_DerivedBrowser::show(int val){
  if (this->overriddenFuncs->show_with_line != NULL) {
    this->overriddenFuncs->show_with_line((fl_Browser) this, val);
  }
  else {
    Fl_Browser::show(val);
  }
}
void Fl_DerivedBrowser::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Browser) this);
  }
  else {
    Fl_Browser::hide();
  }
}
void Fl_DerivedBrowser::hide(int line){
  if (this->overriddenFuncs->hide_with_line != NULL) {
    this->overriddenFuncs->hide_with_line((fl_Browser) this, line);
  }
  else {
    Fl_Browser::hide(line);
  }
}
Fl_Group* Fl_DerivedBrowser::as_group(){
  Fl_Group* grp;
  if (this->overriddenFuncs->as_group != NULL) {
    grp = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Browser) this)));
  }
  else {
    grp = Fl_Browser::as_group();
  }
  return grp;
}
Fl_Window* Fl_DerivedBrowser::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Browser) this)));
  }
  else {
    win = Fl_Browser::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedBrowser::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Browser) this)));
  }
  else {
    win = Fl_Browser::as_gl_window();
  }
  return win;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Browser_Virtual_Funcs*, Fl_Browser_default_virtual_funcs)(){
    fl_Browser_Virtual_Funcs* ptr = (fl_Browser_Virtual_Funcs*)malloc(sizeof(fl_Browser_Virtual_Funcs));
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
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Browser_handle)(fl_Browser self, int event){
    return (static_cast<Fl_DerivedBrowser*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Browser_parent)(fl_Browser browser){
    return (fl_Group) (static_cast<Fl_DerivedBrowser*>(browser))->parent();
  }
  FL_EXPORT_C(void,Fl_Browser_set_parent)(fl_Browser browser,fl_Group grp){
    (static_cast<Fl_DerivedBrowser*>(browser))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Browser_type)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->type();
  }
  FL_EXPORT_C(void,Fl_Browser_set_type)(fl_Browser browser,uchar t){
    (static_cast<Fl_DerivedBrowser*>(browser))->type(t);
  }

FL_EXPORT_C(void, Fl_Browser_draw_box)(fl_Browser Browser){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_box();
}
FL_EXPORT_C(void, Fl_Browser_draw_box_with_tc)(fl_Browser Browser,Fl_Boxtype t, Fl_Color c){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_box(t,c);
}
FL_EXPORT_C(void, Fl_Browser_draw_box_with_txywhc)(fl_Browser Browser,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_box(t,x,y,w,h,c);
}
FL_EXPORT_C(void, Fl_Browser_draw_backdrop)(fl_Browser Browser){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_backdrop();
}
FL_EXPORT_C(void, Fl_Browser_draw_focus)(fl_Browser Browser){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_focus();
}
FL_EXPORT_C(void, Fl_Browser_draw_focus_with_txywh)(fl_Browser Browser,Fl_Boxtype t, int x,int y,int w,int h){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_focus(t,x,y,w,h);
}
FL_EXPORT_C(void, Fl_Browser_draw_label)(fl_Browser Browser){
 (static_cast<Fl_DerivedBrowser*>(Browser))->draw_label();
}
  FL_EXPORT_C(int,Fl_Browser_x)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->x();
  }
  FL_EXPORT_C(int,Fl_Browser_y)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->y();
  }
  FL_EXPORT_C(int,Fl_Browser_w)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->w();
  }
  FL_EXPORT_C(int,Fl_Browser_h)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->h();
  }
  FL_EXPORT_C(void,Fl_Browser_set_align)(fl_Browser browser, Fl_Align alignment){
    (static_cast<Fl_DerivedBrowser*>(browser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Browser_align)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Browser_box)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->box();
  }
  FL_EXPORT_C(void,Fl_Browser_set_box)(fl_Browser browser,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedBrowser*>(browser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Browser_color)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->color();
  }
  FL_EXPORT_C(void,Fl_Browser_set_color)(fl_Browser browser,Fl_Color bg){
    (static_cast<Fl_DerivedBrowser*>(browser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Browser_set_color_with_bg_sel)(fl_Browser browser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedBrowser*>(browser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Browser_selection_color)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Browser_set_selection_color)(fl_Browser browser,Fl_Color a){
    (static_cast<Fl_DerivedBrowser*>(browser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Browser_label)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->label();
  }
  FL_EXPORT_C(void,Fl_Browser_copy_label)(fl_Browser browser,const char* new_label){
    (static_cast<Fl_DerivedBrowser*>(browser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Browser_set_label)(fl_Browser browser,const char* text){
    (static_cast<Fl_DerivedBrowser*>(browser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Browser_labeltype)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Browser_set_labeltype)(fl_Browser browser,Fl_Labeltype a){
    (static_cast<Fl_DerivedBrowser*>(browser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Browser_set_labelcolor)(fl_Browser browser,Fl_Color c){
    (static_cast<Fl_DerivedBrowser*>(browser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Browser_labelcolor)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Browser_labelfont)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Browser_set_labelfont)(fl_Browser browser,Fl_Font c){
    (static_cast<Fl_DerivedBrowser*>(browser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Browser_labelsize)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Browser_set_labelsize)(fl_Browser browser,Fl_Fontsize pix){
    (static_cast<Fl_DerivedBrowser*>(browser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Browser_image)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->image();
  }
  FL_EXPORT_C(void,Fl_Browser_set_image)(fl_Browser browser,fl_Image pix){
    (static_cast<Fl_DerivedBrowser*>(browser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Browser_deimage)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->deimage();
  }
  FL_EXPORT_C(void,Fl_Browser_set_deimage)(fl_Browser browser,fl_Image pix){
    (static_cast<Fl_DerivedBrowser*>(browser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Browser_tooltip)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Browser_copy_tooltip)(fl_Browser browser,const char* text){
    (static_cast<Fl_DerivedBrowser*>(browser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Browser_set_tooltip)(fl_Browser browser,const char* text){
    (static_cast<Fl_DerivedBrowser*>(browser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Browser_set_callback_with_user_data)(fl_Browser browser,fl_Callback* cb,void* p){
    Fl_DerivedBrowser* castedWindow = (static_cast<Fl_DerivedBrowser*>(browser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Browser_set_callback)(fl_Browser browser,fl_Callback* cb){
    Fl_DerivedBrowser* castedWindow = (static_cast<Fl_DerivedBrowser*>(browser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Browser_other_data)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->get_other_data();
  }
  FL_EXPORT_C(void,Fl_Browser_set_other_data)(fl_Browser browser,void* v){
    (static_cast<Fl_DerivedBrowser*>(browser))->set_other_data(v);
  }
  FL_EXPORT_C(void*,Fl_Browser_user_data)(fl_Browser browser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedBrowser*>(browser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedBrowser*>(browser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Browser_set_user_data)(fl_Browser browser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Browser*>(browser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Browser*>(browser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Browser*>(browser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Browser_argument)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->argument();
  }
  FL_EXPORT_C(void,Fl_Browser_set_argument)(fl_Browser browser,long v){
    (static_cast<Fl_DerivedBrowser*>(browser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Browser_when)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->when();
  }
  FL_EXPORT_C(void,Fl_Browser_set_when)(fl_Browser browser,uchar i){
    (static_cast<Fl_DerivedBrowser*>(browser))->when(i);
  }
  FL_EXPORT_C(int,Fl_Browser_visible_r)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Browser_show_super)(fl_Browser browser){
    return (static_cast<Fl_Browser*>(browser))->Fl_Browser::show();
  }
  FL_EXPORT_C(void,Fl_Browser_hide_super)(fl_Browser browser){
    return (static_cast<Fl_Browser*>(browser))->Fl_Browser::hide();
  }
  FL_EXPORT_C(void,Fl_Browser_clear_visible)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Browser_active)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->active();
  }
  FL_EXPORT_C(int,Fl_Browser_active_r)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->active_r();
  }
  FL_EXPORT_C(void,Fl_Browser_activate)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->activate();
  }
  FL_EXPORT_C(void,Fl_Browser_deactivate)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Browser_output)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->output();
  }
  FL_EXPORT_C(void,Fl_Browser_set_output)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->output();
  }
  FL_EXPORT_C(void,Fl_Browser_clear_output)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Browser_takesevents)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Browser_set_changed)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->changed();
  }
  FL_EXPORT_C(void,Fl_Browser_clear_changed)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Browser_take_focus)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Browser_set_visible_focus)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Browser_clear_visible_focus)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Browser_modify_visible_focus)(fl_Browser browser,int v){
    (static_cast<Fl_DerivedBrowser*>(browser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Browser_visible_focus)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Browser_contains)(fl_Browser browser,fl_Widget w){
    return (static_cast<Fl_DerivedBrowser*>(browser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Browser_inside)(fl_Browser browser,fl_Widget w){
    return (static_cast<Fl_DerivedBrowser*>(browser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Browser_redraw)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->redraw();
  }
  FL_EXPORT_C(void,Fl_Browser_redraw_label)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Browser_damage)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->damage();
  }
  FL_EXPORT_C(void,Fl_Browser_clear_damage_with_bitmask)(fl_Browser browser,uchar c){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Browser_clear_damage)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Browser_damage_with_text)(fl_Browser browser,uchar c){
    (static_cast<Fl_DerivedBrowser*>(browser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Browser_damage_inside_widget)(fl_Browser browser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedBrowser*>(browser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Browser_draw_label_with_xywh_alignment)(fl_Browser browser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedBrowser*>(browser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Browser_measure_label)(fl_Browser browser,int* ww,int* hh){
    (static_cast<Fl_DerivedBrowser*>(browser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Browser_window)(fl_Browser browser){
    return (fl_Window) (static_cast<Fl_DerivedBrowser*>(browser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Browser_top_window)(fl_Browser browser){
    return (fl_Window) (static_cast<Fl_DerivedBrowser*>(browser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Browser_top_window_offset)(fl_Browser browser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedBrowser*>(browser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Browser_as_group_super)(fl_Browser browser){
    return (fl_Group) (static_cast<Fl_Browser*>(browser))->Fl_Browser::as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Browser_as_group)(fl_Browser browser){
    return (fl_Group) (static_cast<Fl_DerivedBrowser*>(browser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Browser_as_gl_window_super)(fl_Browser browser){
    return (fl_Gl_Window) (static_cast<Fl_Browser*>(browser))->Fl_Browser::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Browser_as_gl_window)(fl_Browser browser){
    return (fl_Gl_Window) (static_cast<Fl_DerivedBrowser*>(browser))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Browser_set_resizable_by_reference)(fl_Browser browser,fl_Widget o){
    (static_cast<Fl_DerivedBrowser*>(browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Browser_set_resizable)(fl_Browser browser,fl_Widget o){
    (static_cast<Fl_DerivedBrowser*>(browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Browser_resizable)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->resizable();
  }
  FL_EXPORT_C(void,Fl_Browser_add_resizable)(fl_Browser browser,fl_Widget o){
    return (static_cast<Fl_DerivedBrowser*>(browser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Browser_set_clip_children)(fl_Browser browser,int c){
    return (static_cast<Fl_DerivedBrowser*>(browser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Browser_clip_children)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Browser_focus)(fl_Browser browser, fl_Widget W){
    return (static_cast<Fl_DerivedBrowser*>(browser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Browser__ddfdesign_kludge)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->_ddfdesign_kludge();
  }
  // FL_EXPORT_C(void,Fl_Browser_forms_end)(fl_Browser self){
  //   (static_cast<Fl_DerivedBrowser*>(self))->forms_end();
  // }

  FL_EXPORT_C(fl_Browser, Fl_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    fl_Browser_Virtual_Funcs* funcs = Fl_Browser_default_virtual_funcs();
    Fl_DerivedBrowser* browser = new Fl_DerivedBrowser(x,y,w,h,label,funcs);
    return (static_cast<fl_Browser>(browser));
  }
  FL_EXPORT_C(fl_Browser, Fl_Browser_New)(int x, int y, int w, int h) {
    fl_Browser_Virtual_Funcs* funcs = Fl_Browser_default_virtual_funcs();
    Fl_DerivedBrowser* browser = new Fl_DerivedBrowser(x,y,w,h,0,funcs);
    return (fl_Browser)browser;
  }
  FL_EXPORT_C(fl_Browser, Fl_OverriddenBrowser_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Browser_Virtual_Funcs* funcs) {
    Fl_DerivedBrowser* browser = new Fl_DerivedBrowser(x,y,w,h,label,funcs);
    return (static_cast<fl_Browser>(browser));
  }
  FL_EXPORT_C(fl_Browser, Fl_OverriddenBrowser_New)(int x, int y, int w, int h, fl_Browser_Virtual_Funcs* funcs) {
    Fl_DerivedBrowser* browser = new Fl_DerivedBrowser(x,y,w,h,0,funcs);
    return (fl_Browser)browser;
  }
  FL_EXPORT_C(void,Fl_Browser_Destroy)(fl_Browser browser){
    delete (static_cast<Fl_DerivedBrowser*>(browser));
  }
  FL_EXPORT_C(void,Fl_Browser_remove)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->remove(line);
  }
  FL_EXPORT_C(void,Fl_Browser_add)(fl_Browser browser,const char* newtext){
    return (static_cast<Fl_DerivedBrowser*>(browser))->add(newtext);
  }
  FL_EXPORT_C(void,Fl_Browser_add_with_d)(fl_Browser browser,const char* newtext,void* d){
    return (static_cast<Fl_DerivedBrowser*>(browser))->add(newtext,d);
  }
  FL_EXPORT_C(void,Fl_Browser_insert)(fl_Browser browser,int line,const char* newtext){
    return (static_cast<Fl_DerivedBrowser*>(browser))->insert(line,newtext);
  }
  FL_EXPORT_C(void,Fl_Browser_insert_with_d)(fl_Browser browser,int line,const char* newtext,void* d){
    return (static_cast<Fl_DerivedBrowser*>(browser))->insert(line,newtext,d);
  }
  FL_EXPORT_C(void,Fl_Browser_move)(fl_Browser browser,int to,int from){
    return (static_cast<Fl_DerivedBrowser*>(browser))->move(to,from);
  }
  FL_EXPORT_C(int,Fl_Browser_load)(fl_Browser browser,const char* filename){
    return (static_cast<Fl_DerivedBrowser*>(browser))->load(filename);
  }
  FL_EXPORT_C(void,Fl_Browser_swap)(fl_Browser browser,int a, int b){
    (static_cast<Fl_DerivedBrowser*>(browser))->swap(a,b);
  }
  FL_EXPORT_C(void,Fl_Browser_clear)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->clear();
  }
  FL_EXPORT_C(int,Fl_Browser_size)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->size();
  }
  FL_EXPORT_C(void,Fl_Browser_set_size)(fl_Browser browser,int W,int H){
    return (static_cast<Fl_DerivedBrowser*>(browser))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Browser_topline)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->topline();
  }
  FL_EXPORT_C(void,Fl_Browser_lineposition)(fl_Browser browser,int line,Fl_Line_Position pos){
    Fl_Browser::Fl_Line_Position p = (Fl_Browser::Fl_Line_Position)-1;
    switch(p){
    case TOP :    {p = Fl_Browser::TOP; break;}
    case BOTTOM : {p = Fl_Browser::BOTTOM; break;}
    case MIDDLE : {p = Fl_Browser::MIDDLE; break;}
    default:      {p = (Fl_Browser::Fl_Line_Position)-1; break;}
    }
    return (static_cast<Fl_DerivedBrowser*>(browser))->lineposition(line,p);
  }
  FL_EXPORT_C(void,Fl_Browser_set_topline)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->topline(line);
  }
  FL_EXPORT_C(void,Fl_Browser_bottomline)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->bottomline(line);
  }
  FL_EXPORT_C(void,Fl_Browser_middleline)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->middleline(line);
  }
  FL_EXPORT_C(int,Fl_Browser_select)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->select(line);
  }
  FL_EXPORT_C(int,Fl_Browser_select_with_val)(fl_Browser browser,int line,int val){
    return (static_cast<Fl_DerivedBrowser*>(browser))->select(line,val);
  }
  FL_EXPORT_C(int,Fl_Browser_selected)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->selected(line);
  }
  FL_EXPORT_C(void,Fl_Browser_show_with_line)(fl_Browser browser,int line){
    (static_cast<Fl_DerivedBrowser*>(browser))->show(line);
  }
  FL_EXPORT_C(void,Fl_Browser_show)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->show();
  }
  FL_EXPORT_C(void,Fl_Browser_hide_with_line)(fl_Browser browser,int line){
    (static_cast<Fl_DerivedBrowser*>(browser))->hide(line);
  }
  FL_EXPORT_C(void,Fl_Browser_hide)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->hide();
  }
  FL_EXPORT_C(int,Fl_Browser_visible)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->visible(line);
  }
  FL_EXPORT_C(int,Fl_Browser_value)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->value();
  }
  FL_EXPORT_C(void,Fl_Browser_set_value)(fl_Browser browser,int line){
    (static_cast<Fl_DerivedBrowser*>(browser))->value(line);
  }
  FL_EXPORT_C(const char*,Fl_Browser_text)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->text(line);
  }
  FL_EXPORT_C(void,Fl_Browser_set_text)(fl_Browser browser,int line,const char* newtext){
    (static_cast<Fl_DerivedBrowser*>(browser))->text(line,newtext);
  }
  FL_EXPORT_C(void*,Fl_Browser_data)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->data(line);
  }
  FL_EXPORT_C(void,Fl_Browser_set_data)(fl_Browser browser,int line,void* d){
    (static_cast<Fl_DerivedBrowser*>(browser))->data(line,d);
  }
  FL_EXPORT_C(char,Fl_Browser_format_char)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->format_char();
  }
  FL_EXPORT_C(void,Fl_Browser_set_format_char)(fl_Browser browser,char c){
    (static_cast<Fl_DerivedBrowser*>(browser))->format_char(c);
  }
  FL_EXPORT_C(char,Fl_Browser_column_char)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->column_char();
  }
  FL_EXPORT_C(void,Fl_Browser_set_column_char)(fl_Browser browser,char c){
    (static_cast<Fl_DerivedBrowser*>(browser))->column_char(c);
  }
  FL_EXPORT_C(const int*,Fl_Browser_column_widths)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->column_widths();
  }
  FL_EXPORT_C(void,Fl_Browser_set_column_widths)(fl_Browser browser,const int* arr){
    (static_cast<Fl_DerivedBrowser*>(browser))->column_widths(arr);
  }
  FL_EXPORT_C(int,Fl_Browser_displayed)(fl_Browser browser,int line){
    return (static_cast<Fl_DerivedBrowser*>(browser))->displayed(line);
  }
  FL_EXPORT_C(void,Fl_Browser_make_visible)(fl_Browser browser,int line){
    (static_cast<Fl_DerivedBrowser*>(browser))->make_visible(line);
  }
  FL_EXPORT_C(void,Fl_Browser_set_icon)(fl_Browser browser,int line,fl_Image icon){
    (static_cast<Fl_DerivedBrowser*>(browser))->icon(line,(static_cast<Fl_Image*>(icon)));
  }
  FL_EXPORT_C(fl_Image,Fl_Browser_icon)(fl_Browser browser,int line){
    return (fl_Image)(static_cast<Fl_DerivedBrowser*>(browser))->icon(line);
  }
  FL_EXPORT_C(void,Fl_Browser_remove_icon)(fl_Browser browser,int line){
    (static_cast<Fl_DerivedBrowser*>(browser))->remove_icon(line);
  }
  FL_EXPORT_C(int,Fl_Browser_select_only)(fl_Browser browser,void *item){
    return (static_cast<Fl_DerivedBrowser*>(browser))->select_only(item);
  }
  FL_EXPORT_C(int,Fl_Browser_select_only_with_docallbacks)(fl_Browser browser,void *item,int docallbacks){
    return (static_cast<Fl_DerivedBrowser*>(browser))->select_only(item,docallbacks);
  }
  FL_EXPORT_C(int,Fl_Browser_deselect)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->deselect();
  }
  FL_EXPORT_C(int,Fl_Browser_deselect_with_docallbacks)(fl_Browser browser,int docallbacks){
    return (static_cast<Fl_DerivedBrowser*>(browser))->deselect(docallbacks);
  }
  FL_EXPORT_C(int,Fl_Browser_position)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->position();
  }
  FL_EXPORT_C(void,Fl_Browser_set_position)(fl_Browser browser,int pos){
    (static_cast<Fl_DerivedBrowser*>(browser))->position(pos);
  }
  FL_EXPORT_C(int,Fl_Browser_hposition)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->hposition();
  }
  FL_EXPORT_C(void,Fl_Browser_set_hposition)(fl_Browser browser,int ){
    (static_cast<Fl_DerivedBrowser*>(browser))->hposition();
  }
  FL_EXPORT_C(uchar,Fl_Browser_has_scrollbar)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->has_scrollbar();
  }
  FL_EXPORT_C(void,Fl_Browser_set_has_scrollbar)(fl_Browser browser,uchar mode){
    (static_cast<Fl_DerivedBrowser*>(browser))->has_scrollbar(mode);
  }
  FL_EXPORT_C(Fl_Font,Fl_Browser_textfont)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->textfont();
  }
  FL_EXPORT_C(void,Fl_Browser_set_textfont)(fl_Browser browser,Fl_Font font){
    (static_cast<Fl_DerivedBrowser*>(browser))->textfont(font);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Browser_textsize)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->textsize();
  }
  FL_EXPORT_C(void,Fl_Browser_set_textsize)(fl_Browser browser,Fl_Fontsize newSize){
    (static_cast<Fl_DerivedBrowser*>(browser))->textsize(newSize);
  }
  FL_EXPORT_C(Fl_Color,Fl_Browser_textcolor)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Browser_set_textcolor)(fl_Browser browser,Fl_Color col){
    (static_cast<Fl_DerivedBrowser*>(browser))->textcolor(col);
  }
  FL_EXPORT_C(int,Fl_Browser_scrollbar_size)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Browser_set_scrollbar_size)(fl_Browser browser,int newSize){
    (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_size(newSize);
  }
  FL_EXPORT_C(int,Fl_Browser_scrollbar_width)(fl_Browser browser){
    return (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Browser_set_scrollbar_width)(fl_Browser browser,int width){
    (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_width(width);
  }
  FL_EXPORT_C(void,Fl_Browser_scrollbar_right)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_right();
  }
  FL_EXPORT_C(void,Fl_Browser_set_scrollbar_left)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->scrollbar_left();
  }
  FL_EXPORT_C(void,Fl_Browser_sort)(fl_Browser browser){
    (static_cast<Fl_DerivedBrowser*>(browser))->sort();
  }
  FL_EXPORT_C(void,Fl_Browser_sort_with_flags)(fl_Browser browser,int flags){
    (static_cast<Fl_DerivedBrowser*>(browser))->sort(flags);
  }
#ifdef __cplusplus
}
#endif
