#ifndef __FL_DOUBLE_WINDOW_C__
#define __FL_DOUBLE_WINDOW_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Double_Window.H"
#include "Fl_WindowC.h"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Double_Window_handle)(fl_Double_Window self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Double_Window_parent)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_parent)(fl_Double_Window win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Double_Window_type)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_type)(fl_Double_Window win, uchar t);

  FL_EXPORT_C(int,          Fl_Double_Window_x)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_y)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_w)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_h)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_align)(fl_Double_Window double_window, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Double_Window_align)(fl_Double_Window win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Double_Window_box)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_box)(fl_Double_Window win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Double_Window_color)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_color)(fl_Double_Window win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Double_Window_set_color_with_bg_sel)(fl_Double_Window win,Fl_Color bg, Fl_Color a);
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
  FL_EXPORT_C(void,         Fl_Double_Window_set_callback_with_user_data)(fl_Double_Window win, fl_Callback* cb, void* p);
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
  FL_EXPORT_C(void,         Fl_Double_Window_draw_label_with_xywh_alignment)(fl_Double_Window win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Double_Window_measure_label)(fl_Double_Window win, int* ww , int* hh);
  FL_EXPORT_C(fl_Group,     Fl_Double_Window_as_group)(fl_Double_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Double_Window_as_gl_window)(fl_Double_Window win);
  FL_EXPORT_C(fl_Window,    Fl_Double_Window_window)(fl_Double_Window double_window);
  FL_EXPORT_C(fl_Window,    Fl_Double_Window_top_window)(fl_Double_Window double_window);
  FL_EXPORT_C(fl_Window ,   Fl_Double_Window_top_window_offset)(fl_Double_Window double_window, int* xoff, int* yoff);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void, Fl_Double_Window_draw_child)(fl_Double_Window Double_Window,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Double_Window_draw_children)(fl_Double_Window Double_Window);
  FL_EXPORT_C(void, Fl_Double_Window_draw_outside_label)(fl_Double_Window Double_Window,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Double_Window_update_child)(fl_Double_Window Double_Window,fl_Widget widget);
  FL_EXPORT_C(int*, Fl_Double_Window_sizes)(fl_Double_Window Double_Window);
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
  FL_EXPORT_C(fl_Widget,         Fl_Double_Window_resizable)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_add_resizable)(fl_Double_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Double_Window_init_sizes)(fl_Double_Window win);
  FL_EXPORT_C(int,          Fl_Double_Window_children)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_set_clip_children)(fl_Double_Window win,int c);
  FL_EXPORT_C(unsigned int, Fl_Double_Window_clip_children)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_focus)(fl_Double_Window win,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Double_Window__ddfdesign_kludge)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_insert_with_before)(fl_Double_Window self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Double_Window_array)(fl_Double_Window self);
  FL_EXPORT_C(fl_Widget,    Fl_Double_Window_child)(fl_Double_Window self, int n);
  FL_EXPORT_C(void,         Fl_Double_Window_forms_end)(fl_Double_Window self);
  /* FL_EXPORT_C(void,         Fl_Double_Window_forms_end)(fl_Double_Window win); */
  /* Fl_Window inherited */
  FL_EXPORT_C(unsigned int, Fl_Double_Window_changed)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen_off)(fl_Double_Window win);
  FL_EXPORT_C(void,         Fl_Double_Window_fullscreen_off_with_resize)(fl_Double_Window win,int X,int Y,int W,int H);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_New_WithLabel)(int w, int h, const char* title);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_New)(int w, int h);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title);
  FL_EXPORT_C(fl_Double_Window,    Fl_Double_Window_NewXY)(int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Double_Window_iconize)(fl_Double_Window win);

  FL_EXPORT_C(fl_Double_Window, Fl_OverriddenDouble_Window_New_WithLabel)(int w, int h, const char* title, fl_Double_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Double_Window, Fl_OverriddenDouble_Window_New)(int w, int h,fl_Double_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Double_Window, Fl_OverriddenDouble_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title,fl_Double_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Double_Window, Fl_OverriddenDouble_Window_NewXY)(int x, int y, int w, int h,fl_Double_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(void ,Fl_Double_Window_set_border)(fl_Double_Window win, int b);
  FL_EXPORT_C(void ,Fl_Double_Window_clear_border)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Double_Window_border)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_set_override)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int,Fl_Double_Window_override)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_set_modal)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int,Fl_Double_Window_modal)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_set_non_modal)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Double_Window_non_modal)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_set_menu_window)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int,Fl_Double_Window_menu_window)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_set_tooltip_window)(fl_Double_Window win);
  FL_EXPORT_C(unsigned int,Fl_Double_Window_tooltip_window)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_hotspot_with_x_y)(fl_Double_Window win, int x, int y);
  FL_EXPORT_C(void ,Fl_Double_Window_hotspot_with_x_y_with_offscreen)(fl_Double_Window win, int x, int y, int offscreen);
  FL_EXPORT_C(void ,Fl_Double_Window_hotspot_with_widget)(fl_Double_Window win, fl_Widget w);//, int offscreen = 0);
  FL_EXPORT_C(void ,Fl_Double_Window_hotspot_with_widget_with_offscreen)(fl_Double_Window win, fl_Widget w, int offscreen);
  FL_EXPORT_C(void ,Fl_Double_Window_free_position)(fl_Double_Window win);
  FL_EXPORT_C(void ,Fl_Double_Window_size_range)(fl_Double_Window win, int minw, int minh);
  FL_EXPORT_C(void ,Fl_Double_Window_size_range_with_args)(fl_Window win, int minw, int minh, fl_Window_size_range_args* args);//int maxw=0, int maxh=0, int dw=0, int dh=0, int aspect=0);
  FL_EXPORT_C(const char*, Fl_Double_Window_label)(fl_Double_Window win);
  FL_EXPORT_C(const char*, Fl_Double_Window_iconlabel)(fl_Double_Window win);
  FL_EXPORT_C(void, Fl_Double_Window_set_label)(fl_Double_Window win,const char*);
  FL_EXPORT_C(void, Fl_Double_Window_set_iconlabel)(fl_Double_Window win,const char*);
  FL_EXPORT_C(void, Fl_Double_Window_set_label_with_iconlabel)(fl_Double_Window win,const char* label, const char* iconlabel);
  FL_EXPORT_C(void, Fl_Double_Window_copy_label)(fl_Double_Window win,const char* a);
  FL_EXPORT_C(void, Fl_Double_Window_set_default_xclass)(const char* label);
  FL_EXPORT_C(const char*, Fl_Double_Window_default_xclass)();
  FL_EXPORT_C(const char*, Fl_Double_Window_xclass)(fl_Double_Window win);
  FL_EXPORT_C(void, Fl_Double_Window_set_xclass)(fl_Double_Window win,const char* c);
  FL_EXPORT_C(const void*, Fl_Double_Window_icon)(fl_Double_Window win);
  FL_EXPORT_C(void, Fl_Double_Window_set_icon)(fl_Double_Window win,const void * ic);
  FL_EXPORT_C(int, Fl_Double_Window_shown)(fl_Double_Window win);
  FL_EXPORT_C(void, Fl_Double_Window_iconize)(fl_Double_Window win);
  FL_EXPORT_C(int, Fl_Double_Window_x_root)(fl_Double_Window win);
  FL_EXPORT_C(int, Fl_Double_Window_y_root)(fl_Double_Window win);
  FL_EXPORT_C(fl_Double_Window, Fl_Double_Window_current)();
  FL_EXPORT_C(void, Fl_Double_Window_make_current)(fl_Double_Window win);
  FL_EXPORT_C(void, Fl_Double_Window_set_cursor_with_bg)(fl_Double_Window win, Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Double_Window_set_cursor_with_fg)(fl_Double_Window win,Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Double_Window_set_cursor_with_fg_bg)(fl_Double_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );/* =FL_BLACK *//*=FL_WHITE*/
  FL_EXPORT_C(void, Fl_Double_Window_set_cursor)(fl_Double_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Double_Window_set_default_cursor_with_bg)(fl_Double_Window win,Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Double_Window_set_default_cursor_with_fg)(fl_Double_Window win, Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Double_Window_set_default_cursor_with_fg_bg)(fl_Double_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );
  FL_EXPORT_C(void, Fl_Double_Window_set_default_cursor)(fl_Double_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Double_Window_default_callback)(fl_Double_Window win, void* v);
  FL_EXPORT_C(int, Fl_Double_Window_decorated_w)(fl_Double_Window win);
  FL_EXPORT_C(int, Fl_Double_Window_decorated_h)(fl_Double_Window win);
  /* Fl_Double_Window specific */
  // flush resize destructor, constructor
