#ifndef __FL_CLOCK_C__
#define __FL_CLOCK_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Clock.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedClock : public Fl_Clock {
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
    Fl_DerivedClock(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedClock(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedClock();
  };

#endif
#define FL_SQUARE_CLOCK		0
#define FL_ROUND_CLOCK		1
#define FL_ANALOG_CLOCK FL_SQUARE_CLOCK
#define FL_DIGITAL_CLOCK FL_SQUARE_CLOCK
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,     Fl_Clock_parent)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_parent)(fl_Clock clock, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Clock_type)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_type)(fl_Clock clock, uchar t);
  FL_EXPORT_C(int,          Fl_Clock_x)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_y)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_w)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_h)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_align)(fl_Clock clock, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Clock_align)(fl_Clock clock);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Clock_box)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_box)(fl_Clock clock, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Clock_color)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_color)(fl_Clock clock, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Clock_set_color_with_bg_sel)(fl_Clock clock,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Clock_selection_color)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_selection_color)(fl_Clock clock, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Clock_label)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_copy_label)(fl_Clock clock, const char* new_label);
  FL_EXPORT_C(void,         Fl_Clock_set_label)(fl_Clock clock, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Clock_labeltype)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_labeltype)(fl_Clock clock, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Clock_labelcolor)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_labelcolor)(fl_Clock clock, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Clock_labelfont)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_labelfont)(fl_Clock clock, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Clock_labelsize)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_labelsize)(fl_Clock clock, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Clock_image)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_image)(fl_Clock clock, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Clock_deimage)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_deimage)(fl_Clock clock, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Clock_tooltip)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_copy_tooltip)(fl_Clock clock, const char* text);
  FL_EXPORT_C(void,         Fl_Clock_set_tooltip)(fl_Clock clock, const char* text);
  FL_EXPORT_C(void,         Fl_Clock_set_callback_with_user_data)(fl_Clock clock, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Clock_set_callback)(fl_Clock clock, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Clock_user_data)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_user_data)(fl_Clock clock, void* v);
  FL_EXPORT_C(long,         Fl_Clock_argument)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_argument)(fl_Clock clock, long v);
  FL_EXPORT_C(Fl_When,      Fl_Clock_when)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_when)(fl_Clock clock, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Clock_visible)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_visible_r)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_visible)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_clear_visible)(fl_Clock clock);
  FL_EXPORT_C(unsigned int, Fl_Clock_active)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_active_r)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_activate)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_deactivate)(fl_Clock clock);
  FL_EXPORT_C(unsigned int, Fl_Clock_output)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_output)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_clear_output)(fl_Clock clock);
  FL_EXPORT_C(unsigned int, Fl_Clock_takesevents)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_changed)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_clear_changed)(fl_Clock clock);
  FL_EXPORT_C(int,          Fl_Clock_take_focus)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_set_visible_focus)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_clear_visible_focus)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_modify_visible_focus)(fl_Clock clock, int v);
  FL_EXPORT_C(unsigned int, Fl_Clock_visible_focus)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_do_callback)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_do_callback_with_widget_and_user_data)(fl_Clock clock, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Clock_do_callback_with_widget_and_default_user_data)(fl_Clock clock, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Clock_contains)(fl_Clock clock, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Clock_inside)(fl_Clock clock, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Clock_redraw)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_redraw_label)(fl_Clock clock);
  FL_EXPORT_C(uchar,        Fl_Clock_damage)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_clear_damage_with_bitmask)(fl_Clock clock, uchar c);
  FL_EXPORT_C(void,         Fl_Clock_clear_damage)(fl_Clock clock);
  FL_EXPORT_C(void,         Fl_Clock_damage_with_text)(fl_Clock clock, uchar c);
  FL_EXPORT_C(void,         Fl_Clock_damage_inside_widget)(fl_Clock clock, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Clock_draw_label_with_xywh_alignment)(fl_Clock clock, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Clock_measure_label)(fl_Clock clock, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Clock_window)(fl_Clock clock);
  FL_EXPORT_C(fl_Window,    Fl_Clock_top_window)(fl_Clock clock);
  FL_EXPORT_C(fl_Window ,   Fl_Clock_top_window_offset)(fl_Clock clock, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Clock_as_group)(fl_Clock clock);
  FL_EXPORT_C(fl_Gl_Window, Fl_Clock_as_gl_window)(fl_Clock clock);
  /* Fl_Clock specific functions */
  FL_EXPORT_C(fl_Clock,    Fl_Clock_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Clock,    Fl_Clock_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Clock,    Fl_Clock_New_WithClockType)(uchar t, int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(void, Fl_Clock_set_value)(fl_Clock clock, ulong v);
  FL_EXPORT_C(void, Fl_Clock_set_value_with_hms)(fl_Clock clock, int H, int m, int s);
  FL_EXPORT_C(ulong, Fl_Clock_value)(fl_Clock clock);
  FL_EXPORT_C(int, Fl_Clock_hour)(fl_Clock clock);
  FL_EXPORT_C(int, Fl_Clock_minute)(fl_Clock clock);
  FL_EXPORT_C(int, Fl_Clock_second)(fl_Clock clock);
  FL_EXPORT_C(fl_Clock,    Fl_OverriddenClock_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Clock,    Fl_OverriddenClock_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Clock_draw)(fl_Clock o);
  FL_EXPORT_C(void, Fl_Clock_draw_super)(fl_Clock o);
  FL_EXPORT_C(int, Fl_Clock_handle)(fl_Clock o, int event);
  FL_EXPORT_C(int, Fl_Clock_handle_super)(fl_Clock o, int event);
  FL_EXPORT_C(void, Fl_Clock_resize)(fl_Clock o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Clock_resize_super)(fl_Clock o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Clock_show)(fl_Clock o);
  FL_EXPORT_C(void, Fl_Clock_show_super)(fl_Clock o);
  FL_EXPORT_C(void, Fl_Clock_hide)(fl_Clock o);
  FL_EXPORT_C(void, Fl_Clock_hide_super)(fl_Clock o);

#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_CLOCK_C__*/
