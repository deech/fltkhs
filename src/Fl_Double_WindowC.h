#ifndef __FL_DOUBLE_WINDOW_C__
#define __FL_DOUBLE_WINDOW_C__
#include "FL/Fl.H"
#include "FL/Fl_Double_Window.H"
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "Fl_CallbackC.h"
#ifdef __cplusplus
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,     Fl_Double_Window_parent)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_parent)(fl_Double_Window win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Double_Window_type)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_type)(fl_Double_Window win, uchar t);
  FL_EXPORT_C(int,          Fl_Double_Window_x)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_y)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_w)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_h)(fl_Double_Window win);
  FL_EXPORT_C(Fl_Align,     Fl_Double_Window_align)(fl_Double_Window win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Double_Window_box)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_box)(fl_Double_Window win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Double_Window_color)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_color)(fl_Double_Window win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Double_Window_set_background_and_selection_color)(fl_Double_Window win,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Double_Window_selection_color)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_selection_color)(fl_Double_Window win, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Double_Window_label)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_copy_label)(fl_Double_Window win, const char* new_label);
  FL_EXPORT_C(void,         Fl_Double_Window_set_label)(fl_Double_Window win, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Double_Window_labeltype)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_labeltype)(fl_Double_Window win, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Double_Window_labelcolor)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_labelcolor)(fl_Double_Window win, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Double_Window_labelfont)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_labelfont)(fl_Double_Window win, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Double_Window_labelsize)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_labelsize)(fl_Double_Window win, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Double_Window_image)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_image)(fl_Double_Window win, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Double_Window_deimage)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_deimage)(fl_Double_Window win, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Double_Window_tooltip)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_copy_tooltip)(fl_Double_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Double_Window_set_tooltip)(fl_Double_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Double_Window_set_callback_and_user_data)(fl_Double_Window win, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Double_Window_set_callback)(fl_Double_Window win, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Double_Window_user_data)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_user_data)(fl_Double_Window win, void* v);
  FL_EXPORT_C(long,         Fl_Double_Window_argument)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_argument)(fl_Double_Window win, long v);
  FL_EXPORT_C(Fl_When,      Fl_Double_Window_when)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_when)(fl_Double_Window win, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_visible)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_visible_r)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_visible)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_visible)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_active)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_active_r)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_activate)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_deactivate)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_output)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_output)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_output)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_takesevents)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_changed)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_changed)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_take_focus)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_visible_focus)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_visible_focus)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_modify_visible_focus)(fl_Double_Window win, int v);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_visible_focus)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_do_callback)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_do_callback_with_widget_and_user_data)(fl_Double_Window win, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Double_Window_do_callback_with_widget_and_default_user_data)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Double_Window_contains)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Double_Window_inside)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Double_Window_redraw)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_redraw_label)(fl_Double_Window win);
  FL_EXPORT_C(uchar,        Fl_Double_Window_damage)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_damage_with_bitmask)(fl_Double_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Double_Window_clear_damage)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_damage_with_text)(fl_Double_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Double_Window_damage_inside_widget)(fl_Double_Window win, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Double_Window_draw_label)(fl_Double_Window win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Double_Window_measure_label)(fl_Double_Window win, int& ww , int& hh);
  FL_EXPORT_C(fl_Group,     Fl_Double_Window_as_group)(fl_Double_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Double_Window_as_gl_window)(fl_Double_Window win);

  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Double_Window_begin)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_end)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_find)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Double_Window_add)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Double_Window_insert)(fl_Double_Window win, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Double_Window_remove_index)(fl_Double_Window win, int index);
  FL_EXPORT_C(void,         Fl_Double_Window_remove_widget)(fl_Double_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Double_Window_clear)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_resizable_by_reference)(fl_Double_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Double_Window_set_resizable)(fl_Double_Window win,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Double_Window_resizable)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_add_resizable)(fl_Double_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Double_Window_init_sizes)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_clip_children)(fl_Double_Window win,int c);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_clip_children)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_focus)(fl_Double_Window win,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Double_Window__ddfdesign_kludge)(fl_Double_Window win);
  /* FL_EXPORT_C(void,         Fl_Double_Window_forms_end)(fl_Double_Window win); */
  /* Fl_Double_Window specific */
  FL_EXPORT_C(unsigned int, Fl_Double_Window_changed)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen_off)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen_off_with_resize)(fl_Double_Window win,int X,int Y,int W,int H);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_New_WithLabel)(int x, int y, const char* title);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_New)(int x, int y);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_NewWH)(int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Double_Window_iconize)(fl_Double_Window win);

  /* Fl_Double_Window specific */
  // flush resize destructor, constructor
  FL_EXPORT_C(void,         Fl_Double_Window_show)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_show_with_args)(fl_Double_Window win, int argc, char** argv);
  FL_EXPORT_C(void,         Fl_Double_Window_destroy)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_flush)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_resize)(fl_Double_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Double_Window_hide)(fl_Double_Window win);
#ifdef __cplusplus
}
#endif

#endif /* __FL_DOUBLE_WINDOW_C__ */
