#ifndef __FL_HOR_SLIDER_C__
#define __FL_HOR_SLIDER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Hor_Slider is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Hor_Slider.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Hor_Slider_handle)(fl_Widget self, int event);
  FL_EXPORT_C(int,Fl_Hor_Slider_handle_super)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Hor_Slider_parent)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_parent)(fl_Hor_Slider slider, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Hor_Slider_type)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_type)(fl_Hor_Slider slider, uchar t);

  FL_EXPORT_C(int,          Fl_Hor_Slider_x)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_y)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_w)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_h)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_align)(fl_Hor_Slider slider, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Hor_Slider_align)(fl_Hor_Slider slider);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Hor_Slider_box)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_box)(fl_Hor_Slider slider, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Hor_Slider_color)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_color)(fl_Hor_Slider slider, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_color_with_bg_sel)(fl_Hor_Slider slider,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Hor_Slider_selection_color)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_selection_color)(fl_Hor_Slider slider, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Hor_Slider_label)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_copy_label)(fl_Hor_Slider slider, const char* new_label);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_label)(fl_Hor_Slider slider, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Hor_Slider_labeltype)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_labeltype)(fl_Hor_Slider slider, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Hor_Slider_labelcolor)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_labelcolor)(fl_Hor_Slider slider, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Hor_Slider_labelfont)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_labelfont)(fl_Hor_Slider slider, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Hor_Slider_labelsize)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_labelsize)(fl_Hor_Slider slider, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Hor_Slider_image)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_image)(fl_Hor_Slider slider, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Hor_Slider_deimage)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_deimage)(fl_Hor_Slider slider, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Hor_Slider_tooltip)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_copy_tooltip)(fl_Hor_Slider slider, const char* text);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_tooltip)(fl_Hor_Slider slider, const char* text);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_callback_with_user_data)(fl_Hor_Slider slider, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_callback)(fl_Hor_Slider slider, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Hor_Slider_other_data)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_other_data)(fl_Hor_Slider slider, void* v);
  FL_EXPORT_C(void*,        Fl_Hor_Slider_user_data)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_user_data)(fl_Hor_Slider slider, void* v);
  FL_EXPORT_C(long,         Fl_Hor_Slider_argument)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_argument)(fl_Hor_Slider slider, long v);
  FL_EXPORT_C(Fl_When,      Fl_Hor_Slider_when)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_when)(fl_Hor_Slider slider, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Hor_Slider_visible)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_visible_r)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_show_super)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_show)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_hide_super)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_hide)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_visible)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_visible)(fl_Hor_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Hor_Slider_active)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_active_r)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_activate)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_deactivate)(fl_Hor_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Hor_Slider_output)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_output)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_output)(fl_Hor_Slider slider);
  FL_EXPORT_C(unsigned int, Fl_Hor_Slider_takesevents)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_changed)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_changed)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_take_focus)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_set_visible_focus)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_visible_focus)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_modify_visible_focus)(fl_Hor_Slider slider, int v);
  FL_EXPORT_C(unsigned int, Fl_Hor_Slider_visible_focus)(fl_Hor_Slider slider);
  FL_EXPORT_C(int,          Fl_Hor_Slider_contains)(fl_Hor_Slider slider, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Hor_Slider_inside)(fl_Hor_Slider slider, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Hor_Slider_redraw)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_redraw_label)(fl_Hor_Slider slider);
  FL_EXPORT_C(uchar,        Fl_Hor_Slider_damage)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_damage_with_bitmask)(fl_Hor_Slider slider, uchar c);
  FL_EXPORT_C(void,         Fl_Hor_Slider_clear_damage)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_damage_with_text)(fl_Hor_Slider slider, uchar c);
  FL_EXPORT_C(void,         Fl_Hor_Slider_damage_inside_widget)(fl_Hor_Slider slider, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Hor_Slider_draw_label_with_xywh_alignment)(fl_Hor_Slider slider, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Hor_Slider_measure_label)(fl_Hor_Slider slider, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Hor_Slider_window)(fl_Hor_Slider slider);
  FL_EXPORT_C(fl_Window,    Fl_Hor_Slider_top_window)(fl_Hor_Slider slider);
  FL_EXPORT_C(fl_Window ,   Fl_Hor_Slider_top_window_offset)(fl_Hor_Slider slider, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Hor_Slider_as_gl_window_super)(fl_Hor_Slider slider);
  FL_EXPORT_C(fl_Gl_Window, Fl_Hor_Slider_as_gl_window)(fl_Hor_Slider slider);
  FL_EXPORT_C(void,         Fl_Hor_Slider_resize_super)(fl_Table table,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Hor_Slider_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Hor_Slider_bounds)(fl_Hor_Slider slider, double a, double b);
  FL_EXPORT_C(double, Fl_Hor_Slider_minimum)(fl_Hor_Slider slider);
  FL_EXPORT_C(void, Fl_Hor_Slider_set_minimum)(fl_Hor_Slider slider, double a);
  FL_EXPORT_C(double, Fl_Hor_Slider_maximum)(fl_Hor_Slider slider);
  FL_EXPORT_C(void, Fl_Hor_Slider_set_maximum)(fl_Hor_Slider slider, double a);
  FL_EXPORT_C(void, Fl_Hor_Slider_range)(fl_Hor_Slider slider, double a, double b);
  FL_EXPORT_C(void, Fl_Hor_Slider_set_step)(fl_Hor_Slider slider, int a);
  FL_EXPORT_C(void, Fl_Hor_Slider_set_step_with_a_b)(fl_Hor_Slider slider, double a, int b);
  FL_EXPORT_C(void, Fl_Hor_Slider_step_with_s)(fl_Hor_Slider slider, double s);
  FL_EXPORT_C(double, Fl_Hor_Slider_step)(fl_Hor_Slider slider);
  FL_EXPORT_C(void, Fl_Hor_Slider_precision)(fl_Hor_Slider slider, int precision);
  FL_EXPORT_C(double, Fl_Hor_Slider_value)(fl_Hor_Slider slider);
  FL_EXPORT_C(int, Fl_Hor_Slider_set_value)(fl_Hor_Slider slider, double v);
  FL_EXPORT_C(int, Fl_Hor_Slider_format)(fl_Hor_Slider slider, char* format);
  FL_EXPORT_C(double, Fl_Hor_Slider_round)(fl_Hor_Slider slider, double v);
  FL_EXPORT_C(double, Fl_Hor_Slider_clamp)(fl_Hor_Slider slider, double v);
  FL_EXPORT_C(double, Fl_Hor_Slider_increment)(fl_Hor_Slider slider, double v, int n);

  /* Fl_Hor_Slider specific */
  FL_EXPORT_C(fl_Hor_Slider,    Fl_Hor_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Hor_Slider   , Fl_Hor_Slider_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Hor_Slider_Destroy)(fl_Hor_Slider slider);
  FL_EXPORT_C(int, Fl_Hor_Slider_scrollvalue)(fl_Hor_Slider slider, int pos,int size,int first,int total);
  FL_EXPORT_C(float, Fl_Hor_Slider_set_slider_size)(fl_Hor_Slider slider);
  FL_EXPORT_C(void, Fl_Hor_Slider_slider_size)(fl_Hor_Slider slider, double v);
  FL_EXPORT_C(Fl_Boxtype, Fl_Hor_Slider_slider)(fl_Hor_Slider slider);
  FL_EXPORT_C(void, Fl_Hor_Slider_set_slider)(fl_Hor_Slider slider, Fl_Boxtype c);
#ifdef __cplusplus
}
#endif
#endif /* __FL_HOR_SLIDER_C__ */
