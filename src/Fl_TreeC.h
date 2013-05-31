#ifndef __FL_TREE_C__
#define __FL_TREE_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tree.H"
#include "Fl_CallbackC.h"
#ifdef __cplusplus
EXPORT {
#endif
#ifdef INTERNAL_LINKAGE
  typedef enum {
  FL_TREE_REASON_NONE=0,
    FL_TREE_REASON_SELECTED,
    FL_TREE_REASON_DESELECTED,
#if FLTK_ABI_VERSION >= 10302
    FL_TREE_REASON_RESELECTED,
#endif /*FLTK_ABI_VERSION*/
    FL_TREE_REASON_OPENED,
    FL_TREE_REASON_CLOSED
    } Fl_Tree_Reason;
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,     Fl_Tree_parent)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_parent)(fl_Tree tree, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Tree_type)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_type)(fl_Tree tree, uchar t);
  FL_EXPORT_C(int,          Fl_Tree_x)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_y)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_w)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_h)(fl_Tree tree);
  FL_EXPORT_C(Fl_Align,     Fl_Tree_align)(fl_Tree tree);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Tree_box)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_box)(fl_Tree tree, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_color)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_color)(fl_Tree tree, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Tree_set_background_and_selection_color)(fl_Tree tree,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_selection_color)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_selection_color)(fl_Tree tree, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Tree_label)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_copy_label)(fl_Tree tree, const char* new_label);
  FL_EXPORT_C(void,         Fl_Tree_set_label)(fl_Tree tree, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Tree_labeltype)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labeltype)(fl_Tree tree, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_labelcolor)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labelcolor)(fl_Tree tree, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Tree_labelfont)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labelfont)(fl_Tree tree, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Tree_labelsize)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labelsize)(fl_Tree tree, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Tree_image)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_image)(fl_Tree tree, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Tree_deimage)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_deimage)(fl_Tree tree, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Tree_tooltip)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_copy_tooltip)(fl_Tree tree, const char* text);
  FL_EXPORT_C(void,         Fl_Tree_set_tooltip)(fl_Tree tree, const char* text);
  FL_EXPORT_C(void,         Fl_Tree_set_callback_and_user_data)(fl_Tree tree, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Tree_set_callback)(fl_Tree tree, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Tree_user_data)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_user_data)(fl_Tree tree, void* v);
  FL_EXPORT_C(long,         Fl_Tree_argument)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_argument)(fl_Tree tree, long v);
  FL_EXPORT_C(Fl_When,      Fl_Tree_when)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_when)(fl_Tree tree, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Tree_visible)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_visible_r)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_visible)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_clear_visible)(fl_Tree tree);
  FL_EXPORT_C(unsigned int, Fl_Tree_active)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_active_r)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_activate)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_deactivate)(fl_Tree tree);
  FL_EXPORT_C(unsigned int, Fl_Tree_output)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_output)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_clear_output)(fl_Tree tree);
  FL_EXPORT_C(unsigned int, Fl_Tree_takesevents)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_changed)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_clear_changed)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_take_focus)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_visible_focus)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_clear_visible_focus)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_modify_visible_focus)(fl_Tree tree, int v);
  FL_EXPORT_C(unsigned int, Fl_Tree_visible_focus)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_do_callback)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_do_callback_with_widget_and_user_data)(fl_Tree tree, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Tree_do_callback_with_widget_and_default_user_data)(fl_Tree tree, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Tree_contains)(fl_Tree tree, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Tree_inside)(fl_Tree tree, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tree_redraw)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_redraw_label)(fl_Tree tree);
  FL_EXPORT_C(uchar,        Fl_Tree_damage)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_clear_damage_with_bitmask)(fl_Tree tree, uchar c);
  FL_EXPORT_C(void,         Fl_Tree_clear_damage)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_damage_with_text)(fl_Tree tree, uchar c);
  FL_EXPORT_C(void,         Fl_Tree_damage_inside_widget)(fl_Tree tree, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Tree_draw_label)(fl_Tree tree, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Tree_measure_label)(fl_Tree tree, int& ww , int& hh);
  FL_EXPORT_C(fl_Group,     Fl_Tree_as_group)(fl_Tree tree);
  FL_EXPORT_C(fl_Gl_Window, Fl_Tree_as_gl_window)(fl_Tree tree);

  
  int handle(int e);
  void draw();
  void show_self();
  void root_label(const char *new_label);
  Fl_Tree_Item* root();
  Fl_Tree_Item *add(const char *path);
  Fl_Tree_Item* add(Fl_Tree_Item *item, const char *name);
  Fl_Tree_Item *insert_above(Fl_Tree_Item *above, const char *name);
  Fl_Tree_Item* insert(Fl_Tree_Item *item, const char *name, int pos);
  int remove(Fl_Tree_Item *item);
  void clear();
  void clear_children(Fl_Tree_Item *item);
  Fl_Tree_Item *find_item(const char *path);
  const Fl_Tree_Item *find_item(const char *path) const;
  int item_pathname(char *pathname, int pathnamelen, const Fl_Tree_Item *item) const;
  const Fl_Tree_Item *find_clicked() const;
  Fl_Tree_Item *item_clicked();
  Fl_Tree_Item *first();
  Fl_Tree_Item *first_visible();
  Fl_Tree_Item *next(Fl_Tree_Item *item=0);
  Fl_Tree_Item *prev(Fl_Tree_Item *item=0);
  Fl_Tree_Item *last();
  Fl_Tree_Item *last_visible();
  Fl_Tree_Item *first_selected_item();
  Fl_Tree_Item *next_selected_item(Fl_Tree_Item *item=0);
  int open(Fl_Tree_Item *item, int docallback=1);
  int open(const char *path, int docallback=1);
  void open_toggle(Fl_Tree_Item *item, int docallback=1);
  int close(Fl_Tree_Item *item, int docallback=1);
  int close(const char *path, int docallback=1);
  int is_open(Fl_Tree_Item *item) const;
  int is_open(const char *path) const;
  int is_close(Fl_Tree_Item *item) const;
  int is_close(const char *path) const;
  int select(Fl_Tree_Item *item, int docallback=1);
  int select(const char *path, int docallback=1);
  void select_toggle(Fl_Tree_Item *item, int docallback=1);
  int deselect(Fl_Tree_Item *item, int docallback=1);
  int deselect(const char *path, int docallback=1);
  int deselect_all(Fl_Tree_Item *item=0, int docallback=1);
  int select_only(Fl_Tree_Item *selitem, int docallback=1);
  int select_all(Fl_Tree_Item *item=0, int docallback=1);
  void set_item_focus(Fl_Tree_Item *item);
  Fl_Tree_Item *get_item_focus() const;
  int is_selected(Fl_Tree_Item *item) const;
  int is_selected(const char *path);
  Fl_Font     item_labelfont() const;
  void        item_labelfont(Fl_Font val);
  Fl_Fontsize item_labelsize() const;
  void        item_labelsize(Fl_Fontsize val);
  Fl_Color    item_labelfgcolor(void) const;
  void        item_labelfgcolor(Fl_Color val);
  Fl_Color    item_labelbgcolor(void) const;
  void        item_labelbgcolor(Fl_Color val);
  Fl_Color connectorcolor() const;
  void connectorcolor(Fl_Color val);
  int marginleft() const;
  void marginleft(int val);
  int margintop() const;
  void margintop(int val);
