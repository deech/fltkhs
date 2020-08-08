#ifndef __FL_REPEAT_BUTTON_C__
#define __FL_REPEAT_BUTTON_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Repeat_Button.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedRepeat_Button : public Fl_Repeat_Button {
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
    void destroy_data();
    Fl_DerivedRepeat_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedRepeat_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedRepeat_Button();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_handle,(fl_Repeat_Button self, int event));
  FL_EXPORT_C_HEADER(int,Fl_DerivedRepeat_Button_handle,(fl_Repeat_Button self, int event));
  FL_EXPORT_C_HEADER(fl_Group,Fl_Repeat_Button_parent,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_parent,(fl_Repeat_Button repeat_button, fl_Group grp));
  FL_EXPORT_C_HEADER(uchar,Fl_Repeat_Button_type,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_type,(fl_Repeat_Button repeat_button, uchar t));

  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_x,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_y,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_w,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_h,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_align,(fl_Repeat_Button repeat_button, Fl_Align alignment));
  FL_EXPORT_C_HEADER(Fl_Align,Fl_Repeat_Button_align,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(Fl_Boxtype,Fl_Repeat_Button_box,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_box,(fl_Repeat_Button repeat_button, Fl_Boxtype new_box));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Repeat_Button_color,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_color,(fl_Repeat_Button repeat_button, Fl_Color bg));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_color_with_bg_sel,(fl_Repeat_Button repeat_button,Fl_Color bg, Fl_Color a));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Repeat_Button_selection_color,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_selection_color,(fl_Repeat_Button repeat_button, Fl_Color a));
  FL_EXPORT_C_HEADER(const char*,Fl_Repeat_Button_label,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_copy_label,(fl_Repeat_Button repeat_button, const char* new_label));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_label,(fl_Repeat_Button repeat_button, const char* text));
  FL_EXPORT_C_HEADER(Fl_Labeltype,Fl_Repeat_Button_labeltype,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_labeltype,(fl_Repeat_Button repeat_button, Fl_Labeltype a));
  FL_EXPORT_C_HEADER(Fl_Color,Fl_Repeat_Button_labelcolor,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_labelcolor,(fl_Repeat_Button repeat_button, Fl_Color c));
  FL_EXPORT_C_HEADER(Fl_Font,Fl_Repeat_Button_labelfont,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_labelfont,(fl_Repeat_Button repeat_button, Fl_Font c));
  FL_EXPORT_C_HEADER(Fl_Fontsize,Fl_Repeat_Button_labelsize,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_labelsize,(fl_Repeat_Button repeat_button, Fl_Fontsize pix));
  FL_EXPORT_C_HEADER(fl_Image,Fl_Repeat_Button_image,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_image,(fl_Repeat_Button repeat_button, fl_Image pix));
  FL_EXPORT_C_HEADER(fl_Image,Fl_Repeat_Button_deimage,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_deimage,(fl_Repeat_Button repeat_button, fl_Image pix));
  FL_EXPORT_C_HEADER(const char*,Fl_Repeat_Button_tooltip,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_copy_tooltip,(fl_Repeat_Button repeat_button, const char* text));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_tooltip,(fl_Repeat_Button repeat_button, const char* text));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_callback_with_user_data,(fl_Repeat_Button repeat_button, fl_Callback* cb, void* p));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_callback,(fl_Repeat_Button repeat_button, fl_Callback* cb));
  FL_EXPORT_C_HEADER(void*,Fl_Repeat_Button_user_data,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_user_data,(fl_Repeat_Button repeat_button, void* v));
  FL_EXPORT_C_HEADER(long,Fl_Repeat_Button_argument,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_argument,(fl_Repeat_Button repeat_button, long v));
  FL_EXPORT_C_HEADER(Fl_When,Fl_Repeat_Button_when,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_when,(fl_Repeat_Button repeat_button, uchar i));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Repeat_Button_visible,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_visible_r,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_visible,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_visible,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Repeat_Button_active,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_active_r,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_activate,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_deactivate,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Repeat_Button_output,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_output,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_output,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Repeat_Button_takesevents,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_changed,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_changed,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_take_focus,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_set_visible_focus,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_visible_focus,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_modify_visible_focus,(fl_Repeat_Button repeat_button, int v));
  FL_EXPORT_C_HEADER(unsigned int,Fl_Repeat_Button_visible_focus,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_do_callback,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_do_callback_with_widget_and_user_data,(fl_Repeat_Button repeat_button, fl_Widget w, long arg));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_do_callback_with_widget_and_default_user_data,(fl_Repeat_Button repeat_button, fl_Widget w));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_contains,(fl_Repeat_Button repeat_button, fl_Widget w));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_inside,(fl_Repeat_Button repeat_button, fl_Widget w));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_redraw,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_redraw_label,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(uchar,Fl_Repeat_Button_damage,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_damage_with_bitmask,(fl_Repeat_Button repeat_button, uchar c));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_clear_damage,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_damage_with_text,(fl_Repeat_Button repeat_button, uchar c));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_damage_inside_widget,(fl_Repeat_Button repeat_button, uchar c, int x , int y , int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_draw_label_with_xywh_alignment,(fl_Repeat_Button repeat_button, int x , int y , int w, int h, Fl_Align alignment));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_measure_label,(fl_Repeat_Button repeat_button, int* ww , int* hh));

  FL_EXPORT_C_HEADER(fl_Window,Fl_Repeat_Button_window,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(fl_Window,Fl_Repeat_Button_top_window,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(fl_Window ,Fl_Repeat_Button_top_window_offset,(fl_Repeat_Button repeat_button, int* xoff, int* yoff));
  FL_EXPORT_C_HEADER(fl_Group,Fl_Repeat_Button_as_group,(fl_Repeat_Button repeat_button));
  FL_EXPORT_C_HEADER(fl_Gl_Window,Fl_Repeat_Button_as_gl_window,(fl_Repeat_Button repeat_button));
  /* Fl_Repeat_Button specific functions */
  FL_EXPORT_C_HEADER(fl_Repeat_Button,Fl_Repeat_Button_New_WithLabel,(int x, int y, int w, int h, const char* label));
  FL_EXPORT_C_HEADER(fl_Repeat_Button,Fl_Repeat_Button_New,(int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_Destroy,(fl_Repeat_Button button));
  FL_EXPORT_C_HEADER(char        ,Fl_Repeat_Button_value,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(int         ,Fl_Repeat_Button_set_value,(fl_Repeat_Button b, int v));
  FL_EXPORT_C_HEADER(int         ,Fl_Repeat_Button_set,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(int         ,Fl_Repeat_Button_clear,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(void        ,Fl_Repeat_Button_setonly,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(int         ,Fl_Repeat_Button_get_shortcut ,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(void        ,Fl_Repeat_Button_set_shortcut ,(fl_Repeat_Button b, int s));
  FL_EXPORT_C_HEADER(Fl_Boxtype  ,Fl_Repeat_Button_down_box,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(void        ,Fl_Repeat_Button_set_down_box,(fl_Repeat_Button b,Fl_Boxtype boxtype));
  FL_EXPORT_C_HEADER(Fl_Color    ,Fl_Repeat_Button_down_color ,(fl_Repeat_Button b));
  FL_EXPORT_C_HEADER(void        ,Fl_Repeat_Button_set_down_color,(fl_Repeat_Button b, Fl_Color c));
  FL_EXPORT_C_HEADER(fl_Repeat_Button,Fl_OverriddenRepeat_Button_New,(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs));
  FL_EXPORT_C_HEADER(fl_Repeat_Button,Fl_OverriddenRepeat_Button_New_WithLabel,(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_draw,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_DerivedRepeat_Button_draw,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_draw_super,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_handle,(fl_Repeat_Button o, int event));
  FL_EXPORT_C_HEADER(int,Fl_Repeat_Button_handle_super,(fl_Repeat_Button o, int event));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_resize,(fl_Repeat_Button o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_DerivedRepeat_Button_resize,(fl_Repeat_Button o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_resize_super,(fl_Repeat_Button o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_show,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_DerivedRepeat_Button_show,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_show_super,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_hide,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_DerivedRepeat_Button_hide,(fl_Repeat_Button o));
  FL_EXPORT_C_HEADER(void,Fl_Repeat_Button_hide_super,(fl_Repeat_Button o));
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_REPEAT_BUTTON_C__*/