#ifdef __cplusplus
  class Fl_DerivedDouble_Window : public Fl_Double_Window {
    fl_Double_Window_Virtual_Funcs* overriddenFuncs;
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
    int handle_super(int event);
    virtual void resize(int x, int y, int w, int h);
    void resize_super(int x, int y, int w, int h);
    virtual void show();
    void show_super();
    virtual void show(int,char**);
    virtual void hide();
    void hide_super();
    virtual void flush();
    void flush_super();
    virtual Fl_Window* as_window();
    Fl_Window* as_window_super();
    virtual Fl_Group* as_group();
    Fl_Group* as_group_super();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_Gl_Window* as_gl_window_super();
    void draw_child(Fl_Widget* widget);
    void draw_children();
    void draw_outside_label(Fl_Widget* widget);
    void update_child(Fl_Widget* widget);
    int* sizes();
    Fl_DerivedDouble_Window(int X, int Y, int W, int H, const char *l, fl_Double_Window_Virtual_Funcs* funcs);
    Fl_DerivedDouble_Window(int X, int Y, int W, int H, fl_Double_Window_Virtual_Funcs* funcs);
    Fl_DerivedDouble_Window(int W, int H, const char *l, fl_Double_Window_Virtual_Funcs* funcs);
    Fl_DerivedDouble_Window(int W, int H, fl_Double_Window_Virtual_Funcs* funcs);
    ~Fl_DerivedDouble_Window();
  };
