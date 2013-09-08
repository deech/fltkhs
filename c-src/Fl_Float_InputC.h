#ifndef __FL_FLOAT_INPUT_C__
#define __FL_FLOAT_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Float_Input.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Float_Input_handle)(fl_Float_Input self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Float_Input_parent)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_parent)(fl_Float_Input float_input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Float_Input_type)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_type)(fl_Float_Input float_input, uchar t);

  FL_EXPORT_C(int,          Fl_Float_Input_x)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_y)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_w)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_h)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_align)(fl_Float_Input float_input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,         Fl_Float_Input_align)(fl_Float_Input float_input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Float_Input_box)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_box)(fl_Float_Input float_input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Float_Input_color)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_color)(fl_Float_Input float_input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Float_Input_set_color_with_bg_sel)(fl_Float_Input float_input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Float_Input_selection_color)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_selection_color)(fl_Float_Input float_input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Float_Input_label)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_copy_label)(fl_Float_Input float_input, const char* new_label);
  FL_EXPORT_C(void,         Fl_Float_Input_set_label)(fl_Float_Input float_input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Float_Input_labeltype)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_labeltype)(fl_Float_Input float_input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Float_Input_labelcolor)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_labelcolor)(fl_Float_Input float_input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Float_Input_labelfont)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_labelfont)(fl_Float_Input float_input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Float_Input_labelsize)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_labelsize)(fl_Float_Input float_input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Float_Input_image)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_image)(fl_Float_Input float_input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Float_Input_deimage)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_deimage)(fl_Float_Input float_input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Float_Input_tooltip)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_copy_tooltip)(fl_Float_Input float_input, const char* text);
  FL_EXPORT_C(void,         Fl_Float_Input_set_tooltip)(fl_Float_Input float_input, const char* text);
  FL_EXPORT_C(void,         Fl_Float_Input_set_callback_with_user_data)(fl_Float_Input float_input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Float_Input_set_callback)(fl_Float_Input float_input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Float_Input_user_data)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_user_data)(fl_Float_Input float_input, void* v);
  FL_EXPORT_C(long,         Fl_Float_Input_argument)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_argument)(fl_Float_Input float_input, long v);
  FL_EXPORT_C(Fl_When,      Fl_Float_Input_when)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_when)(fl_Float_Input float_input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Float_Input_visible)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_visible_r)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_visible)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_visible)(fl_Float_Input float_input);
  FL_EXPORT_C(unsigned int, Fl_Float_Input_active)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_active_r)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_activate)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_deactivate)(fl_Float_Input float_input);
  FL_EXPORT_C(unsigned int, Fl_Float_Input_output)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_output)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_output)(fl_Float_Input float_input);
  FL_EXPORT_C(unsigned int, Fl_Float_Input_takesevents)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_changed)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_changed)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_take_focus)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_visible_focus)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_visible_focus)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_modify_visible_focus)(fl_Float_Input float_input, int v);
  FL_EXPORT_C(unsigned int, Fl_Float_Input_visible_focus)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_do_callback)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_do_callback_with_widget_and_user_data)(fl_Float_Input float_input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Float_Input_do_callback_with_widget_and_default_user_data)(fl_Float_Input float_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Float_Input_contains)(fl_Float_Input float_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Float_Input_inside)(fl_Float_Input float_input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Float_Input_redraw)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_redraw_label)(fl_Float_Input float_input);
  FL_EXPORT_C(uchar,        Fl_Float_Input_damage)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_damage_with_bitmask)(fl_Float_Input float_input, uchar c);
  FL_EXPORT_C(void,         Fl_Float_Input_clear_damage)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_damage_with_text)(fl_Float_Input float_input, uchar c);
  FL_EXPORT_C(void,         Fl_Float_Input_damage_inside_widget)(fl_Float_Input float_input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Float_Input_draw_label_with_xywh_alignment)(fl_Float_Input float_input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Float_Input_measure_label)(fl_Float_Input float_input, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Float_Input_window)(fl_Float_Input float_input);
  FL_EXPORT_C(fl_Window,    Fl_Float_Input_top_window)(fl_Float_Input float_input);
  FL_EXPORT_C(fl_Window ,   Fl_Float_Input_top_window_offset)(fl_Float_Input float_input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Float_Input_as_group)(fl_Float_Input float_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Float_Input_as_gl_window)(fl_Float_Input float_input);
  /* Fl_Float_Input specific functions */
  FL_EXPORT_C(int,      Fl_Float_Input_handle)(fl_Float_Input float_input, int event);
  FL_EXPORT_C(fl_Float_Input, Fl_Float_Input_New_WithLabel)(int x, int y, int w, int h, const char* label); 
  FL_EXPORT_C(fl_Float_Input, Fl_Float_Input_New)(int x, int y, int w, int h); 
  FL_EXPORT_C(void,     Fl_Float_Input_Destroy)(fl_Float_Input float_input);
  
  FL_EXPORT_C(void,         Fl_Float_Input_resize)(fl_Float_Input float_input, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Float_Input_set_value)(fl_Float_Input float_input, const char*);
  FL_EXPORT_C(int,          Fl_Float_Input_set_value_with_length)(fl_Float_Input float_input, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Float_Input_static_value)(fl_Float_Input float_input, const char* text);
  FL_EXPORT_C(int,          Fl_Float_Input_static_value_with_length)(fl_Float_Input float_input, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Float_Input_value)(fl_Float_Input float_input);
  FL_EXPORT_C(Fl_Char,      Fl_Float_Input_index)(fl_Float_Input float_input, int i);
  FL_EXPORT_C(int,          Fl_Float_Input_size)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_size)(fl_Float_Input float_input, int W, int H);
  FL_EXPORT_C(int,          Fl_Float_Input_maximum_size)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_maximum_size)(fl_Float_Input float_input, int m);
  FL_EXPORT_C(int,          Fl_Float_Input_position)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_mark)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_set_position_with_cursor_mark)(fl_Float_Input float_input,int p, int m);
  FL_EXPORT_C(int,          Fl_Float_Input_set_position_n_n)(fl_Float_Input float_input,int p);
  FL_EXPORT_C(int,          Fl_Float_Input_set_mark)(fl_Float_Input float_input,int m);
  FL_EXPORT_C(int,          Fl_Float_Input_replace)(fl_Float_Input float_input,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Float_Input_replace_with_ilen)(fl_Float_Input float_input,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Float_Input_cut)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_cut_bytes)(fl_Float_Input float_input,int n);
  FL_EXPORT_C(int,          Fl_Float_Input_cut_range)(fl_Float_Input float_input,int a, int b);
  FL_EXPORT_C(int,          Fl_Float_Input_insert)(fl_Float_Input float_input,const char* t);
  FL_EXPORT_C(int,          Fl_Float_Input_insert_with_length)(fl_Float_Input float_input,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Float_Input_copy)(fl_Float_Input float_input,int clipboard);
  FL_EXPORT_C(int,          Fl_Float_Input_undo)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_copy_cuts)(fl_Float_Input float_input);
  FL_EXPORT_C(int,          Fl_Float_Input_shortcut)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_shortcut)(fl_Float_Input float_input,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Float_Input_textfont)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_textfont)(fl_Float_Input float_input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Float_Input_textsize)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_textsize)(fl_Float_Input float_input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Float_Input_textcolor)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_textcolor)(fl_Float_Input float_input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Float_Input_cursor_color)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_cursor_color)(fl_Float_Input float_input,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Float_Input_input_type)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_input_type)(fl_Float_Input float_input,int t);
  FL_EXPORT_C(int,          Fl_Float_Input_readonly)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_readonly)(fl_Float_Input float_input,int b);
  FL_EXPORT_C(int,          Fl_Float_Input_wrap)(fl_Float_Input float_input);
  FL_EXPORT_C(void,         Fl_Float_Input_set_wrap)(fl_Float_Input float_input,int b);
  FL_EXPORT_C(void,         Fl_Float_Input_tab_nav)(fl_Float_Input float_input,int val);
  FL_EXPORT_C(int,          Fl_Float_Input_set_tab_nav)(fl_Float_Input float_input);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_FLOAT_INPUT_C__*/
