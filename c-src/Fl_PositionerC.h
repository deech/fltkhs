#ifndef __FL_POSITIONER_C__
#define __FL_POSITIONER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Positioner.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedPositioner : public Fl_Positioner {
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
    Fl_DerivedPositioner(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedPositioner(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedPositioner();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Window,    Fl_Positioner_as_window )(fl_Positioner positioner);
  FL_EXPORT_C(fl_Gl_Window, Fl_Positioner_as_gl_window)(fl_Positioner positioner);
  FL_EXPORT_C(fl_Group,     Fl_Positioner_parent)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_parent)(fl_Positioner positioner, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Positioner_type)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_type)(fl_Positioner positioner, uchar t);

  FL_EXPORT_C(int,          Fl_Positioner_x)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_y)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_w)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_h)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_align)(fl_Positioner positioner, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Positioner_align)(fl_Positioner positioner);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Positioner_box)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_box)(fl_Positioner positioner, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Positioner_color)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_color)(fl_Positioner positioner, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Positioner_set_color_with_bg_sel)(fl_Positioner positioner,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Positioner_selection_color)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_selection_color)(fl_Positioner positioner, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Positioner_label)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_copy_label)(fl_Positioner positioner, const char* new_label);
  FL_EXPORT_C(void,         Fl_Positioner_set_label)(fl_Positioner positioner, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Positioner_labeltype)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_labeltype)(fl_Positioner positioner, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Positioner_labelcolor)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_labelcolor)(fl_Positioner positioner, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Positioner_labelfont)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_labelfont)(fl_Positioner positioner, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Positioner_labelsize)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_labelsize)(fl_Positioner positioner, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Positioner_image)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_image)(fl_Positioner positioner, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Positioner_deimage)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_deimage)(fl_Positioner positioner, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Positioner_tooltip)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_copy_tooltip)(fl_Positioner positioner, const char* text);
  FL_EXPORT_C(void,         Fl_Positioner_set_tooltip)(fl_Positioner positioner, const char* text);
  FL_EXPORT_C(void,         Fl_Positioner_set_callback_with_user_data)(fl_Positioner positioner, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Positioner_set_callback)(fl_Positioner positioner, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Positioner_user_data)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_user_data)(fl_Positioner positioner, void* v);
  FL_EXPORT_C(long,         Fl_Positioner_argument)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_argument)(fl_Positioner positioner, long v);
  FL_EXPORT_C(Fl_When,      Fl_Positioner_when)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_when)(fl_Positioner positioner, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Positioner_visible)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_visible_r)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_visible)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_clear_visible)(fl_Positioner positioner);
  FL_EXPORT_C(unsigned int, Fl_Positioner_active)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_active_r)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_activate)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_deactivate)(fl_Positioner positioner);
  FL_EXPORT_C(unsigned int, Fl_Positioner_output)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_output)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_clear_output)(fl_Positioner positioner);
  FL_EXPORT_C(unsigned int, Fl_Positioner_takesevents)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_changed)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_clear_changed)(fl_Positioner positioner);
  FL_EXPORT_C(int,          Fl_Positioner_take_focus)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_set_visible_focus)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_clear_visible_focus)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_modify_visible_focus)(fl_Positioner positioner, int v);
  FL_EXPORT_C(unsigned int, Fl_Positioner_visible_focus)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_do_callback)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_do_callback_with_widget_and_user_data)(fl_Positioner positioner, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Positioner_do_callback_with_widget_and_default_user_data)(fl_Positioner positioner, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Positioner_contains)(fl_Positioner positioner, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Positioner_inside)(fl_Positioner positioner, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Positioner_redraw)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_redraw_label)(fl_Positioner positioner);
  FL_EXPORT_C(uchar,        Fl_Positioner_damage)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_clear_damage_with_bitmask)(fl_Positioner positioner, uchar c);
  FL_EXPORT_C(void,         Fl_Positioner_clear_damage)(fl_Positioner positioner);
  FL_EXPORT_C(void,         Fl_Positioner_damage_with_text)(fl_Positioner positioner, uchar c);
  FL_EXPORT_C(void,         Fl_Positioner_damage_inside_widget)(fl_Positioner positioner, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Positioner_draw_label_with_xywh_alignment)(fl_Positioner positioner, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Positioner_measure_label)(fl_Positioner positioner, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Positioner_window)(fl_Positioner positioner);
  FL_EXPORT_C(fl_Window,    Fl_Positioner_top_window)(fl_Positioner positioner);
  FL_EXPORT_C(fl_Window ,   Fl_Positioner_top_window_offset)(fl_Positioner positioner, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Positioner_as_group)(fl_Positioner positioner);
  FL_EXPORT_C(fl_Gl_Window, Fl_Positioner_as_gl_window)(fl_Positioner positioner);

  FL_EXPORT_C(fl_Positioner, Fl_Positioner_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Positioner, Fl_Positioner_New_WithLabel)(int x, int y, int w, int h,const char *l);

  FL_EXPORT_C(void, Fl_Positioner_Destroy)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_xvalue)(fl_Positioner positioner, double xvalue);
  FL_EXPORT_C(double, Fl_Positioner_xvalue)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_yvalue)(fl_Positioner positioner, double yvalue);
  FL_EXPORT_C(double, Fl_Positioner_yvalue)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_xminimum)(fl_Positioner positioner, double xminimum);
  FL_EXPORT_C(double, Fl_Positioner_xminimum)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_yminimum)(fl_Positioner positioner, double yminimum);
  FL_EXPORT_C(double, Fl_Positioner_yminimum)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_xmaximum)(fl_Positioner positioner, double xmaximum);
  FL_EXPORT_C(double, Fl_Positioner_xmaximum)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_set_ymaximum)(fl_Positioner positioner, double ymaximum);
  FL_EXPORT_C(double, Fl_Positioner_ymaximum)(fl_Positioner positioner);
  FL_EXPORT_C(void, Fl_Positioner_xbounds)(fl_Positioner positioner, double xstart, double xend);
  FL_EXPORT_C(void, Fl_Positioner_ybounds)(fl_Positioner positioner, double ystart, double yend);
  FL_EXPORT_C(void, Fl_Positioner_xstep)(fl_Positioner positioner, double xstep);
  FL_EXPORT_C(void, Fl_Positioner_ystep)(fl_Positioner positioner, double ystep);
  FL_EXPORT_C(fl_Positioner,    Fl_OverriddenPositioner_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Positioner,    Fl_OverriddenPositioner_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Positioner_draw)(fl_Positioner o);
  FL_EXPORT_C(void, Fl_Positioner_draw_super)(fl_Positioner o);
  FL_EXPORT_C(int, Fl_Positioner_handle)(fl_Positioner o, int event);
  FL_EXPORT_C(int, Fl_Positioner_handle_super)(fl_Positioner o, int event);
  FL_EXPORT_C(void, Fl_Positioner_resize)(fl_Positioner o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Positioner_resize_super)(fl_Positioner o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Positioner_show)(fl_Positioner o);
  FL_EXPORT_C(void, Fl_Positioner_show_super)(fl_Positioner o);
  FL_EXPORT_C(void, Fl_Positioner_hide)(fl_Positioner o);
  FL_EXPORT_C(void, Fl_Positioner_hide_super)(fl_Positioner o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_POSITIONER_C__*/
