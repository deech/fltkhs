#ifndef __FL_INPUT_C__
#define __FL_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Input.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedInput : public Fl_Input {
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
    Fl_DerivedInput(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedInput(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedInput();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Input_handle)(fl_Input self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Input_parent)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_parent)(fl_Input input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Input_type)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_type)(fl_Input input, uchar t);

  FL_EXPORT_C(int,          Fl_Input_x)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_y)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_w)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_h)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_align)(fl_Input input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Input_align)(fl_Input input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Input_box)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_box)(fl_Input input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Input_color)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_color)(fl_Input input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Input_set_color_with_bg_sel)(fl_Input input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Input_selection_color)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_selection_color)(fl_Input input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Input_label)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_copy_label)(fl_Input input, const char* new_label);
  FL_EXPORT_C(void,         Fl_Input_set_label)(fl_Input input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Input_labeltype)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_labeltype)(fl_Input input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Input_labelcolor)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_labelcolor)(fl_Input input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Input_labelfont)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_labelfont)(fl_Input input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Input_labelsize)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_labelsize)(fl_Input input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Input_image)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_image)(fl_Input input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Input_deimage)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_deimage)(fl_Input input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Input_tooltip)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_copy_tooltip)(fl_Input input, const char* text);
  FL_EXPORT_C(void,         Fl_Input_set_tooltip)(fl_Input input, const char* text);
  FL_EXPORT_C(void,         Fl_Input_set_callback_with_user_data)(fl_Input input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Input_set_callback)(fl_Input input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Input_user_data)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_user_data)(fl_Input input, void* v);
  FL_EXPORT_C(long,         Fl_Input_argument)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_argument)(fl_Input input, long v);
  FL_EXPORT_C(Fl_When,      Fl_Input_when)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_when)(fl_Input input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Input_visible)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_visible_r)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_visible)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_clear_visible)(fl_Input input);
  FL_EXPORT_C(unsigned int, Fl_Input_active)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_active_r)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_activate)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_deactivate)(fl_Input input);
  FL_EXPORT_C(unsigned int, Fl_Input_output)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_output)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_clear_output)(fl_Input input);
  FL_EXPORT_C(unsigned int, Fl_Input_takesevents)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_changed)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_clear_changed)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_take_focus)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_visible_focus)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_clear_visible_focus)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_modify_visible_focus)(fl_Input input, int v);
  FL_EXPORT_C(unsigned int, Fl_Input_visible_focus)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_do_callback)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_do_callback_with_widget_and_user_data)(fl_Input input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Input_do_callback_with_widget_and_default_user_data)(fl_Input input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Input_contains)(fl_Input input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Input_inside)(fl_Input input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Input_redraw)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_redraw_label)(fl_Input input);
  FL_EXPORT_C(uchar,        Fl_Input_damage)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_clear_damage_with_bitmask)(fl_Input input, uchar c);
  FL_EXPORT_C(void,         Fl_Input_clear_damage)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_damage_with_text)(fl_Input input, uchar c);
  FL_EXPORT_C(void,         Fl_Input_damage_inside_widget)(fl_Input input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Input_draw_label_with_xywh_alignment)(fl_Input input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Input_measure_label)(fl_Input input, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Input_window)(fl_Input input);
  FL_EXPORT_C(fl_Window,    Fl_Input_top_window)(fl_Input input);
  FL_EXPORT_C(fl_Window ,   Fl_Input_top_window_offset)(fl_Input input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Input_as_group)(fl_Input input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Input_as_gl_window)(fl_Input input);
  /* Fl_Input specific functions */
  FL_EXPORT_C(int,      Fl_Input_handle)(fl_Input input, int event);
  FL_EXPORT_C(fl_Input, Fl_Input_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Input, Fl_Input_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,     Fl_Input_Destroy)(fl_Input input);

  FL_EXPORT_C(void,         Fl_Input_resize)(fl_Input input, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Input_set_value)(fl_Input input, const char* text);
  FL_EXPORT_C(int,          Fl_Input_set_value_with_length)(fl_Input input, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Input_static_value)(fl_Input input, const char* text);
  FL_EXPORT_C(int,          Fl_Input_static_value_with_length)(fl_Input input, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Input_value)(fl_Input input);
  FL_EXPORT_C(Fl_Char,      Fl_Input_index)(fl_Input input, int i);
  FL_EXPORT_C(int,          Fl_Input_size)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_size)(fl_Input input, int w, int h);
  FL_EXPORT_C(int,          Fl_Input_maximum_size)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_maximum_size)(fl_Input input, int m);
  FL_EXPORT_C(int,          Fl_Input_position)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_mark)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_set_position_with_cursor_mark)(fl_Input input,int p, int m);
  FL_EXPORT_C(int,          Fl_Input_set_position_n_n)(fl_Input input,int p);
  FL_EXPORT_C(int,          Fl_Input_set_mark)(fl_Input input,int m);
  FL_EXPORT_C(int,          Fl_Input_replace)(fl_Input input,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Input_replace_with_ilen)(fl_Input input,int b, int e, const char* text, int ilen);
  FL_EXPORT_C(int,          Fl_Input_cut)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_cut_bytes)(fl_Input input,int n);
  FL_EXPORT_C(int,          Fl_Input_cut_range)(fl_Input input,int a, int b);
  FL_EXPORT_C(int,          Fl_Input_insert)(fl_Input input,const char* t);
  FL_EXPORT_C(int,          Fl_Input_insert_with_length)(fl_Input input,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Input_copy)(fl_Input input,int clipboard);
  FL_EXPORT_C(int,          Fl_Input_undo)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_copy_cuts)(fl_Input input);
  FL_EXPORT_C(int,          Fl_Input_shortcut)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_shortcut)(fl_Input input,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Input_textfont)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_textfont)(fl_Input input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Input_textsize)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_textsize)(fl_Input input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Input_textcolor)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_textcolor)(fl_Input input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Input_cursor_color)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_cursor_color)(fl_Input input,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Input_input_type)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_input_type)(fl_Input input,int t);
  FL_EXPORT_C(int,          Fl_Input_readonly)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_readonly)(fl_Input input,int b);
  FL_EXPORT_C(int,          Fl_Input_wrap)(fl_Input input);
  FL_EXPORT_C(void,         Fl_Input_set_wrap)(fl_Input input,int b);
  FL_EXPORT_C(void,         Fl_Input_tab_nav)(fl_Input input,int val);
  FL_EXPORT_C(int,          Fl_Input_set_tab_nav)(fl_Input input);
  FL_EXPORT_C(fl_Input,    Fl_OverriddenInput_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Input,    Fl_OverriddenInput_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Input_draw)(fl_Input o);
  FL_EXPORT_C(void, Fl_Input_draw_super)(fl_Input o);
  FL_EXPORT_C(int, Fl_Input_handle)(fl_Input o, int event);
  FL_EXPORT_C(int, Fl_Input_handle_super)(fl_Input o, int event);
  FL_EXPORT_C(void, Fl_Input_resize)(fl_Input o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Input_resize_super)(fl_Input o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Input_show)(fl_Input o);
  FL_EXPORT_C(void, Fl_Input_show_super)(fl_Input o);
  FL_EXPORT_C(void, Fl_Input_hide)(fl_Input o);
  FL_EXPORT_C(void, Fl_Input_hide_super)(fl_Input o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_INPUT_C__*/
