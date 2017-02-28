#include "Fl_Sys_Menu_BarC.h"
#include "UtilsC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedSys_Menu_Bar::Fl_DerivedSys_Menu_Bar(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Sys_Menu_Bar(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSys_Menu_Bar::Fl_DerivedSys_Menu_Bar(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Sys_Menu_Bar(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSys_Menu_Bar::~Fl_DerivedSys_Menu_Bar(){
    free(overriddenFuncs);
  }
  void Fl_DerivedSys_Menu_Bar::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Sys_Menu_Bar) this);
    }
    else {
      Fl_Sys_Menu_Bar::draw();
    }
  }

  void Fl_DerivedSys_Menu_Bar::draw_super(){
    Fl_Sys_Menu_Bar::draw();
  }

  int Fl_DerivedSys_Menu_Bar::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Sys_Menu_Bar) this,event);
    }
    else {
      i = Fl_Sys_Menu_Bar::handle(event);
    }
    return i;
  }
  int Fl_DerivedSys_Menu_Bar::handle_super(int event){
    return Fl_Sys_Menu_Bar::handle(event);
  }

  void Fl_DerivedSys_Menu_Bar::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Sys_Menu_Bar) this,x,y,w,h);
    }
    else {
      Fl_Sys_Menu_Bar::resize(x,y,w,h);
    }
  }

  void Fl_DerivedSys_Menu_Bar::resize_super(int x, int y, int w, int h){
    Fl_Sys_Menu_Bar::resize(x,y,w,h);
  }
  void Fl_DerivedSys_Menu_Bar::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Sys_Menu_Bar) this);
    }
    else {
      Fl_Sys_Menu_Bar::show();
    }
  }
  void Fl_DerivedSys_Menu_Bar::show_super(){
    Fl_Sys_Menu_Bar::show();
  }

  void Fl_DerivedSys_Menu_Bar::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Sys_Menu_Bar) this);
    }
    else {
      Fl_Sys_Menu_Bar::hide();
    }
  }
  void Fl_DerivedSys_Menu_Bar::hide_super(){
    Fl_Sys_Menu_Bar::hide();
  }
