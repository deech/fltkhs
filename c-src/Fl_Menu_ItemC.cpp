#include "Fl_Menu_ItemC.h"

#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_next_with_step)(fl_Menu_Item menu_item,int step){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->next(step);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_next)(fl_Menu_Item menu_item){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->next();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_first)(fl_Menu_Item menu_item){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->first();
  }
  FL_EXPORT_C(const char*,Fl_Menu_Item_label)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->label();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_label)(fl_Menu_Item menu_item,const char* a){
    return (static_cast<Fl_Menu_Item*>(menu_item))->label(a);
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_label_with_labeltype)(fl_Menu_Item menu_item,Fl_Labeltype labeltype,const char* b){
    return (static_cast<Fl_Menu_Item*>(menu_item))->label(labeltype,b);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Menu_Item_labeltype)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_labeltype)(fl_Menu_Item menu_item,Fl_Labeltype a){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_labelcolor)(fl_Menu_Item menu_item, Fl_Color c){
    (static_cast<Fl_Menu_Item*>(menu_item))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Menu_Item_labelcolor)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Menu_Item_labelfont)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_labelfont)(fl_Menu_Item menu_item,Fl_Font a){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labelfont(a);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Menu_Item_labelsize)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_labelsize)(fl_Menu_Item menu_item,Fl_Fontsize a){
    return (static_cast<Fl_Menu_Item*>(menu_item))->labelsize(a);
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_callback_with_user_data)(fl_Menu_Item menu_item,fl_Callback* c,void* user_data){
    C_to_Fl_Callback* callback = new C_to_Fl_Callback(c, user_data);
    callback->set_callback(static_cast<Fl_Menu_Item*>(menu_item));
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_callback)(fl_Menu_Item menu_item,fl_Callback* c){
    C_to_Fl_Callback* callback = new C_to_Fl_Callback(c);
    callback->set_callback(static_cast<Fl_Menu_Item*>(menu_item));
  }
  FL_EXPORT_C(int, Fl_Menu_Item_has_callback)(fl_Menu_Item menu_item){
    void* p = 0;
    p = (void*)(static_cast<Fl_Menu_Item*>(menu_item)->callback());
    if (p == NULL) {
      return 0;
    }
    else {
      return 1;
    }
  }
  FL_EXPORT_C(void*,Fl_Menu_Item_user_data)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->user_data();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_user_data)(fl_Menu_Item menu_item,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Item*>(menu_item))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Menu_Item*>(menu_item))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Menu_Item*>(menu_item))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Menu_Item_argument)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->argument();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_argument)(fl_Menu_Item menu_item,long v){
    return (static_cast<Fl_Menu_Item*>(menu_item))->argument(v);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_shortcut)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set_shortcut)(fl_Menu_Item menu_item,int s){
    return (static_cast<Fl_Menu_Item*>(menu_item))->shortcut(s);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_submenu)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->submenu();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_checkbox)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->checkbox();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_radio)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->radio();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_value)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->value();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_set)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->set();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_clear)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->clear();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_setonly)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->setonly();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_visible)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->visible();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_show)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->show();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_hide)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->hide();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_active)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->active();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_activate)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->activate();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_deactivate)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->deactivate();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_activevisible)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->activevisible();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_image)(fl_Menu_Item menu_item,fl_Image a){
    return (static_cast<Fl_Menu_Item*>(menu_item))->image((static_cast<Fl_Image*>(a)));
  }
  FL_EXPORT_C(int,Fl_Menu_Item_measure)(fl_Menu_Item menu_item,int* h,fl_Menu_ menu){
    return (static_cast<Fl_Menu_Item*>(menu_item))->measure(h,(static_cast<Fl_Menu_*>(menu)));
  }
  FL_EXPORT_C(void,Fl_Menu_Item_draw_with_t)(fl_Menu_Item menu_item,int x,int y,int w,int h,fl_Menu_ menu ,int t){
    return (static_cast<Fl_Menu_Item*>(menu_item))->draw(x,y,w,h,(static_cast<Fl_Menu_*>(menu)),t);
  }
  FL_EXPORT_C(void,Fl_Menu_Item_draw)(fl_Menu_Item menu_item,int x,int y,int w,int h,fl_Menu_ menu){
    return (static_cast<Fl_Menu_Item*>(menu_item))->draw(x,y,w,h,(static_cast<Fl_Menu_*>(menu)));
  }
  FL_EXPORT_C(int, Fl_Menu_Item_flags)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->flags;
  }
  FL_EXPORT_C(void, Fl_Menu_Item_set_flags)(fl_Menu_Item menu_item, int flags){
    (static_cast<Fl_Menu_Item*>(menu_item))->flags = flags;
  }
  FL_EXPORT_C(char*, Fl_Menu_Item_text)(fl_Menu_Item menu_item){
    return (char*)(static_cast<Fl_Menu_Item*>(menu_item))->text;
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_popup)(fl_Menu_Item menu_item,int X,int Y){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->popup(X,Y);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_pulldown)(fl_Menu_Item menu_item,int X,int Y,int W,int H){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->pulldown(X,Y,W,H);
  }

  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_popup_with_args)(fl_Menu_Item menu_item,int X,int Y, char* title, fl_Menu_Item picked, fl_Menu_ menu){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->popup(X,Y,title, (static_cast<Fl_Menu_Item*>(picked)), (static_cast<Fl_Menu_*>(menu)));
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_pulldown_with_args)(fl_Menu_Item menu_item,int X,int Y,int W, int H, fl_Menu_Item picked, fl_Menu_ menu, fl_Menu_Item title, int menubar){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->pulldown(X,Y,W,H,(static_cast<Fl_Menu_Item*>(picked)), (static_cast<Fl_Menu_*>(menu)), (static_cast<Fl_Menu_Item*>(title)), menubar);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_test_shortcut)(fl_Menu_Item menu_item){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->test_shortcut();
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_find_shortcut_with_ip_require_alt)(fl_Menu_Item menu_item,int* ip,int require_alt){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->find_shortcut(ip,require_alt ? true : false);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_find_shortcut_with_ip)(fl_Menu_Item menu_item,int* ip){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->find_shortcut(ip);
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_find_shortcut_with_require_alt)(fl_Menu_Item menu_item,int require_alt){
    return (fl_Menu_Item)(static_cast<Fl_Menu_Item*>(menu_item))->find_shortcut(0,require_alt ? true : false);
  }
  FL_EXPORT_C(void,Fl_Menu_Item_do_callback)(fl_Menu_Item menu_item,fl_Widget o){
    return (static_cast<Fl_Menu_Item*>(menu_item))->do_callback((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Menu_Item_do_callback_with_user_data)(fl_Menu_Item menu_item,fl_Widget o,void* arg){
    return (static_cast<Fl_Menu_Item*>(menu_item))->do_callback((static_cast<Fl_Widget*>(o)),arg);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_checked)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->checked();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_check)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->check();
  }
  FL_EXPORT_C(void,Fl_Menu_Item_uncheck)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->uncheck();
  }
  FL_EXPORT_C(int,Fl_Menu_Item_insert)(fl_Menu_Item menu_item,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Item*>(menu_item)),index,name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_insert_with_flags)(fl_Menu_Item menu_item,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Item*>(menu_item)),index,name,shortcut, flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_insert_with_user_data_flags)(fl_Menu_Item menu_item,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Item*>(menu_item)),index,name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_user_data)(fl_Menu_Item menu_item,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_flags)(fl_Menu_Item menu_item,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_user_data_flags)(fl_Menu_Item menu_item,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_shortcutname_user_data)(fl_Menu_Item menu_item,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,0);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_shortcutname_flags)(fl_Menu_Item menu_item,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,flags);
  }
  FL_EXPORT_C(int,Fl_Menu_Item_add_with_shortcutname_user_data_flags)(fl_Menu_Item menu_item,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Item*>(menu_item)),name,shortcut,flags);
  }
  FL_EXPORT_C(int, Fl_Menu_Item_size)(fl_Menu_Item menu_item){
    return (static_cast<Fl_Menu_Item*>(menu_item))->size();
  }
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_New)(){
    Fl_Menu_Item* i = new Fl_Menu_Item();
    return (fl_Menu_Item)i;
  }
  FL_EXPORT_C(void, Fl_Menu_Item_Destroy)(fl_Menu_Item menu_item){
    delete (static_cast<Fl_Menu_Item*>(menu_item));
  }
#ifdef __cplusplus
}
#endif
