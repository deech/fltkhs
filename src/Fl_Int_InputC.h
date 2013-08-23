#ifndef __FL_INT_INPUT_C__
#define __FL_INT_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Int_Input.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Int_Input_handle_super)(fl_Int_Input self, int event);
  FL_EXPORT_C(int,Fl_Int_Input_handle)(fl_Int_Input self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Int_Input_parent)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_parent)(fl_Int_Input int_input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Int_Input_type)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_type)(fl_Int_Input int_input, uchar t);

FL_EXPORT_C(void, Fl_Int_Input_draw_box)(fl_Int_Input Int_Input);
FL_EXPORT_C(void, Fl_Int_Input_draw_box_with_tc)(fl_Int_Input Int_Input,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Int_Input_draw_box_with_txywhc)(fl_Int_Input Int_Input,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Int_Input_draw_backdrop)(fl_Int_Input Int_Input);
FL_EXPORT_C(void, Fl_Int_Input_draw_focus)(fl_Int_Input Int_Input);
FL_EXPORT_C(void, Fl_Int_Input_draw_focus_with_txywh)(fl_Int_Input Int_Input,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Int_Input_draw_label)(fl_Int_Input Int_Input);
  FL_EXPORT_C(int,          Fl_Int_Input_x)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_y)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_w)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_h)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_align)(fl_Int_Input int_input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Int_Input_align)(fl_Int_Input int_input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Int_Input_box)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_box)(fl_Int_Input int_input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Int_Input_color)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_color)(fl_Int_Input int_input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Int_Input_set_color_with_bg_sel)(fl_Int_Input int_input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Int_Input_selection_color)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_selection_color)(fl_Int_Input int_input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Int_Input_label)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_copy_label)(fl_Int_Input int_input, const char* new_label);
  FL_EXPORT_C(void,         Fl_Int_Input_set_label)(fl_Int_Input int_input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Int_Input_labeltype)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_labeltype)(fl_Int_Input int_input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Int_Input_labelcolor)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_labelcolor)(fl_Int_Input int_input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Int_Input_labelfont)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_labelfont)(fl_Int_Input int_input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Int_Input_labelsize)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_labelsize)(fl_Int_Input int_input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Int_Input_image)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_image)(fl_Int_Input int_input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Int_Input_deimage)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_deimage)(fl_Int_Input int_input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Int_Input_tooltip)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_copy_tooltip)(fl_Int_Input int_input, const char* text);
  FL_EXPORT_C(void,         Fl_Int_Input_set_tooltip)(fl_Int_Input int_input, const char* text);
  FL_EXPORT_C(void,         Fl_Int_Input_set_callback_with_user_data)(fl_Int_Input int_input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Int_Input_set_callback)(fl_Int_Input int_input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Int_Input_user_data)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_user_data)(fl_Int_Input int_input, void* v);
  FL_EXPORT_C(long,         Fl_Int_Input_argument)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_argument)(fl_Int_Input int_input, long v);
  FL_EXPORT_C(Fl_When,      Fl_Int_Input_when)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_when)(fl_Int_Input int_input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Int_Input_visible)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_visible_r)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_visible)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_visible)(fl_Int_Input int_input);
  FL_EXPORT_C(unsigned int, Fl_Int_Input_active)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_active_r)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_activate)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_deactivate)(fl_Int_Input int_input);
  FL_EXPORT_C(unsigned int, Fl_Int_Input_output)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_output)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_output)(fl_Int_Input int_input);
  FL_EXPORT_C(unsigned int, Fl_Int_Input_takesevents)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_changed)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_changed)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_take_focus)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_visible_focus)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_visible_focus)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_modify_visible_focus)(fl_Int_Input int_input, int v);
  FL_EXPORT_C(unsigned int, Fl_Int_Input_visible_focus)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_do_callback)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_do_callback_with_widget_and_user_data)(fl_Int_Input int_input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Int_Input_do_callback_with_widget_and_default_user_data)(fl_Int_Input int_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Int_Input_contains)(fl_Int_Input int_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Int_Input_inside)(fl_Int_Input int_input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Int_Input_redraw)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_redraw_label)(fl_Int_Input int_input);
  FL_EXPORT_C(uchar,        Fl_Int_Input_damage)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_damage_with_bitmask)(fl_Int_Input int_input, uchar c);
  FL_EXPORT_C(void,         Fl_Int_Input_clear_damage)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_damage_with_text)(fl_Int_Input int_input, uchar c);
  FL_EXPORT_C(void,         Fl_Int_Input_damage_inside_widget)(fl_Int_Input int_input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Int_Input_draw_label_with_xywh_alignment)(fl_Int_Input int_input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Int_Input_measure_label)(fl_Int_Input int_input, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Int_Input_window)(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Window,    Fl_Int_Input_top_window)(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Window ,   Fl_Int_Input_top_window_offset)(fl_Int_Input int_input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Int_Input_as_group)(fl_Int_Input int_input);
  /* Fl_Int_Input specific functions */
