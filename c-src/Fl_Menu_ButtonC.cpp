#include "Fl_Menu_ButtonC.h"
#include "UtilsC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedMenu_Button::Fl_DerivedMenu_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Menu_Button(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedMenu_Button::Fl_DerivedMenu_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Menu_Button(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedMenu_Button::~Fl_DerivedMenu_Button(){
    free(overriddenFuncs);
  }
  void Fl_DerivedMenu_Button::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Menu_Button) this);
    }
    else {
      Fl_Menu_Button::draw();
    }
  }

  void Fl_DerivedMenu_Button::draw_super(){
    Fl_Menu_Button::draw();
  }

  int Fl_DerivedMenu_Button::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Menu_Button) this,event);
    }
    else {
      i = Fl_Menu_Button::handle(event);
    }
    return i;
  }
  int Fl_DerivedMenu_Button::handle_super(int event){
    return Fl_Menu_Button::handle(event);
  }

  void Fl_DerivedMenu_Button::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Menu_Button) this,x,y,w,h);
    }
    else {
      Fl_Menu_Button::resize(x,y,w,h);
    }
  }

  void Fl_DerivedMenu_Button::resize_super(int x, int y, int w, int h){
    Fl_Menu_Button::resize(x,y,w,h);
  }
  void Fl_DerivedMenu_Button::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Menu_Button) this);
    }
    else {
      Fl_Menu_Button::show();
    }
  }
  void Fl_DerivedMenu_Button::show_super(){
    Fl_Menu_Button::show();
  }

  void Fl_DerivedMenu_Button::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Menu_Button) this);
    }
    else {
      Fl_Menu_Button::hide();
    }
  }
  void Fl_DerivedMenu_Button::hide_super(){
    Fl_Menu_Button::hide();
  }


