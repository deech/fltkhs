#include "Fl_ChoiceC.h"
#include "UtilsC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedChoice::Fl_DerivedChoice(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Choice(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedChoice::Fl_DerivedChoice(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Choice(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedChoice::~Fl_DerivedChoice(){
    free(overriddenFuncs);
  }
  void Fl_DerivedChoice::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Choice) this);
    }
    else {
      Fl_Choice::draw();
    }
  }

  void Fl_DerivedChoice::draw_super(){
    Fl_Choice::draw();
  }

  int Fl_DerivedChoice::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Choice) this,event);
    }
    else {
      i = Fl_Choice::handle(event);
    }
    return i;
  }
  int Fl_DerivedChoice::handle_super(int event){
    return Fl_Choice::handle(event);
  }

  void Fl_DerivedChoice::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Choice) this,x,y,w,h);
    }
    else {
      Fl_Choice::resize(x,y,w,h);
    }
  }

  void Fl_DerivedChoice::resize_super(int x, int y, int w, int h){
    Fl_Choice::resize(x,y,w,h);
  }
  void Fl_DerivedChoice::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Choice) this);
    }
    else {
      Fl_Choice::show();
    }
  }
  void Fl_DerivedChoice::show_super(){
    Fl_Choice::show();
  }

  void Fl_DerivedChoice::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Choice) this);
    }
    else {
      Fl_Choice::hide();
    }
  }
  void Fl_DerivedChoice::hide_super(){
    Fl_Choice::hide();
  }


