#ifndef __FL_LINE_DIAL_C__
#define __FL_LINE_DIAL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Line_Dial is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Line_Dial.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Group,     Fl_Line_Dial_parent)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_parent)(fl_Line_Dial line_dial, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Line_Dial_type)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_type)(fl_Line_Dial line_dial, uchar t);

  FL_EXPORT_C(int,          Fl_Line_Dial_x)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_y)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_w)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_h)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_align)(fl_Line_Dial line_dial, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Line_Dial_align)(fl_Line_Dial line_dial);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Line_Dial_box)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_box)(fl_Line_Dial line_dial, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Line_Dial_color)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_color)(fl_Line_Dial line_dial, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_color_with_bg_sel)(fl_Line_Dial line_dial,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Line_Dial_selection_color)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_selection_color)(fl_Line_Dial line_dial, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Line_Dial_label)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_copy_label)(fl_Line_Dial line_dial, const char* new_label);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_label)(fl_Line_Dial line_dial, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Line_Dial_labeltype)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_labeltype)(fl_Line_Dial line_dial, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Line_Dial_labelcolor)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_labelcolor)(fl_Line_Dial line_dial, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Line_Dial_labelfont)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_labelfont)(fl_Line_Dial line_dial, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Line_Dial_labelsize)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_labelsize)(fl_Line_Dial line_dial, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Line_Dial_image)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_image)(fl_Line_Dial line_dial, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Line_Dial_deimage)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_deimage)(fl_Line_Dial line_dial, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Line_Dial_tooltip)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_copy_tooltip)(fl_Line_Dial line_dial, const char* text);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_tooltip)(fl_Line_Dial line_dial, const char* text);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_callback_with_user_data)(fl_Line_Dial line_dial, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_callback)(fl_Line_Dial line_dial, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Line_Dial_other_data)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_other_data)(fl_Line_Dial line_dial, void* v);
  FL_EXPORT_C(void*,        Fl_Line_Dial_user_data)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_user_data)(fl_Line_Dial line_dial, void* v);
  FL_EXPORT_C(long,         Fl_Line_Dial_argument)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_argument)(fl_Line_Dial line_dial, long v);
  FL_EXPORT_C(Fl_When,      Fl_Line_Dial_when)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_when)(fl_Line_Dial line_dial, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Line_Dial_visible)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_visible_r)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_show)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_hide)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_visible)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_visible)(fl_Line_Dial line_dial);
  FL_EXPORT_C(unsigned int, Fl_Line_Dial_active)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_active_r)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_activate)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_deactivate)(fl_Line_Dial line_dial);
  FL_EXPORT_C(unsigned int, Fl_Line_Dial_output)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_output)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_output)(fl_Line_Dial line_dial);
  FL_EXPORT_C(unsigned int, Fl_Line_Dial_takesevents)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_changed)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_changed)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_take_focus)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_set_visible_focus)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_visible_focus)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_modify_visible_focus)(fl_Line_Dial line_dial, int v);
  FL_EXPORT_C(unsigned int, Fl_Line_Dial_visible_focus)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,          Fl_Line_Dial_contains)(fl_Line_Dial line_dial, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Line_Dial_inside)(fl_Line_Dial line_dial, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Line_Dial_redraw)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_redraw_label)(fl_Line_Dial line_dial);
  FL_EXPORT_C(uchar,        Fl_Line_Dial_damage)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_damage_with_bitmask)(fl_Line_Dial line_dial, uchar c);
  FL_EXPORT_C(void,         Fl_Line_Dial_clear_damage)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_damage_with_text)(fl_Line_Dial line_dial, uchar c);
  FL_EXPORT_C(void,         Fl_Line_Dial_damage_inside_widget)(fl_Line_Dial line_dial, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Line_Dial_draw_label_with_xywh_alignment)(fl_Line_Dial line_dial, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Line_Dial_measure_label)(fl_Line_Dial line_dial, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Line_Dial_window)(fl_Line_Dial line_dial);
  FL_EXPORT_C(fl_Window,    Fl_Line_Dial_top_window)(fl_Line_Dial line_dial);
  FL_EXPORT_C(fl_Window ,   Fl_Line_Dial_top_window_offset)(fl_Line_Dial line_dial, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Line_Dial_as_gl_window)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,         Fl_Line_Dial_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Line_Dial_bounds)(fl_Line_Dial line_dial, double a, double b);
  FL_EXPORT_C(double, Fl_Line_Dial_minimum)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void, Fl_Line_Dial_set_minimum)(fl_Line_Dial line_dial, double a);
  FL_EXPORT_C(double, Fl_Line_Dial_maximum)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void, Fl_Line_Dial_set_maximum)(fl_Line_Dial line_dial, double a);
  FL_EXPORT_C(void, Fl_Line_Dial_range)(fl_Line_Dial line_dial, double a, double b);
  FL_EXPORT_C(void, Fl_Line_Dial_set_step)(fl_Line_Dial line_dial, int a);
  FL_EXPORT_C(void, Fl_Line_Dial_set_step_with_a_b)(fl_Line_Dial line_dial, double a, int b);
  FL_EXPORT_C(void, Fl_Line_Dial_step_with_s)(fl_Line_Dial line_dial, double s);
  FL_EXPORT_C(double, Fl_Line_Dial_step)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void, Fl_Line_Dial_precision)(fl_Line_Dial line_dial, int precision);
  FL_EXPORT_C(double, Fl_Line_Dial_value)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int, Fl_Line_Dial_set_value)(fl_Line_Dial line_dial, double v);
  FL_EXPORT_C(int, Fl_Line_Dial_format)(fl_Line_Dial line_dial, char* format);
  FL_EXPORT_C(double, Fl_Line_Dial_round)(fl_Line_Dial line_dial, double v);
  FL_EXPORT_C(double, Fl_Line_Dial_clamp)(fl_Line_Dial line_dial, double v);
  FL_EXPORT_C(double, Fl_Line_Dial_increment)(fl_Line_Dial line_dial, double v, int n);

  /* Fl_Line_Dial specific */
  FL_EXPORT_C(fl_Line_Dial,    Fl_Line_Dial_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Dial,    Fl_Line_Dial_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(void,      Fl_Line_Dial_Destroy)(fl_Line_Dial line_dial);
  FL_EXPORT_C(void,      Fl_Line_Dial_set_angle1)(fl_Line_Dial line_dial, short a);
  FL_EXPORT_C(void,      Fl_Line_Dial_set_angle2)(fl_Line_Dial line_dial, short a);
  FL_EXPORT_C(short,     Fl_Line_Dial_angle1)(fl_Line_Dial line_dial);
  FL_EXPORT_C(short,     Fl_Line_Dial_angle2)(fl_Line_Dial line_dial);
  FL_EXPORT_C(int,       Fl_Line_Dial_handle)(fl_Line_Dial line_dial, int event);
#ifdef __cplusplus
}
#endif
#endif /* __FL_LINE_DIAL_C__ */
