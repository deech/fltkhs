#ifndef __FL_SCROLLBAR_C__
#define __FL_SCROLLBAR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Scrollbar is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Scrollbar.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedScrollbar : public Fl_Scrollbar {
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
    Fl_DerivedScrollbar(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedScrollbar(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedScrollbar();
  };
#endif
  FL_EXPORT_C(int,Fl_Scrollbar_handle)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Scrollbar_parent)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_parent)(fl_Scrollbar slider, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Scrollbar_type)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_type)(fl_Scrollbar slider, uchar t);

  FL_EXPORT_C(int,          Fl_Scrollbar_x)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_y)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_w)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_h)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_align)(fl_Scrollbar slider, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Scrollbar_align)(fl_Scrollbar slider);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Scrollbar_box)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_box)(fl_Scrollbar slider, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Scrollbar_color)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_color)(fl_Scrollbar slider, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_color_with_bg_sel)(fl_Scrollbar slider,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Scrollbar_selection_color)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_selection_color)(fl_Scrollbar slider, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Scrollbar_label)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_copy_label)(fl_Scrollbar slider, const char* new_label);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_label)(fl_Scrollbar slider, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Scrollbar_labeltype)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_labeltype)(fl_Scrollbar slider, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Scrollbar_labelcolor)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_labelcolor)(fl_Scrollbar slider, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Scrollbar_labelfont)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_labelfont)(fl_Scrollbar slider, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Scrollbar_labelsize)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_labelsize)(fl_Scrollbar slider, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Scrollbar_image)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_image)(fl_Scrollbar slider, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Scrollbar_deimage)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_deimage)(fl_Scrollbar slider, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Scrollbar_tooltip)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_copy_tooltip)(fl_Scrollbar slider, const char* text);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_tooltip)(fl_Scrollbar slider, const char* text);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_callback_with_user_data)(fl_Scrollbar slider, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_callback)(fl_Scrollbar slider, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Scrollbar_other_data)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_other_data)(fl_Scrollbar slider, void* v);
  FL_EXPORT_C(void*,        Fl_Scrollbar_user_data)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_user_data)(fl_Scrollbar slider, void* v);
  FL_EXPORT_C(long,         Fl_Scrollbar_argument)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_argument)(fl_Scrollbar slider, long v);
  FL_EXPORT_C(Fl_When,      Fl_Scrollbar_when)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_when)(fl_Scrollbar slider, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Scrollbar_visible)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_visible_r)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_show)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_hide)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_visible)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_visible)(fl_Scrollbar slider);
  FL_EXPORT_C(unsigned int, Fl_Scrollbar_active)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_active_r)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_activate)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_deactivate)(fl_Scrollbar slider);
  FL_EXPORT_C(unsigned int, Fl_Scrollbar_output)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_output)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_output)(fl_Scrollbar slider);
  FL_EXPORT_C(unsigned int, Fl_Scrollbar_takesevents)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_changed)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_changed)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_take_focus)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_set_visible_focus)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_visible_focus)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_modify_visible_focus)(fl_Scrollbar slider, int v);
  FL_EXPORT_C(unsigned int, Fl_Scrollbar_visible_focus)(fl_Scrollbar slider);
  FL_EXPORT_C(int,          Fl_Scrollbar_contains)(fl_Scrollbar slider, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Scrollbar_inside)(fl_Scrollbar slider, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Scrollbar_redraw)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_redraw_label)(fl_Scrollbar slider);
  FL_EXPORT_C(uchar,        Fl_Scrollbar_damage)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_damage_with_bitmask)(fl_Scrollbar slider, uchar c);
  FL_EXPORT_C(void,         Fl_Scrollbar_clear_damage)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_damage_with_text)(fl_Scrollbar slider, uchar c);
  FL_EXPORT_C(void,         Fl_Scrollbar_damage_inside_widget)(fl_Scrollbar slider, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Scrollbar_draw_label_with_xywh_alignment)(fl_Scrollbar slider, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Scrollbar_measure_label)(fl_Scrollbar slider, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Scrollbar_window)(fl_Scrollbar slider);
  FL_EXPORT_C(fl_Window,    Fl_Scrollbar_top_window)(fl_Scrollbar slider);
  FL_EXPORT_C(fl_Window ,   Fl_Scrollbar_top_window_offset)(fl_Scrollbar slider, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Scrollbar_as_gl_window)(fl_Scrollbar slider);
  FL_EXPORT_C(void,         Fl_Scrollbar_resize)(fl_Table table,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Scrollbar_bounds)(fl_Scrollbar slider, double a, double b);
  FL_EXPORT_C(double, Fl_Scrollbar_minimum)(fl_Scrollbar slider);
  FL_EXPORT_C(void, Fl_Scrollbar_set_minimum)(fl_Scrollbar slider, double a);
  FL_EXPORT_C(double, Fl_Scrollbar_maximum)(fl_Scrollbar slider);
  FL_EXPORT_C(void, Fl_Scrollbar_set_maximum)(fl_Scrollbar slider, double a);
  FL_EXPORT_C(void, Fl_Scrollbar_range)(fl_Scrollbar slider, double a, double b);
  FL_EXPORT_C(void, Fl_Scrollbar_set_step)(fl_Scrollbar slider, int a);
  FL_EXPORT_C(void, Fl_Scrollbar_set_step_with_a_b)(fl_Scrollbar slider, double a, int b);
  FL_EXPORT_C(void, Fl_Scrollbar_step_with_s)(fl_Scrollbar slider, double s);
  FL_EXPORT_C(double, Fl_Scrollbar_step)(fl_Scrollbar slider);
  FL_EXPORT_C(void, Fl_Scrollbar_precision)(fl_Scrollbar slider, int precision);
  FL_EXPORT_C(double, Fl_Scrollbar_value)(fl_Scrollbar slider);
  FL_EXPORT_C(int, Fl_Scrollbar_set_value)(fl_Scrollbar slider, double v);
  FL_EXPORT_C(int, Fl_Scrollbar_format)(fl_Scrollbar slider, char* format);
  FL_EXPORT_C(double, Fl_Scrollbar_round)(fl_Scrollbar slider, double v);
  FL_EXPORT_C(double, Fl_Scrollbar_clamp)(fl_Scrollbar slider, double v);
  FL_EXPORT_C(double, Fl_Scrollbar_increment)(fl_Scrollbar slider, double v, int n);

  /* Fl_Scrollbar specific */
  FL_EXPORT_C(fl_Scrollbar,    Fl_Scrollbar_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Scrollbar   , Fl_Scrollbar_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,      Fl_Scrollbar_Destroy)(fl_Scrollbar slider);
  FL_EXPORT_C(int, Fl_Scrollbar_scrollvalue)(fl_Scrollbar slider, int pos,int size,int first,int total);
  FL_EXPORT_C(float, Fl_Scrollbar_set_slider_size)(fl_Scrollbar slider);
  FL_EXPORT_C(void, Fl_Scrollbar_slider_size)(fl_Scrollbar slider, double v);
  FL_EXPORT_C(Fl_Boxtype, Fl_Scrollbar_slider)(fl_Scrollbar slider);
  FL_EXPORT_C(void, Fl_Scrollbar_set_slider)(fl_Scrollbar slider, Fl_Boxtype c);
  FL_EXPORT_C(void, Fl_Scrollbar_set_linesize)(fl_Scrollbar slider, int i);
  FL_EXPORT_C(int  , Fl_Scrollbar_linesize)(fl_Scrollbar slider);
  FL_EXPORT_C(fl_Scrollbar,    Fl_OverriddenScrollbar_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Scrollbar,    Fl_OverriddenScrollbar_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Scrollbar_draw)(fl_Scrollbar o);
  FL_EXPORT_C(void, Fl_Scrollbar_draw_super)(fl_Scrollbar o);
  FL_EXPORT_C(int, Fl_Scrollbar_handle)(fl_Scrollbar o, int event);
  FL_EXPORT_C(int, Fl_Scrollbar_handle_super)(fl_Scrollbar o, int event);
  FL_EXPORT_C(void, Fl_Scrollbar_resize)(fl_Scrollbar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Scrollbar_resize_super)(fl_Scrollbar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Scrollbar_show)(fl_Scrollbar o);
  FL_EXPORT_C(void, Fl_Scrollbar_show_super)(fl_Scrollbar o);
  FL_EXPORT_C(void, Fl_Scrollbar_hide)(fl_Scrollbar o);
  FL_EXPORT_C(void, Fl_Scrollbar_hide_super)(fl_Scrollbar o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SCROLLBAR_C__ */
