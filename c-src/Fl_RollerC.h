#ifndef __FL_ROLLER_C__
#define __FL_ROLLER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Roller is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Roller.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedRoller : public Fl_Roller {
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
    Fl_DerivedRoller(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedRoller(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedRoller();
  };

#endif
  FL_EXPORT_C(fl_Group,     Fl_Roller_parent)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_parent)(fl_Roller roller, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Roller_type)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_type)(fl_Roller roller, uchar t);

  FL_EXPORT_C(int,          Fl_Roller_x)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_y)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_w)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_h)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_align)(fl_Roller roller, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Roller_align)(fl_Roller roller);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Roller_box)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_box)(fl_Roller roller, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Roller_color)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_color)(fl_Roller roller, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Roller_set_color_with_bg_sel)(fl_Roller roller,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Roller_selection_color)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_selection_color)(fl_Roller roller, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Roller_label)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_copy_label)(fl_Roller roller, const char* new_label);
  FL_EXPORT_C(void,         Fl_Roller_set_label)(fl_Roller roller, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Roller_labeltype)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_labeltype)(fl_Roller roller, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Roller_labelcolor)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_labelcolor)(fl_Roller roller, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Roller_labelfont)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_labelfont)(fl_Roller roller, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Roller_labelsize)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_labelsize)(fl_Roller roller, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Roller_image)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_image)(fl_Roller roller, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Roller_deimage)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_deimage)(fl_Roller roller, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Roller_tooltip)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_copy_tooltip)(fl_Roller roller, const char* text);
  FL_EXPORT_C(void,         Fl_Roller_set_tooltip)(fl_Roller roller, const char* text);
  FL_EXPORT_C(void,         Fl_Roller_set_callback_with_user_data)(fl_Roller roller, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Roller_set_callback)(fl_Roller roller, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Roller_other_data)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_other_data)(fl_Roller roller, void* v);
  FL_EXPORT_C(void*,        Fl_Roller_user_data)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_user_data)(fl_Roller roller, void* v);
  FL_EXPORT_C(long,         Fl_Roller_argument)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_argument)(fl_Roller roller, long v);
  FL_EXPORT_C(Fl_When,      Fl_Roller_when)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_when)(fl_Roller roller, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Roller_visible)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_visible_r)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_show)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_hide)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_visible)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_clear_visible)(fl_Roller roller);
  FL_EXPORT_C(unsigned int, Fl_Roller_active)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_active_r)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_activate)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_deactivate)(fl_Roller roller);
  FL_EXPORT_C(unsigned int, Fl_Roller_output)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_output)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_clear_output)(fl_Roller roller);
  FL_EXPORT_C(unsigned int, Fl_Roller_takesevents)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_changed)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_clear_changed)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_take_focus)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_set_visible_focus)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_clear_visible_focus)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_modify_visible_focus)(fl_Roller roller, int v);
  FL_EXPORT_C(unsigned int, Fl_Roller_visible_focus)(fl_Roller roller);
  FL_EXPORT_C(int,          Fl_Roller_contains)(fl_Roller roller, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Roller_inside)(fl_Roller roller, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Roller_redraw)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_redraw_label)(fl_Roller roller);
  FL_EXPORT_C(uchar,        Fl_Roller_damage)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_clear_damage_with_bitmask)(fl_Roller roller, uchar c);
  FL_EXPORT_C(void,         Fl_Roller_clear_damage)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_damage_with_text)(fl_Roller roller, uchar c);
  FL_EXPORT_C(void,         Fl_Roller_damage_inside_widget)(fl_Roller roller, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Roller_draw_label_with_xywh_alignment)(fl_Roller roller, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Roller_measure_label)(fl_Roller roller, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Roller_window)(fl_Roller roller);
  FL_EXPORT_C(fl_Window,    Fl_Roller_top_window)(fl_Roller roller);
  FL_EXPORT_C(fl_Window ,   Fl_Roller_top_window_offset)(fl_Roller roller, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Roller_as_gl_window)(fl_Roller roller);
  FL_EXPORT_C(void,         Fl_Roller_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Roller_bounds)(fl_Roller roller, double a, double b);
  FL_EXPORT_C(double, Fl_Roller_minimum)(fl_Roller roller);
  FL_EXPORT_C(void, Fl_Roller_set_minimum)(fl_Roller roller, double a);
  FL_EXPORT_C(double, Fl_Roller_maximum)(fl_Roller roller);
  FL_EXPORT_C(void, Fl_Roller_set_maximum)(fl_Roller roller, double a);
  FL_EXPORT_C(void, Fl_Roller_range)(fl_Roller roller, double a, double b);
  FL_EXPORT_C(void, Fl_Roller_set_step)(fl_Roller roller, int a);
  FL_EXPORT_C(void, Fl_Roller_set_step_with_a_b)(fl_Roller roller, double a, int b);
  FL_EXPORT_C(void, Fl_Roller_step_with_s)(fl_Roller roller, double s);
  FL_EXPORT_C(double, Fl_Roller_step)(fl_Roller roller);
  FL_EXPORT_C(void, Fl_Roller_precision)(fl_Roller roller, int precision);
  FL_EXPORT_C(double, Fl_Roller_value)(fl_Roller roller);
  FL_EXPORT_C(int, Fl_Roller_set_value)(fl_Roller roller, double v);
  FL_EXPORT_C(int, Fl_Roller_format)(fl_Roller roller, char* format);
  FL_EXPORT_C(double, Fl_Roller_round)(fl_Roller roller, double v);
  FL_EXPORT_C(double, Fl_Roller_clamp)(fl_Roller roller, double v);
  FL_EXPORT_C(double, Fl_Roller_increment)(fl_Roller roller, double v, int n);

  /* Fl_Roller specific */
  FL_EXPORT_C(fl_Roller,    Fl_Roller_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Roller   , Fl_Roller_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Roller_Destroy)(fl_Roller roller);
  FL_EXPORT_C(int,       Fl_Roller_handle)(fl_Roller roller, int event);
  FL_EXPORT_C(fl_Roller,    Fl_OverriddenRoller_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Roller,    Fl_OverriddenRoller_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Roller_draw)(fl_Roller o);
  FL_EXPORT_C(void, Fl_Roller_draw_super)(fl_Roller o);
  FL_EXPORT_C(int, Fl_Roller_handle)(fl_Roller o, int event);
  FL_EXPORT_C(int, Fl_Roller_handle_super)(fl_Roller o, int event);
  FL_EXPORT_C(void, Fl_Roller_resize)(fl_Roller o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Roller_resize_super)(fl_Roller o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Roller_show)(fl_Roller o);
  FL_EXPORT_C(void, Fl_Roller_show_super)(fl_Roller o);
  FL_EXPORT_C(void, Fl_Roller_hide)(fl_Roller o);
  FL_EXPORT_C(void, Fl_Roller_hide_super)(fl_Roller o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_ROLLER_C__ */
