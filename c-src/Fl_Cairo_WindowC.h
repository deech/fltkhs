#ifndef __FL_CAIRO_WINDOW_C__
#define __FL_CAIRO_WINDOW_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Cairo_Window.H"
#include "Fl_WindowC.h"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Cairo_Window_handle)(fl_Cairo_Window self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Cairo_Window_parent)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_parent)(fl_Cairo_Window win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Cairo_Window_type)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_type)(fl_Cairo_Window win, uchar t);

  FL_EXPORT_C(int,          Fl_Cairo_Window_x)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_y)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_w)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_h)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_align)(fl_Cairo_Window cairo_window, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Cairo_Window_align)(fl_Cairo_Window win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Cairo_Window_box)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_box)(fl_Cairo_Window win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Cairo_Window_color)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_color)(fl_Cairo_Window win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_color_with_bg_sel)(fl_Cairo_Window win,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Cairo_Window_selection_color)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_selection_color)(fl_Cairo_Window win, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Cairo_Window_label)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_copy_label)(fl_Cairo_Window win, const char* new_label);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_label)(fl_Cairo_Window win, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Cairo_Window_labeltype)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_labeltype)(fl_Cairo_Window win, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Cairo_Window_labelcolor)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_labelcolor)(fl_Cairo_Window win, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Cairo_Window_labelfont)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_labelfont)(fl_Cairo_Window win, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Cairo_Window_labelsize)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_labelsize)(fl_Cairo_Window win, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Cairo_Window_image)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_image)(fl_Cairo_Window win, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Cairo_Window_deimage)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_deimage)(fl_Cairo_Window win, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Cairo_Window_tooltip)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_copy_tooltip)(fl_Cairo_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_tooltip)(fl_Cairo_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_callback_with_user_data)(fl_Cairo_Window win, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_callback)(fl_Cairo_Window win, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Cairo_Window_user_data)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_user_data)(fl_Cairo_Window win, void* v);
  FL_EXPORT_C(long,         Fl_Cairo_Window_argument)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_argument)(fl_Cairo_Window win, long v);
  FL_EXPORT_C(Fl_When,      Fl_Cairo_Window_when)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_when)(fl_Cairo_Window win, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_visible)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_visible_r)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_visible)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_visible)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_active)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_active_r)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_activate)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_deactivate)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_output)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_output)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_output)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_takesevents)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_changed)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_changed)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_take_focus)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_visible_focus)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_visible_focus)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_modify_visible_focus)(fl_Cairo_Window win, int v);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_visible_focus)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_do_callback)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_do_callback_with_widget_and_user_data)(fl_Cairo_Window win, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Cairo_Window_do_callback_with_widget_and_default_user_data)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Cairo_Window_contains)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Cairo_Window_inside)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Cairo_Window_redraw)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_redraw_label)(fl_Cairo_Window win);
  FL_EXPORT_C(uchar,        Fl_Cairo_Window_damage)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_damage_with_bitmask)(fl_Cairo_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear_damage)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_damage_with_text)(fl_Cairo_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Cairo_Window_damage_inside_widget)(fl_Cairo_Window win, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Cairo_Window_draw_label_with_xywh_alignment)(fl_Cairo_Window win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Cairo_Window_measure_label)(fl_Cairo_Window win, int* ww , int* hh);
  FL_EXPORT_C(fl_Group,     Fl_Cairo_Window_as_group)(fl_Cairo_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Cairo_Window_as_gl_window)(fl_Cairo_Window win);
  FL_EXPORT_C(fl_Window,    Fl_Cairo_Window_window)(fl_Cairo_Window cairo_window);
  FL_EXPORT_C(fl_Window,    Fl_Cairo_Window_top_window)(fl_Cairo_Window cairo_window);
  FL_EXPORT_C(fl_Window ,   Fl_Cairo_Window_top_window_offset)(fl_Cairo_Window cairo_window, int* xoff, int* yoff);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void, Fl_Cairo_Window_draw_child)(fl_Cairo_Window Cairo_Window,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Cairo_Window_draw_children)(fl_Cairo_Window Cairo_Window);
  FL_EXPORT_C(void, Fl_Cairo_Window_draw_outside_label)(fl_Cairo_Window Cairo_Window,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Cairo_Window_update_child)(fl_Cairo_Window Cairo_Window,fl_Widget widget);
  FL_EXPORT_C(int*, Fl_Cairo_Window_sizes)(fl_Cairo_Window Cairo_Window);
  FL_EXPORT_C(void,         Fl_Cairo_Window_begin)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_end)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_find)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Cairo_Window_add)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Cairo_Window_insert)(fl_Cairo_Window win, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Cairo_Window_remove_index)(fl_Cairo_Window win, int index);
  FL_EXPORT_C(void,         Fl_Cairo_Window_remove_widget)(fl_Cairo_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Cairo_Window_clear)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_resizable_by_reference)(fl_Cairo_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_resizable)(fl_Cairo_Window win,fl_Widget o);
  FL_EXPORT_C(fl_Widget,         Fl_Cairo_Window_resizable)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_add_resizable)(fl_Cairo_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Cairo_Window_init_sizes)(fl_Cairo_Window win);
  FL_EXPORT_C(int,          Fl_Cairo_Window_children)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_clip_children)(fl_Cairo_Window win,int c);
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_clip_children)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_focus)(fl_Cairo_Window win,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Cairo_Window__ddfdesign_kludge)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_insert_with_before)(fl_Cairo_Window self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Cairo_Window_array)(fl_Cairo_Window self);
  FL_EXPORT_C(fl_Widget,    Fl_Cairo_Window_child)(fl_Cairo_Window self, int n);
  FL_EXPORT_C(void,         Fl_Cairo_Window_forms_end)(fl_Cairo_Window self);
  /* FL_EXPORT_C(void,         Fl_Cairo_Window_forms_end)(fl_Cairo_Window win); */
  /* Fl_Window inherited */
  FL_EXPORT_C(unsigned int, Fl_Cairo_Window_changed)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_fullscreen)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_fullscreen_off)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_fullscreen_off_with_resize)(fl_Cairo_Window win,int X,int Y,int W,int H);
  FL_EXPORT_C(void,         Fl_Cairo_Window_iconize)(fl_Cairo_Window win);
  FL_EXPORT_C(fl_Cairo_Window,    Fl_Cairo_Window_New_WithLabel)(int w, int h, const char* title);
  FL_EXPORT_C(fl_Cairo_Window,    Fl_Cairo_Window_New)(int w, int h);
  FL_EXPORT_C(fl_Cairo_Window, Fl_OverriddenCairo_Window_New_WithLabel)(int w, int h, const char* title, fl_Cairo_Window_Virtual_Funcs* funcs); 
  FL_EXPORT_C(fl_Cairo_Window, Fl_OverriddenCairo_Window_New)(int w, int h,fl_Cairo_Window_Virtual_Funcs* funcs); 
  FL_EXPORT_C(int ,Fl_Cairo_Window_handle)(fl_Cairo_Window win, int event);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_border)(fl_Cairo_Window win, int b);
  FL_EXPORT_C(void ,Fl_Cairo_Window_clear_border)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Cairo_Window_border)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_override)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int,Fl_Cairo_Window_override)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_modal)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int,Fl_Cairo_Window_modal)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_non_modal)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Cairo_Window_non_modal)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_menu_window)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int,Fl_Cairo_Window_menu_window)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_set_tooltip_window)(fl_Cairo_Window win);
  FL_EXPORT_C(unsigned int,Fl_Cairo_Window_tooltip_window)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_hotspot_with_x_y)(fl_Cairo_Window win, int x, int y);
  FL_EXPORT_C(void ,Fl_Cairo_Window_hotspot_with_x_y_with_offscreen)(fl_Cairo_Window win, int x, int y, int offscreen);
  FL_EXPORT_C(void ,Fl_Cairo_Window_hotspot_with_widget)(fl_Cairo_Window win, fl_Widget w);//, int offscreen = 0);
  FL_EXPORT_C(void ,Fl_Cairo_Window_hotspot_with_widget_with_offscreen)(fl_Cairo_Window win, fl_Widget w, int offscreen);
  FL_EXPORT_C(void ,Fl_Cairo_Window_free_position)(fl_Cairo_Window win);
  FL_EXPORT_C(void ,Fl_Cairo_Window_size_range)(fl_Cairo_Window win, int minw, int minh);
  FL_EXPORT_C(void ,Fl_Cairo_Window_size_range_with_args)(fl_Window win, int minw, int minh, fl_Window_size_range_args* args);//int maxw=0, int maxh=0, int dw=0, int dh=0, int aspect=0);
  FL_EXPORT_C(const char*, Fl_Cairo_Window_label)(fl_Cairo_Window win);
  FL_EXPORT_C(const char*, Fl_Cairo_Window_iconlabel)(fl_Cairo_Window win);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_label)(fl_Cairo_Window win,const char*);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_iconlabel)(fl_Cairo_Window win,const char*);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_label_with_iconlabel)(fl_Cairo_Window win,const char* label, const char* iconlabel);
  FL_EXPORT_C(void, Fl_Cairo_Window_copy_label)(fl_Cairo_Window win,const char* a);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_default_xclass)(const char* label);
  FL_EXPORT_C(const char*, Fl_Cairo_Window_default_xclass)();
  FL_EXPORT_C(const char*, Fl_Cairo_Window_xclass)(fl_Cairo_Window win);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_xclass)(fl_Cairo_Window win,const char* c);
  FL_EXPORT_C(const void*, Fl_Cairo_Window_icon)(fl_Cairo_Window win);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_icon)(fl_Cairo_Window win,const void * ic);
  FL_EXPORT_C(int, Fl_Cairo_Window_shown)(fl_Cairo_Window win);
  FL_EXPORT_C(void, Fl_Cairo_Window_iconize)(fl_Cairo_Window win);
  FL_EXPORT_C(int, Fl_Cairo_Window_x_root)(fl_Cairo_Window win);
  FL_EXPORT_C(int, Fl_Cairo_Window_y_root)(fl_Cairo_Window win);
  FL_EXPORT_C(fl_Cairo_Window, Fl_Cairo_Window_current)();
  FL_EXPORT_C(void, Fl_Cairo_Window_make_current)(fl_Cairo_Window win);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_cursor_with_bg)(fl_Cairo_Window win, Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_cursor_with_fg)(fl_Cairo_Window win,Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_cursor_with_fg_bg)(fl_Cairo_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );/* =FL_BLACK *//*=FL_WHITE*/
  FL_EXPORT_C(void, Fl_Cairo_Window_set_cursor)(fl_Cairo_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_default_cursor_with_bg)(fl_Cairo_Window win,Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_default_cursor_with_fg)(fl_Cairo_Window win, Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Cairo_Window_set_default_cursor_with_fg_bg)(fl_Cairo_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );
  FL_EXPORT_C(void, Fl_Cairo_Window_set_default_cursor)(fl_Cairo_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Cairo_Window_default_callback)(fl_Cairo_Window win, void* v);
  FL_EXPORT_C(int, Fl_Cairo_Window_decorated_w)(fl_Cairo_Window win);
  FL_EXPORT_C(int, Fl_Cairo_Window_decorated_h)(fl_Cairo_Window win);
  /* Fl_Cairo_Window specific */
  // flush resize destructor, constructor
