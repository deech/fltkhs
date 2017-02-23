#ifndef __FL_MENU__C__
#define __FL_MENU__C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedMenu_ : public Fl_Menu_ {
    fl_Menu__Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    void draw_box();
    void draw_box(Fl_Boxtype t, Fl_Color c);
    void draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
    void draw_backdrop();
    void draw_focus();
    void draw_focus(Fl_Boxtype t, int x,int y,int w,int h);
    void draw_label();
    void draw_label(int x,int y,int w,int h,Fl_Align alignment);
    virtual void draw();
    virtual int handle(int event);
    void resize_super(int x, int y, int w, int h);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    virtual Fl_Group* as_group();
    virtual Fl_Group* as_group_super();
    const Fl_Menu_Item* get_menu_item_by_index(int i);
    Fl_DerivedMenu_(int X, int Y, int W, int H, const char *l, fl_Menu__Virtual_Funcs* funcs);
    Fl_DerivedMenu_(int X, int Y, int W, int H, fl_Menu__Virtual_Funcs* funcs);
    ~Fl_DerivedMenu_();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Menu__handle_super)(fl_Group self, int event);
  FL_EXPORT_C(int,          Fl_Menu__handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Menu__parent)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_parent)(fl_Menu_ menu_, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Menu__type)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_type)(fl_Menu_ menu_, uchar t);

  FL_EXPORT_C(void, Fl_Menu__draw_box)(fl_Menu_ Menu_);
  FL_EXPORT_C(void, Fl_Menu__draw_box_with_tc)(fl_Menu_ Menu_,Fl_Boxtype t, Fl_Color c);
  FL_EXPORT_C(void, Fl_Menu__draw_box_with_txywhc)(fl_Menu_ Menu_,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
  FL_EXPORT_C(void, Fl_Menu__draw_backdrop)(fl_Menu_ Menu_);
  FL_EXPORT_C(void, Fl_Menu__draw_focus)(fl_Menu_ Menu_);
  FL_EXPORT_C(void, Fl_Menu__draw_focus_with_txywh)(fl_Menu_ Menu_,Fl_Boxtype t, int x,int y,int w,int h);
  FL_EXPORT_C(void, Fl_Menu__draw_label)(fl_Menu_ Menu_);
  FL_EXPORT_C(int,          Fl_Menu__x)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__y)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__w)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__h)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_align)(fl_Menu_ menu_, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Menu__align)(fl_Menu_ menu_);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Menu__box)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_box)(fl_Menu_ menu_, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Menu__color)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_color)(fl_Menu_ menu_, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Menu__set_color_with_bg_sel)(fl_Menu_ menu_,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu__selection_color)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_selection_color)(fl_Menu_ menu_, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Menu__label)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__copy_label)(fl_Menu_ menu_, const char* new_label);
  FL_EXPORT_C(void,         Fl_Menu__set_label)(fl_Menu_ menu_, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Menu__labeltype)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_labeltype)(fl_Menu_ menu_, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Menu__labelcolor)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_labelcolor)(fl_Menu_ menu_, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Menu__item_labelfont)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_item_labelfont)(fl_Menu_ menu_, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Menu__item_labelsize)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_item_labelsize)(fl_Menu_ menu_, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu__image)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_image)(fl_Menu_ menu_, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Menu__deimage)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_deimage)(fl_Menu_ menu_, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Menu__tooltip)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__copy_tooltip)(fl_Menu_ menu_, const char* text);
  FL_EXPORT_C(void,         Fl_Menu__set_tooltip)(fl_Menu_ menu_, const char* text);
  FL_EXPORT_C(void,         Fl_Menu__set_callback_with_user_data)(fl_Menu_ menu_, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Menu__set_callback)(fl_Menu_ menu_, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Menu__other_data)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_other_data)(fl_Menu_ menu_, void* v);
  FL_EXPORT_C(void*,        Fl_Menu__user_data)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_user_data)(fl_Menu_ menu_, void* v);
  FL_EXPORT_C(long,         Fl_Menu__argument)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_argument)(fl_Menu_ menu_, long v);
  FL_EXPORT_C(Fl_When,      Fl_Menu__when)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_when)(fl_Menu_ menu_, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Menu__visible)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__visible_r)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__show_super)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__show)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__hide_super)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__hide)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Window,    Fl_Menu__as_window_super)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Window,    Fl_Menu__as_window )(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_visible)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__clear_visible)(fl_Menu_ menu_);
  FL_EXPORT_C(unsigned int, Fl_Menu__active)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__active_r)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__activate)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__deactivate)(fl_Menu_ menu_);
  FL_EXPORT_C(unsigned int, Fl_Menu__output)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_output)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__clear_output)(fl_Menu_ menu_);
  FL_EXPORT_C(unsigned int, Fl_Menu__takesevents)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_changed)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__clear_changed)(fl_Menu_ menu_);
  FL_EXPORT_C(int,          Fl_Menu__take_focus)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__set_visible_focus)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__clear_visible_focus)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__modify_visible_focus)(fl_Menu_ menu_, int v);
  FL_EXPORT_C(unsigned int, Fl_Menu__visible_focus)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu_do_callback)(fl_Menu menu);
  FL_EXPORT_C(void,         Fl_Menu_do_callback_with_widget_and_user_data)(fl_Menu menu, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Menu_do_callback_with_widget_and_default_user_data)(fl_Menu menu, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Menu__contains)(fl_Menu_ menu_, fl_Group w);
  FL_EXPORT_C(int,          Fl_Menu__inside)(fl_Menu_ menu_, fl_Group w);
  FL_EXPORT_C(void,         Fl_Menu__redraw)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__redraw_label)(fl_Menu_ menu_);
  FL_EXPORT_C(uchar,        Fl_Menu__damage)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__clear_damage_with_bitmask)(fl_Menu_ menu_, uchar c);
  FL_EXPORT_C(void,         Fl_Menu__clear_damage)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__damage_with_text)(fl_Menu_ menu_, uchar c);
  FL_EXPORT_C(void,         Fl_Menu__damage_inside_group)(fl_Menu_ menu_, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Menu__draw_label_with_xywh_alignment)(fl_Menu_ menu_, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Menu__measure_label)(fl_Menu_ menu_, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Menu__window)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Window,    Fl_Menu__top_window)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Window ,   Fl_Menu__top_window_offset)(fl_Menu_ menu_, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Menu__as_group_super)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Group,     Fl_Menu__as_group)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Gl_Window, Fl_Menu__as_gl_window_super)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Gl_Window, Fl_Menu__as_gl_window)(fl_Menu_ menu_);
  FL_EXPORT_C(void,         Fl_Menu__resize_super)(fl_Menu_ menu_,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Menu__resize)(fl_Menu_ menu_,int X, int Y, int W, int H);

  /* Fl_Menu_ specific */
  FL_EXPORT_C(void*, Fl_Menu__other_data)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_other_data)(fl_Menu_ menu_, void* v);
  FL_EXPORT_C(fl_Menu_,    Fl_Menu__New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Menu_, Fl_OverriddenMenu__New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Menu__Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Menu_   , Fl_Menu__New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Menu_   , Fl_OverriddenMenu__New)(int x, int y, int w, int h, fl_Menu__Virtual_Funcs* funcs);
  FL_EXPORT_C(void   , Fl_Menu__Destroy)(fl_Menu_ menu_);
  FL_EXPORT_C(int, Fl_Menu__item_pathname_with_finditem)(fl_Menu_ menu_, char* name, int namelen,  fl_Menu_Item finditem);
  FL_EXPORT_C(int, Fl_Menu__item_pathname)(fl_Menu_ menu_, char* name, int namelen);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu__picked)(fl_Menu_ menu_,  const fl_Menu_Item item);
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu__find_item_with_name)(fl_Menu_ menu_,  char* name);
  //  FL_EXPORT_C( fl_Menu_Item, Fl_Menu__find_item_with_cb)(fl_Menu_ menu_, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C(int, Fl_Menu__find_index_with_name)(fl_Menu_ menu_,  char* name);
  FL_EXPORT_C(int, Fl_Menu__find_index_with_item)(fl_Menu_ menu_,  fl_Menu_Item item);
  //  FL_EXPORT_C(int, Fl_Menu__find_index_with_cb)(fl_Menu_ menu_, fl_Callback cb); Don't know how to do this
  FL_EXPORT_C( fl_Menu_Item, Fl_Menu__test_shortcut)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__global)(fl_Menu_ menu_);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu__menu)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__menu_with_m)(fl_Menu_ menu_,  fl_Menu_Item* item, int size);
  FL_EXPORT_C(void, Fl_Menu__copy)(fl_Menu_ menu_,  fl_Menu_Item m);
  FL_EXPORT_C(void, Fl_Menu__copy_with_user_data)(fl_Menu_ menu_,  fl_Menu_Item m, void* user_data);
  FL_EXPORT_C(int, Fl_Menu__insert)(fl_Menu_ menu_, int index,  char* name, int shortcut, fl_Callback cb);
  FL_EXPORT_C(int, Fl_Menu__insert_with_user_data)(fl_Menu_ menu_, int index,  char*, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu__insert_with_flags)(fl_Menu_ menu_, int index,  char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu__insert_with_user_data_flags)(fl_Menu_ menu_, int index,  char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu__insert_with_shortcutname)(fl_Menu_ menu_, int index,  char* name, char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu__insert_with_shortcutname_flags)(fl_Menu_ menu_, int index,  char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu__add)(fl_Menu_ menu_, char* name, int shortcut, fl_Callback);
  FL_EXPORT_C(int, Fl_Menu__add_with_user_data)(fl_Menu_ menu_, char* name, int shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu__add_with_flags)(fl_Menu_ menu_, char* name, int shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu__add_with_user_data_flags)(fl_Menu_ menu_, char* name, int shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu__add_with_shortcutname)(fl_Menu_ menu_, char* name,   char* shortcut, fl_Callback* cb);
  FL_EXPORT_C(int, Fl_Menu__add_with_shortcutname_user_data)(fl_Menu_ menu_, char* name,   char* shortcut, fl_Callback* cb, void* user_data);
  FL_EXPORT_C(int, Fl_Menu__add_with_shortcutname_flags)(fl_Menu_ menu_, char* name,   char* shortcut, fl_Callback* cb, int flags);
  FL_EXPORT_C(int, Fl_Menu__add_with_shortcutname_user_data_flags)(fl_Menu_ menu_, char* name,  char* shortcut, fl_Callback* cb, void* user_data, int flags);
  FL_EXPORT_C(int, Fl_Menu__add_with_name)(fl_Menu_ menu_,  char* name);
  FL_EXPORT_C(int , Fl_Menu__size)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_size)(fl_Menu_ menu_, int W, int H);
  FL_EXPORT_C(void, Fl_Menu__clear)(fl_Menu_ menu_);
  FL_EXPORT_C(int, Fl_Menu__clear_submenu)(fl_Menu_ menu_, int index);
  FL_EXPORT_C(void, Fl_Menu__replace)(fl_Menu_ menu_, int, char* name);
  FL_EXPORT_C(void, Fl_Menu__remove)(fl_Menu_ menu_, int);
  FL_EXPORT_C(void, Fl_Menu__shortcut)(fl_Menu_ menu_, int i, int s);
  FL_EXPORT_C(void, Fl_Menu__set_mode)(fl_Menu_ menu_, int i,int fl);
  FL_EXPORT_C(int , Fl_Menu__mode)(fl_Menu_ menu_, int i);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu__mvalue)(fl_Menu_ menu_);
  FL_EXPORT_C(int, Fl_Menu__value)(fl_Menu_ menu_);
  FL_EXPORT_C(int, Fl_Menu__value_with_item)(fl_Menu_ menu_,  fl_Menu_Item item);
  FL_EXPORT_C(fl_Menu_Item, Fl_Menu__get_menu_item_by_index)(fl_Menu_ menu_,  int i);
  FL_EXPORT_C(int, Fl_Menu__value_with_index)(fl_Menu_ menu_, int index);
  FL_EXPORT_C(char*, Fl_Menu__text)(fl_Menu_ menu_);
  FL_EXPORT_C(char*, Fl_Menu__text_with_index)(fl_Menu_ menu_, int i);
  FL_EXPORT_C(Fl_Font, Fl_Menu__textfont)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_textfont)(fl_Menu_ menu_, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize, Fl_Menu__textsize)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_textsize)(fl_Menu_ menu_, Fl_Fontsize c);
  FL_EXPORT_C(Fl_Color, Fl_Menu__textcolor)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_textcolor)(fl_Menu_ menu_, Fl_Color c);
  FL_EXPORT_C(Fl_Boxtype, Fl_Menu__down_box)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_down_box)(fl_Menu_ menu_, Fl_Boxtype b);
  FL_EXPORT_C(Fl_Color, Fl_Menu__down_color)(fl_Menu_ menu_);
  FL_EXPORT_C(void, Fl_Menu__set_down_color)(fl_Menu_ menu_, unsigned c);
#if FL_API_VERSION == 10304
  FL_EXPORT_C(void, Fl_Menu__set_only)(fl_Menu_ menu_, fl_Menu_Item m);
#endif
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU__C__ */
