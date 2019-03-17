#ifndef __FL_VALUE_INPUT_C__
#define __FL_VALUE_INPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Value_Input.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedValue_Input : public Fl_Value_Input {
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
    void destroy_data();
    Fl_DerivedValue_Input(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedValue_Input(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedValue_Input();
  };

#endif
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_handle,(fl_Value_Input self, int event));
  FL_EXPORT_C_HEADER(fl_Group,Fl_Value_Input_parent,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_parent,(fl_Value_Input value_input, fl_Group grp));
  FL_EXPORT_C_HEADER(uchar,Fl_Value_Input_type,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_type,(fl_Value_Input value_input, uchar t));

  FL_EXPORT_C_HEADER(int,Fl_Value_Input_x,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_y,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_w,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_h,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_align,(fl_Value_Input value_input, Fl_Align alignment));
  FL_EXPORT_C_HEADER(Fl_Align,Fl_Value_Input_align,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(Fl_Boxtype,Fl_Value_Input_box,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_box,(fl_Value_Input value_input, Fl_Boxtype new_box));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Value_Input_color,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_color,(fl_Value_Input value_input, Fl_Color bg));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_color_with_bg_sel,(fl_Value_Input value_input,Fl_Color bg, Fl_Color a));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Value_Input_selection_color,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_selection_color,(fl_Value_Input value_input, Fl_Color a));
  FL_EXPORT_C_HEADER(const char*,Fl_Value_Input_label,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_copy_label,(fl_Value_Input value_input, const char* new_label));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_label,(fl_Value_Input value_input, const char* text));
  FL_EXPORT_C_HEADER(Fl_Labeltype,Fl_Value_Input_labeltype,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_labeltype,(fl_Value_Input value_input, Fl_Labeltype a));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Value_Input_labelcolor,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_labelcolor,(fl_Value_Input value_input, Fl_Color c));
  FL_EXPORT_C_HEADER(Fl_Font,Fl_Value_Input_labelfont,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_labelfont,(fl_Value_Input value_input, Fl_Font c));
  FL_EXPORT_C_HEADER(Fl_Fontsize,Fl_Value_Input_labelsize,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_labelsize,(fl_Value_Input value_input, Fl_Fontsize pix));
  FL_EXPORT_C_HEADER(fl_Image,Fl_Value_Input_image,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_image,(fl_Value_Input value_input, fl_Image pix));
  FL_EXPORT_C_HEADER(fl_Image,Fl_Value_Input_deimage,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_deimage,(fl_Value_Input value_input, fl_Image pix));
  FL_EXPORT_C_HEADER(const char*,Fl_Value_Input_tooltip,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_copy_tooltip,(fl_Value_Input value_input, const char* text));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_tooltip,(fl_Value_Input value_input, const char* text));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_callback_with_user_data,(fl_Value_Input value_input, fl_Callback* cb, void* p));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_callback,(fl_Value_Input value_input, fl_Callback* cb));
  FL_EXPORT_C_HEADER(void*,Fl_Value_Input_user_data,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_user_data,(fl_Value_Input value_input, void* v));
  FL_EXPORT_C_HEADER(long,Fl_Value_Input_argument,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_argument,(fl_Value_Input value_input, long v));
  FL_EXPORT_C_HEADER(Fl_When,Fl_Value_Input_when,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_when,(fl_Value_Input value_input, uchar i));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Value_Input_visible,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_visible_r,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_visible,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_visible,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Value_Input_active,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_active_r,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_activate,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_deactivate,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Value_Input_output,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_output,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_output,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Value_Input_takesevents,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_changed,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_changed,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_take_focus,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_set_visible_focus,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_visible_focus,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_modify_visible_focus,(fl_Value_Input value_input, int v));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Value_Input_visible_focus,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_do_callback,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_do_callback_with_widget_and_user_data,(fl_Value_Input value_input, fl_Widget w, long arg));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_do_callback_with_widget_and_default_user_data,(fl_Value_Input value_input, fl_Widget w));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_contains,(fl_Value_Input value_input, fl_Widget w));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_inside,(fl_Value_Input value_input, fl_Widget w));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_redraw,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_redraw_label,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(uchar,Fl_Value_Input_damage,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_damage_with_bitmask,(fl_Value_Input value_input, uchar c));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_clear_damage,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_damage_with_text,(fl_Value_Input value_input, uchar c));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_damage_inside_widget,(fl_Value_Input value_input, uchar c, int x , int y , int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_draw_label_with_xywh_alignment,(fl_Value_Input value_input, int x , int y , int w, int h, Fl_Align alignment));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_measure_label,(fl_Value_Input value_input, int* ww , int* hh));
  FL_EXPORT_C_HEADER(fl_Window,Fl_Value_Input_window,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(fl_Window,Fl_Value_Input_top_window,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(fl_Window ,Fl_Value_Input_top_window_offset,(fl_Value_Input value_input, int* xoff, int* yoff));
  FL_EXPORT_C_HEADER(fl_Group,Fl_Value_Input_as_group,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(fl_Gl_Window,Fl_Value_Input_as_gl_window,(fl_Value_Input value_input));
  /* Inherited from Fl_Valuator */

  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_bounds,(fl_Value_Input value_input, double a, double b));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_minimum,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_set_minimum,(fl_Value_Input value_input, double a));
  FL_EXPORT_C_HEADER(double,	Fl_Value_Input_maximum,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_set_maximum,(fl_Value_Input value_input, double a));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_range,(fl_Value_Input value_input, double a, double b));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_set_step_with_a,(fl_Value_Input value_input, int a));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_set_step_with_a_b,(fl_Value_Input value_input, double a, int b));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_set_step_with_s,(fl_Value_Input value_input, double s));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_step,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_precision,(fl_Value_Input value_input, int p));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_value,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(int ,	Fl_Value_Input_set_value,(fl_Value_Input value_input, double v));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_round,(fl_Value_Input value_input, double v));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_clamp,(fl_Value_Input value_input, double v));
  FL_EXPORT_C_HEADER(double ,	Fl_Value_Input_increment,(fl_Value_Input value_input, double v, int n));
  /* Fl_Value_Input specific functions */

  FL_EXPORT_C_HEADER(fl_Value_Input,Fl_Value_Input_New_WithLabel,(int x, int y, int w, int h, const char* label));
  FL_EXPORT_C_HEADER(fl_Value_Input,Fl_Value_Input_New,(int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void          ,Fl_Value_Input_Destroy,(fl_Value_Input button));

  FL_EXPORT_C_HEADER(char,	Fl_Value_Input_soft,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_resize,(fl_Value_Input value_input, int X, int Y, int W, int H));
  FL_EXPORT_C_HEADER(void ,	Fl_Value_Input_set_soft,(fl_Value_Input value_input, char s));
  FL_EXPORT_C_HEADER(int ,	Fl_Value_Input_shortcut,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_set_shortcut,(fl_Value_Input value_input,int v));
  FL_EXPORT_C_HEADER(Fl_Font,	Fl_Value_Input_textfont,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_set_textfont,(fl_Value_Input value_input,int v));
  FL_EXPORT_C_HEADER(int ,	Fl_Value_Input_textsize,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_set_textsize,(fl_Value_Input value_input,int v));
  FL_EXPORT_C_HEADER(Fl_Color,	Fl_Value_Input_textcolor,(fl_Value_Input value_input));
  FL_EXPORT_C_HEADER(void,	Fl_Value_Input_set_textcolor,(fl_Value_Input value_input,int v));
  FL_EXPORT_C_HEADER(fl_Value_Input,Fl_OverriddenValue_Input_New,(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs));
  FL_EXPORT_C_HEADER(fl_Value_Input,Fl_OverriddenValue_Input_New_WithLabel,(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_draw,(fl_Value_Input o));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_draw_super,(fl_Value_Input o));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_handle,(fl_Value_Input o, int event));
  FL_EXPORT_C_HEADER(int,Fl_Value_Input_handle_super,(fl_Value_Input o, int event));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_resize,(fl_Value_Input o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_resize_super,(fl_Value_Input o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_show,(fl_Value_Input o));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_show_super,(fl_Value_Input o));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_hide,(fl_Value_Input o));
  FL_EXPORT_C_HEADER(void,Fl_Value_Input_hide_super,(fl_Value_Input o));
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_VALUE_INPUT_C__*/
