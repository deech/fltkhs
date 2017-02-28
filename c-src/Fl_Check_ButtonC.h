#ifndef __FL_CHECK_BUTTON_C__
#define __FL_CHECK_BUTTON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Check_Button.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedCheck_Button : public Fl_Check_Button {
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
    Fl_DerivedCheck_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedCheck_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedCheck_Button();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Check_Button_handle)(fl_Check_Button self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Check_Button_parent)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_parent)(fl_Check_Button win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Check_Button_type)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_type)(fl_Check_Button win, uchar t);

  FL_EXPORT_C(int,          Fl_Check_Button_x)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_y)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_w)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_h)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_align)(fl_Check_Button check_button, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Check_Button_align)(fl_Check_Button win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Check_Button_box)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_box)(fl_Check_Button win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Check_Button_color)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_color)(fl_Check_Button win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Check_Button_set_color_with_bg_sel)(fl_Check_Button win,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Check_Button_selection_color)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_selection_color)(fl_Check_Button win, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Check_Button_label)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_copy_label)(fl_Check_Button win, const char* new_label);
  FL_EXPORT_C(void,         Fl_Check_Button_set_label)(fl_Check_Button win, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Check_Button_labeltype)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_labeltype)(fl_Check_Button win, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Check_Button_labelcolor)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_labelcolor)(fl_Check_Button win, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Check_Button_labelfont)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_labelfont)(fl_Check_Button win, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Check_Button_labelsize)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_labelsize)(fl_Check_Button win, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Check_Button_image)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_image)(fl_Check_Button win, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Check_Button_deimage)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_deimage)(fl_Check_Button win, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Check_Button_tooltip)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_copy_tooltip)(fl_Check_Button win, const char* text);
  FL_EXPORT_C(void,         Fl_Check_Button_set_tooltip)(fl_Check_Button win, const char* text);
  FL_EXPORT_C(void,         Fl_Check_Button_set_callback_with_user_data)(fl_Check_Button win, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Check_Button_set_callback)(fl_Check_Button win, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Check_Button_user_data)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_user_data)(fl_Check_Button win, void* v);
  FL_EXPORT_C(long,         Fl_Check_Button_argument)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_argument)(fl_Check_Button win, long v);
  FL_EXPORT_C(Fl_When,      Fl_Check_Button_when)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_when)(fl_Check_Button win, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Check_Button_visible)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_visible_r)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_visible)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_visible)(fl_Check_Button win);
  FL_EXPORT_C(unsigned int, Fl_Check_Button_active)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_active_r)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_activate)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_deactivate)(fl_Check_Button win);
  FL_EXPORT_C(unsigned int, Fl_Check_Button_output)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_output)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_output)(fl_Check_Button win);
  FL_EXPORT_C(unsigned int, Fl_Check_Button_takesevents)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_changed)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_changed)(fl_Check_Button win);
  FL_EXPORT_C(int,          Fl_Check_Button_take_focus)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_set_visible_focus)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_visible_focus)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_modify_visible_focus)(fl_Check_Button win, int v);
  FL_EXPORT_C(unsigned int, Fl_Check_Button_visible_focus)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_do_callback)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_do_callback_with_widget_and_user_data)(fl_Check_Button win, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Check_Button_do_callback_with_widget_and_default_user_data)(fl_Check_Button win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Check_Button_contains)(fl_Check_Button win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Check_Button_inside)(fl_Check_Button win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Check_Button_redraw)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_redraw_label)(fl_Check_Button win);
  FL_EXPORT_C(uchar,        Fl_Check_Button_damage)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_damage_with_bitmask)(fl_Check_Button win, uchar c);
  FL_EXPORT_C(void,         Fl_Check_Button_clear_damage)(fl_Check_Button win);
  FL_EXPORT_C(void,         Fl_Check_Button_damage_with_text)(fl_Check_Button win, uchar c);
  FL_EXPORT_C(void,         Fl_Check_Button_damage_inside_widget)(fl_Check_Button win, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Check_Button_draw_label_with_xywh_alignment)(fl_Check_Button win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Check_Button_measure_label)(fl_Check_Button win, int* ww , int* hh);

  /* Fl_Check_Button specific functions */
  FL_EXPORT_C(fl_Check_Button, Fl_Check_Button_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Check_Button, Fl_Check_Button_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,            Fl_Check_Button_Destroy)(fl_Check_Button button);

  FL_EXPORT_C(char        , Fl_Check_Button_value)(fl_Check_Button b);
  FL_EXPORT_C(int         , Fl_Check_Button_set_value)(fl_Check_Button b, int v);
  FL_EXPORT_C(int         , Fl_Check_Button_set)(fl_Check_Button b);
  FL_EXPORT_C(int         , Fl_Check_Button_clear)(fl_Check_Button b);
  FL_EXPORT_C(void        , Fl_Check_Button_setonly)(fl_Check_Button b);
  FL_EXPORT_C(int         , Fl_Check_Button_get_shortcut )(fl_Check_Button b);
  FL_EXPORT_C(void        , Fl_Check_Button_set_shortcut )(fl_Check_Button b, int s);
  FL_EXPORT_C(Fl_Boxtype  , Fl_Check_Button_down_box)(fl_Check_Button b);
  FL_EXPORT_C(void        , Fl_Check_Button_set_down_box)(fl_Check_Button b,Fl_Boxtype boxtype);
  FL_EXPORT_C(Fl_Color    , Fl_Check_Button_down_color )(fl_Check_Button b);
  FL_EXPORT_C(void        , Fl_Check_Button_set_down_color)(fl_Check_Button b, Fl_Color c);
  FL_EXPORT_C(fl_Check_Button,    Fl_OverriddenCheck_Button_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Check_Button,    Fl_OverriddenCheck_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Check_Button_draw)(fl_Check_Button o);
  FL_EXPORT_C(void, Fl_Check_Button_draw_super)(fl_Check_Button o);
  FL_EXPORT_C(int, Fl_Check_Button_handle)(fl_Check_Button o, int event);
  FL_EXPORT_C(int, Fl_Check_Button_handle_super)(fl_Check_Button o, int event);
  FL_EXPORT_C(void, Fl_Check_Button_resize)(fl_Check_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Check_Button_resize_super)(fl_Check_Button o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Check_Button_show)(fl_Check_Button o);
  FL_EXPORT_C(void, Fl_Check_Button_show_super)(fl_Check_Button o);
  FL_EXPORT_C(void, Fl_Check_Button_hide)(fl_Check_Button o);
  FL_EXPORT_C(void, Fl_Check_Button_hide_super)(fl_Check_Button o);

#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_BUTTON_C__*/
