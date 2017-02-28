#ifndef __FL_MENU_BUTTON_C__
#define __FL_MENU_BUTTON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_Button.H"
#include "Fl_CallbackC.h"
#include "Fl_Menu_C.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedMenu_Button : public Fl_Menu_Button {
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
    Fl_DerivedMenu_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedMenu_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedMenu_Button();
  };
#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Menu_Button_Type {
    NORMAL = 0,
    POPUP1 = 1, /**< pops up with the mouse 1st button. */
    POPUP2,  /**< pops up with the mouse 2nd button. */
    POPUP12, /**< pops up with the mouse 1st or 2nd buttons. */
    POPUP3,   /**< pops up with the mouse 3rd button. */
    POPUP13,  /**< pops up with the mouse 1st or 3rd buttons. */
    POPUP23,  /**< pops up with the mouse 2nd or 3rd buttons. */
    POPUP123 /**< pops up with any mouse button. */
  } Menu_Button_Type;
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Menu_Button_handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Menu_Button_parent)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_parent)(fl_Menu_Button menu_button, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Menu_Button_type)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_type)(fl_Menu_Button menu_button, uchar t);

  FL_EXPORT_C(int,          Fl_Menu_Button_x)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_y)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_w)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_h)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_align)(fl_Menu_Button menu_button, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Menu_Button_align)(fl_Menu_Button menu_button);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Menu_Button_box)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_box)(fl_Menu_Button menu_button, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Button_color)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_color)(fl_Menu_Button menu_button, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_color_with_bg_sel)(fl_Menu_Button menu_button,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Button_selection_color)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_selection_color)(fl_Menu_Button menu_button, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Menu_Button_label)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_copy_label)(fl_Menu_Button menu_button, const char* new_label);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_label)(fl_Menu_Button menu_button, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Menu_Button_labeltype)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_labeltype)(fl_Menu_Button menu_button, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu_Button_labelcolor)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_labelcolor)(fl_Menu_Button menu_button, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Menu_Button_item_labelfont)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_item_labelfont)(fl_Menu_Button menu_button, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Menu_Button_item_labelsize)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_item_labelsize)(fl_Menu_Button menu_button, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu_Button_image)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_image)(fl_Menu_Button menu_button, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu_Button_deimage)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_deimage)(fl_Menu_Button menu_button, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Menu_Button_tooltip)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_copy_tooltip)(fl_Menu_Button menu_button, const char* text);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_tooltip)(fl_Menu_Button menu_button, const char* text);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_callback_with_user_data)(fl_Menu_Button menu_button, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_callback)(fl_Menu_Button menu_button, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Menu_Button_other_data)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_other_data)(fl_Menu_Button menu_button, void* v);
  FL_EXPORT_C(void*,        Fl_Menu_Button_user_data)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_user_data)(fl_Menu_Button menu_button, void* v);
  FL_EXPORT_C(long,         Fl_Menu_Button_argument)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_argument)(fl_Menu_Button menu_button, long v);
  FL_EXPORT_C(Fl_When,      Fl_Menu_Button_when)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_when)(fl_Menu_Button menu_button, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Menu_Button_visible)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_visible_r)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_show)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_hide)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_visible)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_visible)(fl_Menu_Button menu_button);
  FL_EXPORT_C(unsigned int, Fl_Menu_Button_active)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_active_r)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_activate)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_deactivate)(fl_Menu_Button menu_button);
  FL_EXPORT_C(unsigned int, Fl_Menu_Button_output)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_output)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_output)(fl_Menu_Button menu_button);
  FL_EXPORT_C(unsigned int, Fl_Menu_Button_takesevents)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_changed)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_changed)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_take_focus)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_set_visible_focus)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_visible_focus)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_modify_visible_focus)(fl_Menu_Button menu_button, int v);
  FL_EXPORT_C(unsigned int, Fl_Menu_Button_visible_focus)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int,          Fl_Menu_Button_contains)(fl_Menu_Button menu_button, fl_Group w);
  FL_EXPORT_C(int,          Fl_Menu_Button_inside)(fl_Menu_Button menu_button, fl_Group w);
  FL_EXPORT_C(void,         Fl_Menu_Button_redraw)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_redraw_label)(fl_Menu_Button menu_button);
  FL_EXPORT_C(uchar,        Fl_Menu_Button_damage)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_damage_with_bitmask)(fl_Menu_Button menu_button, uchar c);
  FL_EXPORT_C(void,         Fl_Menu_Button_clear_damage)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_damage_with_text)(fl_Menu_Button menu_button, uchar c);
  FL_EXPORT_C(void,         Fl_Menu_Button_damage_inside_group)(fl_Menu_Button menu_button, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Menu_Button_draw_label_with_xywh_alignment)(fl_Menu_Button menu_button, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Menu_Button_measure_label)(fl_Menu_Button menu_button, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Menu_Button_window)(fl_Menu_Button menu_button);
  FL_EXPORT_C(fl_Window,    Fl_Menu_Button_top_window)(fl_Menu_Button menu_button);
  FL_EXPORT_C(fl_Window ,   Fl_Menu_Button_top_window_offset)(fl_Menu_Button menu_button, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Menu_Button_as_group)(fl_Menu_Button menu_button);
  FL_EXPORT_C(fl_Gl_Window, Fl_Menu_Button_as_gl_window)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void,         Fl_Menu_Button_resize)(fl_Menu_Button menu_button,int X, int Y, int W, int H);

  /* Fl_Menu_Button specific */
  FL_EXPORT_C(fl_Menu_Button,    Fl_Menu_Button_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Menu_Button, Fl_Menu_Button_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Menu_Button_Destroy)(fl_Menu_Button menu_button);

  FL_EXPORT_C(int, Fl_Menu_Button_item_pathname_with_finditem)(fl_Menu_Button menu_button, char* name, int namelen,  fl_Menu_Item finditem);
  FL_EXPORT_C(int, Fl_Menu_Button_item_pathname)(fl_Menu_Button menu_button, char* name, int namelen);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Button_picked)(fl_Menu_Button menu_button,  const fl_Menu_Item item);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Button_find_item_with_name)(fl_Menu_Button menu_button,  char* name);
  //  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Button_find_item_with_cb)(fl_Menu_Button menu_button, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C(int, Fl_Menu_Button_find_index_with_name)(fl_Menu_Button menu_button,  char* name);
  FL_EXPORT_C(int, Fl_Menu_Button_find_index_with_item)(fl_Menu_Button menu_button,  fl_Menu_Item item);
  //  FL_EXPORT_C(int, Fl_Menu_Button_find_index_with_cb)(fl_Menu_Button menu_button, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Button_test_shortcut)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_global)(fl_Menu_Button menu_button);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu_Button_menu)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_menu_with_m)(fl_Menu_Button menu_button,  fl_Menu_Item* items, int size);
  FL_EXPORT_C(void, Fl_Menu_Button_copy)(fl_Menu_Button menu_button,  fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Menu_Button_copy_with_user_data)(fl_Menu_Button menu_button,  fl_Menu_Item m, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Button_insert)(fl_Menu_Button menu_button, int index,  char* name, int shortcut, fl_Callback cb);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_user_data)(fl_Menu_Button menu_button, int index,  char*, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_flags)(fl_Menu_Button menu_button, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_user_data_flags)(fl_Menu_Button menu_button, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_shortcutname)(fl_Menu_Button menu_button, int index,  char* name, char* shortcut);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_shortcutname_user_data)(fl_Menu_Button menu_button, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_shortcutname_flags)(fl_Menu_Button menu_button, int index,  char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_insert_with_shortcutname_user_data_flags)(fl_Menu_Button menu_button, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_add)(fl_Menu_Button menu_button, char* name, int shortcut, fl_Callback);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_user_data)(fl_Menu_Button menu_button, char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_flags)(fl_Menu_Button menu_button, char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_user_data_flags)(fl_Menu_Button menu_button, char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_shortcutname)(fl_Menu_Button menu_button, char* name,   char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_shortcutname_user_data)(fl_Menu_Button menu_button, char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_shortcutname_flags)(fl_Menu_Button menu_button, char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_shortcutname_user_data_flags)(fl_Menu_Button menu_button, char* name,  char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu_Button_add_with_name)(fl_Menu_Button menu_button,  char* name);
  FL_EXPORT_C(int , Fl_Menu_Button_size)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_size)(fl_Menu_Button menu_button, int W, int H);
  FL_EXPORT_C(void, Fl_Menu_Button_clear)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int, Fl_Menu_Button_clear_submenu)(fl_Menu_Button menu_button, int index);
  FL_EXPORT_C(void, Fl_Menu_Button_replace)(fl_Menu_Button menu_button, int, char* name);
  FL_EXPORT_C(void, Fl_Menu_Button_remove)(fl_Menu_Button menu_button, int);
  FL_EXPORT_C(void, Fl_Menu_Button_shortcut)(fl_Menu_Button menu_button, int i, int s);
  FL_EXPORT_C(void, Fl_Menu_Button_set_mode)(fl_Menu_Button menu_button, int i,int fl);
  FL_EXPORT_C(int , Fl_Menu_Button_mode)(fl_Menu_Button menu_button, int i);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Button_mvalue)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int, Fl_Menu_Button_value)(fl_Menu_Button menu_button);
  FL_EXPORT_C(int, Fl_Menu_Button_value_with_item)(fl_Menu_Button menu_button,  fl_Menu_Item item);
  FL_EXPORT_C(int, Fl_Menu_Button_value_with_index)(fl_Menu_Button menu_button, int index);
  FL_EXPORT_C(char*, Fl_Menu_Button_text)(fl_Menu_Button menu_button);
  FL_EXPORT_C(char*, Fl_Menu_Button_text_with_index)(fl_Menu_Button menu_button, int i);
  FL_EXPORT_C(Fl_Font, Fl_Menu_Button_textfont)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_textfont)(fl_Menu_Button menu_button, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize, Fl_Menu_Button_textsize)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_textsize)(fl_Menu_Button menu_button, Fl_Fontsize c);
  FL_EXPORT_C(Fl_Color, Fl_Menu_Button_textcolor)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_textcolor)(fl_Menu_Button menu_button, Fl_Color c);
  FL_EXPORT_C(Fl_Boxtype, Fl_Menu_Button_down_box)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_down_box)(fl_Menu_Button menu_button, Fl_Boxtype b);
  FL_EXPORT_C(Fl_Color, Fl_Menu_Button_down_color)(fl_Menu_Button menu_button);
  FL_EXPORT_C(void, Fl_Menu_Button_set_down_color)(fl_Menu_Button menu_button, unsigned c);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu_Button_popup)(fl_Menu_Button menu_button);
  FL_EXPORT_C(fl_Menu_Button,    Fl_OverriddenMenu_Button_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Menu_Button,    Fl_OverriddenMenu_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Menu_Button_draw)(fl_Menu_Button o);
  FL_EXPORT_C(void, Fl_Menu_Button_draw_super)(fl_Menu_Button o);
  FL_EXPORT_C(int, Fl_Menu_Button_handle)(fl_Menu_Button o, int event);
  FL_EXPORT_C(int, Fl_Menu_Button_handle_super)(fl_Menu_Button o, int event);
  FL_EXPORT_C(void, Fl_Menu_Button_resize)(fl_Menu_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Menu_Button_resize_super)(fl_Menu_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Menu_Button_show)(fl_Menu_Button o);
  FL_EXPORT_C(void, Fl_Menu_Button_show_super)(fl_Menu_Button o);
  FL_EXPORT_C(void, Fl_Menu_Button_hide)(fl_Menu_Button o);
  FL_EXPORT_C(void, Fl_Menu_Button_hide_super)(fl_Menu_Button o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU_BUTTON_C__ */