#endif
  FL_EXPORT_C(fl_Window,Fl_Menu_Button_as_window )(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Menu_Button_as_gl_window )(fl_Menu_Button menu_button){
    return (fl_Gl_Window) (static_cast<Fl_Menu_Button*>(menu_button))->as_gl_window();
  }
  FL_EXPORT_C(fl_Group,Fl_Menu_Button_parent)(fl_Menu_Button menu_button){
    return (fl_Group) (static_cast<Fl_Menu_Button*>(menu_button))->parent();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_parent)(fl_Menu_Button menu_button,fl_Group grp){
    (static_cast<Fl_Menu_Button*>(menu_button))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Menu_Button_type)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->type();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_type)(fl_Menu_Button menu_button,uchar t){
    (static_cast<Fl_Menu_Button*>(menu_button))->type(t);
  }

  FL_EXPORT_C(int,Fl_Menu_Button_x)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->x();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_y)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->y();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_w)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->w();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_h)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->h();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_align)(fl_Menu_Button menu_button, Fl_Align alignment){
    (static_cast<Fl_Menu_Button*>(menu_button))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Menu_Button_align)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu_Button_box)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->box();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_box)(fl_Menu_Button menu_button,Fl_Boxtype new_box){
    (static_cast<Fl_Menu_Button*>(menu_button))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Button_color)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->color();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_color)(fl_Menu_Button menu_button,Fl_Color bg){
    (static_cast<Fl_Menu_Button*>(menu_button))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_color_with_bg_sel)(fl_Menu_Button menu_button,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Menu_Button*>(menu_button))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Button_selection_color)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_selection_color)(fl_Menu_Button menu_button,Fl_Color a){
    (static_cast<Fl_Menu_Button*>(menu_button))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Menu_Button_label)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->label();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_copy_label)(fl_Menu_Button menu_button,const char* new_label){
    (static_cast<Fl_Menu_Button*>(menu_button))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_label)(fl_Menu_Button menu_button,const char* text){
    (static_cast<Fl_Menu_Button*>(menu_button))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Menu_Button_labeltype)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_labeltype)(fl_Menu_Button menu_button,Fl_Labeltype a){
    (static_cast<Fl_Menu_Button*>(menu_button))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_labelcolor)(fl_Menu_Button menu_button,Fl_Color c){
    (static_cast<Fl_Menu_Button*>(menu_button))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Menu_Button_labelcolor)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu_Button_labelfont)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_labelfont)(fl_Menu_Button menu_button,Fl_Font c){
    (static_cast<Fl_Menu_Button*>(menu_button))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu_Button_labelsize)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_labelsize)(fl_Menu_Button menu_button,Fl_Fontsize pix){
    (static_cast<Fl_Menu_Button*>(menu_button))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu_Button_image)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->image();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_image)(fl_Menu_Button menu_button,fl_Image pix){
    (static_cast<Fl_Menu_Button*>(menu_button))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Menu_Button_deimage)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->deimage();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_deimage)(fl_Menu_Button menu_button,fl_Image pix){
    (static_cast<Fl_Menu_Button*>(menu_button))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Menu_Button_tooltip)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_copy_tooltip)(fl_Menu_Button menu_button,const char* text){
    (static_cast<Fl_Menu_Button*>(menu_button))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_tooltip)(fl_Menu_Button menu_button,const char* text){
    (static_cast<Fl_Menu_Button*>(menu_button))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_callback_with_user_data)(fl_Menu_Button menu_button,fl_Callback cb,void* p){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Menu_Button*>(menu_button));
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_callback)(fl_Menu_Button menu_button,fl_Callback cb){
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Menu_Button*>(menu_button));
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Menu_Button_user_data)(fl_Menu_Button menu_button){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Button*>(menu_button))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Menu_Button*>(menu_button))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_user_data)(fl_Menu_Button menu_button,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Item*>(menu_button))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Menu_Button*>(menu_button))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Menu_Button*>(menu_button))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Menu_Button_argument)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->argument();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_argument)(fl_Menu_Button menu_button,long v){
    (static_cast<Fl_Menu_Button*>(menu_button))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Menu_Button_when)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->when();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_when)(fl_Menu_Button menu_button,uchar i){
    (static_cast<Fl_Menu_Button*>(menu_button))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Button_visible)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->visible();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_visible_r)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_visible)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->visible();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_visible)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Button_active)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->active();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_active_r)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->active_r();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_activate)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->activate();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_deactivate)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Button_output)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->output();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_output)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->output();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_output)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Button_takesevents)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_changed)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->changed();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_changed)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_take_focus)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_visible_focus)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_visible_focus)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_modify_visible_focus)(fl_Menu_Button menu_button,int v){
    (static_cast<Fl_Menu_Button*>(menu_button))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Menu_Button_visible_focus)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_do_callback)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_do_callback_with_widget_and_user_data)(fl_Menu_Button menu_button,fl_Widget w,long arg){
    (static_cast<Fl_Menu_Button*>(menu_button))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_do_callback_with_widget_and_default_user_data)(fl_Menu_Button menu_button,fl_Widget w){
    (static_cast<Fl_Menu_Button*>(menu_button))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu_Button_contains)(fl_Menu_Button menu_button,fl_Widget w){
    return (static_cast<Fl_Menu_Button*>(menu_button))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Menu_Button_inside)(fl_Menu_Button menu_button,fl_Widget w){
    return (static_cast<Fl_Menu_Button*>(menu_button))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Menu_Button_redraw)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->redraw();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_redraw_label)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Menu_Button_damage)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->damage();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_damage_with_bitmask)(fl_Menu_Button menu_button,uchar c){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear_damage)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_damage_with_text)(fl_Menu_Button menu_button,uchar c){
    (static_cast<Fl_Menu_Button*>(menu_button))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_damage_inside_widget)(fl_Menu_Button menu_button,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Menu_Button*>(menu_button))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_draw_label_with_xywh_alignment)(fl_Menu_Button menu_button,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Menu_Button*>(menu_button))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_measure_label)(fl_Menu_Button menu_button,int* ww,int* hh){
    (static_cast<Fl_Menu_Button*>(menu_button))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void   , Fl_Menu_Button_Destroy)(fl_Menu_Button menu_button){
    delete (static_cast<Fl_Menu_Button*>(menu_button));
  }
  FL_EXPORT_C(int,Fl_Menu_Button_item_pathname_with_finditem)(fl_Menu_Button menu_button,char* name,int namelen,fl_Menu_Item finditem){
    return (static_cast<Fl_Menu_Button*>(menu_button))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
  }
  FL_EXPORT_C(int,Fl_Menu_Button_item_pathname)(fl_Menu_Button menu_button,char* name,int namelen){
    return (static_cast<Fl_Menu_Button*>(menu_button))->item_pathname(name,namelen);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Button_picked)(fl_Menu_Button menu_button,fl_Menu_Item item){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->picked((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Button_find_item_with_name)(fl_Menu_Button menu_button,char* name){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->find_item(name);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_find_index_with_name)(fl_Menu_Button menu_button,char* name){
    return (static_cast<Fl_Menu_Button*>(menu_button))->find_index(name);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_find_index_with_item)(fl_Menu_Button menu_button,fl_Menu_Item item){
    return (static_cast<Fl_Menu_Button*>(menu_button))->find_index((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Button_test_shortcut)(fl_Menu_Button menu_button){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->test_shortcut();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_global)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->global();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Button_menu)(fl_Menu_Button menu_button){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->menu();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_menu_with_m)(fl_Menu_Button menu_button,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted = convert(item,size);
    return (static_cast<Fl_Menu_Button*>(menu_button))->menu(converted);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_copy)(fl_Menu_Button menu_button,fl_Menu_Item m){
    return (static_cast<Fl_Menu_Button*>(menu_button))->copy((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Menu_Button_copy_with_user_data)(fl_Menu_Button menu_button,fl_Menu_Item m,void* user_data){
    return (static_cast<Fl_Menu_Button*>(menu_button))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_insert)(fl_Menu_Button menu_button,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Button*>(menu_button)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_insert_with_flags)(fl_Menu_Button menu_button,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Button*>(menu_button)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_insert_with_user_data_flags)(fl_Menu_Button menu_button,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Button*>(menu_button)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add)(fl_Menu_Button menu_button,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_user_data)(fl_Menu_Button menu_button,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_flags)(fl_Menu_Button menu_button,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_user_data_flags)(fl_Menu_Button menu_button,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_shortcutname)(fl_Menu_Button menu_button,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_shortcutname_user_data)(fl_Menu_Button menu_button,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_shortcutname_flags)(fl_Menu_Button menu_button,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_add_with_shortcutname_user_data_flags)(fl_Menu_Button menu_button,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Button*>(menu_button)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_size)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->size();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_size)(fl_Menu_Button menu_button,int W,int H){
    (static_cast<Fl_Menu_Button*>(menu_button))->size(W,H);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_clear)(fl_Menu_Button menu_button){
    (static_cast<Fl_Menu_Button*>(menu_button))->clear();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_clear_submenu)(fl_Menu_Button menu_button,int index){
    return (static_cast<Fl_Menu_Button*>(menu_button))->clear_submenu(index);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_replace)(fl_Menu_Button menu_button,int i,char* name){
    (static_cast<Fl_Menu_Button*>(menu_button))->replace(i,name);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_remove)(fl_Menu_Button menu_button,int i ){
    (static_cast<Fl_Menu_Button*>(menu_button))->remove(i);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_shortcut)(fl_Menu_Button menu_button,int i,int s){
    (static_cast<Fl_Menu_Button*>(menu_button))->shortcut(i,s);
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_mode)(fl_Menu_Button menu_button,int i,int fl){
    (static_cast<Fl_Menu_Button*>(menu_button))->mode(i,fl);
  }
  FL_EXPORT_C(int,Fl_Menu_Button_mode)(fl_Menu_Button menu_button,int i){
    return (static_cast<Fl_Menu_Button*>(menu_button))->mode(i);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Button_mvalue)(fl_Menu_Button menu_button){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->mvalue();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_value)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->value();
  }
  FL_EXPORT_C(int,Fl_Menu_Button_value_with_item)(fl_Menu_Button menu_button,fl_Menu_Item item){
    return (static_cast<Fl_Menu_Button*>(menu_button))->value(static_cast<Fl_Menu_Item*>(item));
  }
  FL_EXPORT_C(int,Fl_Menu_Button_value_with_index)(fl_Menu_Button menu_button,int index){
    return (static_cast<Fl_Menu_Button*>(menu_button))->value(index);
  }
  FL_EXPORT_C(char*,Fl_Menu_Button_text)(fl_Menu_Button menu_button){
    return (char*)(static_cast<Fl_Menu_Button*>(menu_button))->text();
  }
  FL_EXPORT_C(char*,Fl_Menu_Button_text_with_index)(fl_Menu_Button menu_button,int i){
    return (char*)(static_cast<Fl_Menu_Button*>(menu_button))->text(i);
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu_Button_textfont)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->textfont();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_textfont)(fl_Menu_Button menu_button,Fl_Font c){
    (static_cast<Fl_Menu_Button*>(menu_button))->textfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu_Button_textsize)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->textsize();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_textsize)(fl_Menu_Button menu_button,Fl_Fontsize c){
    (static_cast<Fl_Menu_Button*>(menu_button))->textsize(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Button_textcolor)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_textcolor)(fl_Menu_Button menu_button,Fl_Color c){
    (static_cast<Fl_Menu_Button*>(menu_button))->textcolor(c);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Menu_Button_down_box)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->down_box();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_down_box)(fl_Menu_Button menu_button,Fl_Boxtype b){
    (static_cast<Fl_Menu_Button*>(menu_button))->down_box(b);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Button_down_color)(fl_Menu_Button menu_button){
    return (static_cast<Fl_Menu_Button*>(menu_button))->down_color();
  }
  FL_EXPORT_C(void,Fl_Menu_Button_set_down_color)(fl_Menu_Button menu_button,unsigned c){
    (static_cast<Fl_Menu_Button*>(menu_button))->down_color(c);
  }
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Button_popup)(fl_Menu_Button menu_button) {
    return (fl_Menu_Item)(static_cast<Fl_Menu_Button*>(menu_button))->popup();
  }
  FL_EXPORT_C(fl_Menu_Button,    Fl_Menu_Button_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedMenu_Button* w = new Fl_DerivedMenu_Button(X,Y,W,H,fs);
    return (fl_Menu_Button)w;
  }
  FL_EXPORT_C(fl_Menu_Button,    Fl_Menu_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedMenu_Button* w = new Fl_DerivedMenu_Button(X,Y,W,H,label,fs);
    return (fl_Menu_Button)w;
  }
  FL_EXPORT_C(fl_Menu_Button,    Fl_OverriddenMenu_Button_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedMenu_Button* w = new Fl_DerivedMenu_Button(X,Y,W,H,fs);
    return (fl_Menu_Button)w;
  }
  FL_EXPORT_C(fl_Menu_Button,    Fl_OverriddenMenu_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedMenu_Button* w = new Fl_DerivedMenu_Button(X,Y,W,H,label,fs);
    return (fl_Menu_Button)w;
  }
  FL_EXPORT_C(void, Fl_Menu_Button_draw)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Menu_Button_draw_super)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Menu_Button_handle)(fl_Menu_Button o, int event){
    return (static_cast<Fl_DerivedMenu_Button*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Menu_Button_handle_super)(fl_Menu_Button o, int event){
    return (static_cast<Fl_DerivedMenu_Button*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Menu_Button_resize)(fl_Menu_Button o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_Button*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Menu_Button_resize_super)(fl_Menu_Button o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedMenu_Button*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Menu_Button_show)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Menu_Button_show_super)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Menu_Button_hide)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Menu_Button_hide_super)(fl_Menu_Button o){
    (static_cast<Fl_DerivedMenu_Button*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
