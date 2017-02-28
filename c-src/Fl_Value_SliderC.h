#ifndef __FL_VALUE_SLIDER_C__
#define __FL_VALUE_SLIDER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Value_Slider is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Value_Slider.H"
#include "FL/Fl_Hor_Value_Slider.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedValue_Slider : public Fl_Value_Slider {
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
    Fl_DerivedValue_Slider(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedValue_Slider(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedValue_Slider();
  };

#endif
  FL_EXPORT_C(fl_Group,     Fl_Value_Slider_parent)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_parent)(fl_Value_Slider value_slider, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Value_Slider_type)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_type)(fl_Value_Slider value_slider, uchar t);

  FL_EXPORT_C(int,          Fl_Value_Slider_x)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_y)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_w)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_h)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_align)(fl_Value_Slider value_slider, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Value_Slider_align)(fl_Value_Slider value_slider);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Value_Slider_box)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_box)(fl_Value_Slider value_slider, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Slider_color)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_color)(fl_Value_Slider value_slider, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_color_with_bg_sel)(fl_Value_Slider value_slider,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Slider_selection_color)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_selection_color)(fl_Value_Slider value_slider, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Value_Slider_label)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_copy_label)(fl_Value_Slider value_slider, const char* new_label);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_label)(fl_Value_Slider value_slider, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Value_Slider_labeltype)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_labeltype)(fl_Value_Slider value_slider, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Slider_labelcolor)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_labelcolor)(fl_Value_Slider value_slider, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Value_Slider_labelfont)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_labelfont)(fl_Value_Slider value_slider, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Value_Slider_labelsize)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_labelsize)(fl_Value_Slider value_slider, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Value_Slider_image)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_image)(fl_Value_Slider value_slider, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Value_Slider_deimage)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_deimage)(fl_Value_Slider value_slider, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Value_Slider_tooltip)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_copy_tooltip)(fl_Value_Slider value_slider, const char* text);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_tooltip)(fl_Value_Slider value_slider, const char* text);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_callback_with_user_data)(fl_Value_Slider value_slider, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_callback)(fl_Value_Slider value_slider, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Value_Slider_other_data)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_other_data)(fl_Value_Slider value_slider, void* v);
  FL_EXPORT_C(void*,        Fl_Value_Slider_user_data)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_user_data)(fl_Value_Slider value_slider, void* v);
  FL_EXPORT_C(long,         Fl_Value_Slider_argument)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_argument)(fl_Value_Slider value_slider, long v);
  FL_EXPORT_C(Fl_When,      Fl_Value_Slider_when)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_when)(fl_Value_Slider value_slider, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Value_Slider_visible)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_visible_r)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_show)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_hide)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_visible)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_visible)(fl_Value_Slider value_slider);
  FL_EXPORT_C(unsigned int, Fl_Value_Slider_active)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_active_r)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_activate)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_deactivate)(fl_Value_Slider value_slider);
  FL_EXPORT_C(unsigned int, Fl_Value_Slider_output)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_output)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_output)(fl_Value_Slider value_slider);
  FL_EXPORT_C(unsigned int, Fl_Value_Slider_takesevents)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_changed)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_changed)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_take_focus)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_set_visible_focus)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_visible_focus)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_modify_visible_focus)(fl_Value_Slider value_slider, int v);
  FL_EXPORT_C(unsigned int, Fl_Value_Slider_visible_focus)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int,          Fl_Value_Slider_contains)(fl_Value_Slider value_slider, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Value_Slider_inside)(fl_Value_Slider value_slider, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Value_Slider_redraw)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_redraw_label)(fl_Value_Slider value_slider);
  FL_EXPORT_C(uchar,        Fl_Value_Slider_damage)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_damage_with_bitmask)(fl_Value_Slider value_slider, uchar c);
  FL_EXPORT_C(void,         Fl_Value_Slider_clear_damage)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_damage_with_text)(fl_Value_Slider value_slider, uchar c);
  FL_EXPORT_C(void,         Fl_Value_Slider_damage_inside_widget)(fl_Value_Slider value_slider, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Value_Slider_draw_label_with_xywh_alignment)(fl_Value_Slider value_slider, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Value_Slider_measure_label)(fl_Value_Slider value_slider, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Value_Slider_window)(fl_Value_Slider value_slider);
  FL_EXPORT_C(fl_Window,    Fl_Value_Slider_top_window)(fl_Value_Slider value_slider);
  FL_EXPORT_C(fl_Window ,   Fl_Value_Slider_top_window_offset)(fl_Value_Slider value_slider, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Value_Slider_as_gl_window)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void,         Fl_Value_Slider_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Value_Slider_bounds)(fl_Value_Slider value_slider, double a, double b);
  FL_EXPORT_C(double, Fl_Value_Slider_minimum)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_minimum)(fl_Value_Slider value_slider, double a);
  FL_EXPORT_C(double, Fl_Value_Slider_maximum)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_maximum)(fl_Value_Slider value_slider, double a);
  FL_EXPORT_C(void, Fl_Value_Slider_range)(fl_Value_Slider value_slider, double a, double b);
  FL_EXPORT_C(void, Fl_Value_Slider_set_step)(fl_Value_Slider value_slider, int a);
  FL_EXPORT_C(void, Fl_Value_Slider_set_step_with_a_b)(fl_Value_Slider value_slider, double a, int b);
  FL_EXPORT_C(void, Fl_Value_Slider_step_with_s)(fl_Value_Slider value_slider, double s);
  FL_EXPORT_C(double, Fl_Value_Slider_step)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_precision)(fl_Value_Slider value_slider, int precision);
  FL_EXPORT_C(double, Fl_Value_Slider_value)(fl_Value_Slider value_slider);
  FL_EXPORT_C(int, Fl_Value_Slider_set_value)(fl_Value_Slider value_slider, double v);
  FL_EXPORT_C(int, Fl_Value_Slider_format)(fl_Value_Slider value_slider, char* format);
  FL_EXPORT_C(double, Fl_Value_Slider_round)(fl_Value_Slider value_slider, double v);
  FL_EXPORT_C(double, Fl_Value_Slider_clamp)(fl_Value_Slider value_slider, double v);
  FL_EXPORT_C(double, Fl_Value_Slider_increment)(fl_Value_Slider value_slider, double v, int n);

  /* Inherited from Fl_Slider specific */
  FL_EXPORT_C(int, Fl_Value_Slider_scrollvalue)(fl_Value_Slider value_slider, int pos,int size,int first,int total);
  FL_EXPORT_C(float, Fl_Value_Slider_set_value_slider_size)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_value_slider_size)(fl_Value_Slider value_slider, double v);
  FL_EXPORT_C(Fl_Boxtype, Fl_Value_Slider_value_slider)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_value_slider)(fl_Value_Slider value_slider, Fl_Boxtype c);


  /* Fl_Value_Slider specific */
  FL_EXPORT_C(fl_Value_Slider,    Fl_Value_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Value_Slider   , Fl_Value_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Value_Slider,    Fl_Hor_Value_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Value_Slider   , Fl_Hor_Value_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Value_Slider_Destroy)(fl_Value_Slider value_slider);
  FL_EXPORT_C(Fl_Font, Fl_Value_Slider_textfont)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_textfont)(fl_Value_Slider value_slider, Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize, Fl_Value_Slider_textsize)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_textsize)(fl_Value_Slider value_slider, Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color, Fl_Value_Slider_textcolor)(fl_Value_Slider value_slider);
  FL_EXPORT_C(void, Fl_Value_Slider_set_textcolor)(fl_Value_Slider value_slider, Fl_Color s);
  FL_EXPORT_C(int,Fl_Value_Slider_handle)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Value_Slider,    Fl_OverriddenValue_Slider_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Value_Slider,    Fl_OverriddenValue_Slider_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Value_Slider_draw)(fl_Value_Slider o);
  FL_EXPORT_C(void, Fl_Value_Slider_draw_super)(fl_Value_Slider o);
  FL_EXPORT_C(int, Fl_Value_Slider_handle)(fl_Value_Slider o, int event);
  FL_EXPORT_C(int, Fl_Value_Slider_handle_super)(fl_Value_Slider o, int event);
  FL_EXPORT_C(void, Fl_Value_Slider_resize)(fl_Value_Slider o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Value_Slider_resize_super)(fl_Value_Slider o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Value_Slider_show)(fl_Value_Slider o);
  FL_EXPORT_C(void, Fl_Value_Slider_show_super)(fl_Value_Slider o);
  FL_EXPORT_C(void, Fl_Value_Slider_hide)(fl_Value_Slider o);
  FL_EXPORT_C(void, Fl_Value_Slider_hide_super)(fl_Value_Slider o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SLIDER_C__ */
