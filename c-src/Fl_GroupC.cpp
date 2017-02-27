#include "Fl_GroupC.h"
#ifdef __cplusplus
Fl_DerivedGroup::Fl_DerivedGroup(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Group(X,Y,W,H,l){
  overriddenFuncs = funcs;
  other_data = (void*)0;
}
Fl_DerivedGroup::Fl_DerivedGroup(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Group(X,Y,W,H){
  overriddenFuncs = funcs;
  other_data = (void*)0;
}
Fl_DerivedGroup::~Fl_DerivedGroup(){
  free(overriddenFuncs);
}
void Fl_DerivedGroup::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Group) this);
  }
  else {
    Fl_Group::draw();
  }
}

void Fl_DerivedGroup::draw_super(){
  Fl_Group::draw();
}

int Fl_DerivedGroup::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Group) this,event);
  }
  else {
    i = Fl_Group::handle(event);
  }
  return i;
}
int Fl_DerivedGroup::handle_super(int event){
  return Fl_Group::handle(event);
}

void Fl_DerivedGroup::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Group) this,x,y,w,h);
  }
  else {
    Fl_Group::resize(x,y,w,h);
  }
}

void Fl_DerivedGroup::resize_super(int x, int y, int w, int h){
  Fl_Group::resize(x,y,w,h);
}
void Fl_DerivedGroup::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Group) this);
  }
  else {
    Fl_Group::show();
  }
}
void Fl_DerivedGroup::show_super(){
  Fl_Group::show();
}

void Fl_DerivedGroup::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Group) this);
  }
  else {
    Fl_Group::hide();
  }
}
void Fl_DerivedGroup::hide_super(){
  Fl_Group::hide();
}

void Fl_DerivedGroup::draw_child(Fl_Widget* widget){
  Fl_Group::draw_child(*widget);
}
void Fl_DerivedGroup::draw_children(){
  Fl_Group::draw_children();
}
void Fl_DerivedGroup::draw_outside_label(Fl_Widget* widget){
  Fl_Group::draw_outside_label(*widget);
}
void Fl_DerivedGroup::update_child(Fl_Widget* widget){
  Fl_Group::update_child(*widget);
}

EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Group_handle)(fl_Group self, int event){
    return (static_cast<Fl_DerivedGroup*>(self))->handle(event);
  }
  FL_EXPORT_C(int,Fl_Group_handle_super)(fl_Group self, int event){
    return (static_cast<Fl_DerivedGroup*>(self))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Group_resize)(fl_Group self, int x, int y, int w, int h){
    (static_cast<Fl_DerivedGroup*>(self))->resize(x, y, w, h);
  }
  FL_EXPORT_C(void, Fl_Group_resize_super)(fl_Group self, int x, int y, int w, int h){
    (static_cast<Fl_DerivedGroup*>(self))->resize_super(x, y, w, h);
  }
  FL_EXPORT_C(void,Fl_Group_draw)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->draw();
  }
  FL_EXPORT_C(void,Fl_Group_draw_super)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->draw_super();
  }
  FL_EXPORT_C(void,Fl_Group_show)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->show();
  }
  FL_EXPORT_C(void,Fl_Group_show_super)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->show_super();
  }
  FL_EXPORT_C(void,Fl_Group_hide)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->hide();
  }
  FL_EXPORT_C(void,Fl_Group_hide_super)(fl_Group self){
    (static_cast<Fl_DerivedGroup*>(self))->hide_super();
  }
  FL_EXPORT_C(fl_Group,Fl_Group_parent)(fl_Group win){
    return (fl_Group) (static_cast<Fl_DerivedGroup*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Group_set_parent)(fl_Group win,fl_Group grp){
    (static_cast<Fl_DerivedGroup*>(win))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Group_type)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Group_set_type)(fl_Group win,uchar t){
    (static_cast<Fl_DerivedGroup*>(win))->type(t);
  }

  FL_EXPORT_C(int,Fl_Group_x)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Group_y)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Group_w)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Group_h)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Group_set_align)(fl_Group group, Fl_Align alignment){
    (static_cast<Fl_DerivedGroup*>(group))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Group_align)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Group_box)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Group_set_box)(fl_Group win,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedGroup*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Group_color)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Group_set_color)(fl_Group win,Fl_Color bg){
    (static_cast<Fl_DerivedGroup*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Group_set_color_with_bg_sel)(fl_Group win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedGroup*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Group_selection_color)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Group_set_selection_color)(fl_Group win,Fl_Color a){
    (static_cast<Fl_DerivedGroup*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Group_label)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Group_copy_label)(fl_Group win,const char* new_label){
    (static_cast<Fl_DerivedGroup*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Group_set_label)(fl_Group win,const char* text){
    (static_cast<Fl_DerivedGroup*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Group_labeltype)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Group_set_labeltype)(fl_Group win,Fl_Labeltype a){
    (static_cast<Fl_DerivedGroup*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Group_set_labelcolor)(fl_Group win,Fl_Color c){
    (static_cast<Fl_DerivedGroup*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Group_labelcolor)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Group_labelfont)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Group_set_labelfont)(fl_Group win,Fl_Font c){
    (static_cast<Fl_DerivedGroup*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Group_labelsize)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Group_set_labelsize)(fl_Group win,Fl_Fontsize pix){
    (static_cast<Fl_DerivedGroup*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Group_image)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Group_set_image)(fl_Group win,fl_Image pix){
    (static_cast<Fl_DerivedGroup*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Group_deimage)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Group_set_deimage)(fl_Group win,fl_Image pix){
    (static_cast<Fl_DerivedGroup*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Group_tooltip)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Group_copy_tooltip)(fl_Group win,const char* text){
    (static_cast<Fl_DerivedGroup*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Group_set_tooltip)(fl_Group win,const char* text){
    (static_cast<Fl_DerivedGroup*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Group_set_callback_with_user_data)(fl_Group win,fl_Callback* cb,void* p){
    Fl_Group* castedWindow = (static_cast<Fl_DerivedGroup*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Group_set_callback)(fl_Group win,fl_Callback* cb){
    Fl_Group* castedWindow = (static_cast<Fl_DerivedGroup*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Group_user_data)(fl_Group win){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedGroup*>(win))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedGroup*>(win))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Group_set_user_data)(fl_Group win,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedGroup*>(win))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_DerivedGroup*>(win))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_DerivedGroup*>(win))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Group_argument)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Group_set_argument)(fl_Group win,long v){
    (static_cast<Fl_DerivedGroup*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Group_when)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Group_set_when)(fl_Group win,uchar i){
    (static_cast<Fl_DerivedGroup*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_visible)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Group_visible_r)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Group_set_visible)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Group_clear_visible)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Group_active)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Group_active_r)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Group_activate)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Group_deactivate)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->deactivate();
  }
  FL_EXPORT_C(fl_Group,Fl_Group_current)(){
    return (fl_Group)Fl_DerivedGroup::current();
  }
  FL_EXPORT_C(void ,   Fl_Group_set_current)(fl_Group g){
    Fl_DerivedGroup::current(static_cast<Fl_DerivedGroup*>(g));
  }
  FL_EXPORT_C(unsigned int,Fl_Group_output)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Group_set_output)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Group_clear_output)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Group_takesevents)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Group_set_changed)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Group_clear_changed)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Group_take_focus)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Group_set_visible_focus)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_clear_visible_focus)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_modify_visible_focus)(fl_Group win,int v){
    (static_cast<Fl_DerivedGroup*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_visible_focus)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_do_callback)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Group_do_callback_with_widget_and_user_data)(fl_Group win,fl_Widget w,long arg){
    (static_cast<Fl_DerivedGroup*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Group_do_callback_with_widget_and_default_user_data)(fl_Group win,fl_Widget w){
    (static_cast<Fl_DerivedGroup*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Group_contains)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_DerivedGroup*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Group_inside)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_DerivedGroup*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_redraw)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Group_redraw_label)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Group_damage)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Group_clear_damage_with_bitmask)(fl_Group win,uchar c){
    (static_cast<Fl_DerivedGroup*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Group_clear_damage)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Group_damage_with_text)(fl_Group win,uchar c){
    (static_cast<Fl_DerivedGroup*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Group_damage_inside_widget)(fl_Group win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedGroup*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Group_draw_label_with_xywh_alignment)(fl_Group win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedGroup*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Group_measure_label)(fl_Group win,int* ww,int* hh){
    (static_cast<Fl_DerivedGroup*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Group_window)(fl_Group group){
    return (fl_Window) (static_cast<Fl_DerivedGroup*>(group))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Group_top_window)(fl_Group group){
    return (fl_Window) (static_cast<Fl_DerivedGroup*>(group))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Group_top_window_offset)(fl_Group group, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedGroup*>(group))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Group_as_group)(fl_Group win){
    return (fl_Group) (static_cast<Fl_DerivedGroup*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Group_as_gl_window)(fl_Group win){
    return (fl_Gl_Window) (static_cast<Fl_DerivedGroup*>(win))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Group_draw_child)(fl_Group group, fl_Widget widget){
    (static_cast<Fl_DerivedGroup*>(group))->draw_child((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_Group_draw_children)(fl_Group group){
    (static_cast<Fl_DerivedGroup*>(group))->draw_children();
  }
  FL_EXPORT_C(void,Fl_Group_draw_outside_label)(fl_Group group, fl_Widget widget){
    (static_cast<Fl_DerivedGroup*>(group))->draw_outside_label((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_Group_update_child)(fl_Group group, fl_Widget widget){
    (static_cast<Fl_DerivedGroup*>(group))->update_child((static_cast<Fl_Widget*>(widget)));
  }
  FL_EXPORT_C(void,Fl_Group_begin)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Group_end)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Group_find)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_DerivedGroup*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Group_add)(fl_Group win,fl_Widget w){
    (static_cast<Fl_DerivedGroup*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_insert)(fl_Group win,fl_Widget w,int i){
    (static_cast<Fl_DerivedGroup*>(win))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Group_remove_index)(fl_Group win,int index){
    (static_cast<Fl_DerivedGroup*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Group_remove_widget)(fl_Group win,fl_Widget w){
    (static_cast<Fl_DerivedGroup*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_clear)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Group_set_resizable_by_reference)(fl_Group win,fl_Widget o){
    (static_cast<Fl_DerivedGroup*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Group_set_resizable)(fl_Group win,fl_Widget o){
    (static_cast<Fl_DerivedGroup*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Group_resizable)(fl_Group win){
    return (fl_Widget)(static_cast<Fl_DerivedGroup*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Group_add_resizable)(fl_Group win,fl_Widget o){
    return (static_cast<Fl_DerivedGroup*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Group_init_sizes)(fl_Group win){
    (static_cast<Fl_DerivedGroup*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Group_children)(fl_Group self){
    return (static_cast<Fl_DerivedGroup*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Group_set_clip_children)(fl_Group win,int c){
    return (static_cast<Fl_DerivedGroup*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_clip_children)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Group_focus)(fl_Group win, fl_Widget W){
    return (static_cast<Fl_DerivedGroup*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Group__ddfdesign_kludge)(fl_Group win){
    return (static_cast<Fl_DerivedGroup*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Group_insert_with_before)(fl_Group self, fl_Widget w, fl_Widget before){
    (static_cast<Fl_DerivedGroup*>(self))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Group_array)(fl_Group self){
    return (fl_Widget*)(static_cast<Fl_DerivedGroup*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Group_child)(fl_Group self, int n){
    return (fl_Widget)(static_cast<Fl_DerivedGroup*>(self))->child(n);
  }
  FL_EXPORT_C(fl_Group,    Fl_Group_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedGroup* w = new Fl_DerivedGroup(X,Y,W,H,fs);
    return (fl_Group)w;
  }
  FL_EXPORT_C(fl_Group,    Fl_Group_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedGroup* w = new Fl_DerivedGroup(X,Y,W,H,label,fs);
    return (fl_Group)w;
  }
  FL_EXPORT_C(fl_Group,    Fl_OverriddenGroup_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedGroup* w = new Fl_DerivedGroup(X,Y,W,H,fs);
    return (fl_Group)w;
  }
  FL_EXPORT_C(fl_Group,    Fl_OverriddenGroup_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedGroup* w = new Fl_DerivedGroup(X,Y,W,H,label,fs);
    return (fl_Group)w;
  }
  FL_EXPORT_C(void, Fl_Group_Destroy)(fl_Group group){
    delete (static_cast<Fl_DerivedGroup*>(group));
  }
#ifdef __cplusplus
}
#endif
