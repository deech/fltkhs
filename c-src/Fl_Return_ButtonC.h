#ifndef __FL_RETURN_BUTTON_C__
#define __FL_RETURN_BUTTON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Return_Button.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedReturn_Button : public Fl_Return_Button {
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
    Fl_DerivedReturn_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedReturn_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedReturn_Button();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Return_Button_handle)(fl_Return_Button self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Return_Button_parent)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_parent)(fl_Return_Button return_button, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Return_Button_type)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_type)(fl_Return_Button return_button, uchar t);

  FL_EXPORT_C(int,          Fl_Return_Button_x)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_y)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_w)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_h)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_align)(fl_Return_Button return_button, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Return_Button_align)(fl_Return_Button return_button);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Return_Button_box)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_box)(fl_Return_Button return_button, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Return_Button_color)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_color)(fl_Return_Button return_button, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Return_Button_set_color_with_bg_sel)(fl_Return_Button return_button,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Return_Button_selection_color)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_selection_color)(fl_Return_Button return_button, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Return_Button_label)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_copy_label)(fl_Return_Button return_button, const char* new_label);
  FL_EXPORT_C(void,         Fl_Return_Button_set_label)(fl_Return_Button return_button, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Return_Button_labeltype)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_labeltype)(fl_Return_Button return_button, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Return_Button_labelcolor)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_labelcolor)(fl_Return_Button return_button, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Return_Button_labelfont)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_labelfont)(fl_Return_Button return_button, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Return_Button_labelsize)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_labelsize)(fl_Return_Button return_button, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Return_Button_image)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_image)(fl_Return_Button return_button, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Return_Button_deimage)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_deimage)(fl_Return_Button return_button, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Return_Button_tooltip)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_copy_tooltip)(fl_Return_Button return_button, const char* text);
  FL_EXPORT_C(void,         Fl_Return_Button_set_tooltip)(fl_Return_Button return_button, const char* text);
  FL_EXPORT_C(void,         Fl_Return_Button_set_callback_with_user_data)(fl_Return_Button return_button, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Return_Button_set_callback)(fl_Return_Button return_button, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Return_Button_user_data)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_user_data)(fl_Return_Button return_button, void* v);
  FL_EXPORT_C(long,         Fl_Return_Button_argument)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_argument)(fl_Return_Button return_button, long v);
  FL_EXPORT_C(Fl_When,      Fl_Return_Button_when)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_when)(fl_Return_Button return_button, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Return_Button_visible)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_visible_r)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_visible)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_visible)(fl_Return_Button return_button);
  FL_EXPORT_C(unsigned int, Fl_Return_Button_active)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_active_r)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_activate)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_deactivate)(fl_Return_Button return_button);
  FL_EXPORT_C(unsigned int, Fl_Return_Button_output)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_output)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_output)(fl_Return_Button return_button);
  FL_EXPORT_C(unsigned int, Fl_Return_Button_takesevents)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_changed)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_changed)(fl_Return_Button return_button);
  FL_EXPORT_C(int,          Fl_Return_Button_take_focus)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_set_visible_focus)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_visible_focus)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_modify_visible_focus)(fl_Return_Button return_button, int v);
  FL_EXPORT_C(unsigned int, Fl_Return_Button_visible_focus)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_do_callback)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_do_callback_with_widget_and_user_data)(fl_Return_Button return_button, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Return_Button_do_callback_with_widget_and_default_user_data)(fl_Return_Button return_button, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Return_Button_contains)(fl_Return_Button return_button, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Return_Button_inside)(fl_Return_Button return_button, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Return_Button_redraw)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_redraw_label)(fl_Return_Button return_button);
  FL_EXPORT_C(uchar,        Fl_Return_Button_damage)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_damage_with_bitmask)(fl_Return_Button return_button, uchar c);
  FL_EXPORT_C(void,         Fl_Return_Button_clear_damage)(fl_Return_Button return_button);
  FL_EXPORT_C(void,         Fl_Return_Button_damage_with_text)(fl_Return_Button return_button, uchar c);
  FL_EXPORT_C(void,         Fl_Return_Button_damage_inside_widget)(fl_Return_Button return_button, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Return_Button_draw_label_with_xywh_alignment)(fl_Return_Button return_button, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Return_Button_measure_label)(fl_Return_Button return_button, int* ww , int* hh);

  FL_EXPORT_C(fl_Window,    Fl_Return_Button_window)(fl_Return_Button return_button);
  FL_EXPORT_C(fl_Window,    Fl_Return_Button_top_window)(fl_Return_Button return_button);
  FL_EXPORT_C(fl_Window ,   Fl_Return_Button_top_window_offset)(fl_Return_Button return_button, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Return_Button_as_group)(fl_Return_Button return_button);
  FL_EXPORT_C(fl_Gl_Window, Fl_Return_Button_as_gl_window)(fl_Return_Button return_button);
  /* Fl_Return_Button specific functions */
  FL_EXPORT_C(fl_Return_Button,    Fl_Return_Button_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Return_Button,    Fl_Return_Button_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,Fl_Return_Button_Destroy)(fl_Return_Button button);
  FL_EXPORT_C(char        , Fl_Return_Button_value)(fl_Return_Button b);
  FL_EXPORT_C(int         , Fl_Return_Button_set_value)(fl_Return_Button b, int v);
  FL_EXPORT_C(int         , Fl_Return_Button_set)(fl_Return_Button b);
  FL_EXPORT_C(int         , Fl_Return_Button_clear)(fl_Return_Button b);
  FL_EXPORT_C(void        , Fl_Return_Button_setonly)(fl_Return_Button b);
  FL_EXPORT_C(int         , Fl_Return_Button_get_shortcut )(fl_Return_Button b);
  FL_EXPORT_C(void        , Fl_Return_Button_set_shortcut )(fl_Return_Button b, int s);
  FL_EXPORT_C(Fl_Boxtype  , Fl_Return_Button_down_box)(fl_Return_Button b);
  FL_EXPORT_C(void        , Fl_Return_Button_set_down_box)(fl_Return_Button b,Fl_Boxtype boxtype);
  FL_EXPORT_C(Fl_Color    , Fl_Return_Button_down_color )(fl_Return_Button b);
  FL_EXPORT_C(void        , Fl_Return_Button_set_down_color)(fl_Return_Button b, Fl_Color c);
  FL_EXPORT_C(fl_Return_Button,    Fl_OverriddenReturn_Button_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Return_Button,    Fl_OverriddenReturn_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Return_Button_draw)(fl_Return_Button o);
  FL_EXPORT_C(void, Fl_Return_Button_draw_super)(fl_Return_Button o);
  FL_EXPORT_C(int, Fl_Return_Button_handle)(fl_Return_Button o, int event);
  FL_EXPORT_C(int, Fl_Return_Button_handle_super)(fl_Return_Button o, int event);
  FL_EXPORT_C(void, Fl_Return_Button_resize)(fl_Return_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Return_Button_resize_super)(fl_Return_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Return_Button_show)(fl_Return_Button o);
  FL_EXPORT_C(void, Fl_Return_Button_show_super)(fl_Return_Button o);
  FL_EXPORT_C(void, Fl_Return_Button_hide)(fl_Return_Button o);
  FL_EXPORT_C(void, Fl_Return_Button_hide_super)(fl_Return_Button o);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_RETURN_BUTTON_C__*/
