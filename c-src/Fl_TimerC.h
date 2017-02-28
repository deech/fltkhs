#ifndef __FL_TIMER_C__
#define __FL_TIMER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Timer.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedTimer : public Fl_Timer {
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
    Fl_DerivedTimer(uchar t, int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedTimer();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int ,         Fl_Timer_handle )(fl_Timer timer,int event);
  FL_EXPORT_C(void,         Fl_Timer_resize )(fl_Timer timer,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Timer_show )(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_hide )(fl_Timer timer);
  FL_EXPORT_C(fl_Window,    Fl_Timer_as_window )(fl_Timer timer);
  FL_EXPORT_C(fl_Gl_Window, Fl_Timer_as_gl_window)(fl_Timer timer);
  FL_EXPORT_C(fl_Group,     Fl_Timer_parent)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_parent)(fl_Timer timer, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Timer_type)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_type)(fl_Timer timer, uchar t);

  FL_EXPORT_C(int,          Fl_Timer_x)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_y)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_w)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_h)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_align)(fl_Timer timer, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Timer_align)(fl_Timer timer);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Timer_box)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_box)(fl_Timer timer, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Timer_color)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_color)(fl_Timer timer, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Timer_set_color_with_bg_sel)(fl_Timer timer,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Timer_selection_color)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_selection_color)(fl_Timer timer, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Timer_label)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_copy_label)(fl_Timer timer, const char* new_label);
  FL_EXPORT_C(void,         Fl_Timer_set_label)(fl_Timer timer, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Timer_labeltype)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_labeltype)(fl_Timer timer, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Timer_labelcolor)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_labelcolor)(fl_Timer timer, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Timer_labelfont)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_labelfont)(fl_Timer timer, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Timer_labelsize)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_labelsize)(fl_Timer timer, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Timer_image)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_image)(fl_Timer timer, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Timer_deimage)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_deimage)(fl_Timer timer, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Timer_tooltip)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_copy_tooltip)(fl_Timer timer, const char* text);
  FL_EXPORT_C(void,         Fl_Timer_set_tooltip)(fl_Timer timer, const char* text);
  FL_EXPORT_C(void,         Fl_Timer_set_callback_with_user_data)(fl_Timer timer, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Timer_set_callback)(fl_Timer timer, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Timer_user_data)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_user_data)(fl_Timer timer, void* v);
  FL_EXPORT_C(long,         Fl_Timer_argument)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_argument)(fl_Timer timer, long v);
  FL_EXPORT_C(Fl_When,      Fl_Timer_when)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_when)(fl_Timer timer, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Timer_visible)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_visible_r)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_visible)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_clear_visible)(fl_Timer timer);
  FL_EXPORT_C(unsigned int, Fl_Timer_active)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_active_r)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_activate)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_deactivate)(fl_Timer timer);
  FL_EXPORT_C(unsigned int, Fl_Timer_output)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_output)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_clear_output)(fl_Timer timer);
  FL_EXPORT_C(unsigned int, Fl_Timer_takesevents)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_changed)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_clear_changed)(fl_Timer timer);
  FL_EXPORT_C(int,          Fl_Timer_take_focus)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_set_visible_focus)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_clear_visible_focus)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_modify_visible_focus)(fl_Timer timer, int v);
  FL_EXPORT_C(unsigned int, Fl_Timer_visible_focus)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_do_callback)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_do_callback_with_widget_and_user_data)(fl_Timer timer, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Timer_do_callback_with_widget_and_default_user_data)(fl_Timer timer, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Timer_contains)(fl_Timer timer, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Timer_inside)(fl_Timer timer, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Timer_redraw)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_redraw_label)(fl_Timer timer);
  FL_EXPORT_C(uchar,        Fl_Timer_damage)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_clear_damage_with_bitmask)(fl_Timer timer, uchar c);
  FL_EXPORT_C(void,         Fl_Timer_clear_damage)(fl_Timer timer);
  FL_EXPORT_C(void,         Fl_Timer_damage_with_text)(fl_Timer timer, uchar c);
  FL_EXPORT_C(void,         Fl_Timer_damage_inside_widget)(fl_Timer timer, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Timer_draw_label_with_xywh_alignment)(fl_Timer timer, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Timer_measure_label)(fl_Timer timer, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Timer_window)(fl_Timer timer);
  FL_EXPORT_C(fl_Window,    Fl_Timer_top_window)(fl_Timer timer);
  FL_EXPORT_C(fl_Window ,   Fl_Timer_top_window_offset)(fl_Timer timer, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Timer_as_group)(fl_Timer timer);
  FL_EXPORT_C(fl_Gl_Window, Fl_Timer_as_gl_window)(fl_Timer timer);

  FL_EXPORT_C(fl_Timer, Fl_Timer_New)(int x, int y, int w, int h, const char* l);
  FL_EXPORT_C(fl_Timer, Fl_Value_Timer_New)(int x, int y, int w, int h, const char* l);
  FL_EXPORT_C(fl_Timer, Fl_Hidden_Timer_New)(int x, int y, int w, int h, const char* l);

  FL_EXPORT_C(void, Fl_Timer_Destroy)(fl_Timer timer);

  FL_EXPORT_C(char,      Fl_Timer_direction)(fl_Timer timer);
  FL_EXPORT_C(void,      Fl_Timer_set_direction)(fl_Timer timer, char d);
  FL_EXPORT_C(double,    Fl_Timer_value)(fl_Timer timer);
  FL_EXPORT_C(void,      Fl_Timer_set_value)(fl_Timer timer, double value);
  FL_EXPORT_C(char,      Fl_Timer_suspended)(fl_Timer timer);
  FL_EXPORT_C(void,      Fl_Timer_set_suspended)(fl_Timer timer, char s);
  FL_EXPORT_C(fl_Timer,    Fl_OverriddenTimer_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Timer,    Fl_OverriddenTimer_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Timer_draw)(fl_Timer o);
  FL_EXPORT_C(void, Fl_Timer_draw_super)(fl_Timer o);
  FL_EXPORT_C(int, Fl_Timer_handle)(fl_Timer o, int event);
  FL_EXPORT_C(int, Fl_Timer_handle_super)(fl_Timer o, int event);
  FL_EXPORT_C(void, Fl_Timer_resize)(fl_Timer o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Timer_resize_super)(fl_Timer o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Timer_show)(fl_Timer o);
  FL_EXPORT_C(void, Fl_Timer_show_super)(fl_Timer o);
  FL_EXPORT_C(void, Fl_Timer_hide)(fl_Timer o);
  FL_EXPORT_C(void, Fl_Timer_hide_super)(fl_Timer o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_TIMER_C__*/