#if FLTK_ABI_VERSION >= 10302
  int marginbottom() const;
  void marginbottom(int val);
#endif /*FLTK_ABI_VERSION*/
  int linespacing() const;
  void linespacing(int val);
  int openchild_marginbottom() const;
  void openchild_marginbottom(int val);
  int usericonmarginleft() const;
  void usericonmarginleft(int val);
  int labelmarginleft() const;
  void labelmarginleft(int val);
#if FLTK_ABI_VERSION >= 10302
  int widgetmarginleft() const;
  void widgetmarginleft(int val);
#endif /*FLTK_ABI_VERSION*/
  int connectorwidth() const;
  void connectorwidth(int val);
  Fl_Image* usericon() const;
  void usericon(Fl_Image *val);
  Fl_Image* openicon() const;
  void openicon(Fl_Image *val);
  Fl_Image* closeicon() const;
  void closeicon(Fl_Image *val);
  int showcollapse() const;
  void showcollapse(int val);
  int showroot() const;
  void showroot(int val);
  Fl_Tree_Connector connectorstyle() const;
  void connectorstyle(Fl_Tree_Connector val);
  Fl_Tree_Sort sortorder() const;
  void sortorder(Fl_Tree_Sort val);
  Fl_Boxtype selectbox() const;
  void selectbox(Fl_Boxtype val);
  Fl_Tree_Select selectmode() const;
  void selectmode(Fl_Tree_Select val);
#if FLTK_ABI_VERSION >= 10302
  Fl_Tree_Item_Reselect_Mode item_reselect_mode() const;
  void item_reselect_mode(Fl_Tree_Item_Reselect_Mode mode);
  Fl_Tree_Item_Draw_Mode item_draw_mode() const;
  void item_draw_mode(Fl_Tree_Item_Draw_Mode mode);
  void item_draw_mode(int mode);
#endif /*FLTK_ABI_VERSION*/
  int displayed(Fl_Tree_Item *item);
  void show_item(Fl_Tree_Item *item, int yoff);
  void show_item(Fl_Tree_Item *item);
  void show_item_top(Fl_Tree_Item *item);
  void show_item_middle(Fl_Tree_Item *item);
  void show_item_bottom(Fl_Tree_Item *item);
  void display(Fl_Tree_Item *item);
  int  vposition() const;
  void vposition(int pos);

  int is_scrollbar(Fl_Widget *w);
  int scrollbar_size() const;
  void scrollbar_size(int size);
  int is_vscroll_visible() const;
  void callback_item(Fl_Tree_Item* item);
  Fl_Tree_Item* callback_item();
  void callback_reason(Fl_Tree_Reason reason);
  Fl_Tree_Reason callback_reason() const;
  void load(class Fl_Preferences&);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TREE_C__ */
