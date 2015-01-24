#ifndef __FL_TREE_ITEM_C__
#define __FL_TREE_ITEM_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tree_Item.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_New_WithPrefs)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_New_WithItem)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_Destroy)(fl_Tree_Item tree_item);

  FL_EXPORT_C(int, Fl_Tree_Item_x)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_y)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_w)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_h)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_draw)(fl_Tree_Item tree_item, int X, int *Y, int W, fl_Widget tree, fl_Tree_Item itemfocus,  fl_Tree_Prefs prefs);
  FL_EXPORT_C(void, Fl_Tree_Item_draw_with_lastchild)(fl_Tree_Item tree_item, int X, int *Y, int W, fl_Widget tree, fl_Tree_Item itemfocus,  fl_Tree_Prefs prefs);
  FL_EXPORT_C(void, Fl_Tree_Item_show_self_with_indent)(fl_Tree_Item tree_item,  char* indent);
  FL_EXPORT_C(void, Fl_Tree_Item_show_self)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_label)(fl_Tree_Item tree_item,  char* val);
  FL_EXPORT_C(const char*, Fl_Tree_Item_label)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_user_data)(fl_Tree_Item tree_item,  void* data );
  FL_EXPORT_C(void*, Fl_Tree_Item_user_data)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_labelfont)(fl_Tree_Item tree_item, Fl_Font val);
  FL_EXPORT_C(Fl_Font, Fl_Tree_Item_labelfont)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_labelsize)(fl_Tree_Item tree_item, Fl_Fontsize val);
  FL_EXPORT_C(Fl_Fontsize, Fl_Tree_Item_labelsize)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_labelcolor)(fl_Tree_Item tree_item, Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Item_labelcolor)(fl_Tree_Item tree_item);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Item_labelfgcolor)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_labelfgcolor)(fl_Tree_Item tree_item, Fl_Color val);
  FL_EXPORT_C(void, Fl_Tree_Item_set_labelbgcolor)(fl_Tree_Item tree_item, Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Item_labelbgcolor)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_widget)(fl_Tree_Item tree_item, fl_Widget val);
  FL_EXPORT_C(fl_Widget, Fl_Tree_Item_widget)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_children)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_child_by_index)(fl_Tree_Item tree_item, int index);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_child_by_t)(fl_Tree_Item tree_item, int t);
  FL_EXPORT_C(int, Fl_Tree_Item_has_children)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_find_child)(fl_Tree_Item tree_item,  char* name);
  FL_EXPORT_C(int, Fl_Tree_Item_find_child_by_item)(fl_Tree_Item tree_item, fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_Item_remove_child_by_item)(fl_Tree_Item tree_item, fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_Item_remove_child)(fl_Tree_Item tree_item,  char* new_label);
  FL_EXPORT_C(void, Fl_Tree_Item_clear_children)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_swap_children)(fl_Tree_Item tree_item, int ax, int bx);
  FL_EXPORT_C(int, Fl_Tree_Item_swap_children_by_tree_item)(fl_Tree_Item tree_item, fl_Tree_Item a, fl_Tree_Item b);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_find_child_item_by_children)(fl_Tree_Item tree_item, char** arr);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_find_child_item_by_name)(fl_Tree_Item tree_item, const char* name);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_find_child_item)(fl_Tree_Item tree_item, char** arr);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_find_item)(fl_Tree_Item tree_item, char** arr);

  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_add_with)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs,  const char* new_label, fl_Tree_Item new_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_add_with_at)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs, fl_Tree_Item new_item, char** arr);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_add)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs, const char* new_label);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_add_at)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs, char** arr);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_insert)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs,  char* new_label);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_insert_with_pos)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs,  char *new_label, int pos);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_insert_above)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs,  char *new_label);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_deparent    )(fl_Tree_Item tree_item, int index);
  FL_EXPORT_C(int         , Fl_Tree_Item_reparent    )(fl_Tree_Item tree_item, fl_Tree_Item new_item, int index);
  FL_EXPORT_C(int         , Fl_Tree_Item_move        )(fl_Tree_Item tree_item, int to, int from);
  FL_EXPORT_C(int         , Fl_Tree_Item_move_item   )(fl_Tree_Item tree_item, fl_Tree_Item child_item, int op, int pos);
  FL_EXPORT_C(int         , Fl_Tree_Item_move_above  )(fl_Tree_Item tree_item, fl_Tree_Item child_item);
  FL_EXPORT_C(int         , Fl_Tree_Item_move_below  )(fl_Tree_Item tree_item, fl_Tree_Item child_item);
  FL_EXPORT_C(int         , Fl_Tree_Item_move_into   )(fl_Tree_Item tree_item, fl_Tree_Item child_item, int pos);
  FL_EXPORT_C(int, Fl_Tree_Item_depth)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_prev)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_next)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_next_sibling)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_prev_sibling)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_update_prev_next)(fl_Tree_Item tree_item, int index);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_next_displayed)(fl_Tree_Item tree_item, fl_Tree_Prefs prefs);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_prev_displayed)(fl_Tree_Item tree_item, fl_Tree_Prefs prefs);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_parent)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_parent)(fl_Tree_Item tree_item, fl_Tree_Item val);
  FL_EXPORT_C(void, Fl_Tree_Item_open)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_close)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_is_open)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_is_close)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_open_toggle)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_select)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_select_with_val)(fl_Tree_Item tree_item, int val);
  FL_EXPORT_C(void, Fl_Tree_Item_select_toggle)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_select_all)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_deselect)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_deselect_all)(fl_Tree_Item tree_item);
  FL_EXPORT_C(char, Fl_Tree_Item_is_selected)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_activate)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_activate_with_val)(fl_Tree_Item tree_item, int val);
  FL_EXPORT_C(char, Fl_Tree_Item_is_active)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_visible)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_is_visible)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_visible_r)(fl_Tree_Item tree_item);
  FL_EXPORT_C(void, Fl_Tree_Item_set_usericon)(fl_Tree_Item tree_item, fl_Image val);
  FL_EXPORT_C(fl_Image, Fl_Tree_Item_usericon)(fl_Tree_Item tree_item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_Item_find_clicked)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs);
  FL_EXPORT_C(int, Fl_Tree_Item_event_on_collapse_icon)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs);
  FL_EXPORT_C(int, Fl_Tree_Item_event_on_label)(fl_Tree_Item tree_item,  fl_Tree_Prefs prefs);
  FL_EXPORT_C(int, Fl_Tree_Item_is_root)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_label_x)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_label_y)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_label_w)(fl_Tree_Item tree_item);
  FL_EXPORT_C(int, Fl_Tree_Item_label_h)(fl_Tree_Item tree_item);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TREE_ITEM_C__ */
