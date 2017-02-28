#ifndef __FL_TABS_C__
#define __FL_TABS_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tabs.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedTabs : public Fl_Tabs {
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
    Fl_DerivedTabs(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedTabs(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedTabs();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Tabs_handle)(fl_Tabs self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Tabs_parent)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_parent)(fl_Tabs tabs, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Tabs_type)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_type)(fl_Tabs tabs, uchar t);

  FL_EXPORT_C(int,          Fl_Tabs_x)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_y)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_w)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_h)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_align)(fl_Tabs tabs, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Tabs_align)(fl_Tabs tabs);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Tabs_box)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_box)(fl_Tabs tabs, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Tabs_color)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_color)(fl_Tabs tabs, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Tabs_set_color_with_bg_sel)(fl_Tabs tabs,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Tabs_selection_color)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_selection_color)(fl_Tabs tabs, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Tabs_label)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_copy_label)(fl_Tabs tabs, const char* new_label);
  FL_EXPORT_C(void,         Fl_Tabs_set_label)(fl_Tabs tabs, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Tabs_labeltype)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_labeltype)(fl_Tabs tabs, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Tabs_labelcolor)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_labelcolor)(fl_Tabs tabs, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Tabs_item_labelfont)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_item_labelfont)(fl_Tabs tabs, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Tabs_item_labelsize)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_item_labelsize)(fl_Tabs tabs, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Tabs_image)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_image)(fl_Tabs tabs, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Tabs_deimage)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_deimage)(fl_Tabs tabs, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Tabs_tooltip)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_copy_tooltip)(fl_Tabs tabs, const char* text);
  FL_EXPORT_C(void,         Fl_Tabs_set_tooltip)(fl_Tabs tabs, const char* text);
  FL_EXPORT_C(void,         Fl_Tabs_set_callback_with_user_data)(fl_Tabs tabs, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Tabs_set_callback)(fl_Tabs tabs, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Tabs_user_data)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_user_data)(fl_Tabs tabs, void* v);
  FL_EXPORT_C(long,         Fl_Tabs_argument)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_argument)(fl_Tabs tabs, long v);
  FL_EXPORT_C(Fl_When,      Fl_Tabs_when)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_when)(fl_Tabs tabs, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Tabs_visible)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_visible_r)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_visible)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_clear_visible)(fl_Tabs tabs);
  FL_EXPORT_C(unsigned int, Fl_Tabs_active)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_active_r)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_activate)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_deactivate)(fl_Tabs tabs);
  FL_EXPORT_C(unsigned int, Fl_Tabs_output)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_output)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_clear_output)(fl_Tabs tabs);
  FL_EXPORT_C(unsigned int, Fl_Tabs_takesevents)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_changed)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_clear_changed)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_take_focus)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_visible_focus)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_clear_visible_focus)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_modify_visible_focus)(fl_Tabs tabs, int v);
  FL_EXPORT_C(unsigned int, Fl_Tabs_visible_focus)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_do_callback)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_do_callback_with_widget_and_user_data)(fl_Tabs tabs, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Tabs_do_callback_with_widget_and_default_user_data)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Tabs_contains)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Tabs_inside)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tabs_redraw)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_redraw_label)(fl_Tabs tabs);
  FL_EXPORT_C(uchar,        Fl_Tabs_damage)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_clear_damage_with_bitmask)(fl_Tabs tabs, uchar c);
  FL_EXPORT_C(void,         Fl_Tabs_clear_damage)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_damage_with_text)(fl_Tabs tabs, uchar c);
  FL_EXPORT_C(void,         Fl_Tabs_damage_inside_widget)(fl_Tabs tabs, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Tabs_draw_label_with_xywh_alignment)(fl_Tabs tabs, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Tabs_measure_label)(fl_Tabs tabs, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Tabs_window)(fl_Tabs tabs);
  FL_EXPORT_C(fl_Window,    Fl_Tabs_top_window)(fl_Tabs tabs);
  FL_EXPORT_C(fl_Window ,   Fl_Tabs_top_window_offset)(fl_Tabs tabs, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Tabs_as_group)(fl_Tabs tabs);
  FL_EXPORT_C(fl_Gl_Window, Fl_Tabs_as_gl_window)(fl_Tabs tabs);

  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Tabs_begin)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_end)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_find)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tabs_clear)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_resizable_by_reference)(fl_Tabs tabs,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tabs_set_resizable)(fl_Tabs tabs,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Tabs_resizable)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_add_resizable)(fl_Tabs tabs,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tabs_init_sizes)(fl_Tabs tabs);
  FL_EXPORT_C(int,          Fl_Tabs_children)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_set_clip_children)(fl_Tabs tabs,int c);
  FL_EXPORT_C(unsigned int, Fl_Tabs_clip_children)(fl_Tabs tabs);
  FL_EXPORT_C(void,         Fl_Tabs_focus)(fl_Tabs tabs,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Tabs__ddfdesign_kludge)(fl_Tabs tabs);
  FL_EXPORT_C(fl_Widget*,   Fl_Tabs_array)(fl_Tabs self);
  FL_EXPORT_C(fl_Widget,    Fl_Tabs_child)(fl_Tabs self, int n);
  FL_EXPORT_C(void,         Fl_Tabs_forms_end)(fl_Tabs self);

  /* Fl_Tabs specific */
  FL_EXPORT_C(fl_Tabs, Fl_Tabs_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Tabs, Fl_Tabs_New_WithLabel)(int x, int y, int w, int h, const char* l);
  FL_EXPORT_C(int, Fl_Tabs_handle)(fl_Tabs tabs, int event);
  FL_EXPORT_C(fl_Widget, Fl_Tabs_value)(fl_Tabs tabs);
  FL_EXPORT_C(int, Fl_Tabs_set_value)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(fl_Widget, Fl_Tabs_push)(fl_Tabs tabs);
  FL_EXPORT_C(int, Fl_Tabs_set_push)(fl_Tabs tabs, fl_Widget w);
  FL_EXPORT_C(fl_Widget, Fl_Tabs_which)(fl_Tabs tabs, int event_x, int event_y);
  FL_EXPORT_C(void, Fl_Tabs_client_area)(fl_Tabs tabs, int* rx, int* ry, int* rw, int* rh);
  FL_EXPORT_C(void, Fl_Tabs_client_area_with_tabh)(fl_Tabs tabs, int* rx, int* ry, int* rw, int* rh, int tabh);
  FL_EXPORT_C(fl_Tabs,    Fl_OverriddenTabs_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Tabs,    Fl_OverriddenTabs_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Tabs_draw)(fl_Tabs o);
  FL_EXPORT_C(void, Fl_Tabs_draw_super)(fl_Tabs o);
  FL_EXPORT_C(int, Fl_Tabs_handle)(fl_Tabs o, int event);
  FL_EXPORT_C(int, Fl_Tabs_handle_super)(fl_Tabs o, int event);
  FL_EXPORT_C(void, Fl_Tabs_resize)(fl_Tabs o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tabs_resize_super)(fl_Tabs o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tabs_show)(fl_Tabs o);
  FL_EXPORT_C(void, Fl_Tabs_show_super)(fl_Tabs o);
  FL_EXPORT_C(void, Fl_Tabs_hide)(fl_Tabs o);
  FL_EXPORT_C(void, Fl_Tabs_hide_super)(fl_Tabs o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TABS_C__ */
