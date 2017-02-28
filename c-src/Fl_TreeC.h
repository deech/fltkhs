#ifndef __FL_TREE_C__
#define __FL_TREE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tree.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedTree : public Fl_Tree {
    fl_Widget_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    virtual void draw();
    void draw_super();
    virtual int handle(int event);
    int handle_super(int event);
    virtual void resize(int x, int y, int w, int h);
    void resize_super(int x, int y, int w, int h);
    virtual void show();
    void show_super();
    virtual void hide();
    void hide_super();
    Fl_DerivedTree(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedTree(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedTree();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Tree_handle)(fl_Tree self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Tree_parent)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_parent)(fl_Tree tree, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Tree_type)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_type)(fl_Tree tree, uchar t);

  FL_EXPORT_C(int,          Fl_Tree_x)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_y)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_w)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_h)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_align)(fl_Tree tree, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Tree_align)(fl_Tree tree);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Tree_box)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_box)(fl_Tree tree, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_color)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_color)(fl_Tree tree, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Tree_set_color_with_bg_sel)(fl_Tree tree,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_selection_color)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_selection_color)(fl_Tree tree, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Tree_label)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_copy_label)(fl_Tree tree, const char* new_label);
  FL_EXPORT_C(void,         Fl_Tree_set_label)(fl_Tree tree, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Tree_labeltype)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labeltype)(fl_Tree tree, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Tree_labelcolor)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_labelcolor)(fl_Tree tree, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Tree_item_labelfont)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_item_labelfont)(fl_Tree tree, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Tree_item_labelsize)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_item_labelsize)(fl_Tree tree, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Tree_image)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_image)(fl_Tree tree, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Tree_deimage)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_deimage)(fl_Tree tree, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Tree_tooltip)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_copy_tooltip)(fl_Tree tree, const char* text);
  FL_EXPORT_C(void,         Fl_Tree_set_tooltip)(fl_Tree tree, const char* text);
  FL_EXPORT_C(void,         Fl_Tree_set_callback_with_user_data)(fl_Tree tree, fl_Callback* cb, void* p);
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
  FL_EXPORT_C(void,         Fl_Tree_draw_label_with_xywh_alignment)(fl_Tree tree, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Tree_measure_label)(fl_Tree tree, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Tree_window)(fl_Tree tree);
  FL_EXPORT_C(fl_Window,    Fl_Tree_top_window)(fl_Tree tree);
  FL_EXPORT_C(fl_Window ,   Fl_Tree_top_window_offset)(fl_Tree tree, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Tree_as_group)(fl_Tree tree);
  FL_EXPORT_C(fl_Gl_Window, Fl_Tree_as_gl_window)(fl_Tree tree);

  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Tree_begin)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_end)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_find)(fl_Tree tree, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tree_clear)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_resizable_by_reference)(fl_Tree tree,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tree_set_resizable)(fl_Tree tree,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Tree_resizable)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_add_resizable)(fl_Tree tree,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tree_init_sizes)(fl_Tree tree);
  FL_EXPORT_C(int,          Fl_Tree_children)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_set_clip_children)(fl_Tree tree,int c);
  FL_EXPORT_C(unsigned int, Fl_Tree_clip_children)(fl_Tree tree);
  FL_EXPORT_C(void,         Fl_Tree_focus)(fl_Tree tree,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Tree__ddfdesign_kludge)(fl_Tree tree);
  FL_EXPORT_C(fl_Widget*,   Fl_Tree_array)(fl_Tree self);
  FL_EXPORT_C(fl_Widget,    Fl_Tree_child)(fl_Tree self, int n);
  FL_EXPORT_C(void,         Fl_Tree_forms_end)(fl_Tree self);

  /* Fl_Tree specific */
  FL_EXPORT_C(fl_Tree,    Fl_Tree_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Tree   , Fl_Tree_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,Fl_Tree_Destroy)(fl_Tree tree);
  FL_EXPORT_C(int, Fl_Tree_handle)(fl_Tree tree,int e);
  FL_EXPORT_C(void, Fl_Tree_draw)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_show_self)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_root_label)(fl_Tree tree,const char *new_label);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_root)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_add)(fl_Tree tree,const char *path);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_add_with_item_name)(fl_Tree tree,fl_Tree_Item item, const char *name);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_insert_above)(fl_Tree tree,fl_Tree_Item above, const char *name);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_insert)(fl_Tree tree,fl_Tree_Item item, const char *name, int pos);
  FL_EXPORT_C(int, Fl_Tree_remove)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_clear)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_clear_children)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_find_item)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_item_pathname)(fl_Tree tree,char *pathname, int pathnamelen, const fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_item_clicked)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_first)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_first_visible)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_prev)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_prev_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_last)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_last_visible)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_first_selected_item)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_last_selected_item)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_selected_item)(fl_Tree tree);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_selected_item_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_selected_item_with_item_direction)(fl_Tree tree,fl_Tree_Item item, int dir);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_item)(fl_Tree tree,fl_Tree_Item item, int dir, int visible);
  FL_EXPORT_C(int, Fl_Tree_open_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_open_with_item_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_open_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_open_with_path_docallback)(fl_Tree tree,const char* path, int docallback);
  FL_EXPORT_C(void, Fl_Tree_open_toggle)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_open_toggle_with_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_close_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_close_with_item_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_close_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_close_with_path_docallback)(fl_Tree tree,const char* path, int docallback);
  FL_EXPORT_C(int, Fl_Tree_is_open_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_is_open_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_is_close_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_is_close_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_select_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_select_with_item_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_select_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_select_with_path_docallback)(fl_Tree tree,const char* path, int docallback);
  FL_EXPORT_C(void, Fl_Tree_select_toggle)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_select_toggle_with_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_deselect_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_deselect_with_item_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(int, Fl_Tree_deselect_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(int, Fl_Tree_deselect_with_path_docallback)(fl_Tree tree,const char* path, int docallback);
  FL_EXPORT_C(int, Fl_Tree_deselect_all_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_deselect_all_with_docallback)(fl_Tree tree,int docallback);
  FL_EXPORT_C(int, Fl_Tree_deselect_all_with_item_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(void, Fl_Tree_select_only)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_select_only_with_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(void, Fl_Tree_select_all)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_select_all_with_docallback)(fl_Tree tree,fl_Tree_Item item, int docallback);
  FL_EXPORT_C(void, Fl_Tree_set_item_focus)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_get_item_focus)(fl_Tree tree);
  FL_EXPORT_C(int, Fl_Tree_is_selected_with_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int, Fl_Tree_is_selected_with_path)(fl_Tree tree,const char *path);
  FL_EXPORT_C(Fl_Color   , Fl_Tree_item_labelfgcolor)(fl_Tree tree);
  FL_EXPORT_C(void       , Fl_Tree_set_item_labelfgcolor)(fl_Tree tree,Fl_Color val);
  FL_EXPORT_C(Fl_Color   , Fl_Tree_item_labelbgcolor)(fl_Tree tree);
  FL_EXPORT_C(void       , Fl_Tree_set_item_labelbgcolor)(fl_Tree tree,Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Tree_connectorcolor)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_connectorcolor)(fl_Tree tree,Fl_Color val);
  FL_EXPORT_C(int, Fl_Tree_marginleft)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_marginleft)(fl_Tree tree,int val);
  FL_EXPORT_C(int, Fl_Tree_margintop)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_margintop)(fl_Tree tree,int val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int, Fl_Tree_marginbottom)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_marginbottom)(fl_Tree tree,int val);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int, Fl_Tree_linespacing)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_linespacing)(fl_Tree tree,int val);
  FL_EXPORT_C(int, Fl_Tree_openchild_marginbottom)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_openchild_marginbottom)(fl_Tree tree,int val);
  FL_EXPORT_C(int, Fl_Tree_usericonmarginleft)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_usericonmarginleft)(fl_Tree tree,int val);
  FL_EXPORT_C(int, Fl_Tree_labelmarginleft)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_labelmarginleft)(fl_Tree tree,int val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int, Fl_Tree_widgetmarginleft)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_widgetmarginleft)(fl_Tree tree,int val);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int, Fl_Tree_connectorwidth)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_connectorwidth)(fl_Tree tree,int val);
  FL_EXPORT_C(fl_Image, Fl_Tree_usericon)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_usericon)(fl_Tree tree,fl_Image val);
  FL_EXPORT_C(fl_Image, Fl_Tree_openicon)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_openicon)(fl_Tree tree,fl_Image val);
  FL_EXPORT_C(fl_Image, Fl_Tree_closeicon)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_closeicon)(fl_Tree tree,fl_Image val);
  FL_EXPORT_C(int, Fl_Tree_showcollapse)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_showcollapse)(fl_Tree tree,int val);
  FL_EXPORT_C(int, Fl_Tree_showroot)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_showroot)(fl_Tree tree,int val);
  FL_EXPORT_C(Fl_Tree_Connector, Fl_Tree_connectorstyle)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_connectorstyle)(fl_Tree tree,Fl_Tree_Connector val);
  FL_EXPORT_C(Fl_Tree_Sort, Fl_Tree_sortorder)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_sortorder)(fl_Tree tree,Fl_Tree_Sort val);
  FL_EXPORT_C(Fl_Boxtype, Fl_Tree_selectbox)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_selectbox)(fl_Tree tree,Fl_Boxtype val);
  FL_EXPORT_C(Fl_Tree_Select, Fl_Tree_selectmode)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_selectmode)(fl_Tree tree,Fl_Tree_Select val);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(Fl_Tree_Item_Reselect_Mode, Fl_Tree_item_reselect_mode)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_item_reselect_mode)(fl_Tree tree,Fl_Tree_Item_Reselect_Mode mode);
  FL_EXPORT_C(Fl_Tree_Item_Draw_Mode, Fl_Tree_item_draw_mode)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_item_draw_mode)(fl_Tree tree,Fl_Tree_Item_Draw_Mode mode);
  FL_EXPORT_C(void, Fl_Tree_set_item_draw_mode_with_int)(fl_Tree tree,int mode);
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int, Fl_Tree_displayed)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_show_item_with_yoff)(fl_Tree tree,fl_Tree_Item item, int yoff);
  FL_EXPORT_C(void, Fl_Tree_show_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_show_item_top)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_show_item_middle)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_show_item_bottom)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(void, Fl_Tree_display)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(int , Fl_Tree_vposition)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_vposition)(fl_Tree tree,int pos);

  FL_EXPORT_C(int, Fl_Tree_is_scrollbar)(fl_Tree tree,fl_Widget w);
  FL_EXPORT_C(int, Fl_Tree_scrollbar_size)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_scrollbar_size)(fl_Tree tree,int size);
  FL_EXPORT_C(int, Fl_Tree_is_vscroll_visible)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_callback_item)(fl_Tree tree,fl_Tree_Item item);
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_callback_item)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_set_callback_reason)(fl_Tree tree,Fl_Tree_Reason reason);
  FL_EXPORT_C(Fl_Tree_Reason, Fl_Tree_callback_reason)(fl_Tree tree);
  FL_EXPORT_C(void, Fl_Tree_load)(fl_Tree tree,fl_Preferences preferences);
  FL_EXPORT_C(fl_Tree,    Fl_OverriddenTree_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Tree,    Fl_OverriddenTree_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Tree_draw)(fl_Tree o);
  FL_EXPORT_C(void, Fl_Tree_draw_super)(fl_Tree o);
  FL_EXPORT_C(int, Fl_Tree_handle)(fl_Tree o, int event);
  FL_EXPORT_C(int, Fl_Tree_handle_super)(fl_Tree o, int event);
  FL_EXPORT_C(void, Fl_Tree_resize)(fl_Tree o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tree_resize_super)(fl_Tree o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tree_show)(fl_Tree o);
  FL_EXPORT_C(void, Fl_Tree_show_super)(fl_Tree o);
  FL_EXPORT_C(void, Fl_Tree_hide)(fl_Tree o);
  FL_EXPORT_C(void, Fl_Tree_hide_super)(fl_Tree o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TREE_C__ */
