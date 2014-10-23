#ifndef __FL_OVERLAY_WINDOW_C__
#define __FL_OVERLAY_WINDOW_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Overlay_Window.H"
#include "Fl_WindowC.h"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedOverlay_Window : public Fl_Overlay_Window {
  private:
    void (*draw_overlay_fp)(fl_Overlay_Window);
  public:
    void draw_overlay();
    Fl_DerivedOverlay_Window(int X, int Y, int W, int H, const char *l, void (*can_draw_fp)(fl_Overlay_Window));
    Fl_DerivedOverlay_Window(int X, int Y, int W, int H, void (*can_draw_fp)(fl_Overlay_Window));
    Fl_DerivedOverlay_Window(int W, int H, const char *l, void (*can_draw_fp)(fl_Overlay_Window));
    Fl_DerivedOverlay_Window(int W, int H, void (*can_draw_fp)(fl_Overlay_Window));
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Overlay_Window_handle)(fl_Overlay_Window self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Overlay_Window_parent)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_parent)(fl_Overlay_Window win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Overlay_Window_type)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_type)(fl_Overlay_Window win, uchar t);

  FL_EXPORT_C(int,          Fl_Overlay_Window_x)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_y)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_w)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_h)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_align)(fl_Overlay_Window double_window, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Overlay_Window_align)(fl_Overlay_Window win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Overlay_Window_box)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_box)(fl_Overlay_Window win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Overlay_Window_color)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_color)(fl_Overlay_Window win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_color_with_bg_sel)(fl_Overlay_Window win,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Overlay_Window_selection_color)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_selection_color)(fl_Overlay_Window win, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Overlay_Window_label)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_copy_label)(fl_Overlay_Window win, const char* new_label);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_label)(fl_Overlay_Window win, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Overlay_Window_labeltype)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_labeltype)(fl_Overlay_Window win, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Overlay_Window_labelcolor)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_labelcolor)(fl_Overlay_Window win, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Overlay_Window_labelfont)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_labelfont)(fl_Overlay_Window win, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Overlay_Window_labelsize)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_labelsize)(fl_Overlay_Window win, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Overlay_Window_image)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_image)(fl_Overlay_Window win, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Overlay_Window_deimage)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_deimage)(fl_Overlay_Window win, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Overlay_Window_tooltip)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_copy_tooltip)(fl_Overlay_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_tooltip)(fl_Overlay_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_callback_with_user_data)(fl_Overlay_Window win, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_callback)(fl_Overlay_Window win, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Overlay_Window_user_data)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_user_data)(fl_Overlay_Window win, void* v);
  FL_EXPORT_C(long,         Fl_Overlay_Window_argument)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_argument)(fl_Overlay_Window win, long v);
  FL_EXPORT_C(Fl_When,      Fl_Overlay_Window_when)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_when)(fl_Overlay_Window win, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_visible)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_visible_r)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_visible)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_visible)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_active)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_active_r)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_activate)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_deactivate)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_output)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_output)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_output)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_takesevents)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_changed)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_changed)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_take_focus)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_visible_focus)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_visible_focus)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_modify_visible_focus)(fl_Overlay_Window win, int v);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_visible_focus)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_do_callback)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_do_callback_with_widget_and_user_data)(fl_Overlay_Window win, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Overlay_Window_do_callback_with_widget_and_default_user_data)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Overlay_Window_contains)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Overlay_Window_inside)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Overlay_Window_redraw)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_redraw_label)(fl_Overlay_Window win);
  FL_EXPORT_C(uchar,        Fl_Overlay_Window_damage)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_damage_with_bitmask)(fl_Overlay_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear_damage)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_damage_with_text)(fl_Overlay_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Overlay_Window_damage_inside_widget)(fl_Overlay_Window win, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Overlay_Window_draw_label_with_xywh_alignment)(fl_Overlay_Window win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Overlay_Window_measure_label)(fl_Overlay_Window win, int* ww , int* hh);
  FL_EXPORT_C(fl_Group,     Fl_Overlay_Window_as_group)(fl_Overlay_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Overlay_Window_as_gl_window)(fl_Overlay_Window win);
  FL_EXPORT_C(fl_Window, Fl_Overlay_Window_as_window)(fl_Overlay_Window win);
  FL_EXPORT_C(fl_Window,    Fl_Overlay_Window_window)(fl_Overlay_Window double_window);
  FL_EXPORT_C(fl_Window,    Fl_Overlay_Window_top_window)(fl_Overlay_Window double_window);
  FL_EXPORT_C(fl_Window ,   Fl_Overlay_Window_top_window_offset)(fl_Overlay_Window double_window, int* xoff, int* yoff);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Overlay_Window_begin)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_end)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_find)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Overlay_Window_add)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Overlay_Window_insert)(fl_Overlay_Window win, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Overlay_Window_remove_index)(fl_Overlay_Window win, int index);
  FL_EXPORT_C(void,         Fl_Overlay_Window_remove_widget)(fl_Overlay_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Overlay_Window_clear)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_resizable_by_reference)(fl_Overlay_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_resizable)(fl_Overlay_Window win,fl_Widget o);
  FL_EXPORT_C(fl_Widget,         Fl_Overlay_Window_resizable)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_add_resizable)(fl_Overlay_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Overlay_Window_init_sizes)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_children)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_set_clip_children)(fl_Overlay_Window win,int c);
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_clip_children)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_focus)(fl_Overlay_Window win,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Overlay_Window__ddfdesign_kludge)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_insert_with_before)(fl_Overlay_Window self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Overlay_Window_array)(fl_Overlay_Window self);
  FL_EXPORT_C(fl_Widget,    Fl_Overlay_Window_child)(fl_Overlay_Window self, int n);
  FL_EXPORT_C(void,         Fl_Overlay_Window_forms_end)(fl_Overlay_Window self);
  /* FL_EXPORT_C(void,         Fl_Overlay_Window_forms_end)(fl_Overlay_Window win); */
  /* Fl_Window inherited */
  FL_EXPORT_C(unsigned int, Fl_Overlay_Window_changed)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_fullscreen)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_fullscreen_off)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_fullscreen_off_with_resize)(fl_Overlay_Window win,int X,int Y,int W,int H);
  FL_EXPORT_C(void,         Fl_Overlay_Window_iconize)(fl_Overlay_Window win);

  FL_EXPORT_C(int ,Fl_Overlay_Window_handle)(fl_Overlay_Window win, int event);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_border)(fl_Overlay_Window win, int b);
  FL_EXPORT_C(void ,Fl_Overlay_Window_clear_border)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Overlay_Window_border)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_override)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int,Fl_Overlay_Window_override)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_modal)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int,Fl_Overlay_Window_modal)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_non_modal)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Overlay_Window_non_modal)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_menu_window)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int,Fl_Overlay_Window_menu_window)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_set_tooltip_window)(fl_Overlay_Window win);
  FL_EXPORT_C(unsigned int,Fl_Overlay_Window_tooltip_window)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_hotspot_with_x_y)(fl_Overlay_Window win, int x, int y);
  FL_EXPORT_C(void ,Fl_Overlay_Window_hotspot_with_x_y_with_offscreen)(fl_Overlay_Window win, int x, int y, int offscreen);
  FL_EXPORT_C(void ,Fl_Overlay_Window_hotspot_with_widget)(fl_Overlay_Window win, fl_Widget w);//, int offscreen = 0);
  FL_EXPORT_C(void ,Fl_Overlay_Window_hotspot_with_widget_with_offscreen)(fl_Overlay_Window win, fl_Widget w, int offscreen);
  FL_EXPORT_C(void ,Fl_Overlay_Window_free_position)(fl_Overlay_Window win);
  FL_EXPORT_C(void ,Fl_Overlay_Window_size_range)(fl_Overlay_Window win, int minw, int minh);
  FL_EXPORT_C(void ,Fl_Overlay_Window_size_range_with_args)(fl_Window win, int minw, int minh, fl_Window_size_range_args* args);//int maxw=0, int maxh=0, int dw=0, int dh=0, int aspect=0);
  FL_EXPORT_C(const char*, Fl_Overlay_Window_label)(fl_Overlay_Window win);
  FL_EXPORT_C(const char*, Fl_Overlay_Window_iconlabel)(fl_Overlay_Window win);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_label)(fl_Overlay_Window win,const char*);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_iconlabel)(fl_Overlay_Window win,const char*);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_label_with_iconlabel)(fl_Overlay_Window win,const char* label, const char* iconlabel);
  FL_EXPORT_C(void, Fl_Overlay_Window_copy_label)(fl_Overlay_Window win,const char* a);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_default_xclass)(const char* label);
  FL_EXPORT_C(const char*, Fl_Overlay_Window_default_xclass)();
  FL_EXPORT_C(const char*, Fl_Overlay_Window_xclass)(fl_Overlay_Window win);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_xclass)(fl_Overlay_Window win,const char* c);
  FL_EXPORT_C(const void*, Fl_Overlay_Window_icon)(fl_Overlay_Window win);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_icon)(fl_Overlay_Window win,const void * ic);
  FL_EXPORT_C(int, Fl_Overlay_Window_shown)(fl_Overlay_Window win);
  FL_EXPORT_C(void, Fl_Overlay_Window_iconize)(fl_Overlay_Window win);
  FL_EXPORT_C(int, Fl_Overlay_Window_x_root)(fl_Overlay_Window win);
  FL_EXPORT_C(int, Fl_Overlay_Window_y_root)(fl_Overlay_Window win);
  FL_EXPORT_C(fl_Overlay_Window, Fl_Overlay_Window_current)();
  FL_EXPORT_C(void, Fl_Overlay_Window_make_current)(fl_Overlay_Window win);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_cursor_with_bg)(fl_Overlay_Window win, Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_cursor_with_fg)(fl_Overlay_Window win,Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_cursor_with_fg_bg)(fl_Overlay_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );/* =FL_BLACK *//*=FL_WHITE*/
  FL_EXPORT_C(void, Fl_Overlay_Window_set_cursor)(fl_Overlay_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_default_cursor_with_bg)(fl_Overlay_Window win,Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_default_cursor_with_fg)(fl_Overlay_Window win, Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Overlay_Window_set_default_cursor_with_fg_bg)(fl_Overlay_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );
  FL_EXPORT_C(void, Fl_Overlay_Window_set_default_cursor)(fl_Overlay_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Overlay_Window_default_callback)(fl_Overlay_Window win, void* v);
  FL_EXPORT_C(int, Fl_Overlay_Window_decorated_w)(fl_Overlay_Window win);
  FL_EXPORT_C(int, Fl_Overlay_Window_decorated_h)(fl_Overlay_Window win);
  /* Fl_Overlay_Window specific */
  FL_EXPORT_C(void,         Fl_Overlay_Window_show)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_show_with_args)(fl_Overlay_Window win, int argc, char** argv);
  FL_EXPORT_C(void,         Fl_Overlay_Window_flush)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_resize)(fl_Overlay_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Overlay_Window_hide)(fl_Overlay_Window win);
  FL_EXPORT_C(int,          Fl_Overlay_Window_can_do_overlay)(fl_Overlay_Window win);
  FL_EXPORT_C(void,         Fl_Overlay_Window_redraw_overlay)(fl_Overlay_Window win);

  FL_EXPORT_C(fl_Overlay_Window,    Fl_Overlay_Window_New_WithLabel)(int w, int h, const char* title, void (*draw_overlay_fp)(fl_Overlay_Window));
  FL_EXPORT_C(fl_Overlay_Window,    Fl_Overlay_Window_New)(int w, int h, void (*draw_overlay_fp)(fl_Overlay_Window));
  FL_EXPORT_C(fl_Overlay_Window,    Fl_Overlay_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title, void (*draw_overlay_fp)(fl_Overlay_Window));
  FL_EXPORT_C(fl_Overlay_Window,    Fl_Overlay_Window_NewXY)(int x, int y, int w, int h, void (*draw_overlay_fp)(fl_Overlay_Window));
  FL_EXPORT_C(void,         Fl_Overlay_Window_Destroy)(fl_Overlay_Window win);
#ifdef __cplusplus
}
#endif

#endif /* __FL_OVERLAY_WINDOW_C__ */
