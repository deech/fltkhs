#ifndef __FL_MENU_ITEM_C__
#define __FL_MENU_ITEM_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_Item.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_next_with_step)(fl_Menu_Item menu_item, int step);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_next)(fl_Menu_Item menu_item);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_first)(fl_Menu_Item menu_item);
  FL_EXPORT_C(const char*, Fl_Menu_Item_label)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_label)(fl_Menu_Item menu_item, const char* a);
  FL_EXPORT_C(void, Fl_Menu_Item_set_label_with_labeltype)(fl_Menu_Item menu_item, Fl_Labeltype labeltype,const char* b);
  FL_EXPORT_C(Fl_Labeltype, Fl_Menu_Item_labeltype)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_labeltype)(fl_Menu_Item menu_item, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color, Fl_Menu_Item_labelcolor)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_labelcolor)(fl_Menu_Item menu_item, Fl_Color a);
  FL_EXPORT_C(Fl_Font, Fl_Menu_Item_labelfont)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_labelfont)(fl_Menu_Item menu_item, Fl_Font a);
  FL_EXPORT_C(Fl_Fontsize, Fl_Menu_Item_labelsize)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_labelsize)(fl_Menu_Item menu_item, Fl_Fontsize a);
  //  fl_Callback* callback(); commented until I figure out how to do this
  FL_EXPORT_C(void, Fl_Menu_Item_set_callback_with_user_data)(fl_Menu_Item menu_item, fl_Callback* c, void* user_data);
  FL_EXPORT_C(void, Fl_Menu_Item_set_callback)(fl_Menu_Item menu_item, fl_Callback* c);
  FL_EXPORT_C(int,  Fl_Menu_Item_has_callback)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void*, Fl_Menu_Item_user_data)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_user_data)(fl_Menu_Item menu_item, void* v);
  FL_EXPORT_C(long, Fl_Menu_Item_argument)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_argument)(fl_Menu_Item menu_item, long v);
  FL_EXPORT_C(int, Fl_Menu_Item_shortcut)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_shortcut)(fl_Menu_Item menu_item, int s);
  FL_EXPORT_C(int, Fl_Menu_Item_submenu)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_checkbox)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_radio)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_value)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_clear)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_setonly)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_visible)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_show)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_hide)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_active)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_activate)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_deactivate)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_activevisible)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_image)(fl_Menu_Item menu_item, fl_Image a);
  FL_EXPORT_C(int, Fl_Menu_Item_measure)(fl_Menu_Item menu_item, int* h, fl_Menu_ menu);
  FL_EXPORT_C(void, Fl_Menu_Item_draw_with_t)(fl_Menu_Item menu_item, int x, int y, int w, int h, fl_Menu_, int t);
  FL_EXPORT_C(void, Fl_Menu_Item_draw)(fl_Menu_Item menu_item, int x, int y, int w, int h, fl_Menu_ menu);
  FL_EXPORT_C(int, Fl_Menu_Item_flags)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_set_flags)(fl_Menu_Item menu_item,int flags);
  FL_EXPORT_C(char*, Fl_Menu_Item_text)(fl_Menu_Item menu_item);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_popup)(fl_Menu_Item menu_item, int X, int Y);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_pulldown)(fl_Menu_Item menu_item, int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_popup_with_args)(fl_Menu_Item menu_item,int X,int Y, char* title, fl_Menu_Item picked, fl_Menu_ menu);
  FL_EXPORT_C(fl_Menu_Item,Fl_Menu_Item_pulldown_with_args)(fl_Menu_Item menu_item,int X,int Y,int W, int H, fl_Menu_Item picked, fl_Menu_ menu, fl_Menu_Item title, int menubar);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_test_shortcut)(fl_Menu_Item menu_item);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_find_shortcut_with_ip_require_alt)(fl_Menu_Item menu_item, int* ip, int require_alt);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_find_shortcut_with_ip)(fl_Menu_Item menu_item, int* ip);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_find_shortcut_with_require_alt)(fl_Menu_Item menu_item, int require_alt);
  FL_EXPORT_C(void, Fl_Menu_Item_do_callback)(fl_Menu_Item menu_item, fl_Widget o);
  FL_EXPORT_C(void, Fl_Menu_Item_do_callback_with_user_data)(fl_Menu_Item menu_item, fl_Widget o,void* arg);
  FL_EXPORT_C(int, Fl_Menu_Item_checked)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_check)(fl_Menu_Item menu_item);
  FL_EXPORT_C(void, Fl_Menu_Item_uncheck)(fl_Menu_Item menu_item);
  FL_EXPORT_C(int, Fl_Menu_Item_insert)(fl_Menu_Item menu_item, int index,  char* name , int shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu_Item_insert_with_user_data)(fl_Menu_Item menu_item, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Item_insert_with_flags)(fl_Menu_Item menu_item, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_insert_with_user_data_flags)(fl_Menu_Item menu_item, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_add)(fl_Menu_Item menu_item, char* name, int shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_user_data)(fl_Menu_Item menu_item,   char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_flags)(fl_Menu_Item menu_item,   char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_user_data_flags)(fl_Menu_Item menu_item,   char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_shortcutname_user_data)(fl_Menu_Item menu_item,   char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_shortcutname_flags)(fl_Menu_Item menu_item,   char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_add_with_shortcutname_user_data_flags)(fl_Menu_Item menu_item,   char* name,   char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Item_size)(fl_Menu_Item menu_item);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Item_New)();
  FL_EXPORT_C(void, Fl_Menu_Item_Destroy)(fl_Menu_Item menu_item);
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU_ITEM_C__ */
