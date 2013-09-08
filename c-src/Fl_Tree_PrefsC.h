#ifndef __FL_TREE_PREFS_C__
#define __FL_TREE_PREFS_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tree_Prefs.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Tree_Prefs, Fl_Tree_Prefs_New)();
  FL_EXPORT_C(void, Fl_Tree_Prefs_Destroy)(fl_Tree_Prefs prefs);
  FL_EXPORT_C(Fl_Font, Fl_Tree_Prefs_item_labelfont)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_labelfont)(fl_Tree_Prefs tree_prefs, Fl_Font val);
  FL_EXPORT_C(Fl_Fontsize, Fl_Tree_Prefs_item_labelsize)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_labelsize)(fl_Tree_Prefs tree_prefs, Fl_Fontsize val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_item_labelfgcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_labelfgcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_item_labelbgcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_labelbgcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
#else /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_item_labelbgcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_labelbgcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(Fl_Font, Fl_Tree_Prefs_labelfont)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_labelfont)(fl_Tree_Prefs tree_prefs, Fl_Font val);
  FL_EXPORT_C(Fl_Fontsize, Fl_Tree_Prefs_labelsize)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_labelsize)(fl_Tree_Prefs tree_prefs, Fl_Fontsize val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_labelfgcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_labelfgcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_labelbgcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_labelbgcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_marginleft)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_marginleft)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_margintop)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_margintop)(fl_Tree_Prefs tree_prefs, int val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int, Fl_Tree_Prefs_marginbottom)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_marginbottom)(fl_Tree_Prefs tree_prefs, int val);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int, Fl_Tree_Prefs_openchild_marginbottom)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_openchild_marginbottom)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_usericonmarginleft)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_usericonmarginleft)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_labelmarginleft)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void,Fl_Tree_Prefs_set_labelmarginleft)(fl_Tree_Prefs tree_prefs, int val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int, Fl_Tree_Prefs_widgetmarginleft)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_widgetmarginleft)(fl_Tree_Prefs tree_prefs, int val);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int, Fl_Tree_Prefs_linespacing)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_linespacing)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_Prefs_connectorcolor)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_connectorcolor)(fl_Tree_Prefs tree_prefs, Fl_Color val);
  FL_EXPORT_C(Fl_Tree_Connector, Fl_Tree_Prefs_connectorstyle)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_connectorstyle_with_tree_connector)(fl_Tree_Prefs tree_prefs, Fl_Tree_Connector val);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_connectorstyle_with_val)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_connectorwidth)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_connectorwidth)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(fl_Image, Fl_Tree_Prefs_openicon)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_openicon)(fl_Tree_Prefs tree_prefs, fl_Image val);
  FL_EXPORT_C(fl_Image, Fl_Tree_Prefs_closeicon)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_closeicon)(fl_Tree_Prefs tree_prefs, fl_Image val);
  FL_EXPORT_C(fl_Image, Fl_Tree_Prefs_usericon)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_usericon)(fl_Tree_Prefs tree_prefs, fl_Image val);
  FL_EXPORT_C(char, Fl_Tree_Prefs_showcollapse)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_showcollapse)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(Fl_Tree_Sort, Fl_Tree_Prefs_sortorder)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_sortorder)(fl_Tree_Prefs tree_prefs, Fl_Tree_Sort val);
  FL_EXPORT_C(Fl_Boxtype, Fl_Tree_Prefs_selectbox)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_selectbox)(fl_Tree_Prefs tree_prefs, Fl_Boxtype val);
  FL_EXPORT_C(int, Fl_Tree_Prefs_showroot)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_showroot)(fl_Tree_Prefs tree_prefs, int val);
  FL_EXPORT_C(Fl_Tree_Select, Fl_Tree_Prefs_selectmode)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_selectmode)(fl_Tree_Prefs tree_prefs, Fl_Tree_Select val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(Fl_Tree_Item_Reselect_Mode, Fl_Tree_Prefs_item_reselect_mode)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_reselect_mode)(fl_Tree_Prefs tree_prefs, Fl_Tree_Item_Reselect_Mode mode);
  FL_EXPORT_C(Fl_Tree_Item_Draw_Mode, Fl_Tree_Prefs_item_draw_mode)(fl_Tree_Prefs tree_prefs);
  FL_EXPORT_C(void, Fl_Tree_Prefs_set_item_draw_mode)(fl_Tree_Prefs tree_prefs, Fl_Tree_Item_Draw_Mode val);
#endif /*FLTK_ABI_VERSION*/
#ifdef __cplusplus
}
#endif
#endif /* __FL_TREE_PREFS_C__ */