#ifdef __cplusplus
  class Fl_DerivedCairo_Window : public Fl_Cairo_Window {
    fl_Cairo_Window_Virtual_Funcs* overriddenFuncs;
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
    virtual int handle(int event);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void show(int,char**);
    virtual void hide();
    virtual void flush();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    void draw_child(Fl_Widget* widget);
    void draw_children();
    void draw_outside_label(Fl_Widget* widget);
    void update_child(Fl_Widget* widget);
    int* sizes();
    Fl_DerivedCairo_Window(int X, int Y, int W, int H, const char *l, fl_Cairo_Window_Virtual_Funcs* funcs);
    Fl_DerivedCairo_Window(int X, int Y, int W, int H, fl_Cairo_Window_Virtual_Funcs* funcs);
    Fl_DerivedCairo_Window(int W, int H, const char *l, fl_Cairo_Window_Virtual_Funcs* funcs);
    Fl_DerivedCairo_Window(int W, int H, fl_Cairo_Window_Virtual_Funcs* funcs);
    ~Fl_DerivedCairo_Window();
  };
#endif
  FL_EXPORT_C(fl_Cairo_Window_Virtual_Funcs*, Fl_Cairo_Window_default_virtual_funcs)();
  FL_EXPORT_C(void,         Fl_Cairo_Window_show)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_show_with_args)(fl_Cairo_Window win, int argc, char** argv);
  FL_EXPORT_C(void,         Fl_Cairo_Window_destroy)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_flush)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_resize)(fl_Cairo_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Cairo_Window_hide)(fl_Cairo_Window win);
  FL_EXPORT_C(void,         Fl_Cairo_Window_set_draw_cb)(fl_Cairo_Window win, fl_Callback cb);
#ifdef __cplusplus
}
#endif

#endif /* __FL_CAIRO_WINDOW_C__ */
