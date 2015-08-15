#ifndef __FL_VALUATOR_C__
#define __FL_VALUATOR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Valuator is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Valuator.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedValuator : public Fl_Valuator {
    fl_Valuator_Virtual_Funcs* overriddenFuncs;
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
    virtual int format(char* format);
    Fl_DerivedValuator(int X, int Y, int W, int H, const char *l, fl_Valuator_Virtual_Funcs* funcs);
    Fl_DerivedValuator(int X, int Y, int W, int H, fl_Valuator_Virtual_Funcs* funcs);
    ~Fl_DerivedValuator();
  };
#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Valuator_Type {
    FL_VERTICALC = 0,
    FL_HORIZONTALC = 1
  } Valuator_Type;
#endif
  FL_EXPORT_C(int,Fl_Valuator_handle)(fl_Widget self, int event);
  FL_EXPORT_C(int,Fl_Valuator_handle_super)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Valuator_parent)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_parent)(fl_Valuator valuator, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Valuator_type)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_type)(fl_Valuator valuator, uchar t);

FL_EXPORT_C(void, Fl_Valuator_draw_box)(fl_Valuator Valuator);
FL_EXPORT_C(void, Fl_Valuator_draw_box_with_tc)(fl_Valuator Valuator,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Valuator_draw_box_with_txywhc)(fl_Valuator Valuator,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Valuator_draw_backdrop)(fl_Valuator Valuator);
FL_EXPORT_C(void, Fl_Valuator_draw_focus)(fl_Valuator Valuator);
FL_EXPORT_C(void, Fl_Valuator_draw_focus_with_txywh)(fl_Valuator Valuator,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Valuator_draw_label)(fl_Valuator Valuator);
  FL_EXPORT_C(int,          Fl_Valuator_x)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_y)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_w)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_h)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_align)(fl_Valuator valuator, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Valuator_align)(fl_Valuator valuator);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Valuator_box)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_box)(fl_Valuator valuator, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Valuator_color)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_color)(fl_Valuator valuator, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Valuator_set_color_with_bg_sel)(fl_Valuator valuator,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Valuator_selection_color)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_selection_color)(fl_Valuator valuator, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Valuator_label)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_copy_label)(fl_Valuator valuator, const char* new_label);
  FL_EXPORT_C(void,         Fl_Valuator_set_label)(fl_Valuator valuator, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Valuator_labeltype)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_labeltype)(fl_Valuator valuator, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Valuator_labelcolor)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_labelcolor)(fl_Valuator valuator, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Valuator_labelfont)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_labelfont)(fl_Valuator valuator, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Valuator_labelsize)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_labelsize)(fl_Valuator valuator, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Valuator_image)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_image)(fl_Valuator valuator, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Valuator_deimage)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_deimage)(fl_Valuator valuator, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Valuator_tooltip)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_copy_tooltip)(fl_Valuator valuator, const char* text);
  FL_EXPORT_C(void,         Fl_Valuator_set_tooltip)(fl_Valuator valuator, const char* text);
  FL_EXPORT_C(void,         Fl_Valuator_set_callback_with_user_data)(fl_Valuator valuator, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Valuator_set_callback)(fl_Valuator valuator, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Valuator_other_data)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_other_data)(fl_Valuator valuator, void* v);
  FL_EXPORT_C(void*,        Fl_Valuator_user_data)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_user_data)(fl_Valuator valuator, void* v);
  FL_EXPORT_C(long,         Fl_Valuator_argument)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_argument)(fl_Valuator valuator, long v);
  FL_EXPORT_C(Fl_When,      Fl_Valuator_when)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_when)(fl_Valuator valuator, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Valuator_visible)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_visible_r)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_show_super)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_show)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_hide_super)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_hide)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_visible)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_clear_visible)(fl_Valuator valuator);
  FL_EXPORT_C(unsigned int, Fl_Valuator_active)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_active_r)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_activate)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_deactivate)(fl_Valuator valuator);
  FL_EXPORT_C(unsigned int, Fl_Valuator_output)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_output)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_clear_output)(fl_Valuator valuator);
  FL_EXPORT_C(unsigned int, Fl_Valuator_takesevents)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_changed)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_clear_changed)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_take_focus)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_set_visible_focus)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_clear_visible_focus)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_modify_visible_focus)(fl_Valuator valuator, int v);
  FL_EXPORT_C(unsigned int, Fl_Valuator_visible_focus)(fl_Valuator valuator);
  FL_EXPORT_C(int,          Fl_Valuator_contains)(fl_Valuator valuator, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Valuator_inside)(fl_Valuator valuator, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Valuator_redraw)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_redraw_label)(fl_Valuator valuator);
  FL_EXPORT_C(uchar,        Fl_Valuator_damage)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_clear_damage_with_bitmask)(fl_Valuator valuator, uchar c);
  FL_EXPORT_C(void,         Fl_Valuator_clear_damage)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_damage_with_text)(fl_Valuator valuator, uchar c);
  FL_EXPORT_C(void,         Fl_Valuator_damage_inside_widget)(fl_Valuator valuator, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Valuator_draw_label_with_xywh_alignment)(fl_Valuator valuator, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Valuator_measure_label)(fl_Valuator valuator, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Valuator_window)(fl_Valuator valuator);
  FL_EXPORT_C(fl_Window,    Fl_Valuator_top_window)(fl_Valuator valuator);
  FL_EXPORT_C(fl_Window ,   Fl_Valuator_top_window_offset)(fl_Valuator valuator, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Valuator_as_gl_window_super)(fl_Valuator valuator);
  FL_EXPORT_C(fl_Gl_Window, Fl_Valuator_as_gl_window)(fl_Valuator valuator);
  FL_EXPORT_C(void,         Fl_Valuator_resize_super)(fl_Table table,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Valuator_resize)(fl_Table table,int X, int Y, int W, int H);

  FL_EXPORT_C(fl_Valuator_Virtual_Funcs*, Fl_Valuator_default_virtual_funcs)();
  FL_EXPORT_C(fl_Valuator,    Fl_Valuator_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Valuator,    Fl_OverriddenValuator_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Valuator_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Valuator   , Fl_Valuator_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Valuator   , Fl_OverriddenValuator_New)(int x, int y, int w, int h, fl_Valuator_Virtual_Funcs* funcs);
  FL_EXPORT_C(void,      Fl_Valuator_Destroy)(fl_Valuator valuator);

  FL_EXPORT_C(void, Fl_Valuator_bounds)(fl_Valuator valuator, double a, double b);
  FL_EXPORT_C(double, Fl_Valuator_minimum)(fl_Valuator valuator);
  FL_EXPORT_C(void, Fl_Valuator_set_minimum)(fl_Valuator valuator, double a);
  FL_EXPORT_C(double, Fl_Valuator_maximum)(fl_Valuator valuator);
  FL_EXPORT_C(void, Fl_Valuator_set_maximum)(fl_Valuator valuator, double a);
  FL_EXPORT_C(void, Fl_Valuator_range)(fl_Valuator valuator, double a, double b);
  FL_EXPORT_C(void, Fl_Valuator_set_step)(fl_Valuator valuator, int a);
  FL_EXPORT_C(void, Fl_Valuator_set_step_with_a_b)(fl_Valuator valuator, double a, int b);
  FL_EXPORT_C(void, Fl_Valuator_step_with_s)(fl_Valuator valuator, double s);
  FL_EXPORT_C(double, Fl_Valuator_step)(fl_Valuator valuator);
  FL_EXPORT_C(void, Fl_Valuator_precision)(fl_Valuator valuator, int precision);
  FL_EXPORT_C(double, Fl_Valuator_value)(fl_Valuator valuator);
  FL_EXPORT_C(int, Fl_Valuator_set_value)(fl_Valuator valuator, double v);
  FL_EXPORT_C(int, Fl_Valuator_format)(fl_Valuator valuator, char* format);
  FL_EXPORT_C(double, Fl_Valuator_round)(fl_Valuator valuator, double v);
  FL_EXPORT_C(double, Fl_Valuator_clamp)(fl_Valuator valuator, double v);
  FL_EXPORT_C(double, Fl_Valuator_increment)(fl_Valuator valuator, double v, int n);
#ifdef __cplusplus
}
#endif
#endif /* __FL_VALUATOR_C__ */
