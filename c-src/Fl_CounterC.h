#ifndef __FL_COUNTER_C__
#define __FL_COUNTER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Counter is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Counter.H"
#include "FL/Fl_Simple_Counter.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedCounter : public Fl_Counter {
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
    Fl_DerivedCounter(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedCounter(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedCounter();
  };
#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Counter_Type {
    FL_NORMAL_COUNTERC = 0,
    FL_SIMPLE_COUNTERC = 1
  } Counter_Type;
#endif
  FL_EXPORT_C(fl_Group,     Fl_Counter_parent)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_parent)(fl_Counter counter, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Counter_type)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_type)(fl_Counter counter, uchar t);

  FL_EXPORT_C(int,          Fl_Counter_x)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_y)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_w)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_h)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_align)(fl_Counter counter, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Counter_align)(fl_Counter counter);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Counter_box)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_box)(fl_Counter counter, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Counter_color)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_color)(fl_Counter counter, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Counter_set_color_with_bg_sel)(fl_Counter counter,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Counter_selection_color)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_selection_color)(fl_Counter counter, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Counter_label)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_copy_label)(fl_Counter counter, const char* new_label);
  FL_EXPORT_C(void,         Fl_Counter_set_label)(fl_Counter counter, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Counter_labeltype)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_labeltype)(fl_Counter counter, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Counter_labelcolor)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_labelcolor)(fl_Counter counter, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Counter_labelfont)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_labelfont)(fl_Counter counter, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Counter_labelsize)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_labelsize)(fl_Counter counter, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Counter_image)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_image)(fl_Counter counter, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Counter_deimage)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_deimage)(fl_Counter counter, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Counter_tooltip)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_copy_tooltip)(fl_Counter counter, const char* text);
  FL_EXPORT_C(void,         Fl_Counter_set_tooltip)(fl_Counter counter, const char* text);
  FL_EXPORT_C(void,         Fl_Counter_set_callback_with_user_data)(fl_Counter counter, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Counter_set_callback)(fl_Counter counter, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Counter_other_data)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_other_data)(fl_Counter counter, void* v);
  FL_EXPORT_C(void*,        Fl_Counter_user_data)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_user_data)(fl_Counter counter, void* v);
  FL_EXPORT_C(long,         Fl_Counter_argument)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_argument)(fl_Counter counter, long v);
  FL_EXPORT_C(Fl_When,      Fl_Counter_when)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_when)(fl_Counter counter, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Counter_visible)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_visible_r)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_show)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_hide)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_visible)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_clear_visible)(fl_Counter counter);
  FL_EXPORT_C(unsigned int, Fl_Counter_active)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_active_r)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_activate)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_deactivate)(fl_Counter counter);
  FL_EXPORT_C(unsigned int, Fl_Counter_output)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_output)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_clear_output)(fl_Counter counter);
  FL_EXPORT_C(unsigned int, Fl_Counter_takesevents)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_changed)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_clear_changed)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_take_focus)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_visible_focus)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_clear_visible_focus)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_modify_visible_focus)(fl_Counter counter, int v);
  FL_EXPORT_C(unsigned int, Fl_Counter_visible_focus)(fl_Counter counter);
  FL_EXPORT_C(int,          Fl_Counter_contains)(fl_Counter counter, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Counter_inside)(fl_Counter counter, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Counter_redraw)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_redraw_label)(fl_Counter counter);
  FL_EXPORT_C(uchar,        Fl_Counter_damage)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_clear_damage_with_bitmask)(fl_Counter counter, uchar c);
  FL_EXPORT_C(void,         Fl_Counter_clear_damage)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_damage_with_text)(fl_Counter counter, uchar c);
  FL_EXPORT_C(void,         Fl_Counter_damage_inside_widget)(fl_Counter counter, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Counter_draw_label_with_xywh_alignment)(fl_Counter counter, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Counter_measure_label)(fl_Counter counter, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Counter_window)(fl_Counter counter);
  FL_EXPORT_C(fl_Window,    Fl_Counter_top_window)(fl_Counter counter);
  FL_EXPORT_C(fl_Window ,   Fl_Counter_top_window_offset)(fl_Counter counter, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Counter_as_gl_window)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_resize)(fl_Counter counter ,int X, int Y, int W, int H);

  /* Inherited from Fl_Valuator */
  FL_EXPORT_C(void, Fl_Counter_bounds)(fl_Counter counter, double a, double b);
  FL_EXPORT_C(double, Fl_Counter_minimum)(fl_Counter counter);
  FL_EXPORT_C(void, Fl_Counter_set_minimum)(fl_Counter counter, double a);
  FL_EXPORT_C(double, Fl_Counter_maximum)(fl_Counter counter);
  FL_EXPORT_C(void, Fl_Counter_set_maximum)(fl_Counter counter, double a);
  FL_EXPORT_C(void, Fl_Counter_range)(fl_Counter counter, double a, double b);
  FL_EXPORT_C(void, Fl_Counter_set_step)(fl_Counter counter, int a);
  FL_EXPORT_C(void, Fl_Counter_set_step_with_a_b)(fl_Counter counter, double a, int b);
  FL_EXPORT_C(void, Fl_Counter_step_with_s)(fl_Counter counter, double s);
  FL_EXPORT_C(double, Fl_Counter_step)(fl_Counter counter);
  FL_EXPORT_C(void, Fl_Counter_precision)(fl_Counter counter, int precision);
  FL_EXPORT_C(double, Fl_Counter_value)(fl_Counter counter);
  FL_EXPORT_C(int, Fl_Counter_set_value)(fl_Counter counter, double v);
  FL_EXPORT_C(int, Fl_Counter_format)(fl_Counter counter, char* format);
  FL_EXPORT_C(double, Fl_Counter_round)(fl_Counter counter, double v);
  FL_EXPORT_C(double, Fl_Counter_clamp)(fl_Counter counter, double v);
  FL_EXPORT_C(double, Fl_Counter_increment)(fl_Counter counter, double v, int n);

  /* Fl_Counter specific */
  FL_EXPORT_C(fl_Counter,    Fl_Counter_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Counter   , Fl_Counter_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Simple_Counter,Fl_Simple_Counter_New)(int x,int y,int w,int h);
  FL_EXPORT_C(fl_Simple_Counter,Fl_Simple_Counter_New_WithLabel)(int x,int y,int w,int h,const char* label);
  FL_EXPORT_C(void,      Fl_Counter_Destroy)(fl_Counter counter);
  FL_EXPORT_C(int,       Fl_Counter_handle)(fl_Counter counter, int event);
  FL_EXPORT_C(void,      Fl_Counter_lstep)(fl_Counter counter, double lstep);
  FL_EXPORT_C(void,         Fl_Counter_set_textfont)(fl_Counter counter, Fl_Font text);
  FL_EXPORT_C(Fl_Font,     Fl_Counter_textfont)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_textsize)(fl_Counter counter, Fl_Fontsize text);
  FL_EXPORT_C(Fl_Fontsize,     Fl_Counter_textsize)(fl_Counter counter);
  FL_EXPORT_C(void,         Fl_Counter_set_textcolor)(fl_Counter counter, Fl_Color text);
  FL_EXPORT_C(Fl_Color,     Fl_Counter_textcolor)(fl_Counter counter);
  FL_EXPORT_C(fl_Counter,    Fl_OverriddenCounter_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Counter,    Fl_OverriddenCounter_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Counter_draw)(fl_Counter o);
  FL_EXPORT_C(void, Fl_Counter_draw_super)(fl_Counter o);
  FL_EXPORT_C(int, Fl_Counter_handle)(fl_Counter o, int event);
  FL_EXPORT_C(int, Fl_Counter_handle_super)(fl_Counter o, int event);
  FL_EXPORT_C(void, Fl_Counter_resize)(fl_Counter o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Counter_resize_super)(fl_Counter o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Counter_show)(fl_Counter o);
  FL_EXPORT_C(void, Fl_Counter_show_super)(fl_Counter o);
  FL_EXPORT_C(void, Fl_Counter_hide)(fl_Counter o);
  FL_EXPORT_C(void, Fl_Counter_hide_super)(fl_Counter o);

#ifdef __cplusplus
}
#endif
#endif /* __FL_COUNTER_C__ */
