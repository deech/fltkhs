#ifndef __FL_PROGRESS_C__
#define __FL_PROGRESS_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Progress.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedProgress : public Fl_Progress {
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
    Fl_DerivedProgress(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedProgress(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedProgress();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int ,         Fl_Progress_handle )(fl_Progress progress,int event);
  FL_EXPORT_C(void,         Fl_Progress_resize )(fl_Progress progress,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Progress_show )(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_hide )(fl_Progress progress);
  FL_EXPORT_C(fl_Window,    Fl_Progress_as_window )(fl_Progress progress);
  FL_EXPORT_C(fl_Gl_Window, Fl_Progress_as_gl_window)(fl_Progress progress);
  FL_EXPORT_C(fl_Group,     Fl_Progress_parent)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_parent)(fl_Progress progress, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Progress_type)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_type)(fl_Progress progress, uchar t);

  FL_EXPORT_C(int,          Fl_Progress_x)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_y)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_w)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_h)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_align)(fl_Progress progress, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Progress_align)(fl_Progress progress);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Progress_box)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_box)(fl_Progress progress, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Progress_color)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_color)(fl_Progress progress, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Progress_set_color_with_bg_sel)(fl_Progress progress,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Progress_selection_color)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_selection_color)(fl_Progress progress, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Progress_label)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_copy_label)(fl_Progress progress, const char* new_label);
  FL_EXPORT_C(void,         Fl_Progress_set_label)(fl_Progress progress, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Progress_labeltype)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_labeltype)(fl_Progress progress, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Progress_labelcolor)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_labelcolor)(fl_Progress progress, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Progress_labelfont)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_labelfont)(fl_Progress progress, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Progress_labelsize)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_labelsize)(fl_Progress progress, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Progress_image)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_image)(fl_Progress progress, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Progress_deimage)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_deimage)(fl_Progress progress, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Progress_tooltip)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_copy_tooltip)(fl_Progress progress, const char* text);
  FL_EXPORT_C(void,         Fl_Progress_set_tooltip)(fl_Progress progress, const char* text);
  FL_EXPORT_C(void,         Fl_Progress_set_callback_with_user_data)(fl_Progress progress, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Progress_set_callback)(fl_Progress progress, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Progress_user_data)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_user_data)(fl_Progress progress, void* v);
  FL_EXPORT_C(long,         Fl_Progress_argument)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_argument)(fl_Progress progress, long v);
  FL_EXPORT_C(Fl_When,      Fl_Progress_when)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_when)(fl_Progress progress, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Progress_visible)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_visible_r)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_visible)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_clear_visible)(fl_Progress progress);
  FL_EXPORT_C(unsigned int, Fl_Progress_active)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_active_r)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_activate)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_deactivate)(fl_Progress progress);
  FL_EXPORT_C(unsigned int, Fl_Progress_output)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_output)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_clear_output)(fl_Progress progress);
  FL_EXPORT_C(unsigned int, Fl_Progress_takesevents)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_changed)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_clear_changed)(fl_Progress progress);
  FL_EXPORT_C(int,          Fl_Progress_take_focus)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_set_visible_focus)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_clear_visible_focus)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_modify_visible_focus)(fl_Progress progress, int v);
  FL_EXPORT_C(unsigned int, Fl_Progress_visible_focus)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_do_callback)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_do_callback_with_widget_and_user_data)(fl_Progress progress, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Progress_do_callback_with_widget_and_default_user_data)(fl_Progress progress, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Progress_contains)(fl_Progress progress, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Progress_inside)(fl_Progress progress, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Progress_redraw)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_redraw_label)(fl_Progress progress);
  FL_EXPORT_C(uchar,        Fl_Progress_damage)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_clear_damage_with_bitmask)(fl_Progress progress, uchar c);
  FL_EXPORT_C(void,         Fl_Progress_clear_damage)(fl_Progress progress);
  FL_EXPORT_C(void,         Fl_Progress_damage_with_text)(fl_Progress progress, uchar c);
  FL_EXPORT_C(void,         Fl_Progress_damage_inside_widget)(fl_Progress progress, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Progress_draw_label_with_xywh_alignment)(fl_Progress progress, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Progress_measure_label)(fl_Progress progress, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Progress_window)(fl_Progress progress);
  FL_EXPORT_C(fl_Window,    Fl_Progress_top_window)(fl_Progress progress);
  FL_EXPORT_C(fl_Window ,   Fl_Progress_top_window_offset)(fl_Progress progress, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Progress_as_group)(fl_Progress progress);
  FL_EXPORT_C(fl_Gl_Window, Fl_Progress_as_gl_window)(fl_Progress progress);

  FL_EXPORT_C(fl_Progress, Fl_Progress_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Progress, Fl_Progress_New_WithLabel)(int x, int y, int w, int h,const char *l);

  FL_EXPORT_C(void, Fl_Progress_Destroy)(fl_Progress progress);
  FL_EXPORT_C(void ,     Fl_Progress_set_maximum)(fl_Progress progress,float v);
  FL_EXPORT_C(float,     Fl_Progress_maximum)(fl_Progress progress);
  FL_EXPORT_C(void ,     Fl_Progress_set_minimum)(fl_Progress progress,float v);
  FL_EXPORT_C(float,     Fl_Progress_minimum)(fl_Progress progress);
  FL_EXPORT_C(void ,     Fl_Progress_set_value  )(fl_Progress progress,float v);
  FL_EXPORT_C(float,     Fl_Progress_value  )(fl_Progress progress);
  FL_EXPORT_C(fl_Progress,    Fl_OverriddenProgress_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Progress,    Fl_OverriddenProgress_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Progress_draw)(fl_Progress o);
  FL_EXPORT_C(void, Fl_Progress_draw_super)(fl_Progress o);
  FL_EXPORT_C(int, Fl_Progress_handle)(fl_Progress o, int event);
  FL_EXPORT_C(int, Fl_Progress_handle_super)(fl_Progress o, int event);
  FL_EXPORT_C(void, Fl_Progress_resize)(fl_Progress o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Progress_resize_super)(fl_Progress o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Progress_show)(fl_Progress o);
  FL_EXPORT_C(void, Fl_Progress_show_super)(fl_Progress o);
  FL_EXPORT_C(void, Fl_Progress_hide)(fl_Progress o);
  FL_EXPORT_C(void, Fl_Progress_hide_super)(fl_Progress o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_PROGRESS_C__*/
