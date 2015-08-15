#ifndef __FL_WIDGET_C__
#define __FL_WIDGET_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedWidget : public Fl_Widget {
    fl_Widget_Virtual_Funcs* overriddenFuncs;
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
    virtual Fl_Group* as_group();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_DerivedWidget(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedWidget(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedWidget();
  };
#endif
  FL_EXPORT_C(int,Fl_Widget_handle)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Widget_parent)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_parent)(fl_Widget widget, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Widget_type)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_type)(fl_Widget widget, uchar t);
  FL_EXPORT_C(void, Fl_Widget_draw_box)(fl_Widget Widget);
  FL_EXPORT_C(void, Fl_Widget_draw_box_with_tc)(fl_Widget Widget,Fl_Boxtype t, Fl_Color c);
  FL_EXPORT_C(void, Fl_Widget_draw_box_with_txywhc)(fl_Widget Widget,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
  FL_EXPORT_C(void, Fl_Widget_draw_backdrop)(fl_Widget Widget);
  FL_EXPORT_C(void, Fl_Widget_draw_focus)(fl_Widget Widget);
  FL_EXPORT_C(void, Fl_Widget_draw_focus_with_txywh)(fl_Widget Widget,Fl_Boxtype t, int x,int y,int w,int h);
  FL_EXPORT_C(void, Fl_Widget_draw_label)(fl_Widget Widget);
  FL_EXPORT_C(int,          Fl_Widget_x)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_y)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_w)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_h)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_align)(fl_Widget widget, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Widget_align)(fl_Widget widget);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Widget_box)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_box)(fl_Widget widget, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Widget_color)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_color)(fl_Widget widget, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Widget_set_color_with_bg_sel)(fl_Widget widget,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Widget_selection_color)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_selection_color)(fl_Widget widget, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Widget_label)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_copy_label)(fl_Widget widget, const char* new_label);
  FL_EXPORT_C(void,         Fl_Widget_set_label)(fl_Widget widget, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Widget_labeltype)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_labeltype)(fl_Widget widget, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Widget_labelcolor)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_labelcolor)(fl_Widget widget, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Widget_labelfont)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_labelfont)(fl_Widget widget, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Widget_labelsize)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_labelsize)(fl_Widget widget, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Widget_image)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_image)(fl_Widget widget, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Widget_deimage)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_deimage)(fl_Widget widget, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Widget_tooltip)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_copy_tooltip)(fl_Widget widget, const char* text);
  FL_EXPORT_C(void,         Fl_Widget_set_tooltip)(fl_Widget widget, const char* text);
  FL_EXPORT_C(void,         Fl_Widget_do_callback)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_callback_with_user_data)(fl_Widget widget, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Widget_set_callback)(fl_Widget widget, fl_Callback* cb);
  FL_EXPORT_C(int,          Fl_Widget_has_callback)(fl_Widget widget);
  FL_EXPORT_C(void*,        Fl_Widget_other_data)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_other_data)(fl_Widget widget, void* v);
  FL_EXPORT_C(void*,        Fl_Widget_user_data)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_user_data)(fl_Widget widget, void* v);
  FL_EXPORT_C(long,         Fl_Widget_argument)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_argument)(fl_Widget widget, long v);
  FL_EXPORT_C(Fl_When,      Fl_Widget_when)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_when)(fl_Widget widget, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Widget_visible)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_visible_r)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_show_super)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_show)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_hide_super)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_hide)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_visible)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_visible)(fl_Widget widget);
  FL_EXPORT_C(unsigned int, Fl_Widget_active)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_active_r)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_activate)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_deactivate)(fl_Widget widget);
  FL_EXPORT_C(unsigned int, Fl_Widget_output)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_output)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_output)(fl_Widget widget);
  FL_EXPORT_C(unsigned int, Fl_Widget_takesevents)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_changed)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_changed)(fl_Widget widget);
  FL_EXPORT_C(unsigned int, Fl_Widget_changed)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_active)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_active)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_take_focus)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_set_visible_focus)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_visible_focus)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_modify_visible_focus)(fl_Widget widget, int v);
  FL_EXPORT_C(unsigned int, Fl_Widget_visible_focus)(fl_Widget widget);
  FL_EXPORT_C(int,          Fl_Widget_contains)(fl_Widget widget, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Widget_inside)(fl_Widget widget, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Widget_redraw)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_redraw_label)(fl_Widget widget);
  FL_EXPORT_C(uchar,        Fl_Widget_damage)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_clear_damage_with_bitmask)(fl_Widget widget, uchar c);
  FL_EXPORT_C(void,         Fl_Widget_clear_damage)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_damage_with_text)(fl_Widget widget, uchar c);
  FL_EXPORT_C(void,         Fl_Widget_damage_inside_widget)(fl_Widget widget, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Widget_draw_label_with_xywh_alignment)(fl_Widget widget, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Widget_measure_label)(fl_Widget widget, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Widget_window)(fl_Widget widget);
  FL_EXPORT_C(fl_Window,    Fl_Widget_top_window)(fl_Widget widget);
  FL_EXPORT_C(fl_Window ,   Fl_Widget_top_window_offset)(fl_Widget widget, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Widget_as_group_super)(fl_Widget widget);
  FL_EXPORT_C(fl_Group,     Fl_Widget_as_group)(fl_Widget widget);
  FL_EXPORT_C(fl_Gl_Window, Fl_Widget_as_gl_window_super)(fl_Widget widget);
  FL_EXPORT_C(fl_Gl_Window, Fl_Widget_as_gl_window)(fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Widget_resize_super)(fl_Widget widget,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Widget_resize)(fl_Widget widget,int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Widget_Virtual_Funcs*, Fl_Widget_default_virtual_funcs)();
  FL_EXPORT_C(fl_Widget,    Fl_Widget_New)(int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Widget,    Fl_Widget_New_WithLabel)(int X, int Y, int W, int H, const char* label);
  FL_EXPORT_C(fl_Widget,    Fl_OverriddenWidget_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Widget,    Fl_OverriddenWidget_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void,         Fl_Widget_Destroy)(fl_Widget widget);
#ifdef __cplusplus
}
#endif
#endif /* __FL_WIDGET_C__ */
