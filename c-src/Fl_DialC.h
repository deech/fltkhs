#ifndef __FL_DIAL_C__
#define __FL_DIAL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Dial is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Dial.H"
#include "FL/Fl_Fill_Dial.H"
#include "FL/Fl_Line_Dial.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedDial : public Fl_Dial {
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
    Fl_DerivedDial(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedDial(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedDial();
  };
#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Dial_Type {
    FL_NORMAL_DIALC = 0,
    FL_LINE_DIALC = 1,
    FL_FILL_DIALC = 2
  } Dial_Type;
#endif

  FL_EXPORT_C(fl_Group,     Fl_Dial_parent)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_parent)(fl_Dial dial, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Dial_type)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_type)(fl_Dial dial, uchar t);

  FL_EXPORT_C(int,          Fl_Dial_x)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_y)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_w)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_h)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_align)(fl_Dial dial, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Dial_align)(fl_Dial dial);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Dial_box)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_box)(fl_Dial dial, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Dial_color)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_color)(fl_Dial dial, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Dial_set_color_with_bg_sel)(fl_Dial dial,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Dial_selection_color)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_selection_color)(fl_Dial dial, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Dial_label)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_copy_label)(fl_Dial dial, const char* new_label);
  FL_EXPORT_C(void,         Fl_Dial_set_label)(fl_Dial dial, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Dial_labeltype)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_labeltype)(fl_Dial dial, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Dial_labelcolor)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_labelcolor)(fl_Dial dial, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Dial_labelfont)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_labelfont)(fl_Dial dial, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Dial_labelsize)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_labelsize)(fl_Dial dial, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Dial_image)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_image)(fl_Dial dial, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Dial_deimage)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_deimage)(fl_Dial dial, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Dial_tooltip)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_copy_tooltip)(fl_Dial dial, const char* text);
  FL_EXPORT_C(void,         Fl_Dial_set_tooltip)(fl_Dial dial, const char* text);
  FL_EXPORT_C(void,         Fl_Dial_set_callback_with_user_data)(fl_Dial dial, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Dial_set_callback)(fl_Dial dial, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Dial_other_data)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_other_data)(fl_Dial dial, void* v);
  FL_EXPORT_C(void*,        Fl_Dial_user_data)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_user_data)(fl_Dial dial, void* v);
  FL_EXPORT_C(long,         Fl_Dial_argument)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_argument)(fl_Dial dial, long v);
  FL_EXPORT_C(Fl_When,      Fl_Dial_when)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_when)(fl_Dial dial, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Dial_visible)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_visible_r)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_show)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_hide)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_visible)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_clear_visible)(fl_Dial dial);
  FL_EXPORT_C(unsigned int, Fl_Dial_active)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_active_r)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_activate)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_deactivate)(fl_Dial dial);
  FL_EXPORT_C(unsigned int, Fl_Dial_output)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_output)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_clear_output)(fl_Dial dial);
  FL_EXPORT_C(unsigned int, Fl_Dial_takesevents)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_changed)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_clear_changed)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_take_focus)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_set_visible_focus)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_clear_visible_focus)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_modify_visible_focus)(fl_Dial dial, int v);
  FL_EXPORT_C(unsigned int, Fl_Dial_visible_focus)(fl_Dial dial);
  FL_EXPORT_C(int,          Fl_Dial_contains)(fl_Dial dial, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Dial_inside)(fl_Dial dial, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Dial_redraw)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_redraw_label)(fl_Dial dial);
  FL_EXPORT_C(uchar,        Fl_Dial_damage)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_clear_damage_with_bitmask)(fl_Dial dial, uchar c);
  FL_EXPORT_C(void,         Fl_Dial_clear_damage)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_damage_with_text)(fl_Dial dial, uchar c);
  FL_EXPORT_C(void,         Fl_Dial_damage_inside_widget)(fl_Dial dial, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Dial_draw_label_with_xywh_alignment)(fl_Dial dial, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Dial_measure_label)(fl_Dial dial, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Dial_window)(fl_Dial dial);
  FL_EXPORT_C(fl_Window,    Fl_Dial_top_window)(fl_Dial dial);
  FL_EXPORT_C(fl_Window ,   Fl_Dial_top_window_offset)(fl_Dial dial, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Dial_as_gl_window)(fl_Dial dial);
  FL_EXPORT_C(void,         Fl_Dial_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Dial_bounds)(fl_Dial dial, double a, double b);
  FL_EXPORT_C(double, Fl_Dial_minimum)(fl_Dial dial);
  FL_EXPORT_C(void, Fl_Dial_set_minimum)(fl_Dial dial, double a);
  FL_EXPORT_C(double, Fl_Dial_maximum)(fl_Dial dial);
  FL_EXPORT_C(void, Fl_Dial_set_maximum)(fl_Dial dial, double a);
  FL_EXPORT_C(void, Fl_Dial_range)(fl_Dial dial, double a, double b);
  FL_EXPORT_C(void, Fl_Dial_set_step)(fl_Dial dial, int a);
  FL_EXPORT_C(void, Fl_Dial_set_step_with_a_b)(fl_Dial dial, double a, int b);
  FL_EXPORT_C(void, Fl_Dial_step_with_s)(fl_Dial dial, double s);
  FL_EXPORT_C(double, Fl_Dial_step)(fl_Dial dial);
  FL_EXPORT_C(void, Fl_Dial_precision)(fl_Dial dial, int precision);
  FL_EXPORT_C(double, Fl_Dial_value)(fl_Dial dial);
  FL_EXPORT_C(int, Fl_Dial_set_value)(fl_Dial dial, double v);
  FL_EXPORT_C(int, Fl_Dial_format)(fl_Dial dial, char* format);
  FL_EXPORT_C(double, Fl_Dial_round)(fl_Dial dial, double v);
  FL_EXPORT_C(double, Fl_Dial_clamp)(fl_Dial dial, double v);
  FL_EXPORT_C(double, Fl_Dial_increment)(fl_Dial dial, double v, int n);

  /* Fl_Dial specific */
  FL_EXPORT_C(fl_Dial      ,Fl_Dial_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Dial      ,Fl_Dial_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Fill_Dial ,Fl_Fill_Dial_New)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Line_Dial ,Fl_Line_Dial_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Line_Dial ,Fl_Line_Dial_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Dial_Destroy)(fl_Dial dial);
  FL_EXPORT_C(void,      Fl_Dial_set_angle1)(fl_Dial dial, short a);
  FL_EXPORT_C(void,      Fl_Dial_set_angle2)(fl_Dial dial, short a);
  FL_EXPORT_C(short,     Fl_Dial_angle1)(fl_Dial dial);
  FL_EXPORT_C(short,     Fl_Dial_angle2)(fl_Dial dial);
  FL_EXPORT_C(int,       Fl_Dial_handle)(fl_Dial dial, int event);
  FL_EXPORT_C(fl_Dial,    Fl_OverriddenDial_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Dial,    Fl_OverriddenDial_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Dial_draw)(fl_Dial o);
  FL_EXPORT_C(void, Fl_Dial_draw_super)(fl_Dial o);
  FL_EXPORT_C(int, Fl_Dial_handle)(fl_Dial o, int event);
  FL_EXPORT_C(int, Fl_Dial_handle_super)(fl_Dial o, int event);
  FL_EXPORT_C(void, Fl_Dial_resize)(fl_Dial o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Dial_resize_super)(fl_Dial o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Dial_show)(fl_Dial o);
  FL_EXPORT_C(void, Fl_Dial_show_super)(fl_Dial o);
  FL_EXPORT_C(void, Fl_Dial_hide)(fl_Dial o);
  FL_EXPORT_C(void, Fl_Dial_hide_super)(fl_Dial o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_DIAL_C__ */