#ifdef __cplusplus
  class Fl_DerivedInt_Input : public Fl_Int_Input {
    fl_Int_Input_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void draw_box();
    void draw_box(Fl_Boxtype t, Fl_Color c);
    void draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
    void draw_backdrop();
    void draw_focus();
    void draw_focus(Fl_Boxtype t, int x,int y,int w,int h);
    void draw_label();
    void draw_label(int x,int y,int w,int h,Fl_Align alignment);
    virtual void draw();
    virtual int handle(int event);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_DerivedInt_Input(int X, int Y, int W, int H, const char *l, fl_Int_Input_Virtual_Funcs* funcs);
    Fl_DerivedInt_Input(int X, int Y, int W, int H, fl_Int_Input_Virtual_Funcs* funcs);
    ~Fl_DerivedInt_Input();
  };
#endif  
  FL_EXPORT_C(int ,         Fl_Int_Input_handle_super)(fl_Int_Input int_input,int event);
  FL_EXPORT_C(int ,         Fl_Int_Input_handle )(fl_Int_Input int_input,int event);
  FL_EXPORT_C(void,         Fl_Int_Input_resize_super)(fl_Int_Input int_input,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Int_Input_resize )(fl_Int_Input int_input,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Int_Input_show_super)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_show )(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_hide_super)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_hide )(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Window,    Fl_Int_Input_as_window_super)(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Window,    Fl_Int_Input_as_window )(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Int_Input_as_gl_window_super)(fl_Int_Input int_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_Int_Input_as_gl_window)(fl_Int_Input int_input);
  FL_EXPORT_C(void*, Fl_Int_Input_other_data)(fl_Int_Input int_input);
  FL_EXPORT_C(void, Fl_Int_Input_set_other_data)(fl_Int_Input int_input, void* v);
  FL_EXPORT_C(fl_Float_Input, Fl_Int_Input_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Float_Input, Fl_Int_Input_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,     Fl_Int_Input_Destroy)(fl_Int_Input int_input);

  FL_EXPORT_C(void,         Fl_Int_Input_resize)(fl_Int_Input int_input, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Int_Input_set_value)(fl_Int_Input int_input, const char*);
  FL_EXPORT_C(int,          Fl_Int_Input_set_value_with_length)(fl_Int_Input int_input, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Int_Input_static_value)(fl_Int_Input int_input, const char* text);
  FL_EXPORT_C(int,          Fl_Int_Input_static_value_with_length)(fl_Int_Input int_input, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Int_Input_value)(fl_Int_Input int_input);
  FL_EXPORT_C(Fl_Char,      Fl_Int_Input_index)(fl_Int_Input int_input, int i);
  FL_EXPORT_C(int,          Fl_Int_Input_size)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_size)(fl_Int_Input int_input, int W, int H);
  FL_EXPORT_C(int,          Fl_Int_Input_maximum_size)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_maximum_size)(fl_Int_Input int_input, int m);
  FL_EXPORT_C(int,          Fl_Int_Input_position)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_mark)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_set_position_with_cursor_mark)(fl_Int_Input int_input,int p, int m);
  FL_EXPORT_C(int,          Fl_Int_Input_set_position_n_n)(fl_Int_Input int_input,int p);
  FL_EXPORT_C(int,          Fl_Int_Input_set_mark)(fl_Int_Input int_input,int m);
  FL_EXPORT_C(int,          Fl_Int_Input_replace)(fl_Int_Input int_input,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Int_Input_replace_with_ilen)(fl_Int_Input int_input,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Int_Input_cut)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_cut_bytes)(fl_Int_Input int_input,int n);
  FL_EXPORT_C(int,          Fl_Int_Input_cut_range)(fl_Int_Input int_input,int a, int b);
  FL_EXPORT_C(int,          Fl_Int_Input_insert)(fl_Int_Input int_input,const char* t);
  FL_EXPORT_C(int,          Fl_Int_Input_insert_with_length)(fl_Int_Input int_input,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Int_Input_copy)(fl_Int_Input int_input,int clipboard);
  FL_EXPORT_C(int,          Fl_Int_Input_undo)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_copy_cuts)(fl_Int_Input int_input);
  FL_EXPORT_C(int,          Fl_Int_Input_shortcut)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_shortcut)(fl_Int_Input int_input,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Int_Input_textfont)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_textfont)(fl_Int_Input int_input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Int_Input_textsize)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_textsize)(fl_Int_Input int_input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Int_Input_textcolor)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_textcolor)(fl_Int_Input int_input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Int_Input_cursor_color)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_cursor_color)(fl_Int_Input int_input,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Int_Input_input_type)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_input_type)(fl_Int_Input int_input,int t);
  FL_EXPORT_C(int,          Fl_Int_Input_readonly)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_readonly)(fl_Int_Input int_input,int b);
  FL_EXPORT_C(int,          Fl_Int_Input_wrap)(fl_Int_Input int_input);
  FL_EXPORT_C(void,         Fl_Int_Input_set_wrap)(fl_Int_Input int_input,int b);
  FL_EXPORT_C(void,         Fl_Int_Input_tab_nav)(fl_Int_Input int_input,int val);
  FL_EXPORT_C(int,          Fl_Int_Input_set_tab_nav)(fl_Int_Input int_input);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_INT_INPUT_C__*/