#endif
  FL_EXPORT_C(fl_Window,Fl_Choice_as_window_super)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Choice_as_window )(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Choice_as_gl_window_super)(fl_Choice choice){
    return (fl_Gl_Window) (static_cast<Fl_Choice*>(choice))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Choice_as_gl_window )(fl_Choice choice){
    return (fl_Gl_Window) (static_cast<Fl_Choice*>(choice))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Choice_parent)(fl_Choice choice){
    return (fl_Group) (static_cast<Fl_Choice*>(choice))->parent();
  }
  FL_EXPORT_C(void,Fl_Choice_set_parent)(fl_Choice choice,fl_Group grp){
    (static_cast<Fl_Choice*>(choice))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Choice_type)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->type();
  }
  FL_EXPORT_C(void,Fl_Choice_set_type)(fl_Choice choice,uchar t){
    (static_cast<Fl_Choice*>(choice))->type(t);
  }

  FL_EXPORT_C(int,Fl_Choice_x)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->x();
  }
  FL_EXPORT_C(int,Fl_Choice_y)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->y();
  }
  FL_EXPORT_C(int,Fl_Choice_w)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->w();
  }
  FL_EXPORT_C(int,Fl_Choice_h)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->h();
  }
  FL_EXPORT_C(void,Fl_Choice_set_align)(fl_Choice choice, Fl_Align alignment){
    (static_cast<Fl_Choice*>(choice))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Choice_align)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Choice_box)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->box();
  }
  FL_EXPORT_C(void,Fl_Choice_set_box)(fl_Choice choice,Fl_Boxtype new_box){
    (static_cast<Fl_Choice*>(choice))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Choice_color)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->color();
  }
  FL_EXPORT_C(void,Fl_Choice_set_color)(fl_Choice choice,Fl_Color bg){
    (static_cast<Fl_Choice*>(choice))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Choice_set_color_with_bg_sel)(fl_Choice choice,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Choice*>(choice))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Choice_selection_color)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Choice_set_selection_color)(fl_Choice choice,Fl_Color a){
    (static_cast<Fl_Choice*>(choice))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Choice_label)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->label();
  }
  FL_EXPORT_C(void,Fl_Choice_copy_label)(fl_Choice choice,const char* new_label){
    (static_cast<Fl_Choice*>(choice))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Choice_set_label)(fl_Choice choice,const char* text){
    (static_cast<Fl_Choice*>(choice))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Choice_labeltype)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Choice_set_labeltype)(fl_Choice choice,Fl_Labeltype a){
    (static_cast<Fl_Choice*>(choice))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Choice_set_labelcolor)(fl_Choice choice,Fl_Color c){
    (static_cast<Fl_Choice*>(choice))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Choice_labelcolor)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Choice_labelfont)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Choice_set_labelfont)(fl_Choice choice,Fl_Font c){
    (static_cast<Fl_Choice*>(choice))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Choice_labelsize)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Choice_set_labelsize)(fl_Choice choice,Fl_Fontsize pix){
    (static_cast<Fl_Choice*>(choice))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Choice_image)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->image();
  }
  FL_EXPORT_C(void,Fl_Choice_set_image)(fl_Choice choice,fl_Image pix){
    (static_cast<Fl_Choice*>(choice))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Choice_deimage)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->deimage();
  }
  FL_EXPORT_C(void,Fl_Choice_set_deimage)(fl_Choice choice,fl_Image pix){
    (static_cast<Fl_Choice*>(choice))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Choice_tooltip)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Choice_copy_tooltip)(fl_Choice choice,const char* text){
    (static_cast<Fl_Choice*>(choice))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Choice_set_tooltip)(fl_Choice choice,const char* text){
    (static_cast<Fl_Choice*>(choice))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Choice_set_callback_with_user_data)(fl_Choice choice,fl_Callback cb,void* p){
    Fl_Choice* castedMenu_ = (static_cast<Fl_Choice*>(choice));
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Choice_set_callback)(fl_Choice choice,fl_Callback cb){
    Fl_Choice* castedMenu_ = (static_cast<Fl_Choice*>(choice));
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Choice_user_data)(fl_Choice choice){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Choice*>(choice))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Choice*>(choice))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Choice_set_user_data)(fl_Choice choice,void* v){
    (static_cast<Fl_Choice*>(choice))->user_data(v);
  }
  FL_EXPORT_C(long,Fl_Choice_argument)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->argument();
  }
  FL_EXPORT_C(void,Fl_Choice_set_argument)(fl_Choice choice,long v){
    (static_cast<Fl_Choice*>(choice))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Choice_when)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->when();
  }
  FL_EXPORT_C(void,Fl_Choice_set_when)(fl_Choice choice,uchar i){
    (static_cast<Fl_Choice*>(choice))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Choice_visible)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->visible();
  }
  FL_EXPORT_C(int,Fl_Choice_visible_r)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Choice_set_visible)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->visible();
  }
  FL_EXPORT_C(void,Fl_Choice_clear_visible)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Choice_active)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->active();
  }
  FL_EXPORT_C(int,Fl_Choice_active_r)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->active_r();
  }
  FL_EXPORT_C(void,Fl_Choice_activate)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->activate();
  }
  FL_EXPORT_C(void,Fl_Choice_deactivate)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Choice_output)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->output();
  }
  FL_EXPORT_C(void,Fl_Choice_set_output)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->output();
  }
  FL_EXPORT_C(void,Fl_Choice_clear_output)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Choice_takesevents)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Choice_set_changed)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->changed();
  }
  FL_EXPORT_C(void,Fl_Choice_clear_changed)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Choice_take_focus)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Choice_set_visible_focus)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Choice_clear_visible_focus)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Choice_modify_visible_focus)(fl_Choice choice,int v){
    (static_cast<Fl_Choice*>(choice))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Choice_visible_focus)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Choice_do_callback)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Choice_do_callback_with_widget_and_user_data)(fl_Choice choice,fl_Widget w,long arg){
    (static_cast<Fl_Choice*>(choice))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Choice_do_callback_with_widget_and_default_user_data)(fl_Choice choice,fl_Widget w){
    (static_cast<Fl_Choice*>(choice))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Choice_contains)(fl_Choice choice,fl_Widget w){
    return (static_cast<Fl_Choice*>(choice))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Choice_inside)(fl_Choice choice,fl_Widget w){
    return (static_cast<Fl_Choice*>(choice))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Choice_redraw)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->redraw();
  }
  FL_EXPORT_C(void,Fl_Choice_redraw_label)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Choice_damage)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->damage();
  }
  FL_EXPORT_C(void,Fl_Choice_clear_damage_with_bitmask)(fl_Choice choice,uchar c){
    (static_cast<Fl_Choice*>(choice))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Choice_clear_damage)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Choice_damage_with_text)(fl_Choice choice,uchar c){
    (static_cast<Fl_Choice*>(choice))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Choice_damage_inside_widget)(fl_Choice choice,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Choice*>(choice))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Choice_draw_label_with_xywh_alignment)(fl_Choice choice,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Choice*>(choice))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Choice_measure_label)(fl_Choice choice,int* ww,int* hh){
    (static_cast<Fl_Choice*>(choice))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void, Fl_Choice_Destroy)(fl_Choice choice) {
    delete (static_cast<Fl_Choice*>(choice));
  }
  FL_EXPORT_C(int,Fl_Choice_item_pathname_with_finditem)(fl_Choice choice,char* name,int namelen,fl_Menu_Item finditem){
    return (static_cast<Fl_Choice*>(choice))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
  }
  FL_EXPORT_C(int,Fl_Choice_item_pathname)(fl_Choice choice,char* name,int namelen){
    return (static_cast<Fl_Choice*>(choice))->item_pathname(name,namelen);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Choice_picked)(fl_Choice choice,fl_Menu_Item item){
    return (fl_Menu_Item)(static_cast<Fl_Choice*>(choice))->picked((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Choice_find_item_with_name)(fl_Choice choice,char* name){
    return (fl_Menu_Item)(static_cast<Fl_Choice*>(choice))->find_item(name);
  }
  FL_EXPORT_C(int,Fl_Choice_find_index_with_name)(fl_Choice choice,char* name){
    return (static_cast<Fl_Choice*>(choice))->find_index(name);
  }
  FL_EXPORT_C(int,Fl_Choice_find_index_with_item)(fl_Choice choice,fl_Menu_Item item){
    return (static_cast<Fl_Choice*>(choice))->find_index((static_cast<Fl_Menu_Item*>(item)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Choice_test_shortcut)(fl_Choice choice){
    return (fl_Menu_Item)(static_cast<Fl_Choice*>(choice))->test_shortcut();
  }
  FL_EXPORT_C(void,Fl_Choice_global)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->global();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Choice_menu)(fl_Choice choice){
    return (fl_Menu_Item)(static_cast<Fl_Choice*>(choice))->menu();
  }
  FL_EXPORT_C(void,Fl_Choice_menu_with_m)(fl_Choice choice,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted = convert(item,size);
    return (static_cast<Fl_Choice*>(choice))->menu(converted);
  }
  FL_EXPORT_C(void,Fl_Choice_copy)(fl_Choice choice,fl_Menu_Item m){
    return (static_cast<Fl_Choice*>(choice))->copy((static_cast<Fl_Menu_Item*>(m)));
  }
  FL_EXPORT_C(void,Fl_Choice_copy_with_user_data)(fl_Choice choice,fl_Menu_Item m,void* user_data){
    return (static_cast<Fl_Choice*>(choice))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
  }
  FL_EXPORT_C(int,Fl_Choice_insert)(fl_Choice choice,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Choice*>(choice)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Choice_insert_with_flags)(fl_Choice choice,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Choice*>(choice)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Choice_insert_with_user_data_flags)(fl_Choice choice,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_Choice*>(choice)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_user_data)(fl_Choice choice,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_flags)(fl_Choice choice,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_user_data_flags)(fl_Choice choice,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_shortcutname)(fl_Choice choice,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_shortcutname_user_data)(fl_Choice choice,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_shortcutname_flags)(fl_Choice choice,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Choice_add_with_shortcutname_user_data_flags)(fl_Choice choice,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Choice*>(choice)),name,shortcut,flags);
  }
  FL_EXPORT_C(int, Fl_Choice_add_with_name)(fl_Choice choice,  char* name){
    return (static_cast<Fl_Choice*>(choice))->add(name);
  }
  FL_EXPORT_C(int,Fl_Choice_size)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->size();
  }
  FL_EXPORT_C(void,Fl_Choice_set_size)(fl_Choice choice,int W,int H){
    (static_cast<Fl_Choice*>(choice))->size(W,H);
  }
  FL_EXPORT_C(void,Fl_Choice_clear)(fl_Choice choice){
    (static_cast<Fl_Choice*>(choice))->clear();
  }
  FL_EXPORT_C(int,Fl_Choice_clear_submenu)(fl_Choice choice,int index){
    return (static_cast<Fl_Choice*>(choice))->clear_submenu(index);
  }
  FL_EXPORT_C(void,Fl_Choice_replace)(fl_Choice choice,int i,char* name){
    (static_cast<Fl_Choice*>(choice))->replace(i,name);
  }
  FL_EXPORT_C(void,Fl_Choice_remove)(fl_Choice choice,int i ){
    (static_cast<Fl_Choice*>(choice))->remove(i);
  }
  FL_EXPORT_C(void,Fl_Choice_shortcut)(fl_Choice choice,int i,int s){
    (static_cast<Fl_Choice*>(choice))->shortcut(i,s);
  }
  FL_EXPORT_C(void,Fl_Choice_set_mode)(fl_Choice choice,int i,int fl){
    (static_cast<Fl_Choice*>(choice))->mode(i,fl);
  }
  FL_EXPORT_C(int,Fl_Choice_mode)(fl_Choice choice,int i){
    return (static_cast<Fl_Choice*>(choice))->mode(i);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Choice_mvalue)(fl_Choice choice){
    return (fl_Menu_Item)(static_cast<Fl_Choice*>(choice))->mvalue();
  }
  FL_EXPORT_C(int,Fl_Choice_value)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->value();
  }
  FL_EXPORT_C(int,Fl_Choice_set_value_with_item)(fl_Choice choice,fl_Menu_Item item){
    return (static_cast<Fl_Choice*>(choice))->value(static_cast<Fl_Menu_Item*>(item));
  }
  FL_EXPORT_C(int,Fl_Choice_set_value_with_index)(fl_Choice choice,int index){
    return (static_cast<Fl_Choice*>(choice))->value(index);
  }
  FL_EXPORT_C(char*,Fl_Choice_text)(fl_Choice choice){
    return (char*)(static_cast<Fl_Choice*>(choice))->text();
  }
  FL_EXPORT_C(char*,Fl_Choice_text_with_index)(fl_Choice choice,int i){
    return (char*)(static_cast<Fl_Choice*>(choice))->text(i);
  }
  FL_EXPORT_C(Fl_Font,Fl_Choice_textfont)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->textfont();
  }
  FL_EXPORT_C(void,Fl_Choice_set_textfont)(fl_Choice choice,Fl_Font c){
    (static_cast<Fl_Choice*>(choice))->textfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Choice_textsize)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->textsize();
  }
  FL_EXPORT_C(void,Fl_Choice_set_textsize)(fl_Choice choice,Fl_Fontsize c){
    (static_cast<Fl_Choice*>(choice))->textsize(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Choice_textcolor)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Choice_set_textcolor)(fl_Choice choice,Fl_Color c){
    (static_cast<Fl_Choice*>(choice))->textcolor(c);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Choice_down_box)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->down_box();
  }
  FL_EXPORT_C(void,Fl_Choice_set_down_box)(fl_Choice choice,Fl_Boxtype b){
    (static_cast<Fl_Choice*>(choice))->down_box(b);
  }
  FL_EXPORT_C(Fl_Color,Fl_Choice_down_color)(fl_Choice choice){
    return (static_cast<Fl_Choice*>(choice))->down_color();
  }
  FL_EXPORT_C(void,Fl_Choice_set_down_color)(fl_Choice choice,unsigned c){
    (static_cast<Fl_Choice*>(choice))->down_color(c);
  }
  FL_EXPORT_C(fl_Choice,    Fl_Choice_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedChoice* w = new Fl_DerivedChoice(X,Y,W,H,fs);
    return (fl_Choice)w;
  }
  FL_EXPORT_C(fl_Choice,    Fl_Choice_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedChoice* w = new Fl_DerivedChoice(X,Y,W,H,label,fs);
    return (fl_Choice)w;
  }
  FL_EXPORT_C(fl_Choice,    Fl_OverriddenChoice_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedChoice* w = new Fl_DerivedChoice(X,Y,W,H,fs);
    return (fl_Choice)w;
  }
  FL_EXPORT_C(fl_Choice,    Fl_OverriddenChoice_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedChoice* w = new Fl_DerivedChoice(X,Y,W,H,label,fs);
    return (fl_Choice)w;
  }
  FL_EXPORT_C(void, Fl_Choice_draw)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Choice_draw_super)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Choice_handle)(fl_Choice o, int event){
    return (static_cast<Fl_DerivedChoice*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Choice_handle_super)(fl_Choice o, int event){
    return (static_cast<Fl_DerivedChoice*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Choice_resize)(fl_Choice o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedChoice*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Choice_resize_super)(fl_Choice o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedChoice*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Choice_show)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Choice_show_super)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Choice_hide)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Choice_hide_super)(fl_Choice o){
    (static_cast<Fl_DerivedChoice*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
