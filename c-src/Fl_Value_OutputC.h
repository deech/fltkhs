#ifndef __FL_VALUE_OUTPUT_C__
#define __FL_VALUE_OUTPUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Value_Output.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedValue_Output : public Fl_Value_Output {
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
    Fl_DerivedValue_Output(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedValue_Output(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedValue_Output();
  };

#endif
  FL_EXPORT_C(int,Fl_Value_Output_handle)(fl_Value_Output self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Value_Output_parent)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_parent)(fl_Value_Output value_output, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Value_Output_type)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_type)(fl_Value_Output value_output, uchar t);

  FL_EXPORT_C(int,          Fl_Value_Output_x)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_y)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_w)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_h)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_align)(fl_Value_Output value_output, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Value_Output_align)(fl_Value_Output value_output);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Value_Output_box)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_box)(fl_Value_Output value_output, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Output_color)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_color)(fl_Value_Output value_output, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Value_Output_set_color_with_bg_sel)(fl_Value_Output value_output,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Output_selection_color)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_selection_color)(fl_Value_Output value_output, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Value_Output_label)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_copy_label)(fl_Value_Output value_output, const char* new_label);
  FL_EXPORT_C(void,         Fl_Value_Output_set_label)(fl_Value_Output value_output, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Value_Output_labeltype)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_labeltype)(fl_Value_Output value_output, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Value_Output_labelcolor)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_labelcolor)(fl_Value_Output value_output, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Value_Output_labelfont)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_labelfont)(fl_Value_Output value_output, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Value_Output_labelsize)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_labelsize)(fl_Value_Output value_output, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Value_Output_image)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_image)(fl_Value_Output value_output, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Value_Output_deimage)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_deimage)(fl_Value_Output value_output, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Value_Output_tooltip)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_copy_tooltip)(fl_Value_Output value_output, const char* text);
  FL_EXPORT_C(void,         Fl_Value_Output_set_tooltip)(fl_Value_Output value_output, const char* text);
  FL_EXPORT_C(void,         Fl_Value_Output_set_callback_with_user_data)(fl_Value_Output value_output, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Value_Output_set_callback)(fl_Value_Output value_output, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Value_Output_user_data)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_user_data)(fl_Value_Output value_output, void* v);
  FL_EXPORT_C(long,         Fl_Value_Output_argument)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_argument)(fl_Value_Output value_output, long v);
  FL_EXPORT_C(Fl_When,      Fl_Value_Output_when)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_when)(fl_Value_Output value_output, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Value_Output_visible)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_visible_r)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_visible)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_visible)(fl_Value_Output value_output);
  FL_EXPORT_C(unsigned int, Fl_Value_Output_active)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_active_r)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_activate)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_deactivate)(fl_Value_Output value_output);
  FL_EXPORT_C(unsigned int, Fl_Value_Output_output)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_output)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_output)(fl_Value_Output value_output);
  FL_EXPORT_C(unsigned int, Fl_Value_Output_takesevents)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_changed)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_changed)(fl_Value_Output value_output);
  FL_EXPORT_C(int,          Fl_Value_Output_take_focus)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_set_visible_focus)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_visible_focus)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_modify_visible_focus)(fl_Value_Output value_output, int v);
  FL_EXPORT_C(unsigned int, Fl_Value_Output_visible_focus)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_do_callback)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_do_callback_with_widget_and_user_data)(fl_Value_Output value_output, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Value_Output_do_callback_with_widget_and_default_user_data)(fl_Value_Output value_output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Value_Output_contains)(fl_Value_Output value_output, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Value_Output_inside)(fl_Value_Output value_output, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Value_Output_redraw)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_redraw_label)(fl_Value_Output value_output);
  FL_EXPORT_C(uchar,        Fl_Value_Output_damage)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_damage_with_bitmask)(fl_Value_Output value_output, uchar c);
  FL_EXPORT_C(void,         Fl_Value_Output_clear_damage)(fl_Value_Output value_output);
  FL_EXPORT_C(void,         Fl_Value_Output_damage_with_text)(fl_Value_Output value_output, uchar c);
  FL_EXPORT_C(void,         Fl_Value_Output_damage_inside_widget)(fl_Value_Output value_output, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Value_Output_draw_label_with_xywh_alignment)(fl_Value_Output value_output, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Value_Output_measure_label)(fl_Value_Output value_output, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Value_Output_window)(fl_Value_Output value_output);
  FL_EXPORT_C(fl_Window,    Fl_Value_Output_top_window)(fl_Value_Output value_output);
  FL_EXPORT_C(fl_Window ,   Fl_Value_Output_top_window_offset)(fl_Value_Output value_output, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Value_Output_as_group)(fl_Value_Output value_output);
  FL_EXPORT_C(fl_Gl_Window, Fl_Value_Output_as_gl_window)(fl_Value_Output value_output);
  /* Inherited from Fl_Valuator */

  FL_EXPORT_C(void ,	Fl_Value_Output_bounds)(fl_Value_Output value_output, double a, double b);
  FL_EXPORT_C(double ,	Fl_Value_Output_minimum)(fl_Value_Output value_output);
  FL_EXPORT_C(void ,	Fl_Value_Output_set_minimum)(fl_Value_Output value_output, double a);
  FL_EXPORT_C(double,	Fl_Value_Output_maximum)(fl_Value_Output value_output);
  FL_EXPORT_C(void ,	Fl_Value_Output_set_maximum)(fl_Value_Output value_output, double a);
  FL_EXPORT_C(void ,	Fl_Value_Output_range)(fl_Value_Output value_output, double a, double b);
  FL_EXPORT_C(void ,	Fl_Value_Output_set_step_with_a)(fl_Value_Output value_output, int a);
  FL_EXPORT_C(void ,	Fl_Value_Output_set_step_with_a_b)(fl_Value_Output value_output, double a, int b);
  FL_EXPORT_C(void,	Fl_Value_Output_set_step_with_s)(fl_Value_Output value_output, double s);
  FL_EXPORT_C(double ,	Fl_Value_Output_step)(fl_Value_Output value_output);
  FL_EXPORT_C(void,	Fl_Value_Output_precision)(fl_Value_Output value_output, int p);
  FL_EXPORT_C(double ,	Fl_Value_Output_value)(fl_Value_Output value_output);
  FL_EXPORT_C(int ,	Fl_Value_Output_set_value)(fl_Value_Output value_output, double v);
  FL_EXPORT_C(double ,	Fl_Value_Output_round)(fl_Value_Output value_output, double v);
  FL_EXPORT_C(double ,	Fl_Value_Output_clamp)(fl_Value_Output value_output, double v);
  FL_EXPORT_C(double ,	Fl_Value_Output_increment)(fl_Value_Output value_output, double v, int n);
  /* Fl_Value_Output specific functions */

  FL_EXPORT_C(fl_Value_Output,  Fl_Value_Output_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Value_Output, Fl_Value_Output_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void          , Fl_Value_Output_Destroy)(fl_Value_Output button);

  FL_EXPORT_C(void,Fl_Value_Output_resize)(fl_Value_Output value_output,int X,int Y,int W,int H);
  FL_EXPORT_C(char,	Fl_Value_Output_soft)(fl_Value_Output value_output);
  FL_EXPORT_C(void ,	Fl_Value_Output_set_soft)(fl_Value_Output value_output, char s);
  FL_EXPORT_C(Fl_Font,	Fl_Value_Output_textfont)(fl_Value_Output value_output);
  FL_EXPORT_C(void,	Fl_Value_Output_set_textfont)(fl_Value_Output value_output,int v);
  FL_EXPORT_C(int ,	Fl_Value_Output_textsize)(fl_Value_Output value_output);
  FL_EXPORT_C(void,	Fl_Value_Output_set_textsize)(fl_Value_Output value_output,int v);
  FL_EXPORT_C(Fl_Color,	Fl_Value_Output_textcolor)(fl_Value_Output value_output);
  FL_EXPORT_C(void,	Fl_Value_Output_set_textcolor)(fl_Value_Output value_output,int v);
  FL_EXPORT_C(fl_Value_Output,    Fl_OverriddenValue_Output_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Value_Output,    Fl_OverriddenValue_Output_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Value_Output_draw)(fl_Value_Output o);
  FL_EXPORT_C(void, Fl_Value_Output_draw_super)(fl_Value_Output o);
  FL_EXPORT_C(int, Fl_Value_Output_handle)(fl_Value_Output o, int event);
  FL_EXPORT_C(int, Fl_Value_Output_handle_super)(fl_Value_Output o, int event);
  FL_EXPORT_C(void, Fl_Value_Output_resize)(fl_Value_Output o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Value_Output_resize_super)(fl_Value_Output o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Value_Output_show)(fl_Value_Output o);
  FL_EXPORT_C(void, Fl_Value_Output_show_super)(fl_Value_Output o);
  FL_EXPORT_C(void, Fl_Value_Output_hide)(fl_Value_Output o);
  FL_EXPORT_C(void, Fl_Value_Output_hide_super)(fl_Value_Output o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_VALUE_INPUT_C__*/
