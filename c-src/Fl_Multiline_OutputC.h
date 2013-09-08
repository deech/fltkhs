#ifndef __FL_MULTILINE_OUTPUT_C__
#define __FL_MULTILINE_OUTPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Multiline_Output.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Multiline_Output_handle)(fl_Multiline_Output self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Multiline_Output_parent)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_parent)(fl_Multiline_Output multiline_output, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Multiline_Output_type)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_type)(fl_Multiline_Output multiline_output, uchar t);

  FL_EXPORT_C(int,          Fl_Multiline_Output_x)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_y)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_w)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_h)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_align)(fl_Multiline_Output multiline_output, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Multiline_Output_align)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Multiline_Output_box)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_box)(fl_Multiline_Output multiline_output, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Output_color)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_color)(fl_Multiline_Output multiline_output, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_color_with_bg_sel)(fl_Multiline_Output multiline_output,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Output_selection_color)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_selection_color)(fl_Multiline_Output multiline_output, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Multiline_Output_label)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_copy_label)(fl_Multiline_Output multiline_output, const char* new_label);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_label)(fl_Multiline_Output multiline_output, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Multiline_Output_labeltype)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_labeltype)(fl_Multiline_Output multiline_output, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Output_labelcolor)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_labelcolor)(fl_Multiline_Output multiline_output, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Multiline_Output_labelfont)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_labelfont)(fl_Multiline_Output multiline_output, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Multiline_Output_labelsize)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_labelsize)(fl_Multiline_Output multiline_output, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Multiline_Output_image)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_image)(fl_Multiline_Output multiline_output, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Multiline_Output_deimage)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_deimage)(fl_Multiline_Output multiline_output, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Multiline_Output_tooltip)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_copy_tooltip)(fl_Multiline_Output multiline_output, const char* text);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_tooltip)(fl_Multiline_Output multiline_output, const char* text);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_callback_with_user_data)(fl_Multiline_Output multiline_output, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_callback)(fl_Multiline_Output multiline_output, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Multiline_Output_user_data)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_user_data)(fl_Multiline_Output multiline_output, void* v);
  FL_EXPORT_C(long,         Fl_Multiline_Output_argument)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_argument)(fl_Multiline_Output multiline_output, long v);
  FL_EXPORT_C(Fl_When,      Fl_Multiline_Output_when)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_when)(fl_Multiline_Output multiline_output, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Output_visible)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_visible_r)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_visible)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_visible)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Output_active)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_active_r)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_activate)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_deactivate)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Output_multiline_output)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_multiline_output)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_multiline_output)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Output_takesevents)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_changed)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_changed)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_take_focus)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_visible_focus)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_visible_focus)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_modify_visible_focus)(fl_Multiline_Output multiline_output, int v);
  FL_EXPORT_C(unsigned int, Fl_Multiline_Output_visible_focus)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_do_callback)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_do_callback_with_widget_and_user_data)(fl_Multiline_Output multiline_output, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Multiline_Output_do_callback_with_widget_and_default_user_data)(fl_Multiline_Output multiline_output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Multiline_Output_contains)(fl_Multiline_Output multiline_output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Multiline_Output_inside)(fl_Multiline_Output multiline_output, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Multiline_Output_redraw)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_redraw_label)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(uchar,        Fl_Multiline_Output_damage)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_damage_with_bitmask)(fl_Multiline_Output multiline_output, uchar c);
  FL_EXPORT_C(void,         Fl_Multiline_Output_clear_damage)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_damage_with_text)(fl_Multiline_Output multiline_output, uchar c);
  FL_EXPORT_C(void,         Fl_Multiline_Output_damage_inside_widget)(fl_Multiline_Output multiline_output, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Multiline_Output_draw_label_with_xywh_alignment)(fl_Multiline_Output multiline_output, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Multiline_Output_measure_label)(fl_Multiline_Output multiline_output, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Multiline_Output_window)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(fl_Window,    Fl_Multiline_Output_top_window)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(fl_Window ,   Fl_Multiline_Output_top_window_offset)(fl_Multiline_Output multiline_output, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Multiline_Output_as_group)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(fl_Gl_Window, Fl_Multiline_Output_as_gl_window)(fl_Multiline_Output multiline_output);
  /* Fl_Multiline_Output specific functions */
  FL_EXPORT_C(int,      Fl_Multiline_Output_handle)(fl_Multiline_Output multiline_output, int event);
  FL_EXPORT_C(fl_Multiline_Output, Fl_Multiline_Output_New_WithLabel)(int x, int y, int w, int h, const char* label); 
  FL_EXPORT_C(fl_Multiline_Output, Fl_Multiline_Output_New)(int x, int y, int w, int h); 
  FL_EXPORT_C(void,     Fl_Multiline_Output_Destroy)(fl_Multiline_Output multiline_output);
  
  FL_EXPORT_C(void,         Fl_Multiline_Output_resize)(fl_Multiline_Output multiline_output, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_value)(fl_Multiline_Output multiline_output, const char*);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_value_with_length)(fl_Multiline_Output multiline_output, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Multiline_Output_static_value)(fl_Multiline_Output multiline_output, const char* text);
  FL_EXPORT_C(int,          Fl_Multiline_Output_static_value_with_length)(fl_Multiline_Output multiline_output, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Multiline_Output_value)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(Fl_Char,      Fl_Multiline_Output_index)(fl_Multiline_Output multiline_output, int i);
  FL_EXPORT_C(int,          Fl_Multiline_Output_size)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_size)(fl_Multiline_Output multiline_output, int W, int H);
  FL_EXPORT_C(int,          Fl_Multiline_Output_maximum_size)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_maximum_size)(fl_Multiline_Output multiline_output, int m);
  FL_EXPORT_C(int,          Fl_Multiline_Output_position)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_mark)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_position_with_cursor_mark)(fl_Multiline_Output multiline_output,int p, int m);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_position_n_n)(fl_Multiline_Output multiline_output,int p);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_mark)(fl_Multiline_Output multiline_output,int m);
  FL_EXPORT_C(int,          Fl_Multiline_Output_replace)(fl_Multiline_Output multiline_output,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Multiline_Output_replace_with_ilen)(fl_Multiline_Output multiline_output,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Multiline_Output_cut)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_cut_bytes)(fl_Multiline_Output multiline_output,int n);
  FL_EXPORT_C(int,          Fl_Multiline_Output_cut_range)(fl_Multiline_Output multiline_output,int a, int b);
  FL_EXPORT_C(int,          Fl_Multiline_Output_insert)(fl_Multiline_Output multiline_output,const char* t);
  FL_EXPORT_C(int,          Fl_Multiline_Output_insert_with_length)(fl_Multiline_Output multiline_output,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Multiline_Output_copy)(fl_Multiline_Output multiline_output,int clipboard);
  FL_EXPORT_C(int,          Fl_Multiline_Output_undo)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_copy_cuts)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(int,          Fl_Multiline_Output_shortcut)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_shortcut)(fl_Multiline_Output multiline_output,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Multiline_Output_textfont)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_textfont)(fl_Multiline_Output multiline_output,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Multiline_Output_textsize)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_textsize)(fl_Multiline_Output multiline_output,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Output_textcolor)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_textcolor)(fl_Multiline_Output multiline_output,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Multiline_Output_cursor_color)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_cursor_color)(fl_Multiline_Output multiline_output,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Multiline_Output_input_type)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_input_type)(fl_Multiline_Output multiline_output,int t);
  FL_EXPORT_C(int,          Fl_Multiline_Output_readonly)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_readonly)(fl_Multiline_Output multiline_output,int b);
  FL_EXPORT_C(int,          Fl_Multiline_Output_wrap)(fl_Multiline_Output multiline_output);
  FL_EXPORT_C(void,         Fl_Multiline_Output_set_wrap)(fl_Multiline_Output multiline_output,int b);
  FL_EXPORT_C(void,         Fl_Multiline_Output_tab_nav)(fl_Multiline_Output multiline_output,int val);
  FL_EXPORT_C(int,          Fl_Multiline_Output_set_tab_nav)(fl_Multiline_Output multiline_output);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_MULTILINE_OUTPUT_C__*/
