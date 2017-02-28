#ifndef __FL_SYS_MENU_BAR_C__
#define __FL_SYS_MENU_BAR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Sys_Menu_Bar.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedSys_Menu_Bar : public Fl_Sys_Menu_Bar {
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
    Fl_DerivedSys_Menu_Bar(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedSys_Menu_Bar(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedSys_Menu_Bar();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Sys_Menu_Bar_parent)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_parent)(fl_Sys_Menu_Bar sys_menu_bar, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Sys_Menu_Bar_type)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_type)(fl_Sys_Menu_Bar sys_menu_bar, uchar t);

  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_x)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_y)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_w)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_h)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_align)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Sys_Menu_Bar_align)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Sys_Menu_Bar_box)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_box)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Sys_Menu_Bar_color)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_color)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_color_with_bg_sel)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Sys_Menu_Bar_selection_color)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_selection_color)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Sys_Menu_Bar_label)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_copy_label)(fl_Sys_Menu_Bar sys_menu_bar, const char* new_label);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_label)(fl_Sys_Menu_Bar sys_menu_bar, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Sys_Menu_Bar_labeltype)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_labeltype)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Sys_Menu_Bar_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Sys_Menu_Bar_item_labelfont)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_item_labelfont)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Sys_Menu_Bar_item_labelsize)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_item_labelsize)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Sys_Menu_Bar_image)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_image)(fl_Sys_Menu_Bar sys_menu_bar, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Sys_Menu_Bar_deimage)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_deimage)(fl_Sys_Menu_Bar sys_menu_bar, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Sys_Menu_Bar_tooltip)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_copy_tooltip)(fl_Sys_Menu_Bar sys_menu_bar, const char* text);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_tooltip)(fl_Sys_Menu_Bar sys_menu_bar, const char* text);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_callback_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_callback)(fl_Sys_Menu_Bar sys_menu_bar, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Sys_Menu_Bar_other_data)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_other_data)(fl_Sys_Menu_Bar sys_menu_bar, void* v);
  FL_EXPORT_C(void*,        Fl_Sys_Menu_Bar_user_data)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_user_data)(fl_Sys_Menu_Bar sys_menu_bar, void* v);
  FL_EXPORT_C(long,         Fl_Sys_Menu_Bar_argument)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_argument)(fl_Sys_Menu_Bar sys_menu_bar, long v);
  FL_EXPORT_C(Fl_When,      Fl_Sys_Menu_Bar_when)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_when)(fl_Sys_Menu_Bar sys_menu_bar, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Sys_Menu_Bar_visible)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_visible_r)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_show)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_hide)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_visible)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_visible)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Sys_Menu_Bar_active)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_active_r)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_activate)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_deactivate)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Sys_Menu_Bar_output)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_output)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_output)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Sys_Menu_Bar_takesevents)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_changed)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_changed)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_take_focus)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_set_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_modify_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar, int v);
  FL_EXPORT_C(unsigned int, Fl_Sys_Menu_Bar_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_contains)(fl_Sys_Menu_Bar sys_menu_bar, fl_Group w);
  FL_EXPORT_C(int,          Fl_Sys_Menu_Bar_inside)(fl_Sys_Menu_Bar sys_menu_bar, fl_Group w);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_redraw)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_redraw_label)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(uchar,        Fl_Sys_Menu_Bar_damage)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_damage_with_bitmask)(fl_Sys_Menu_Bar sys_menu_bar, uchar c);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_clear_damage)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_damage_with_text)(fl_Sys_Menu_Bar sys_menu_bar, uchar c);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_damage_inside_group)(fl_Sys_Menu_Bar sys_menu_bar, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_draw_label_with_xywh_alignment)(fl_Sys_Menu_Bar sys_menu_bar, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_measure_label)(fl_Sys_Menu_Bar sys_menu_bar, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Sys_Menu_Bar_window)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(fl_Window,    Fl_Sys_Menu_Bar_top_window)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(fl_Window ,   Fl_Sys_Menu_Bar_top_window_offset)(fl_Sys_Menu_Bar sys_menu_bar, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Sys_Menu_Bar_as_group)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(fl_Gl_Window, Fl_Sys_Menu_Bar_as_gl_window)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void,         Fl_Sys_Menu_Bar_resize)(fl_Sys_Menu_Bar sys_menu_bar,int X, int Y, int W, int H);

  /* Fl_Sys_Menu_Bar specific */
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_Sys_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Sys_Menu_Bar, Fl_Sys_Menu_Bar_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_Destroy)(fl_Sys_Menu_Bar sys_menu_bar);

  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_item_pathname_with_finditem)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int namelen,  fl_Menu_Item finditem);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_item_pathname)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int namelen);
  FL_EXPORT_C( fl_Menu_Item, Fl_Sys_Menu_Bar_picked)(fl_Sys_Menu_Bar sys_menu_bar,  const fl_Menu_Item item);
  FL_EXPORT_C( fl_Menu_Item, Fl_Sys_Menu_Bar_find_item_with_name)(fl_Sys_Menu_Bar sys_menu_bar,  char* name);
  //  FL_EXPORT_C( fl_Menu_Item, Fl_Sys_Menu_Bar_find_item_with_cb)(fl_Sys_Menu_Bar sys_menu_bar, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_find_index_with_name)(fl_Sys_Menu_Bar sys_menu_bar,  char* name);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_find_index_with_item)(fl_Sys_Menu_Bar sys_menu_bar,  fl_Menu_Item item);
  //  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_find_index_with_cb)(fl_Sys_Menu_Bar sys_menu_bar, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C( fl_Menu_Item, Fl_Sys_Menu_Bar_test_shortcut)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_global)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C( fl_Menu_Item, Fl_Sys_Menu_Bar_menu)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_menu_with_m)(fl_Sys_Menu_Bar sys_menu_bar,  fl_Menu_Item* items, int size);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_copy)(fl_Sys_Menu_Bar sys_menu_bar,  fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_copy_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,  fl_Menu_Item m, void* user_data);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name, int shortcut, fl_Callback cb);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char*, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_flags)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_shortcutname)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name, char* shortcut);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_shortcutname_user_data)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_shortcutname_flags)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_insert_with_shortcutname_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int shortcut, fl_Callback);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_flags)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar, char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_shortcutname)(fl_Sys_Menu_Bar sys_menu_bar, char* name,   char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_shortcutname_user_data)(fl_Sys_Menu_Bar sys_menu_bar, char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_shortcutname_flags)(fl_Sys_Menu_Bar sys_menu_bar, char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_shortcutname_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar, char* name,  char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_add_with_name)(fl_Sys_Menu_Bar sys_menu_bar,  char* name);
  FL_EXPORT_C(int , Fl_Sys_Menu_Bar_size)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_size)(fl_Sys_Menu_Bar sys_menu_bar, int W, int H);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_clear)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_clear_submenu)(fl_Sys_Menu_Bar sys_menu_bar, int index);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_replace)(fl_Sys_Menu_Bar sys_menu_bar, int, char* name);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_remove)(fl_Sys_Menu_Bar sys_menu_bar, int);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_shortcut)(fl_Sys_Menu_Bar sys_menu_bar, int i, int s);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_mode)(fl_Sys_Menu_Bar sys_menu_bar, int i,int fl);
  FL_EXPORT_C(int , Fl_Sys_Menu_Bar_mode)(fl_Sys_Menu_Bar sys_menu_bar, int i);
  FL_EXPORT_C(fl_Menu_Item, Fl_Sys_Menu_Bar_mvalue)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_value)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_value_with_item)(fl_Sys_Menu_Bar sys_menu_bar,  fl_Menu_Item item);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_value_with_index)(fl_Sys_Menu_Bar sys_menu_bar, int index);
  FL_EXPORT_C(char*, Fl_Sys_Menu_Bar_text)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(char*, Fl_Sys_Menu_Bar_text_with_index)(fl_Sys_Menu_Bar sys_menu_bar, int i);
  FL_EXPORT_C(Fl_Font, Fl_Sys_Menu_Bar_textfont)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_textfont)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize, Fl_Sys_Menu_Bar_textsize)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_textsize)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Fontsize c);
  FL_EXPORT_C(Fl_Color, Fl_Sys_Menu_Bar_textcolor)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_textcolor)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Color c);
  FL_EXPORT_C(Fl_Boxtype, Fl_Sys_Menu_Bar_down_box)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_down_box)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Boxtype b);
  FL_EXPORT_C(Fl_Color, Fl_Sys_Menu_Bar_down_color)(fl_Sys_Menu_Bar sys_menu_bar);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_set_down_color)(fl_Sys_Menu_Bar sys_menu_bar, unsigned c);
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_OverriddenSys_Menu_Bar_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Sys_Menu_Bar,    Fl_OverriddenSys_Menu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_draw)(fl_Sys_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_draw_super)(fl_Sys_Menu_Bar o);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_handle)(fl_Sys_Menu_Bar o, int event);
  FL_EXPORT_C(int, Fl_Sys_Menu_Bar_handle_super)(fl_Sys_Menu_Bar o, int event);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_resize)(fl_Sys_Menu_Bar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_resize_super)(fl_Sys_Menu_Bar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_show)(fl_Sys_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_show_super)(fl_Sys_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_hide)(fl_Sys_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Sys_Menu_Bar_hide_super)(fl_Sys_Menu_Bar o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SYS_MENU_BAR_C__ */
