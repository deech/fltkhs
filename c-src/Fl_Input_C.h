#ifndef __FL_INPUT__C__
#define __FL_INPUT__C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Input_.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
#ifndef INTERNAL_LINKAGE
 #define FL_NORMAL_INPUT		0
 #define FL_FLOAT_INPUT		1
 #define FL_INT_INPUT		2
 #define FL_HIDDEN_INPUT		3
 #define FL_MULTILINE_INPUT	4
 #define FL_SECRET_INPUT		5
 #define FL_INPUT_READONLY	8
 #define FL_NORMAL_OUTPUT	(FL_NORMAL_INPUT | FL_INPUT_READONLY)
 #define FL_MULTILINE_OUTPUT	(FL_MULTILINE_INPUT | FL_INPUT_READONLY)
#endif /* INTERNAL_LINKAGE */
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Input__handle)(fl_Input_ self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Input__parent)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_parent)(fl_Input_ input_, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Input__type)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_type)(fl_Input_ input_, uchar t);

  FL_EXPORT_C(int,          Fl_Input__x)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__y)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__w)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__h)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_align)(fl_Input_ input_, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Input__align)(fl_Input_ input_);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Input__box)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_box)(fl_Input_ input_, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Input__color)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_color)(fl_Input_ input_, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Input__set_color_with_bg_sel)(fl_Input_ input_,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Input__selection_color)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_selection_color)(fl_Input_ input_, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Input__label)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__copy_label)(fl_Input_ input_, const char* new_label);
  FL_EXPORT_C(void,         Fl_Input__set_label)(fl_Input_ input_, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Input__labeltype)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_labeltype)(fl_Input_ input_, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Input__labelcolor)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_labelcolor)(fl_Input_ input_, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Input__labelfont)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_labelfont)(fl_Input_ input_, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Input__labelsize)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_labelsize)(fl_Input_ input_, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Input__image)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_image)(fl_Input_ input_, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Input__deimage)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_deimage)(fl_Input_ input_, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Input__tooltip)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__copy_tooltip)(fl_Input_ input_, const char* text);
  FL_EXPORT_C(void,         Fl_Input__set_tooltip)(fl_Input_ input_, const char* text);
  FL_EXPORT_C(void,         Fl_Input__set_callback_with_user_data)(fl_Input_ input_, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Input__set_callback)(fl_Input_ input_, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Input__user_data)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_user_data)(fl_Input_ input_, void* v);
  FL_EXPORT_C(long,         Fl_Input__argument)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_argument)(fl_Input_ input_, long v);
  FL_EXPORT_C(Fl_When,      Fl_Input__when)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_when)(fl_Input_ input_, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Input__visible)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__visible_r)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_visible)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__clear_visible)(fl_Input_ input_);
  FL_EXPORT_C(unsigned int, Fl_Input__active)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__active_r)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__activate)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__deactivate)(fl_Input_ input_);
  FL_EXPORT_C(unsigned int, Fl_Input__output)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_output)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__clear_output)(fl_Input_ input_);
  FL_EXPORT_C(unsigned int, Fl_Input__takesevents)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_changed)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__clear_changed)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__take_focus)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_visible_focus)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__clear_visible_focus)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__modify_visible_focus)(fl_Input_ input_, int v);
  FL_EXPORT_C(unsigned int, Fl_Input__visible_focus)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__do_callback)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__do_callback_with_widget_and_user_data)(fl_Input_ input_, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Input__do_callback_with_widget_and_default_user_data)(fl_Input_ input_, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Input__contains)(fl_Input_ input_, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Input__inside)(fl_Input_ input_, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Input__redraw)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__redraw_label)(fl_Input_ input_);
  FL_EXPORT_C(uchar,        Fl_Input__damage)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__clear_damage_with_bitmask)(fl_Input_ input_, uchar c);
  FL_EXPORT_C(void,         Fl_Input__clear_damage)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__damage_with_text)(fl_Input_ input_, uchar c);
  FL_EXPORT_C(void,         Fl_Input__damage_inside_widget)(fl_Input_ input_, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Input__draw_label_with_xywh_alignment)(fl_Input_ input_, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Input__measure_label)(fl_Input_ input_, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Input__window)(fl_Input_ input_);
  FL_EXPORT_C(fl_Window,    Fl_Input__top_window)(fl_Input_ input_);
  FL_EXPORT_C(fl_Window ,   Fl_Input__top_window_offset)(fl_Input_ input_, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Input__as_group)(fl_Input_ input_);
  FL_EXPORT_C(fl_Gl_Window, Fl_Input__as_gl_window)(fl_Input_ input_);
  /* Fl_Input_ specific functions */
  FL_EXPORT_C(void,         Fl_Input__resize)(fl_Input_ input_, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Input__set_value)(fl_Input_ input_, const char*);
  FL_EXPORT_C(int,          Fl_Input__set_value_with_length)(fl_Input_ input_, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Input__static_value)(fl_Input_ input_, const char* text);
  FL_EXPORT_C(int,          Fl_Input__static_value_with_length)(fl_Input_ input_, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Input__value)(fl_Input_ input_);
  FL_EXPORT_C(Fl_Char,      Fl_Input__index)(fl_Input_ input_, int i);
  FL_EXPORT_C(int,          Fl_Input__size)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_size)(fl_Input_ input_, int W, int H);
  FL_EXPORT_C(int,          Fl_Input__maximum_size)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_maximum_size)(fl_Input_ input_, int m);
  FL_EXPORT_C(int,          Fl_Input__position)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__mark)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__set_position_with_cursor_mark)(fl_Input_ input_,int p, int m);
  FL_EXPORT_C(int,          Fl_Input__set_position_n_n)(fl_Input_ input_,int p);
  FL_EXPORT_C(int,          Fl_Input__set_mark)(fl_Input_ input_,int m);
  FL_EXPORT_C(int,          Fl_Input__replace)(fl_Input_ input_,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Input__replace_with_ilen)(fl_Input_ input_,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Input__cut)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__cut_bytes)(fl_Input_ input_,int n);
  FL_EXPORT_C(int,          Fl_Input__cut_range)(fl_Input_ input_,int a, int b);
  FL_EXPORT_C(int,          Fl_Input__insert)(fl_Input_ input_,const char* t);
  FL_EXPORT_C(int,          Fl_Input__insert_with_length)(fl_Input_ input_,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Input__copy)(fl_Input_ input_,int clipboard);
  FL_EXPORT_C(int,          Fl_Input__undo)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__copy_cuts)(fl_Input_ input_);
  FL_EXPORT_C(int,          Fl_Input__shortcut)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_shortcut)(fl_Input_ input_,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Input__textfont)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_textfont)(fl_Input_ input_,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Input__textsize)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_textsize)(fl_Input_ input_,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Input__textcolor)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_textcolor)(fl_Input_ input_,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Input__cursor_color)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_cursor_color)(fl_Input_ input_,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Input__input_type)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_input_type)(fl_Input_ input_,int t);
  FL_EXPORT_C(int,          Fl_Input__readonly)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_readonly)(fl_Input_ input_,int b);
  FL_EXPORT_C(int,          Fl_Input__wrap)(fl_Input_ input_);
  FL_EXPORT_C(void,         Fl_Input__set_wrap)(fl_Input_ input_,int b);
  FL_EXPORT_C(void,         Fl_Input__tab_nav)(fl_Input_ input_,int val);
  FL_EXPORT_C(int,          Fl_Input__set_tab_nav)(fl_Input_ input_);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_INPUT__C__*/
