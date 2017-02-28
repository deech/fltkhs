#ifndef __FL_ADJUSTER_C__
#define __FL_ADJUSTER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Adjuster is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Adjuster.H"
#include "Fl_CallbackC.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedAdjuster : public Fl_Adjuster {
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
    Fl_DerivedAdjuster(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedAdjuster(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedAdjuster();
  };
#endif
  FL_EXPORT_C(fl_Group,     Fl_Adjuster_parent)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_parent)(fl_Adjuster adjuster, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Adjuster_type)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_type)(fl_Adjuster adjuster, uchar t);

  FL_EXPORT_C(int,          Fl_Adjuster_x)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_y)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_w)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_h)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_align)(fl_Adjuster adjuster, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Adjuster_align)(fl_Adjuster adjuster);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Adjuster_box)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_box)(fl_Adjuster adjuster, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Adjuster_color)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_color)(fl_Adjuster adjuster, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Adjuster_set_color_with_bg_sel)(fl_Adjuster adjuster,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Adjuster_selection_color)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_selection_color)(fl_Adjuster adjuster, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Adjuster_label)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_copy_label)(fl_Adjuster adjuster, const char* new_label);
  FL_EXPORT_C(void,         Fl_Adjuster_set_label)(fl_Adjuster adjuster, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Adjuster_labeltype)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_labeltype)(fl_Adjuster adjuster, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Adjuster_labelcolor)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_labelcolor)(fl_Adjuster adjuster, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Adjuster_labelfont)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_labelfont)(fl_Adjuster adjuster, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Adjuster_labelsize)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_labelsize)(fl_Adjuster adjuster, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Adjuster_image)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_image)(fl_Adjuster adjuster, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Adjuster_deimage)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_deimage)(fl_Adjuster adjuster, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Adjuster_tooltip)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_copy_tooltip)(fl_Adjuster adjuster, const char* text);
  FL_EXPORT_C(void,         Fl_Adjuster_set_tooltip)(fl_Adjuster adjuster, const char* text);
  FL_EXPORT_C(void,         Fl_Adjuster_set_callback_with_user_data)(fl_Adjuster adjuster, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Adjuster_set_callback)(fl_Adjuster adjuster, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Adjuster_other_data)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_other_data)(fl_Adjuster adjuster, void* v);
  FL_EXPORT_C(void*,        Fl_Adjuster_user_data)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_user_data)(fl_Adjuster adjuster, void* v);
  FL_EXPORT_C(long,         Fl_Adjuster_argument)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_argument)(fl_Adjuster adjuster, long v);
  FL_EXPORT_C(Fl_When,      Fl_Adjuster_when)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_when)(fl_Adjuster adjuster, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Adjuster_visible)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_visible_r)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_visible)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_visible)(fl_Adjuster adjuster);
  FL_EXPORT_C(unsigned int, Fl_Adjuster_active)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_active_r)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_activate)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_deactivate)(fl_Adjuster adjuster);
  FL_EXPORT_C(unsigned int, Fl_Adjuster_output)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_output)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_output)(fl_Adjuster adjuster);
  FL_EXPORT_C(unsigned int, Fl_Adjuster_takesevents)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_changed)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_changed)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_take_focus)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_set_visible_focus)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_visible_focus)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_modify_visible_focus)(fl_Adjuster adjuster, int v);
  FL_EXPORT_C(unsigned int, Fl_Adjuster_visible_focus)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,          Fl_Adjuster_contains)(fl_Adjuster adjuster, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Adjuster_inside)(fl_Adjuster adjuster, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Adjuster_redraw)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_redraw_label)(fl_Adjuster adjuster);
  FL_EXPORT_C(uchar,        Fl_Adjuster_damage)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_damage_with_bitmask)(fl_Adjuster adjuster, uchar c);
  FL_EXPORT_C(void,         Fl_Adjuster_clear_damage)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,         Fl_Adjuster_damage_with_text)(fl_Adjuster adjuster, uchar c);
  FL_EXPORT_C(void,         Fl_Adjuster_damage_inside_widget)(fl_Adjuster adjuster, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Adjuster_draw_label_with_xywh_alignment)(fl_Adjuster adjuster, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Adjuster_measure_label)(fl_Adjuster adjuster, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Adjuster_window)(fl_Adjuster adjuster);
  FL_EXPORT_C(fl_Window,    Fl_Adjuster_top_window)(fl_Adjuster adjuster);
  FL_EXPORT_C(fl_Window ,   Fl_Adjuster_top_window_offset)(fl_Adjuster adjuster, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Adjuster_as_gl_window)(fl_Adjuster adjuster);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Adjuster_bounds)(fl_Adjuster adjuster, double a, double b);
  FL_EXPORT_C(double, Fl_Adjuster_minimum)(fl_Adjuster adjuster);
  FL_EXPORT_C(void, Fl_Adjuster_set_minimum)(fl_Adjuster adjuster, double a);
  FL_EXPORT_C(double, Fl_Adjuster_maximum)(fl_Adjuster adjuster);
  FL_EXPORT_C(void, Fl_Adjuster_set_maximum)(fl_Adjuster adjuster, double a);
  FL_EXPORT_C(void, Fl_Adjuster_range)(fl_Adjuster adjuster, double a, double b);
  FL_EXPORT_C(void, Fl_Adjuster_set_step)(fl_Adjuster adjuster, int a);
  FL_EXPORT_C(void, Fl_Adjuster_set_step_with_a_b)(fl_Adjuster adjuster, double a, int b);
  FL_EXPORT_C(void, Fl_Adjuster_step_with_s)(fl_Adjuster adjuster, double s);
  FL_EXPORT_C(double, Fl_Adjuster_step)(fl_Adjuster adjuster);
  FL_EXPORT_C(void, Fl_Adjuster_precision)(fl_Adjuster adjuster, int precision);
  FL_EXPORT_C(double, Fl_Adjuster_value)(fl_Adjuster adjuster);
  FL_EXPORT_C(int, Fl_Adjuster_set_value)(fl_Adjuster adjuster, double v);
  FL_EXPORT_C(int, Fl_Adjuster_format)(fl_Adjuster adjuster, char* format);
  FL_EXPORT_C(double, Fl_Adjuster_round)(fl_Adjuster adjuster, double v);
  FL_EXPORT_C(double, Fl_Adjuster_clamp)(fl_Adjuster adjuster, double v);
  FL_EXPORT_C(double, Fl_Adjuster_increment)(fl_Adjuster adjuster, double v, int n);

  /* Fl_Adjuster specific */
  FL_EXPORT_C(fl_Adjuster,    Fl_Adjuster_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Adjuster   , Fl_Adjuster_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Adjuster_Destroy)(fl_Adjuster adjuster);
  FL_EXPORT_C(int,      Fl_Adjuster_soft)(fl_Adjuster adjuster);
  FL_EXPORT_C(void,      Fl_Adjuster_set_soft)(fl_Adjuster adjuster, int soft);

  FL_EXPORT_C(fl_Adjuster,    Fl_OverriddenAdjuster_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Adjuster,    Fl_OverriddenAdjuster_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Adjuster_draw)(fl_Adjuster o);
  FL_EXPORT_C(void, Fl_Adjuster_draw_super)(fl_Adjuster o);
  FL_EXPORT_C(int, Fl_Adjuster_handle)(fl_Adjuster o, int event);
  FL_EXPORT_C(int, Fl_Adjuster_handle_super)(fl_Adjuster o, int event);
  FL_EXPORT_C(void, Fl_Adjuster_resize)(fl_Adjuster o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Adjuster_resize_super)(fl_Adjuster o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Adjuster_show)(fl_Adjuster o);
  FL_EXPORT_C(void, Fl_Adjuster_show_super)(fl_Adjuster o);
  FL_EXPORT_C(void, Fl_Adjuster_hide)(fl_Adjuster o);
  FL_EXPORT_C(void, Fl_Adjuster_hide_super)(fl_Adjuster o);

#ifdef __cplusplus
}
#endif
#endif /* __FL_ADJUSTER_C__ */
