#ifndef __FL_SECRET_INPUT_C__
#define __FL_SECRET_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Secret_Input.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Secret_Input_handle)(fl_Secret_Input self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Secret_Input_parent)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_parent)(fl_Secret_Input secret_input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Secret_Input_type)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_type)(fl_Secret_Input secret_input, uchar t);

  FL_EXPORT_C(int,          Fl_Secret_Input_x)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_y)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_w)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_h)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_align)(fl_Secret_Input secret_input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Secret_Input_align)(fl_Secret_Input secret_input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Secret_Input_box)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_box)(fl_Secret_Input secret_input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Secret_Input_color)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_color)(fl_Secret_Input secret_input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_color_with_bg_sel)(fl_Secret_Input secret_input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Secret_Input_selection_color)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_selection_color)(fl_Secret_Input secret_input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Secret_Input_label)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_copy_label)(fl_Secret_Input secret_input, const char* new_label);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_label)(fl_Secret_Input secret_input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Secret_Input_labeltype)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_labeltype)(fl_Secret_Input secret_input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Secret_Input_labelcolor)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_labelcolor)(fl_Secret_Input secret_input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Secret_Input_labelfont)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_labelfont)(fl_Secret_Input secret_input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Secret_Input_labelsize)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_labelsize)(fl_Secret_Input secret_input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Secret_Input_image)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_image)(fl_Secret_Input secret_input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Secret_Input_deimage)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_deimage)(fl_Secret_Input secret_input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Secret_Input_tooltip)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_copy_tooltip)(fl_Secret_Input secret_input, const char* text);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_tooltip)(fl_Secret_Input secret_input, const char* text);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_callback_with_user_data)(fl_Secret_Input secret_input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_callback)(fl_Secret_Input secret_input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Secret_Input_user_data)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_user_data)(fl_Secret_Input secret_input, void* v);
  FL_EXPORT_C(long,         Fl_Secret_Input_argument)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_argument)(fl_Secret_Input secret_input, long v);
  FL_EXPORT_C(Fl_When,      Fl_Secret_Input_when)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_when)(fl_Secret_Input secret_input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Secret_Input_visible)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_visible_r)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_visible)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_visible)(fl_Secret_Input secret_input);
  FL_EXPORT_C(unsigned int, Fl_Secret_Input_active)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_active_r)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_activate)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_deactivate)(fl_Secret_Input secret_input);
  FL_EXPORT_C(unsigned int, Fl_Secret_Input_output)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_output)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_output)(fl_Secret_Input secret_input);
  FL_EXPORT_C(unsigned int, Fl_Secret_Input_takesevents)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_changed)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_changed)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_take_focus)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_visible_focus)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_visible_focus)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_modify_visible_focus)(fl_Secret_Input secret_input, int v);
  FL_EXPORT_C(unsigned int, Fl_Secret_Input_visible_focus)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_do_callback)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_do_callback_with_widget_and_user_data)(fl_Secret_Input secret_input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Secret_Input_do_callback_with_widget_and_default_user_data)(fl_Secret_Input secret_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Secret_Input_contains)(fl_Secret_Input secret_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Secret_Input_inside)(fl_Secret_Input secret_input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Secret_Input_redraw)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_redraw_label)(fl_Secret_Input secret_input);
  FL_EXPORT_C(uchar,        Fl_Secret_Input_damage)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_damage_with_bitmask)(fl_Secret_Input secret_input, uchar c);
  FL_EXPORT_C(void,         Fl_Secret_Input_clear_damage)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_damage_with_text)(fl_Secret_Input secret_input, uchar c);
  FL_EXPORT_C(void,         Fl_Secret_Input_damage_inside_widget)(fl_Secret_Input secret_input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Secret_Input_draw_label_with_xywh_alignment)(fl_Secret_Input secret_input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Secret_Input_measure_label)(fl_Secret_Input secret_input, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Secret_Input_window)(fl_Secret_Input secret_input);
  FL_EXPORT_C(fl_Window,    Fl_Secret_Input_top_window)(fl_Secret_Input secret_input);
  FL_EXPORT_C(fl_Window ,   Fl_Secret_Input_top_window_offset)(fl_Secret_Input secret_input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Secret_Input_as_group)(fl_Secret_Input secret_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Secret_Input_as_gl_window)(fl_Secret_Input secret_input);
  /* Fl_Secret_Input specific functions */
  FL_EXPORT_C(int,      Fl_Secret_Input_handle)(fl_Secret_Input secret_input, int event);
  FL_EXPORT_C(fl_Float_Input, Fl_Secret_Input_New_WithLabel)(int x, int y, int w, int h, const char* label); 
  FL_EXPORT_C(fl_Float_Input, Fl_Secret_Input_New)(int x, int y, int w, int h); 
  FL_EXPORT_C(void,     Fl_Secret_Input_Destroy)(fl_Secret_Input secret_input);
  
  FL_EXPORT_C(void,         Fl_Secret_Input_resize)(fl_Secret_Input secret_input, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_value)(fl_Secret_Input secret_input, const char*);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_value_with_length)(fl_Secret_Input secret_input, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Secret_Input_static_value)(fl_Secret_Input secret_input, const char* text);
  FL_EXPORT_C(int,          Fl_Secret_Input_static_value_with_length)(fl_Secret_Input secret_input, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Secret_Input_value)(fl_Secret_Input secret_input);
  FL_EXPORT_C(Fl_Char,      Fl_Secret_Input_index)(fl_Secret_Input secret_input, int i);
  FL_EXPORT_C(int,          Fl_Secret_Input_size)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_size)(fl_Secret_Input secret_input, int W, int H);
  FL_EXPORT_C(int,          Fl_Secret_Input_maximum_size)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_maximum_size)(fl_Secret_Input secret_input, int m);
  FL_EXPORT_C(int,          Fl_Secret_Input_position)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_mark)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_position_with_cursor_mark)(fl_Secret_Input secret_input,int p, int m);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_position_n_n)(fl_Secret_Input secret_input,int p);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_mark)(fl_Secret_Input secret_input,int m);
  FL_EXPORT_C(int,          Fl_Secret_Input_replace)(fl_Secret_Input secret_input,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Secret_Input_replace_with_ilen)(fl_Secret_Input secret_input,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Secret_Input_cut)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_cut_bytes)(fl_Secret_Input secret_input,int n);
  FL_EXPORT_C(int,          Fl_Secret_Input_cut_range)(fl_Secret_Input secret_input,int a, int b);
  FL_EXPORT_C(int,          Fl_Secret_Input_insert)(fl_Secret_Input secret_input,const char* t);
  FL_EXPORT_C(int,          Fl_Secret_Input_insert_with_length)(fl_Secret_Input secret_input,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Secret_Input_copy)(fl_Secret_Input secret_input,int clipboard);
  FL_EXPORT_C(int,          Fl_Secret_Input_undo)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_copy_cuts)(fl_Secret_Input secret_input);
  FL_EXPORT_C(int,          Fl_Secret_Input_shortcut)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_shortcut)(fl_Secret_Input secret_input,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Secret_Input_textfont)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_textfont)(fl_Secret_Input secret_input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Secret_Input_textsize)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_textsize)(fl_Secret_Input secret_input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Secret_Input_textcolor)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_textcolor)(fl_Secret_Input secret_input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Secret_Input_cursor_color)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_cursor_color)(fl_Secret_Input secret_input,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Secret_Input_input_type)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_input_type)(fl_Secret_Input secret_input,int t);
  FL_EXPORT_C(int,          Fl_Secret_Input_readonly)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_readonly)(fl_Secret_Input secret_input,int b);
  FL_EXPORT_C(int,          Fl_Secret_Input_wrap)(fl_Secret_Input secret_input);
  FL_EXPORT_C(void,         Fl_Secret_Input_set_wrap)(fl_Secret_Input secret_input,int b);
  FL_EXPORT_C(void,         Fl_Secret_Input_tab_nav)(fl_Secret_Input secret_input,int val);
  FL_EXPORT_C(int,          Fl_Secret_Input_set_tab_nav)(fl_Secret_Input secret_input);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_SECRET_INPUT_C__*/
