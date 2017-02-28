#ifndef __FL_FILE_INPUT_C__
#define __FL_FILE_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_File_Input.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedFile_Input : public Fl_File_Input {
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
    Fl_DerivedFile_Input(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedFile_Input(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedFile_Input();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,     Fl_File_Input_parent)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_parent)(fl_File_Input file_input, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_File_Input_type)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_type)(fl_File_Input file_input, uchar t);

  FL_EXPORT_C(int,          Fl_File_Input_x)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_y)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_w)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_h)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_align)(fl_File_Input file_input, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_File_Input_align)(fl_File_Input file_input);
  FL_EXPORT_C(Fl_Boxtype,   Fl_File_Input_box)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_box)(fl_File_Input file_input, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_File_Input_color)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_color)(fl_File_Input file_input, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_File_Input_set_color_with_bg_sel)(fl_File_Input file_input,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_File_Input_selection_color)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_selection_color)(fl_File_Input file_input, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_File_Input_label)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_copy_label)(fl_File_Input file_input, const char* new_label);
  FL_EXPORT_C(void,         Fl_File_Input_set_label)(fl_File_Input file_input, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_File_Input_labeltype)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_labeltype)(fl_File_Input file_input, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_File_Input_labelcolor)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_labelcolor)(fl_File_Input file_input, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_File_Input_labelfont)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_labelfont)(fl_File_Input file_input, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_File_Input_labelsize)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_labelsize)(fl_File_Input file_input, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_File_Input_image)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_image)(fl_File_Input file_input, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_File_Input_deimage)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_deimage)(fl_File_Input file_input, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_File_Input_tooltip)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_copy_tooltip)(fl_File_Input file_input, const char* text);
  FL_EXPORT_C(void,         Fl_File_Input_set_tooltip)(fl_File_Input file_input, const char* text);
  FL_EXPORT_C(void,         Fl_File_Input_set_callback_with_user_data)(fl_File_Input file_input, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_File_Input_set_callback)(fl_File_Input file_input, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_File_Input_user_data)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_user_data)(fl_File_Input file_input, void* v);
  FL_EXPORT_C(long,         Fl_File_Input_argument)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_argument)(fl_File_Input file_input, long v);
  FL_EXPORT_C(Fl_When,      Fl_File_Input_when)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_when)(fl_File_Input file_input, uchar i);
  FL_EXPORT_C(unsigned int, Fl_File_Input_visible)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_visible_r)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_visible)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_clear_visible)(fl_File_Input file_input);
  FL_EXPORT_C(unsigned int, Fl_File_Input_active)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_active_r)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_activate)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_deactivate)(fl_File_Input file_input);
  FL_EXPORT_C(unsigned int, Fl_File_Input_output)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_output)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_clear_output)(fl_File_Input file_input);
  FL_EXPORT_C(unsigned int, Fl_File_Input_takesevents)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_changed)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_clear_changed)(fl_File_Input file_input);
  FL_EXPORT_C(int,          Fl_File_Input_take_focus)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_visible_focus)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_clear_visible_focus)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_modify_visible_focus)(fl_File_Input file_input, int v);
  FL_EXPORT_C(unsigned int, Fl_File_Input_visible_focus)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_do_callback)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_do_callback_with_widget_and_user_data)(fl_File_Input file_input, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_File_Input_do_callback_with_widget_and_default_user_data)(fl_File_Input file_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_File_Input_contains)(fl_File_Input file_input, fl_Widget w);
  FL_EXPORT_C(int,          Fl_File_Input_inside)(fl_File_Input file_input, fl_Widget w);
  FL_EXPORT_C(void,         Fl_File_Input_redraw)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_redraw_label)(fl_File_Input file_input);
  FL_EXPORT_C(uchar,        Fl_File_Input_damage)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_clear_damage_with_bitmask)(fl_File_Input file_input, uchar c);
  FL_EXPORT_C(void,         Fl_File_Input_clear_damage)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_damage_with_text)(fl_File_Input file_input, uchar c);
  FL_EXPORT_C(void,         Fl_File_Input_damage_inside_widget)(fl_File_Input file_input, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_File_Input_draw_label_with_xywh_alignment)(fl_File_Input file_input, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_File_Input_measure_label)(fl_File_Input file_input, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_File_Input_window)(fl_File_Input file_input);
  FL_EXPORT_C(fl_Window,    Fl_File_Input_top_window)(fl_File_Input file_input);
  FL_EXPORT_C(fl_Window ,   Fl_File_Input_top_window_offset)(fl_File_Input file_input, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_File_Input_as_group)(fl_File_Input file_input);
  FL_EXPORT_C(fl_Gl_Window, Fl_File_Input_as_gl_window)(fl_File_Input file_input);
  /* Inherited from Fl_Input */
  FL_EXPORT_C(int,           Fl_File_Input_handle)(fl_File_Input file_input, int event);
  FL_EXPORT_C(int,         Fl_File_Input_static_value)(fl_File_Input file_input, const char* text);
  FL_EXPORT_C(int,         Fl_File_Input_static_value_with_length)(fl_File_Input file_input, const char* text, int length);
  FL_EXPORT_C(Fl_Char,     Fl_File_Input_index)(fl_File_Input file_input, int i);
  FL_EXPORT_C(int,         Fl_File_Input_size)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_size)(fl_File_Input file_input, int W, int H);
  FL_EXPORT_C(int,         Fl_File_Input_maximum_size)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_maximum_size)(fl_File_Input file_input, int m);
  FL_EXPORT_C(int,         Fl_File_Input_position)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_mark)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_set_position_with_cursor_mark)(fl_File_Input file_input,int p, int m);
  FL_EXPORT_C(int,         Fl_File_Input_set_position_n_n)(fl_File_Input file_input,int p);
  FL_EXPORT_C(int,         Fl_File_Input_set_mark)(fl_File_Input file_input,int m);
  FL_EXPORT_C(int,         Fl_File_Input_replace)(fl_File_Input file_input,int b, int e, const char *text);
  FL_EXPORT_C(int,         Fl_File_Input_replace_with_ilen)(fl_File_Input file_input,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,         Fl_File_Input_cut)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_cut_bytes)(fl_File_Input file_input,int n);
  FL_EXPORT_C(int,         Fl_File_Input_cut_range)(fl_File_Input file_input,int a, int b);
  FL_EXPORT_C(int,         Fl_File_Input_insert)(fl_File_Input file_input,const char* t);
  FL_EXPORT_C(int,         Fl_File_Input_insert_with_length)(fl_File_Input file_input,const char* t, int l);
  FL_EXPORT_C(int,         Fl_File_Input_copy)(fl_File_Input file_input,int clipboard);
  FL_EXPORT_C(int,         Fl_File_Input_undo)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_copy_cuts)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_shortcut)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_shortcut)(fl_File_Input file_input,int s);
  FL_EXPORT_C(Fl_Font,     Fl_File_Input_textfont)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_textfont)(fl_File_Input file_input,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize, Fl_File_Input_textsize)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_textsize)(fl_File_Input file_input,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,    Fl_File_Input_textcolor)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_textcolor)(fl_File_Input file_input,Fl_Color n);
  FL_EXPORT_C(Fl_Color,    Fl_File_Input_cursor_color)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_cursor_color)(fl_File_Input file_input,Fl_Color n);
  FL_EXPORT_C(int,         Fl_File_Input_input_type)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_input_type)(fl_File_Input file_input,int t);
  FL_EXPORT_C(int,         Fl_File_Input_readonly)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_readonly)(fl_File_Input file_input,int b);
  FL_EXPORT_C(int,         Fl_File_Input_wrap)(fl_File_Input file_input);
  FL_EXPORT_C(void,        Fl_File_Input_set_wrap)(fl_File_Input file_input,int b);
  FL_EXPORT_C(void,        Fl_File_Input_tab_nav)(fl_File_Input file_input,int val);
  FL_EXPORT_C(int,         Fl_File_Input_set_tab_nav)(fl_File_Input file_input);

  /* Fl_File_Input specific functions */
  FL_EXPORT_C(fl_File_Input, Fl_File_Input_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_File_Input, Fl_File_Input_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,          Fl_File_Input_Destroy)(fl_File_Input file_input);
  FL_EXPORT_C(int,         Fl_File_Input_set_value)(fl_File_Input file_input, const char*);
  FL_EXPORT_C(int,         Fl_File_Input_set_value_with_length)(fl_File_Input file_input, const char* text, int length);
  FL_EXPORT_C(const char*, Fl_File_Input_value)(fl_File_Input file_input);
  FL_EXPORT_C(Fl_Color,    Fl_File_Input_errorcolor)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_errorcolor)(fl_File_Input file_input, Fl_Color color);
  FL_EXPORT_C(Fl_Boxtype,  Fl_File_Input_down_box)(fl_File_Input file_input);
  FL_EXPORT_C(void,         Fl_File_Input_set_down_box)(fl_File_Input file_input, Fl_Boxtype color);
  FL_EXPORT_C(fl_File_Input,    Fl_OverriddenFile_Input_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_File_Input,    Fl_OverriddenFile_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_File_Input_draw)(fl_File_Input o);
  FL_EXPORT_C(void, Fl_File_Input_draw_super)(fl_File_Input o);
  FL_EXPORT_C(int, Fl_File_Input_handle)(fl_File_Input o, int event);
  FL_EXPORT_C(int, Fl_File_Input_handle_super)(fl_File_Input o, int event);
  FL_EXPORT_C(void, Fl_File_Input_resize)(fl_File_Input o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_File_Input_resize_super)(fl_File_Input o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_File_Input_show)(fl_File_Input o);
  FL_EXPORT_C(void, Fl_File_Input_show_super)(fl_File_Input o);
  FL_EXPORT_C(void, Fl_File_Input_hide)(fl_File_Input o);
  FL_EXPORT_C(void, Fl_File_Input_hide_super)(fl_File_Input o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_FILE_INPUT_C__*/