#endif
  FL_EXPORT_C(fl_Double_Window_Virtual_Funcs*, Fl_Double_Window_default_virtual_funcs)();
  FL_EXPORT_C(int ,		Fl_Double_Window_handle)(fl_Double_Window win, int event);
  FL_EXPORT_C(int ,		Fl_Double_Window_handle_super)(fl_Double_Window win, int event);
  FL_EXPORT_C(void,		Fl_Double_Window_draw_super)(fl_Double_Window win);
  FL_EXPORT_C(fl_Group,		Fl_Double_Window_as_group)(fl_Double_Window window);
  FL_EXPORT_C(fl_Window,	Fl_Double_Window_as_window)(fl_Double_Window window);
  FL_EXPORT_C(fl_Gl_Window,	Fl_Double_Window_as_gl_window)(fl_Double_Window window);
  FL_EXPORT_C(fl_Group,		Fl_Double_Window_as_group_super)(fl_Double_Window window);
  FL_EXPORT_C(fl_Window,	Fl_Double_Window_as_window_super)(fl_Double_Window window);
  FL_EXPORT_C(fl_Gl_Window,	Fl_Double_Window_as_gl_window_super)(fl_Double_Window window);
  FL_EXPORT_C(void,		Fl_Double_Window_show_super)(fl_Double_Window win);
  FL_EXPORT_C(void,		Fl_Double_Window_show)(fl_Double_Window win);
  FL_EXPORT_C(void,		Fl_Double_Window_show_with_args)(fl_Double_Window win, int argc, char** argv);
  FL_EXPORT_C(void,		Fl_Double_Window_Destroy)(fl_Double_Window win);
  FL_EXPORT_C(void,		Fl_Double_Window_flush_super)(fl_Double_Window win);
  FL_EXPORT_C(void,		Fl_Double_Window_flush)(fl_Double_Window win);
  FL_EXPORT_C(void,		Fl_Double_Window_resize_super)(fl_Double_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,		Fl_Double_Window_resize)(fl_Double_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,		Fl_Double_Window_hide_super)(fl_Double_Window win);
  FL_EXPORT_C(void,             Fl_Double_Window_hide)(fl_Double_Window win);
  FL_EXPORT_C(void,             fl_Double_Window_wait_for_expose)(fl_Double_Window win);

#ifdef __cplusplus
}
#endif

#endif /* __FL_DOUBLE_WINDOW_C__ */
