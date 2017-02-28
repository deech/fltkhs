#ifndef __FL_CHOICE_C__
#define __FL_CHOICE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Choice.H"
#include "Fl_CallbackC.h"
#include "Fl_Menu_C.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedChoice : public Fl_Choice {
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
    Fl_DerivedChoice(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedChoice(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedChoice();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,     Fl_Choice_parent)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_parent)(fl_Choice choice, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Choice_type)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_type)(fl_Choice choice, uchar t);

  FL_EXPORT_C(int,          Fl_Choice_x)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_y)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_w)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_h)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_align)(fl_Choice choice, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Choice_align)(fl_Choice choice);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Choice_box)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_box)(fl_Choice choice, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Choice_color)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_color)(fl_Choice choice, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Choice_set_color_with_bg_sel)(fl_Choice choice,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Choice_selection_color)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_selection_color)(fl_Choice choice, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Choice_label)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_copy_label)(fl_Choice choice, const char* new_label);
  FL_EXPORT_C(void,         Fl_Choice_set_label)(fl_Choice choice, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Choice_labeltype)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_labeltype)(fl_Choice choice, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Choice_labelcolor)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_labelcolor)(fl_Choice choice, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Choice_item_labelfont)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_item_labelfont)(fl_Choice choice, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Choice_item_labelsize)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_item_labelsize)(fl_Choice choice, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Choice_image)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_image)(fl_Choice choice, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Choice_deimage)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_deimage)(fl_Choice choice, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Choice_tooltip)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_copy_tooltip)(fl_Choice choice, const char* text);
  FL_EXPORT_C(void,         Fl_Choice_set_tooltip)(fl_Choice choice, const char* text);
  FL_EXPORT_C(void,         Fl_Choice_set_callback_with_user_data)(fl_Choice choice, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Choice_set_callback)(fl_Choice choice, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Choice_other_data)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_other_data)(fl_Choice choice, void* v);
  FL_EXPORT_C(void*,        Fl_Choice_user_data)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_user_data)(fl_Choice choice, void* v);
  FL_EXPORT_C(long,         Fl_Choice_argument)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_argument)(fl_Choice choice, long v);
  FL_EXPORT_C(Fl_When,      Fl_Choice_when)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_when)(fl_Choice choice, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Choice_visible)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_visible_r)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_visible)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_clear_visible)(fl_Choice choice);
  FL_EXPORT_C(unsigned int, Fl_Choice_active)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_active_r)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_activate)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_deactivate)(fl_Choice choice);
  FL_EXPORT_C(unsigned int, Fl_Choice_output)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_output)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_clear_output)(fl_Choice choice);
  FL_EXPORT_C(unsigned int, Fl_Choice_takesevents)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_changed)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_clear_changed)(fl_Choice choice);
  FL_EXPORT_C(int,          Fl_Choice_take_focus)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_set_visible_focus)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_clear_visible_focus)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_modify_visible_focus)(fl_Choice choice, int v);
  FL_EXPORT_C(unsigned int, Fl_Choice_visible_focus)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_do_callback)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_do_callback_with_widget_and_user_data)(fl_Choice choice, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Choice_do_callback_with_widget_and_default_user_data)(fl_Choice choice, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Choice_contains)(fl_Choice choice, fl_Group w);
  FL_EXPORT_C(int,          Fl_Choice_inside)(fl_Choice choice, fl_Group w);
  FL_EXPORT_C(void,         Fl_Choice_redraw)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_redraw_label)(fl_Choice choice);
  FL_EXPORT_C(uchar,        Fl_Choice_damage)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_clear_damage_with_bitmask)(fl_Choice choice, uchar c);
  FL_EXPORT_C(void,         Fl_Choice_clear_damage)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_damage_with_text)(fl_Choice choice, uchar c);
  FL_EXPORT_C(void,         Fl_Choice_damage_inside_group)(fl_Choice choice, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Choice_draw_label_with_xywh_alignment)(fl_Choice choice, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Choice_measure_label)(fl_Choice choice, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Choice_window)(fl_Choice choice);
  FL_EXPORT_C(fl_Window,    Fl_Choice_top_window)(fl_Choice choice);
  FL_EXPORT_C(fl_Window ,   Fl_Choice_top_window_offset)(fl_Choice choice, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Choice_as_group_super)(fl_Choice choice);
  FL_EXPORT_C(fl_Group,     Fl_Choice_as_group)(fl_Choice choice);
  FL_EXPORT_C(fl_Gl_Window, Fl_Choice_as_gl_window_super)(fl_Choice choice);
  FL_EXPORT_C(fl_Gl_Window, Fl_Choice_as_gl_window)(fl_Choice choice);
  FL_EXPORT_C(void,         Fl_Choice_resize_super)(fl_Choice choice,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Choice_resize)(fl_Choice choice,int X, int Y, int W, int H);

  /* Fl_Choice specific */
  FL_EXPORT_C(fl_Choice,    Fl_Choice_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Choice   , Fl_Choice_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Choice_Destroy)(fl_Choice choice);

  FL_EXPORT_C(int, Fl_Choice_item_pathname_with_finditem)(fl_Choice choice, char* name, int namelen,  fl_Menu_Item finditem);
  FL_EXPORT_C(int, Fl_Choice_item_pathname)(fl_Choice choice, char* name, int namelen);
  FL_EXPORT_C( fl_Menu_Item, Fl_Choice_picked)(fl_Choice choice,  const fl_Menu_Item item);
  FL_EXPORT_C( fl_Menu_Item, Fl_Choice_find_item_with_name)(fl_Choice choice,  char* name);
  //  FL_EXPORT_C( fl_Menu_Item, Fl_Choice_find_item_with_cb)(fl_Choice choice, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C(int, Fl_Choice_find_index_with_name)(fl_Choice choice,  char* name);
  FL_EXPORT_C(int, Fl_Choice_find_index_with_item)(fl_Choice choice,  fl_Menu_Item item);
  //  FL_EXPORT_C(int, Fl_Choice_find_index_with_cb)(fl_Choice choice, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C( fl_Menu_Item, Fl_Choice_test_shortcut)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_global)(fl_Choice choice);
  FL_EXPORT_C( fl_Menu_Item, Fl_Choice_menu)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_menu_with_m)(fl_Choice choice,  fl_Menu_Item* item, int size);
  FL_EXPORT_C(void, Fl_Choice_copy)(fl_Choice choice,  fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Choice_copy_with_user_data)(fl_Choice choice,  fl_Menu_Item m, void* user_data);
  FL_EXPORT_C(int, Fl_Choice_insert)(fl_Choice choice, int index,  char* name, int shortcut, fl_Callback cb);
  FL_EXPORT_C(int, Fl_Choice_insert_with_user_data)(fl_Choice choice, int index,  char*, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Choice_insert_with_flags)(fl_Choice choice, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Choice_insert_with_user_data_flags)(fl_Choice choice, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Choice_insert_with_shortcutname)(fl_Choice choice, int index,  char* name, char* shortcut);
  FL_EXPORT_C(int, Fl_Choice_insert_with_shortcutname_user_data)(fl_Choice choice, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Choice_insert_with_shortcutname_flags)(fl_Choice choice, int index,  char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Choice_insert_with_shortcutname_user_data_flags)(fl_Choice choice, int index,  char* name,   char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Choice_add)(fl_Choice choice, char* name, int shortcut, fl_Callback);
  FL_EXPORT_C(int, Fl_Choice_add_with_user_data)(fl_Choice choice, char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Choice_add_with_flags)(fl_Choice choice, char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Choice_add_with_user_data_flags)(fl_Choice choice, char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Choice_add_with_shortcutname)(fl_Choice choice, char* name,   char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Choice_add_with_shortcutname_user_data)(fl_Choice choice, char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Choice_add_with_shortcutname_flags)(fl_Choice choice, char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Choice_add_with_shortcutname_user_data_flags)(fl_Choice choice, char* name,  char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Choice_add_with_name)(fl_Choice choice,  char* name);
  FL_EXPORT_C(int , Fl_Choice_size)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_size)(fl_Choice choice, int W, int H);
  FL_EXPORT_C(void, Fl_Choice_clear)(fl_Choice choice);
  FL_EXPORT_C(int, Fl_Choice_clear_submenu)(fl_Choice choice, int index);
  FL_EXPORT_C(void, Fl_Choice_replace)(fl_Choice choice, int, char* name);
  FL_EXPORT_C(void, Fl_Choice_remove)(fl_Choice choice, int);
  FL_EXPORT_C(void, Fl_Choice_shortcut)(fl_Choice choice, int i, int s);
  FL_EXPORT_C(void, Fl_Choice_set_mode)(fl_Choice choice, int i,int fl);
  FL_EXPORT_C(int , Fl_Choice_mode)(fl_Choice choice, int i);
  FL_EXPORT_C(fl_Menu_Item, Fl_Choice_mvalue)(fl_Choice choice);
  FL_EXPORT_C(int, Fl_Choice_value)(fl_Choice choice);
  FL_EXPORT_C(int, Fl_Choice_set_value_with_item)(fl_Choice choice,  fl_Menu_Item item);
  FL_EXPORT_C(int, Fl_Choice_set_value_with_index)(fl_Choice choice, int index);
  FL_EXPORT_C(char*, Fl_Choice_text)(fl_Choice choice);
  FL_EXPORT_C(char*, Fl_Choice_text_with_index)(fl_Choice choice, int i);
  FL_EXPORT_C(Fl_Font, Fl_Choice_textfont)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_textfont)(fl_Choice choice, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize, Fl_Choice_textsize)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_textsize)(fl_Choice choice, Fl_Fontsize c);
  FL_EXPORT_C(Fl_Color, Fl_Choice_textcolor)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_textcolor)(fl_Choice choice, Fl_Color c);
  FL_EXPORT_C(Fl_Boxtype, Fl_Choice_down_box)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_down_box)(fl_Choice choice, Fl_Boxtype b);
  FL_EXPORT_C(Fl_Color, Fl_Choice_down_color)(fl_Choice choice);
  FL_EXPORT_C(void, Fl_Choice_set_down_color)(fl_Choice choice, unsigned c);
  FL_EXPORT_C(fl_Choice,    Fl_OverriddenChoice_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Choice,    Fl_OverriddenChoice_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Choice_draw)(fl_Choice o);
  FL_EXPORT_C(void, Fl_Choice_draw_super)(fl_Choice o);
  FL_EXPORT_C(int, Fl_Choice_handle)(fl_Choice o, int event);
  FL_EXPORT_C(int, Fl_Choice_handle_super)(fl_Choice o, int event);
  FL_EXPORT_C(void, Fl_Choice_resize)(fl_Choice o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Choice_resize_super)(fl_Choice o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Choice_show)(fl_Choice o);
  FL_EXPORT_C(void, Fl_Choice_show_super)(fl_Choice o);
  FL_EXPORT_C(void, Fl_Choice_hide)(fl_Choice o);
  FL_EXPORT_C(void, Fl_Choice_hide_super)(fl_Choice o);

#ifdef __cplusplus
}
#endif
#endif /* __FL_CHOICE_C__ */
