#ifndef __FL_BUTTON_C__
#define __FL_BUTTON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Button.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(void,         Fl_Button_draw_super)(fl_Button button);
  FL_EXPORT_C(int ,         Fl_Button_handle_super)(fl_Button button,int event);
  FL_EXPORT_C(int ,         Fl_Button_handle)(fl_Button button,int event);
  FL_EXPORT_C(void,         Fl_Button_resize_super)(fl_Button button,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Button_resize )(fl_Button button,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Button_show_super)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_show )(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_hide_super)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_hide )(fl_Button button);
  FL_EXPORT_C(fl_Window,    Fl_Button_as_window_super)(fl_Button button);
  FL_EXPORT_C(fl_Window,    Fl_Button_as_window )(fl_Button button);
  FL_EXPORT_C(fl_Gl_Window, Fl_Button_as_gl_window_super)(fl_Button button);
  FL_EXPORT_C(fl_Gl_Window, Fl_Button_as_gl_window)(fl_Button button);
  FL_EXPORT_C(fl_Group,     Fl_Button_parent)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_parent)(fl_Button button, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Button_type)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_type)(fl_Button button, uchar t);

FL_EXPORT_C(void, Fl_Button_draw_box)(fl_Button Button);
FL_EXPORT_C(void, Fl_Button_draw_box_with_tc)(fl_Button Button,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Button_draw_box_with_txywhc)(fl_Button Button,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Button_draw_backdrop)(fl_Button Button);
FL_EXPORT_C(void, Fl_Button_draw_focus)(fl_Button Button);
FL_EXPORT_C(void, Fl_Button_draw_focus_with_txywh)(fl_Button Button,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Button_draw_label)(fl_Button Button);
  FL_EXPORT_C(int,          Fl_Button_x)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_y)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_w)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_h)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_align)(fl_Button button, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Button_align)(fl_Button button);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Button_box)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_box)(fl_Button button, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Button_color)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_color)(fl_Button button, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Button_set_color_with_bg_sel)(fl_Button button,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Button_selection_color)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_selection_color)(fl_Button button, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Button_label)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_copy_label)(fl_Button button, const char* new_label);
  FL_EXPORT_C(void,         Fl_Button_set_label)(fl_Button button, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Button_labeltype)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_labeltype)(fl_Button button, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Button_labelcolor)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_labelcolor)(fl_Button button, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Button_labelfont)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_labelfont)(fl_Button button, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Button_labelsize)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_labelsize)(fl_Button button, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Button_image)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_image)(fl_Button button, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Button_deimage)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_deimage)(fl_Button button, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Button_tooltip)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_copy_tooltip)(fl_Button button, const char* text);
  FL_EXPORT_C(void,         Fl_Button_set_tooltip)(fl_Button button, const char* text);
  FL_EXPORT_C(void,         Fl_Button_set_callback_with_user_data)(fl_Button button, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Button_set_callback)(fl_Button button, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Button_user_data)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_user_data)(fl_Button button, void* v);
  FL_EXPORT_C(long,         Fl_Button_argument)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_argument)(fl_Button button, long v);
  FL_EXPORT_C(Fl_When,      Fl_Button_when)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_when)(fl_Button button, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Button_visible)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_visible_r)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_visible)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_clear_visible)(fl_Button button);
  FL_EXPORT_C(unsigned int, Fl_Button_active)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_active_r)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_activate)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_deactivate)(fl_Button button);
  FL_EXPORT_C(unsigned int, Fl_Button_output)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_output)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_clear_output)(fl_Button button);
  FL_EXPORT_C(unsigned int, Fl_Button_takesevents)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_changed)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_clear_changed)(fl_Button button);
  FL_EXPORT_C(int,          Fl_Button_take_focus)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_set_visible_focus)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_clear_visible_focus)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_modify_visible_focus)(fl_Button button, int v);
  FL_EXPORT_C(unsigned int, Fl_Button_visible_focus)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_do_callback)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_do_callback_with_widget_and_user_data)(fl_Button button, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Button_do_callback_with_widget_and_default_user_data)(fl_Button button, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Button_contains)(fl_Button button, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Button_inside)(fl_Button button, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Button_redraw)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_redraw_label)(fl_Button button);
  FL_EXPORT_C(uchar,        Fl_Button_damage)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_clear_damage_with_bitmask)(fl_Button button, uchar c);
  FL_EXPORT_C(void,         Fl_Button_clear_damage)(fl_Button button);
  FL_EXPORT_C(void,         Fl_Button_damage_with_text)(fl_Button button, uchar c);
  FL_EXPORT_C(void,         Fl_Button_damage_inside_widget)(fl_Button button, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Button_draw_label_with_xywh_alignment)(fl_Button button, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Button_measure_label)(fl_Button button, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Button_window)(fl_Button button);
  FL_EXPORT_C(fl_Window,    Fl_Button_top_window)(fl_Button button);
  FL_EXPORT_C(fl_Window ,   Fl_Button_top_window_offset)(fl_Button button, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Button_as_group_super)(fl_Button button);
  FL_EXPORT_C(fl_Group,     Fl_Button_as_group)(fl_Button button);
  FL_EXPORT_C(fl_Gl_Window, Fl_Button_as_gl_window)(fl_Button button);
