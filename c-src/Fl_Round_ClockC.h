#ifndef __FL_ROUND_CLOCK_C__
#define __FL_ROUND_CLOCK_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Round_Clock.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Round_Clock_handle)(fl_Round_Clock self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Round_Clock_parent)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_parent)(fl_Round_Clock round_clock, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Round_Clock_type)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_type)(fl_Round_Clock round_clock, uchar t);

  FL_EXPORT_C(int,          Fl_Round_Clock_x)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_y)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_w)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_h)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_align)(fl_Round_Clock round_clock, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Round_Clock_align)(fl_Round_Clock round_clock);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Round_Clock_box)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_box)(fl_Round_Clock round_clock, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Round_Clock_color)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_color)(fl_Round_Clock round_clock, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_color_with_bg_sel)(fl_Round_Clock round_clock,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Round_Clock_selection_color)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_selection_color)(fl_Round_Clock round_clock, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Round_Clock_label)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_copy_label)(fl_Round_Clock round_clock, const char* new_label);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_label)(fl_Round_Clock round_clock, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Round_Clock_labeltype)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_labeltype)(fl_Round_Clock round_clock, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Round_Clock_labelcolor)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_labelcolor)(fl_Round_Clock round_clock, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Round_Clock_labelfont)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_labelfont)(fl_Round_Clock round_clock, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Round_Clock_labelsize)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_labelsize)(fl_Round_Clock round_clock, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Round_Clock_image)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_image)(fl_Round_Clock round_clock, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Round_Clock_deimage)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_deimage)(fl_Round_Clock round_clock, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Round_Clock_tooltip)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_copy_tooltip)(fl_Round_Clock round_clock, const char* text);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_tooltip)(fl_Round_Clock round_clock, const char* text);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_callback_with_user_data)(fl_Round_Clock round_clock, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_callback)(fl_Round_Clock round_clock, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Round_Clock_user_data)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_user_data)(fl_Round_Clock round_clock, void* v);
  FL_EXPORT_C(long,         Fl_Round_Clock_argument)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_argument)(fl_Round_Clock round_clock, long v);
  FL_EXPORT_C(Fl_When,      Fl_Round_Clock_when)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_when)(fl_Round_Clock round_clock, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Round_Clock_visible)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_visible_r)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_visible)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_visible)(fl_Round_Clock round_clock);
  FL_EXPORT_C(unsigned int, Fl_Round_Clock_active)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_active_r)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_activate)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_deactivate)(fl_Round_Clock round_clock);
  FL_EXPORT_C(unsigned int, Fl_Round_Clock_output)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_output)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_output)(fl_Round_Clock round_clock);
  FL_EXPORT_C(unsigned int, Fl_Round_Clock_takesevents)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_changed)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_changed)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int,          Fl_Round_Clock_take_focus)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_set_visible_focus)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_visible_focus)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_modify_visible_focus)(fl_Round_Clock round_clock, int v);
  FL_EXPORT_C(unsigned int, Fl_Round_Clock_visible_focus)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_do_callback)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_do_callback_with_widget_and_user_data)(fl_Round_Clock round_clock, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Round_Clock_do_callback_with_widget_and_default_user_data)(fl_Round_Clock round_clock, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Round_Clock_contains)(fl_Round_Clock round_clock, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Round_Clock_inside)(fl_Round_Clock round_clock, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Round_Clock_redraw)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_redraw_label)(fl_Round_Clock round_clock);
  FL_EXPORT_C(uchar,        Fl_Round_Clock_damage)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_damage_with_bitmask)(fl_Round_Clock round_clock, uchar c);
  FL_EXPORT_C(void,         Fl_Round_Clock_clear_damage)(fl_Round_Clock round_clock);
  FL_EXPORT_C(void,         Fl_Round_Clock_damage_with_text)(fl_Round_Clock round_clock, uchar c);
  FL_EXPORT_C(void,         Fl_Round_Clock_damage_inside_widget)(fl_Round_Clock round_clock, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Round_Clock_draw_label_with_xywh_alignment)(fl_Round_Clock round_clock, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Round_Clock_measure_label)(fl_Round_Clock round_clock, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Round_Clock_window)(fl_Round_Clock round_clock);
  FL_EXPORT_C(fl_Window,    Fl_Round_Clock_top_window)(fl_Round_Clock round_clock);
  FL_EXPORT_C(fl_Window ,   Fl_Round_Clock_top_window_offset)(fl_Round_Clock round_clock, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Round_Clock_as_group)(fl_Round_Clock round_clock);
  FL_EXPORT_C(fl_Gl_Window, Fl_Round_Clock_as_gl_window)(fl_Round_Clock round_clock);
  /* Fl_Round_Clock specific functions */
  FL_EXPORT_C(fl_Round_Clock,    Fl_Round_Clock_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Round_Clock,    Fl_Round_Clock_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Round_Clock_set_value)(fl_Round_Clock round_clock, ulong v);
  FL_EXPORT_C(void, Fl_Round_Clock_set_value_with_hms)(fl_Round_Clock round_clock, int H, int m, int s);
  FL_EXPORT_C(ulong, Fl_Round_Clock_value)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int, Fl_Round_Clock_hour)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int, Fl_Round_Clock_minute)(fl_Round_Clock round_clock);
  FL_EXPORT_C(int, Fl_Round_Clock_second)(fl_Round_Clock round_clock);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_ROUND_CLOCK_C__*/