#endif
  FL_EXPORT_C(fl_Window,Fl_Sys_Menu_Bar_as_window )(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Sys_Menu_Bar_as_gl_window )(fl_Sys_Menu_Bar sys_menu_bar){
    return (fl_Gl_Window) (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->as_gl_window();
  }
  FL_EXPORT_C(fl_Group,Fl_Sys_Menu_Bar_parent)(fl_Sys_Menu_Bar sys_menu_bar){
    return (fl_Group) (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->parent();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_parent)(fl_Sys_Menu_Bar sys_menu_bar,fl_Group grp){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Sys_Menu_Bar_type)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->type();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_type)(fl_Sys_Menu_Bar sys_menu_bar,uchar t){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->type(t);
  }

  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_x)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->x();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_y)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->y();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_w)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->w();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_h)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->h();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_align)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Align alignment){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Sys_Menu_Bar_align)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Sys_Menu_Bar_box)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->box();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_box)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Boxtype new_box){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_color)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_color)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color bg){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_color_with_bg_sel)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_selection_color)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_selection_color)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color a){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Sys_Menu_Bar_label)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->label();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_label)(fl_Sys_Menu_Bar sys_menu_bar,const char* new_label){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_label)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Sys_Menu_Bar_labeltype)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labeltype)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Labeltype a){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Sys_Menu_Bar_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Sys_Menu_Bar_labelfont)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelfont)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Font c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Sys_Menu_Bar_labelsize)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelsize)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Fontsize pix){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Sys_Menu_Bar_image)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->image();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_image)(fl_Sys_Menu_Bar sys_menu_bar,fl_Image pix){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Sys_Menu_Bar_deimage)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deimage();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_deimage)(fl_Sys_Menu_Bar sys_menu_bar,fl_Image pix){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Sys_Menu_Bar_tooltip)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_tooltip)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_tooltip)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_callback_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Callback cb,void* p){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_callback)(fl_Sys_Menu_Bar sys_menu_bar,fl_Callback cb){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Sys_Menu_Bar_user_data)(fl_Sys_Menu_Bar sys_menu_bar){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_user_data)(fl_Sys_Menu_Bar sys_menu_bar,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Item*>(sys_menu_bar))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Sys_Menu_Bar_argument)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->argument();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_argument)(fl_Sys_Menu_Bar sys_menu_bar,long v){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Sys_Menu_Bar_when)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->when();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_when)(fl_Sys_Menu_Bar sys_menu_bar,uchar i){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_visible)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_visible_r)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_visible)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_visible)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_active)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->active();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_active_r)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->active_r();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_activate)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->activate();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_deactivate)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_output)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->output();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_output)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->output();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_output)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_takesevents)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_changed)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->changed();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_changed)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_take_focus)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_modify_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar,int v){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback_with_widget_and_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w,long arg){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback_with_widget_and_default_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_contains)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_inside)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_redraw)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->redraw();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_redraw_label)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Sys_Menu_Bar_damage)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_damage_with_bitmask)(fl_Sys_Menu_Bar sys_menu_bar,uchar c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_damage)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_damage_with_text)(fl_Sys_Menu_Bar sys_menu_bar,uchar c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_damage_inside_widget)(fl_Sys_Menu_Bar sys_menu_bar,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_draw_label_with_xywh_alignment)(fl_Sys_Menu_Bar sys_menu_bar,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_measure_label)(fl_Sys_Menu_Bar sys_menu_bar,int* ww,int* hh){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void   , Fl_Sys_Menu_Bar_Destroy)(fl_Sys_Menu_Bar sys_menu_bar){
    delete (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_item_pathname_with_finditem)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int namelen,fl_Menu_Item finditem){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_item_pathname)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int namelen){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_picked)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->picked((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_find_item_with_name)(fl_Sys_Menu_Bar sys_menu_bar,char* name){
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_item(name);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_find_index_with_name)(fl_Sys_Menu_Bar sys_menu_bar,char* name){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_index(name);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_find_index_with_item)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_index((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_test_shortcut)(fl_Sys_Menu_Bar sys_menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->test_shortcut();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_global)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->global();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_menu)(fl_Sys_Menu_Bar sys_menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->menu();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_menu_with_m)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted = convert(item,size);
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->menu(converted);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item m){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item m,void* user_data){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert_with_flags)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert_with_shortcutname_flags)(fl_Sys_Menu_Bar menu_,int index,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(menu_)),index, name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_name)(fl_Sys_Menu_Bar menu_,  char* name){
    return (static_cast<Fl_Sys_Menu_Bar*>(menu_))->add(name);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_user_data)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_size)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->size();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_size)(fl_Sys_Menu_Bar sys_menu_bar,int W,int H){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->size(W,H);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear)(fl_Sys_Menu_Bar sys_menu_bar){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_clear_submenu)(fl_Sys_Menu_Bar sys_menu_bar,int index){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_submenu(index);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_replace)(fl_Sys_Menu_Bar sys_menu_bar,int i,char* name){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->replace(i,name);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_remove)(fl_Sys_Menu_Bar sys_menu_bar,int i ){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->remove(i);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_shortcut)(fl_Sys_Menu_Bar sys_menu_bar,int i,int s){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->shortcut(i,s);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_mode)(fl_Sys_Menu_Bar sys_menu_bar,int i,int fl){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mode(i,fl);
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_mode)(fl_Sys_Menu_Bar sys_menu_bar,int i){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mode(i);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_mvalue)(fl_Sys_Menu_Bar sys_menu_bar){
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mvalue();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value();
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value_with_item)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value(static_cast<Fl_Menu_Item*>(item));
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value_with_index)(fl_Sys_Menu_Bar sys_menu_bar,int index){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value(index);
  }
  FL_EXPORT_C(char*,Fl_Sys_Menu_Bar_text)(fl_Sys_Menu_Bar sys_menu_bar){
    return (char*)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->text();
  }
  FL_EXPORT_C(char*,Fl_Sys_Menu_Bar_text_with_index)(fl_Sys_Menu_Bar sys_menu_bar,int i){
    return (char*)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->text(i);
  }
  FL_EXPORT_C(Fl_Font,Fl_Sys_Menu_Bar_textfont)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textfont();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textfont)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Font c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Sys_Menu_Bar_textsize)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textsize();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textsize)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Fontsize c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textsize(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_textcolor)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textcolor)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textcolor(c);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Sys_Menu_Bar_down_box)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_box();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_down_box)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Boxtype b){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_box(b);
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_down_color)(fl_Sys_Menu_Bar sys_menu_bar){
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_color();
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_down_color)(fl_Sys_Menu_Bar sys_menu_bar,unsigned c){
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_color(c);
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_Sys_Menu_Bar_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSys_Menu_Bar* w = new Fl_DerivedSys_Menu_Bar(X,Y,W,H,fs);
    return (fl_Sys_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_Sys_Menu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSys_Menu_Bar* w = new Fl_DerivedSys_Menu_Bar(X,Y,W,H,label,fs);
    return (fl_Sys_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_OverriddenSys_Menu_Bar_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSys_Menu_Bar* w = new Fl_DerivedSys_Menu_Bar(X,Y,W,H,fs);
    return (fl_Sys_Menu_Bar)w;
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_OverriddenSys_Menu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSys_Menu_Bar* w = new Fl_DerivedSys_Menu_Bar(X,Y,W,H,label,fs);
    return (fl_Sys_Menu_Bar)w;
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_draw)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_draw_super)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_handle)(fl_Sys_Menu_Bar o, int event){
    return (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_handle_super)(fl_Sys_Menu_Bar o, int event){
    return (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_resize)(fl_Sys_Menu_Bar o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_resize_super)(fl_Sys_Menu_Bar o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_show)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_show_super)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_hide)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_hide_super)(fl_Sys_Menu_Bar o){
    (static_cast<Fl_DerivedSys_Menu_Bar*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
