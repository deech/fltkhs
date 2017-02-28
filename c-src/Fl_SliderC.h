#ifndef __FL_SLIDER_C__
#define __FL_SLIDER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Slider is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Slider.H"
#include "FL/Fl_Fill_Slider.H"
#include "FL/Fl_Hor_Slider.H"
#include "FL/Fl_Hor_Fill_Slider.H"
#include "FL/Fl_Hor_Nice_Slider.H"
#include "FL/Fl_Nice_Slider.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedSlider : public Fl_Slider {
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
    Fl_DerivedSlider(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedSlider(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedSlider();
  };
#endif
  FL_EXPORT_C(int,Fl_Slider_handle)(fl_Widget self, int event);
  FL_EXPORT_C(int,Fl_Slider_handle_super)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Slider_parent)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_parent)(fl_Slider slider, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Slider_type)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_type)(fl_Slider slider, uchar t);

  FL_EXPORT_C(int,          Fl_Slider_x)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_y)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_w)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_h)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_align)(fl_Slider slider, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Slider_align)(fl_Slider slider);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Slider_box)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_box)(fl_Slider slider, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Slider_color)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_color)(fl_Slider slider, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Slider_set_color_with_bg_sel)(fl_Slider slider,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Slider_selection_color)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_selection_color)(fl_Slider slider, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Slider_label)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_copy_label)(fl_Slider slider, const char* new_label);
  FL_EXPORT_C(void,         Fl_Slider_set_label)(fl_Slider slider, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Slider_labeltype)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_labeltype)(fl_Slider slider, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Slider_labelcolor)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_labelcolor)(fl_Slider slider, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Slider_labelfont)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_labelfont)(fl_Slider slider, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Slider_labelsize)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_labelsize)(fl_Slider slider, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Slider_image)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_image)(fl_Slider slider, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Slider_deimage)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_deimage)(fl_Slider slider, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Slider_tooltip)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_copy_tooltip)(fl_Slider slider, const char* text);
  FL_EXPORT_C(void,         Fl_Slider_set_tooltip)(fl_Slider slider, const char* text);
  FL_EXPORT_C(void,         Fl_Slider_set_callback_with_user_data)(fl_Slider slider, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Slider_set_callback)(fl_Slider slider, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Slider_other_data)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_other_data)(fl_Slider slider, void* v);
  FL_EXPORT_C(void*,        Fl_Slider_user_data)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_user_data)(fl_Slider slider, void* v);
  FL_EXPORT_C(long,         Fl_Slider_argument)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_argument)(fl_Slider slider, long v);
  FL_EXPORT_C(Fl_When,      Fl_Slider_when)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_when)(fl_Slider slider, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Slider_visible)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_visible_r)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_show_super)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_show)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_hide_super)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_hide)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_visible)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_clear_visible)(fl_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Slider_active)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_active_r)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_activate)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_deactivate)(fl_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Slider_output)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_output)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_clear_output)(fl_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Slider_takesevents)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_changed)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_clear_changed)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_take_focus)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_set_visible_focus)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_clear_visible_focus)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_modify_visible_focus)(fl_Slider slider, int v);
  FL_EXPORT_C(unsigned int, Fl_Slider_visible_focus)(fl_Slider slider);
  FL_EXPORT_C(int,          Fl_Slider_contains)(fl_Slider slider, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Slider_inside)(fl_Slider slider, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Slider_redraw)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_redraw_label)(fl_Slider slider);
  FL_EXPORT_C(uchar,        Fl_Slider_damage)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_clear_damage_with_bitmask)(fl_Slider slider, uchar c);
  FL_EXPORT_C(void,         Fl_Slider_clear_damage)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_damage_with_text)(fl_Slider slider, uchar c);
  FL_EXPORT_C(void,         Fl_Slider_damage_inside_widget)(fl_Slider slider, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Slider_draw_label_with_xywh_alignment)(fl_Slider slider, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Slider_measure_label)(fl_Slider slider, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Slider_window)(fl_Slider slider);
  FL_EXPORT_C(fl_Window,    Fl_Slider_top_window)(fl_Slider slider);
  FL_EXPORT_C(fl_Window ,   Fl_Slider_top_window_offset)(fl_Slider slider, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Slider_as_gl_window_super)(fl_Slider slider);
  FL_EXPORT_C(fl_Gl_Window, Fl_Slider_as_gl_window)(fl_Slider slider);
  FL_EXPORT_C(void,         Fl_Slider_resize_super)(fl_Table table,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Slider_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Slider_bounds)(fl_Slider slider, double a, double b);
  FL_EXPORT_C(double, Fl_Slider_minimum)(fl_Slider slider);
  FL_EXPORT_C(void, Fl_Slider_set_minimum)(fl_Slider slider, double a);
  FL_EXPORT_C(double, Fl_Slider_maximum)(fl_Slider slider);
  FL_EXPORT_C(void, Fl_Slider_set_maximum)(fl_Slider slider, double a);
  FL_EXPORT_C(void, Fl_Slider_range)(fl_Slider slider, double a, double b);
  FL_EXPORT_C(void, Fl_Slider_set_step)(fl_Slider slider, int a);
  FL_EXPORT_C(void, Fl_Slider_set_step_with_a_b)(fl_Slider slider, double a, int b);
  FL_EXPORT_C(void, Fl_Slider_step_with_s)(fl_Slider slider, double s);
  FL_EXPORT_C(double, Fl_Slider_step)(fl_Slider slider);
  FL_EXPORT_C(void, Fl_Slider_precision)(fl_Slider slider, int precision);
  FL_EXPORT_C(double, Fl_Slider_value)(fl_Slider slider);
  FL_EXPORT_C(int, Fl_Slider_set_value)(fl_Slider slider, double v);
  FL_EXPORT_C(int, Fl_Slider_format)(fl_Slider slider, char* format);
  FL_EXPORT_C(double, Fl_Slider_round)(fl_Slider slider, double v);
  FL_EXPORT_C(double, Fl_Slider_clamp)(fl_Slider slider, double v);
  FL_EXPORT_C(double, Fl_Slider_increment)(fl_Slider slider, double v, int n);

  /* Fl_Slider specific */
  FL_EXPORT_C(fl_Slider,    Fl_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Slider   , Fl_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Slider,    Fl_Slider_New_WithT)(uchar t, int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Fill_Slider,    Fl_Fill_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Fill_Slider   , Fl_Fill_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Hor_Slider,    Fl_Hor_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Hor_Slider   , Fl_Hor_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Hor_Fill_Slider,    Fl_Hor_Fill_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Hor_Fill_Slider   , Fl_Hor_Fill_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Hor_Nice_Slider,    Fl_Hor_Nice_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Hor_Nice_Slider   , Fl_Hor_Nice_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Nice_Slider,    Fl_Nice_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Nice_Slider   , Fl_Nice_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Slider_Destroy)(fl_Slider slider);
  FL_EXPORT_C(int, Fl_Slider_scrollvalue)(fl_Slider slider, int pos,int size,int first,int total);
  FL_EXPORT_C(float, Fl_Slider_set_slider_size)(fl_Slider slider);
  FL_EXPORT_C(void, Fl_Slider_slider_size)(fl_Slider slider, double v);
  FL_EXPORT_C(Fl_Boxtype, Fl_Slider_slider)(fl_Slider slider);
  FL_EXPORT_C(void, Fl_Slider_set_slider)(fl_Slider slider, Fl_Boxtype c);
  FL_EXPORT_C(fl_Slider,    Fl_OverriddenSlider_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Slider,    Fl_OverriddenSlider_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Slider_draw)(fl_Slider o);
  FL_EXPORT_C(void, Fl_Slider_draw_super)(fl_Slider o);
  FL_EXPORT_C(int, Fl_Slider_handle)(fl_Slider o, int event);
  FL_EXPORT_C(int, Fl_Slider_handle_super)(fl_Slider o, int event);
  FL_EXPORT_C(void, Fl_Slider_resize)(fl_Slider o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Slider_resize_super)(fl_Slider o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Slider_show)(fl_Slider o);
  FL_EXPORT_C(void, Fl_Slider_show_super)(fl_Slider o);
  FL_EXPORT_C(void, Fl_Slider_hide)(fl_Slider o);
  FL_EXPORT_C(void, Fl_Slider_hide_super)(fl_Slider o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SLIDER_C__ */
