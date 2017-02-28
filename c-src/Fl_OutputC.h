#ifndef __FL_OUTPUT_C__
#define __FL_OUTPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Output.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedOutput : public Fl_Output {
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
    Fl_DerivedOutput(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedOutput(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedOutput();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Output_handle)(fl_Output self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Output_parent)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_parent)(fl_Output output, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Output_type)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_type)(fl_Output output, uchar t);

  FL_EXPORT_C(int,          Fl_Output_x)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_y)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_w)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_h)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_align)(fl_Output output, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Output_align)(fl_Output output);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Output_box)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_box)(fl_Output output, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Output_color)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_color)(fl_Output output, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Output_set_color_with_bg_sel)(fl_Output output,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Output_selection_color)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_selection_color)(fl_Output output, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Output_label)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_copy_label)(fl_Output output, const char* new_label);
  FL_EXPORT_C(void,         Fl_Output_set_label)(fl_Output output, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Output_labeltype)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_labeltype)(fl_Output output, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Output_labelcolor)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_labelcolor)(fl_Output output, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Output_labelfont)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_labelfont)(fl_Output output, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Output_labelsize)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_labelsize)(fl_Output output, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Output_image)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_image)(fl_Output output, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Output_deimage)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_deimage)(fl_Output output, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Output_tooltip)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_copy_tooltip)(fl_Output output, const char* text);
  FL_EXPORT_C(void,         Fl_Output_set_tooltip)(fl_Output output, const char* text);
  FL_EXPORT_C(void,         Fl_Output_set_callback_with_user_data)(fl_Output output, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Output_set_callback)(fl_Output output, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Output_user_data)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_user_data)(fl_Output output, void* v);
  FL_EXPORT_C(long,         Fl_Output_argument)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_argument)(fl_Output output, long v);
  FL_EXPORT_C(Fl_When,      Fl_Output_when)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_when)(fl_Output output, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Output_visible)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_visible_r)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_visible)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_clear_visible)(fl_Output output);
  FL_EXPORT_C(unsigned int, Fl_Output_active)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_active_r)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_activate)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_deactivate)(fl_Output output);
  FL_EXPORT_C(unsigned int, Fl_Output_output)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_output)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_clear_output)(fl_Output output);
  FL_EXPORT_C(unsigned int, Fl_Output_takesevents)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_changed)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_clear_changed)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_take_focus)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_visible_focus)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_clear_visible_focus)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_modify_visible_focus)(fl_Output output, int v);
  FL_EXPORT_C(unsigned int, Fl_Output_visible_focus)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_do_callback)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_do_callback_with_widget_and_user_data)(fl_Output output, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Output_do_callback_with_widget_and_default_user_data)(fl_Output output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Output_contains)(fl_Output output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Output_inside)(fl_Output output, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Output_redraw)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_redraw_label)(fl_Output output);
  FL_EXPORT_C(uchar,        Fl_Output_damage)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_clear_damage_with_bitmask)(fl_Output output, uchar c);
  FL_EXPORT_C(void,         Fl_Output_clear_damage)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_damage_with_text)(fl_Output output, uchar c);
  FL_EXPORT_C(void,         Fl_Output_damage_inside_widget)(fl_Output output, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Output_draw_label_with_xywh_alignment)(fl_Output output, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Output_measure_label)(fl_Output output, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Output_window)(fl_Output output);
  FL_EXPORT_C(fl_Window,    Fl_Output_top_window)(fl_Output output);
  FL_EXPORT_C(fl_Window ,   Fl_Output_top_window_offset)(fl_Output output, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Output_as_group)(fl_Output output);
  FL_EXPORT_C(fl_Gl_Window, Fl_Output_as_gl_window)(fl_Output output);
  /* Fl_Output specific functions */
  FL_EXPORT_C(int,      Fl_Output_handle)(fl_Output output, int event);
  FL_EXPORT_C(fl_Output, Fl_Output_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Output, Fl_Output_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,     Fl_Output_Destroy)(fl_Output output);

  FL_EXPORT_C(void,         Fl_Output_resize)(fl_Output output, int X, int Y, int W, int H);
  FL_EXPORT_C(int,          Fl_Output_set_value)(fl_Output output, const char*);
  FL_EXPORT_C(int,          Fl_Output_set_value_with_length)(fl_Output output, const char* text, int length);
  FL_EXPORT_C(int,          Fl_Output_static_value)(fl_Output output, const char* text);
  FL_EXPORT_C(int,          Fl_Output_static_value_with_length)(fl_Output output, const char* text, int length);
  FL_EXPORT_C(const char*,  Fl_Output_value)(fl_Output output);
  FL_EXPORT_C(Fl_Char,      Fl_Output_index)(fl_Output output, int i);
  FL_EXPORT_C(int,          Fl_Output_size)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_size)(fl_Output output, int W, int H);
  FL_EXPORT_C(int,          Fl_Output_maximum_size)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_maximum_size)(fl_Output output, int m);
  FL_EXPORT_C(int,          Fl_Output_position)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_mark)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_set_position_with_cursor_mark)(fl_Output output,int p, int m);
  FL_EXPORT_C(int,          Fl_Output_set_position_n_n)(fl_Output output,int p);
  FL_EXPORT_C(int,          Fl_Output_set_mark)(fl_Output output,int m);
  FL_EXPORT_C(int,          Fl_Output_replace)(fl_Output output,int b, int e, const char *text);
  FL_EXPORT_C(int,          Fl_Output_replace_with_ilen)(fl_Output output,int b, int e, const char *text, int ilen);
  FL_EXPORT_C(int,          Fl_Output_cut)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_cut_bytes)(fl_Output output,int n);
  FL_EXPORT_C(int,          Fl_Output_cut_range)(fl_Output output,int a, int b);
  FL_EXPORT_C(int,          Fl_Output_insert)(fl_Output output,const char* t);
  FL_EXPORT_C(int,          Fl_Output_insert_with_length)(fl_Output output,const char* t, int l);
  FL_EXPORT_C(int,          Fl_Output_copy)(fl_Output output,int clipboard);
  FL_EXPORT_C(int,          Fl_Output_undo)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_copy_cuts)(fl_Output output);
  FL_EXPORT_C(int,          Fl_Output_shortcut)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_shortcut)(fl_Output output,int s);
  FL_EXPORT_C(Fl_Font,      Fl_Output_textfont)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_textfont)(fl_Output output,Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Output_textsize)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_textsize)(fl_Output output,Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color,     Fl_Output_textcolor)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_textcolor)(fl_Output output,Fl_Color n);
  FL_EXPORT_C(Fl_Color,     Fl_Output_cursor_color)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_cursor_color)(fl_Output output,Fl_Color n);
  FL_EXPORT_C(int,          Fl_Output_input_type)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_input_type)(fl_Output output,int t);
  FL_EXPORT_C(int,          Fl_Output_readonly)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_readonly)(fl_Output output,int b);
  FL_EXPORT_C(int,          Fl_Output_wrap)(fl_Output output);
  FL_EXPORT_C(void,         Fl_Output_set_wrap)(fl_Output output,int b);
  FL_EXPORT_C(void,         Fl_Output_tab_nav)(fl_Output output,int val);
  FL_EXPORT_C(int,          Fl_Output_set_tab_nav)(fl_Output output);
  FL_EXPORT_C(fl_Output,    Fl_OverriddenOutput_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Output,    Fl_OverriddenOutput_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Output_draw)(fl_Output o);
  FL_EXPORT_C(void, Fl_Output_draw_super)(fl_Output o);
  FL_EXPORT_C(int, Fl_Output_handle)(fl_Output o, int event);
  FL_EXPORT_C(int, Fl_Output_handle_super)(fl_Output o, int event);
  FL_EXPORT_C(void, Fl_Output_resize)(fl_Output o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Output_resize_super)(fl_Output o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Output_show)(fl_Output o);
  FL_EXPORT_C(void, Fl_Output_show_super)(fl_Output o);
  FL_EXPORT_C(void, Fl_Output_hide)(fl_Output o);
  FL_EXPORT_C(void, Fl_Output_hide_super)(fl_Output o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_OUTPUT_C__*/
