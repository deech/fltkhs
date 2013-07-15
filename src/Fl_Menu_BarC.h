#ifndef __FL_MENU_BAR_C__
#define __FL_MENU_BAR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_Bar.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedMenu_Bar : public Fl_Menu_Bar {
    fl_Menu_Bar_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    virtual void draw();
    virtual int handle(int event);
    void resize_super(int x, int y, int w, int h);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_DerivedMenu_Bar(int X, int Y, int W, int H, const char *l, fl_Menu_Bar_Virtual_Funcs* funcs);
    Fl_DerivedMenu_Bar(int X, int Y, int W, int H, fl_Menu_Bar_Virtual_Funcs* funcs);
    ~Fl_DerivedMenu_Bar();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Menu_Bar_handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Menu_Bar_parent)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_parent)(fl_Menu_Bar menu_bar, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Menu_Bar_type)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_type)(fl_Menu_Bar menu_bar, uchar t);
  FL_EXPORT_C(int,          Fl_Menu_Bar_x)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_y)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_w)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_h)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_align)(fl_Menu_Bar menu_bar, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Menu_Bar_align)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Menu_Bar_box)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_box)(fl_Menu_Bar menu_bar, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Bar_color)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_color)(fl_Menu_Bar menu_bar, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_background_and_selection_color)(fl_Menu_Bar menu_bar,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Bar_selection_color)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_selection_color)(fl_Menu_Bar menu_bar, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Menu_Bar_label)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_copy_label)(fl_Menu_Bar menu_bar, const char* new_label);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_label)(fl_Menu_Bar menu_bar, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Menu_Bar_labeltype)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_labeltype)(fl_Menu_Bar menu_bar, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Bar_labelcolor)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_labelcolor)(fl_Menu_Bar menu_bar, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Menu_Bar_item_labelfont)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_item_labelfont)(fl_Menu_Bar menu_bar, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Menu_Bar_item_labelsize)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_item_labelsize)(fl_Menu_Bar menu_bar, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu_Bar_image)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_image)(fl_Menu_Bar menu_bar, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu_Bar_deimage)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_deimage)(fl_Menu_Bar menu_bar, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Menu_Bar_tooltip)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_copy_tooltip)(fl_Menu_Bar menu_bar, const char* text);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_tooltip)(fl_Menu_Bar menu_bar, const char* text);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_callback_and_user_data)(fl_Menu_Bar menu_bar, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_callback)(fl_Menu_Bar menu_bar, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Menu_Bar_other_data)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_other_data)(fl_Menu_Bar menu_bar, void* v);
  FL_EXPORT_C(void*,        Fl_Menu_Bar_user_data)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_user_data)(fl_Menu_Bar menu_bar, void* v);
  FL_EXPORT_C(long,         Fl_Menu_Bar_argument)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_argument)(fl_Menu_Bar menu_bar, long v);
  FL_EXPORT_C(Fl_When,      Fl_Menu_Bar_when)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_when)(fl_Menu_Bar menu_bar, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Menu_Bar_visible)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_visible_r)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_show_super)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_show)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_hide_super)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_hide)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_visible)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_visible)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Menu_Bar_active)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_active_r)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_activate)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_deactivate)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Menu_Bar_output)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_output)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_output)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(unsigned int, Fl_Menu_Bar_takesevents)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_changed)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_changed)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_take_focus)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_set_visible_focus)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_visible_focus)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_modify_visible_focus)(fl_Menu_Bar menu_bar, int v);
  FL_EXPORT_C(unsigned int, Fl_Menu_Bar_visible_focus)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int,          Fl_Menu_Bar_contains)(fl_Menu_Bar menu_bar, fl_Group w);
  FL_EXPORT_C(int,          Fl_Menu_Bar_inside)(fl_Menu_Bar menu_bar, fl_Group w);
  FL_EXPORT_C(void,         Fl_Menu_Bar_redraw)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_redraw_label)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(uchar,        Fl_Menu_Bar_damage)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_damage_with_bitmask)(fl_Menu_Bar menu_bar, uchar c);
  FL_EXPORT_C(void,         Fl_Menu_Bar_clear_damage)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_damage_with_text)(fl_Menu_Bar menu_bar, uchar c);
  FL_EXPORT_C(void,         Fl_Menu_Bar_damage_inside_group)(fl_Menu_Bar menu_bar, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Menu_Bar_draw_label)(fl_Menu_Bar menu_bar, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Menu_Bar_measure_label)(fl_Menu_Bar menu_bar, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Menu_Bar_window)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Window,    Fl_Menu_Bar_top_window)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Window ,   Fl_Menu_Bar_top_window_offset)(fl_Menu_Bar menu_bar, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Menu_Bar_as_group_super)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Group,     Fl_Menu_Bar_as_group)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Gl_Window, Fl_Menu_Bar_as_gl_window_super)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Gl_Window, Fl_Menu_Bar_as_gl_window)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void,         Fl_Menu_Bar_resize_super)(fl_Menu_Bar menu_bar,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Menu_Bar_resize)(fl_Menu_Bar menu_bar,int X, int Y, int W, int H);

  /* Fl_Menu_Bar specific */ 
  FL_EXPORT_C(fl_Menu_Bar,    Fl_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Menu_Bar   , Fl_Menu_Bar_New)(int x, int y, int w, int h);

  FL_EXPORT_C(int, Fl_Menu_Bar_item_pathname_with_finditem)(fl_Menu_Bar menu_bar, char* name, int namelen,  fl_Menu_Item finditem);
  FL_EXPORT_C(int, Fl_Menu_Bar_item_pathname)(fl_Menu_Bar menu_bar, char* name, int namelen);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Bar_picked)(fl_Menu_Bar menu_bar,  const fl_Menu_Item item);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Bar_find_item_with_name)(fl_Menu_Bar menu_bar,  char* name);
  //  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Bar_find_item_with_cb)(fl_Menu_Bar menu_bar, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C(int, Fl_Menu_Bar_find_index_with_name)(fl_Menu_Bar menu_bar,  char* name);
  FL_EXPORT_C(int, Fl_Menu_Bar_find_index_with_item)(fl_Menu_Bar menu_bar,  fl_Menu_Item item);
  //  FL_EXPORT_C(int, Fl_Menu_Bar_find_index_with_cb)(fl_Menu_Bar menu_bar, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Bar_test_shortcut)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_global)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Bar_menu)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_menu_with_m)(fl_Menu_Bar menu_bar,  fl_Menu_Item item);
  FL_EXPORT_C(void, Fl_Menu_Bar_copy)(fl_Menu_Bar menu_bar,  fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Menu_Bar_copy_with_user_data)(fl_Menu_Bar menu_bar,  fl_Menu_Item m, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert)(fl_Menu_Bar menu_bar, int index,  char* name, int shortcut, fl_Callback cb);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_user_data)(fl_Menu_Bar menu_bar, int index,  char*, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_flags)(fl_Menu_Bar menu_bar, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_user_data_flags)(fl_Menu_Bar menu_bar, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_shortcutname)(fl_Menu_Bar menu_bar, int index,  char* name, char* shortcut);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_shortcutname_user_data)(fl_Menu_Bar menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_shortcutname_flags)(fl_Menu_Bar menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_insert_with_shortcutname_user_data_flags)(fl_Menu_Bar menu_bar, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_add)(fl_Menu_Bar menu_bar, char* name, int shortcut, fl_Callback);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_user_data)(fl_Menu_Bar menu_bar, char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_flags)(fl_Menu_Bar menu_bar, char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_user_data_flags)(fl_Menu_Bar menu_bar, char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_shortcutname)(fl_Menu_Bar menu_bar, char* name,   char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_shortcutname_user_data)(fl_Menu_Bar menu_bar, char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_shortcutname_flags)(fl_Menu_Bar menu_bar, char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_shortcutname_user_data_flags)(fl_Menu_Bar menu_bar, char* name,  char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Bar_add_with_name)(fl_Menu_Bar menu_bar,  char* name);
  FL_EXPORT_C(int , Fl_Menu_Bar_size)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_size)(fl_Menu_Bar menu_bar, int W, int H); 
  FL_EXPORT_C(void, Fl_Menu_Bar_clear)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int, Fl_Menu_Bar_clear_submenu)(fl_Menu_Bar menu_bar, int index);
  FL_EXPORT_C(void, Fl_Menu_Bar_replace)(fl_Menu_Bar menu_bar, int, char* name);
  FL_EXPORT_C(void, Fl_Menu_Bar_remove)(fl_Menu_Bar menu_bar, int);
  FL_EXPORT_C(void, Fl_Menu_Bar_shortcut)(fl_Menu_Bar menu_bar, int i, int s); 
  FL_EXPORT_C(void, Fl_Menu_Bar_set_mode)(fl_Menu_Bar menu_bar, int i,int fl); 
  FL_EXPORT_C(int , Fl_Menu_Bar_mode)(fl_Menu_Bar menu_bar, int i);  
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Bar_mvalue)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int, Fl_Menu_Bar_value)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(int, Fl_Menu_Bar_value_with_item)(fl_Menu_Bar menu_bar,  fl_Menu_Item item);
  FL_EXPORT_C(int, Fl_Menu_Bar_value_with_index)(fl_Menu_Bar menu_bar, int index); 
  FL_EXPORT_C(char*, Fl_Menu_Bar_text)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(char*, Fl_Menu_Bar_text_with_index)(fl_Menu_Bar menu_bar, int i);
  FL_EXPORT_C(Fl_Font, Fl_Menu_Bar_textfont)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_textfont)(fl_Menu_Bar menu_bar, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize, Fl_Menu_Bar_textsize)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_textsize)(fl_Menu_Bar menu_bar, Fl_Fontsize c);
  FL_EXPORT_C(Fl_Color, Fl_Menu_Bar_textcolor)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_textcolor)(fl_Menu_Bar menu_bar, Fl_Color c);
  FL_EXPORT_C(Fl_Boxtype, Fl_Menu_Bar_down_box)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_down_box)(fl_Menu_Bar menu_bar, Fl_Boxtype b);
  FL_EXPORT_C(Fl_Color, Fl_Menu_Bar_down_color)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(void, Fl_Menu_Bar_set_down_color)(fl_Menu_Bar menu_bar, unsigned c);
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU_BAR_C__ */