#ifdef __cplusplus
  class Fl_DerivedButton : public Fl_Button {
    fl_Button_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    void draw_box();
    void draw_box(Fl_Boxtype t, Fl_Color c);
    void draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
    void draw_backdrop();
    void draw_focus();
    void draw_focus(Fl_Boxtype t, int x,int y,int w,int h);
    void draw_label();
    void draw_label(int x,int y,int w,int h,Fl_Align alignment);
    virtual void draw();
    void draw_super();
    virtual int handle(int event);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_DerivedButton(int X, int Y, int W, int H, const char *l, fl_Button_Virtual_Funcs* funcs);
    Fl_DerivedButton(int X, int Y, int W, int H, fl_Button_Virtual_Funcs* funcs);
    ~Fl_DerivedButton();
  };
#endif  
  /* Fl_Button specific functions */
  FL_EXPORT_C(fl_Button_Virtual_Funcs*, Fl_Button_default_virtual_funcs)();
  FL_EXPORT_C(void*, Fl_Button_other_data)(fl_Button button);
  FL_EXPORT_C(void, Fl_Button_set_other_data)(fl_Button button, void* v);
  FL_EXPORT_C(fl_Button,    Fl_Button_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Button   , Fl_Button_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Button,    Fl_OverriddenButton_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Button_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Button   , Fl_OverriddenButton_New)(int x, int y, int w, int h, fl_Button_Virtual_Funcs* funcs);
  FL_EXPORT_C(void        , Fl_Button_Destroy)(fl_Button button);
  FL_EXPORT_C(char        , Fl_Button_value)(fl_Button b);
  FL_EXPORT_C(int         , Fl_Button_set_value)(fl_Button b, int v);
  FL_EXPORT_C(int         , Fl_Button_set)(fl_Button b);
  FL_EXPORT_C(int         , Fl_Button_clear)(fl_Button b);
  FL_EXPORT_C(void        , Fl_Button_setonly)(fl_Button b);
  FL_EXPORT_C(int         , Fl_Button_get_shortcut )(fl_Button b);
  FL_EXPORT_C(void        , Fl_Button_set_shortcut )(fl_Button b, int s);
  FL_EXPORT_C(Fl_Boxtype  , Fl_Button_down_box)(fl_Button b);
  FL_EXPORT_C(void        , Fl_Button_set_down_box)(fl_Button b,Fl_Boxtype boxtype);
  FL_EXPORT_C(Fl_Color    , Fl_Button_down_color )(fl_Button b);
  FL_EXPORT_C(void        , Fl_Button_set_down_color)(fl_Button b, Fl_Color c);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_BUTTON_C__*/
