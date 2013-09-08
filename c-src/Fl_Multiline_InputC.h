#ifndef __FL_MULTILINE_INPUT_C__
#define __FL_MULTILINE_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Multiline_Input.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Multiline_Input_handle)(fl_Multiline_Input self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Multiline_Input_parent)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_parent)(fl_Multiline_Input multiline_input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Multiline_Input_type)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_type)(fl_Multiline_Input multiline_input, uchar t);

  FL_EXPORT_C(int,          Fl_Multiline_Input_x)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_y)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_w)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_h)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_align)(fl_Multiline_Input multiline_input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Multiline_Input_align)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Multiline_Input_box)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_box)(fl_Multiline_Input multiline_input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Input_color)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_color)(fl_Multiline_Input multiline_input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_color_with_bg_sel)(fl_Multiline_Input multiline_input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Input_selection_color)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_selection_color)(fl_Multiline_Input multiline_input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Multiline_Input_label)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_copy_label)(fl_Multiline_Input multiline_input, const char* new_label);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_label)(fl_Multiline_Input multiline_input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Multiline_Input_labeltype)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_labeltype)(fl_Multiline_Input multiline_input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Input_labelcolor)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_labelcolor)(fl_Multiline_Input multiline_input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Multiline_Input_labelfont)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_labelfont)(fl_Multiline_Input multiline_input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Multiline_Input_labelsize)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_labelsize)(fl_Multiline_Input multiline_input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Multiline_Input_image)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_image)(fl_Multiline_Input multiline_input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Multiline_Input_deimage)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_deimage)(fl_Multiline_Input multiline_input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Multiline_Input_tooltip)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_copy_tooltip)(fl_Multiline_Input multiline_input, const char* text);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_tooltip)(fl_Multiline_Input multiline_input, const char* text);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_callback_with_user_data)(fl_Multiline_Input multiline_input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_callback)(fl_Multiline_Input multiline_input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Multiline_Input_user_data)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_user_data)(fl_Multiline_Input multiline_input, void* v);
  FL_EXPORT_C(long,         Fl_Multiline_Input_argument)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_argument)(fl_Multiline_Input multiline_input, long v);
  FL_EXPORT_C(Fl_When,      Fl_Multiline_Input_when)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_when)(fl_Multiline_Input multiline_input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Input_visible)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_visible_r)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_visible)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_visible)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Input_active)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_active_r)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_activate)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_deactivate)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Input_output)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_output)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_output)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Input_takesevents)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_changed)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_changed)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_take_focus)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_visible_focus)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_visible_focus)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_modify_visible_focus)(fl_Multiline_Input multiline_input, int v);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Input_visible_focus)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_do_callback)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_do_callback_with_widget_and_user_data)(fl_Multiline_Input multiline_input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Multiline_Input_do_callback_with_widget_and_default_user_data)(fl_Multiline_Input multiline_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Multiline_Input_contains)(fl_Multiline_Input multiline_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Multiline_Input_inside)(fl_Multiline_Input multiline_input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Multiline_Input_redraw)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_redraw_label)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(uchar,        Fl_Multiline_Input_damage)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_damage_with_bitmask)(fl_Multiline_Input multiline_input, uchar c);
  FL_EXPORT_C(void,         Fl_Multiline_Input_clear_damage)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_damage_with_text)(fl_Multiline_Input multiline_input, uchar c);
  FL_EXPORT_C(void,         Fl_Multiline_Input_damage_inside_widget)(fl_Multiline_Input multiline_input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Multiline_Input_draw_label_with_xywh_alignment)(fl_Multiline_Input multiline_input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Multiline_Input_measure_label)(fl_Multiline_Input multiline_input, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Multiline_Input_window)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(fl_Window,    Fl_Multiline_Input_top_window)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(fl_Window ,   Fl_Multiline_Input_top_window_offset)(fl_Multiline_Input multiline_input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Multiline_Input_as_group)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Multiline_Input_as_gl_window)(fl_Multiline_Input multiline_input);
  /* Fl_Multiline_Input specific functions */
  FL_EXPORT_C(int,      Fl_Multiline_Input_handle)(fl_Multiline_Input multiline_input, int event);
  FL_EXPORT_C(fl_Float_Input, Fl_Multiline_Input_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Float_Input, Fl_Multiline_Input_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,     Fl_Multiline_Input_Destroy)(fl_Multiline_Input multiline_input);

  FL_EXPORT_C(void,         Fl_Multiline_Input_resize)(fl_Multiline_Input multiline_input, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_value)(fl_Multiline_Input multiline_input, const char*);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_value_with_length)(fl_Multiline_Input multiline_input, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Multiline_Input_static_value)(fl_Multiline_Input multiline_input, const char* text);
  FL_EXPORT_C(int,          Fl_Multiline_Input_static_value_with_length)(fl_Multiline_Input multiline_input, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Multiline_Input_value)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(Fl_Char,      Fl_Multiline_Input_index)(fl_Multiline_Input multiline_input, int i);
  FL_EXPORT_C(int,          Fl_Multiline_Input_size)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_size)(fl_Multiline_Input multiline_input, int W, int H);
  FL_EXPORT_C(int,          Fl_Multiline_Input_maximum_size)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_maximum_size)(fl_Multiline_Input multiline_input, int m);
  FL_EXPORT_C(int,          Fl_Multiline_Input_position)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_mark)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_position_with_cursor_mark)(fl_Multiline_Input multiline_input,int p, int m);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_position_n_n)(fl_Multiline_Input multiline_input,int p);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_mark)(fl_Multiline_Input multiline_input,int m);
  FL_EXPORT_C(int,          Fl_Multiline_Input_replace)(fl_Multiline_Input multiline_input,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Multiline_Input_replace_with_ilen)(fl_Multiline_Input multiline_input,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Multiline_Input_cut)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_cut_bytes)(fl_Multiline_Input multiline_input,int n);
  FL_EXPORT_C(int,          Fl_Multiline_Input_cut_range)(fl_Multiline_Input multiline_input,int a, int b);
  FL_EXPORT_C(int,          Fl_Multiline_Input_insert)(fl_Multiline_Input multiline_input,const char* t);
  FL_EXPORT_C(int,          Fl_Multiline_Input_insert_with_length)(fl_Multiline_Input multiline_input,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Multiline_Input_copy)(fl_Multiline_Input multiline_input,int clipboard);
  FL_EXPORT_C(int,          Fl_Multiline_Input_undo)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_copy_cuts)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(int,          Fl_Multiline_Input_shortcut)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_shortcut)(fl_Multiline_Input multiline_input,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Multiline_Input_textfont)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_textfont)(fl_Multiline_Input multiline_input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Multiline_Input_textsize)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_textsize)(fl_Multiline_Input multiline_input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Input_textcolor)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_textcolor)(fl_Multiline_Input multiline_input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Input_cursor_color)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_cursor_color)(fl_Multiline_Input multiline_input,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Multiline_Input_input_type)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_input_type)(fl_Multiline_Input multiline_input,int t);
  FL_EXPORT_C(int,          Fl_Multiline_Input_readonly)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_readonly)(fl_Multiline_Input multiline_input,int b);
  FL_EXPORT_C(int,          Fl_Multiline_Input_wrap)(fl_Multiline_Input multiline_input);
  FL_EXPORT_C(void,         Fl_Multiline_Input_set_wrap)(fl_Multiline_Input multiline_input,int b);
  FL_EXPORT_C(void,         Fl_Multiline_Input_tab_nav)(fl_Multiline_Input multiline_input,int val);
  FL_EXPORT_C(int,          Fl_Multiline_Input_set_tab_nav)(fl_Multiline_Input multiline_input);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_MULTILINE_INPUT_C__*/
