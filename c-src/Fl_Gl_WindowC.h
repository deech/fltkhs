#ifndef __FL_GL_WINDOW_C__
#define __FL_GL_WINDOW_C__
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Gl_Window.H" // always include the FL/*.H headers before local headers
                          // Fl_Widget is included transitively and needed for
                          // the callback mechanism included below to work.
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Gl_Window_Virtual_Funcs*, Fl_Gl_Window_default_virtual_funcs)();
  FL_EXPORT_C(int,Fl_Gl_Window_handle)(fl_Gl_Window self, int event);
  FL_EXPORT_C(int,Fl_Gl_Window_handle_super)(fl_Gl_Window self, int event);
  FL_EXPORT_C(void,Fl_Gl_Window_draw_super)(fl_Gl_Window self);
  FL_EXPORT_C(fl_Group,     Fl_Gl_Window_parent)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_parent)(fl_Gl_Window win, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Gl_Window_type)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_type)(fl_Gl_Window win, uchar t);
FL_EXPORT_C(void, Fl_Gl_Window_draw_box)(fl_Gl_Window Gl_Window);
FL_EXPORT_C(void, Fl_Gl_Window_draw_box_with_tc)(fl_Gl_Window Gl_Window,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Gl_Window_draw_box_with_txywhc)(fl_Gl_Window Gl_Window,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Gl_Window_draw_backdrop)(fl_Gl_Window Gl_Window);
FL_EXPORT_C(void, Fl_Gl_Window_draw_focus)(fl_Gl_Window Gl_Window);
FL_EXPORT_C(void, Fl_Gl_Window_draw_focus_with_txywh)(fl_Gl_Window Gl_Window,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Gl_Window_draw_label)(fl_Gl_Window Gl_Window);

  FL_EXPORT_C(int,          Fl_Gl_Window_x)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_y)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_w)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_h)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_align)(fl_Gl_Window gl_window, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Gl_Window_align)(fl_Gl_Window win);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Gl_Window_box)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_box)(fl_Gl_Window win, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Gl_Window_color)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_color)(fl_Gl_Window win, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_color_with_bg_sel)(fl_Gl_Window win,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Gl_Window_selection_color)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_selection_color)(fl_Gl_Window win, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Gl_Window_label)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_copy_label)(fl_Gl_Window win, const char* new_label);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_label)(fl_Gl_Window win, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Gl_Window_labeltype)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_labeltype)(fl_Gl_Window win, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Gl_Window_labelcolor)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_labelcolor)(fl_Gl_Window win, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Gl_Window_labelfont)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_labelfont)(fl_Gl_Window win, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Gl_Window_labelsize)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_labelsize)(fl_Gl_Window win, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Gl_Window_image)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_image)(fl_Gl_Window win, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Gl_Window_deimage)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_deimage)(fl_Gl_Window win, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Gl_Window_tooltip)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_copy_tooltip)(fl_Gl_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_tooltip)(fl_Gl_Window win, const char* text);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_callback_with_user_data)(fl_Gl_Window win, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_callback)(fl_Gl_Window win, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Gl_Window_user_data)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_user_data)(fl_Gl_Window win, void* v);
  FL_EXPORT_C(long,         Fl_Gl_Window_argument)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_argument)(fl_Gl_Window win, long v);
  FL_EXPORT_C(Fl_When,      Fl_Gl_Window_when)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_when)(fl_Gl_Window win, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_visible)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_visible_r)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_visible)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_visible)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_active)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_active_r)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_activate)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_deactivate)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_output)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_output)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_output)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_takesevents)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_changed)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_changed)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_take_focus)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_visible_focus)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_visible_focus)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_modify_visible_focus)(fl_Gl_Window win, int v);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_visible_focus)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_do_callback)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_do_callback_with_widget_and_user_data)(fl_Gl_Window win, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Gl_Window_do_callback_with_widget_and_default_user_data)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Gl_Window_contains)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Gl_Window_inside)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Gl_Window_redraw)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_redraw_label)(fl_Gl_Window win);
  FL_EXPORT_C(uchar,        Fl_Gl_Window_damage)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_damage_with_bitmask)(fl_Gl_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear_damage)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_damage_with_text)(fl_Gl_Window win, uchar c);
  FL_EXPORT_C(void,         Fl_Gl_Window_damage_inside_widget)(fl_Gl_Window win, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Gl_Window_draw_label_with_xywh_alignment)(fl_Gl_Window win, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(fl_Window,    Fl_Gl_Window_window)(fl_Gl_Window gl_window);
  FL_EXPORT_C(fl_Window,    Fl_Gl_Window_top_window)(fl_Gl_Window gl_window);
  FL_EXPORT_C(fl_Window ,   Fl_Gl_Window_top_window_offset)(fl_Gl_Window gl_window, int* xoff, int* yoff);
  FL_EXPORT_C(void,         Fl_Gl_Window_measure_label)(fl_Gl_Window win, int* ww , int* hh);
  FL_EXPORT_C(fl_Group,     Fl_Gl_Window_as_group)(fl_Gl_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_as_gl_window)(fl_Gl_Window win);

  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Gl_Window_begin)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_end)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_find)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Gl_Window_add)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Gl_Window_insert)(fl_Gl_Window win, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Gl_Window_remove_index)(fl_Gl_Window win, int index);
  FL_EXPORT_C(void,         Fl_Gl_Window_remove_widget)(fl_Gl_Window win, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Gl_Window_clear)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_resizable_by_reference)(fl_Gl_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_resizable)(fl_Gl_Window win,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Gl_Window_resizable)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_add_resizable)(fl_Gl_Window win,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Gl_Window_init_sizes)(fl_Gl_Window win);
  FL_EXPORT_C(int,          Fl_Gl_Window_children)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_set_clip_children)(fl_Gl_Window win,int c);
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_clip_children)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_focus)(fl_Gl_Window win,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Gl_Window__ddfdesign_kludge)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_insert_with_before)(fl_Gl_Window self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Gl_Window_array)(fl_Gl_Window self);
  FL_EXPORT_C(fl_Widget,    Fl_Gl_Window_child)(fl_Gl_Window self, int n);
  FL_EXPORT_C(void,         Fl_Gl_Window_forms_end)(fl_Gl_Window self);
  /* FL_EXPORT_C(void,         Fl_Gl_Window_forms_end)(fl_Gl_Window win); */
#ifdef __cplusplus
  class Fl_DerivedGl_Window : public Fl_Gl_Window {
    fl_Gl_Window_Virtual_Funcs* overriddenFuncs;
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
    void resize_super(int x, int y, int w, int h);
    virtual void show();
    void show_super();
    virtual void show(int,char**);
    virtual void hide();
    void hide_super();
    virtual void flush();
    void flush_super();
    virtual Fl_Group* as_group();
    Fl_Group* as_group_super();
    virtual Fl_Window* as_window();
    Fl_Window* as_window_super();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_Gl_Window* as_gl_window_super();
    Fl_DerivedGl_Window(int X, int Y, int W, int H, const char *l, fl_Gl_Window_Virtual_Funcs* funcs);
    Fl_DerivedGl_Window(int X, int Y, int W, int H, fl_Gl_Window_Virtual_Funcs* funcs);
    Fl_DerivedGl_Window(int W, int H, const char *l, fl_Gl_Window_Virtual_Funcs* funcs);
    Fl_DerivedGl_Window(int W, int H, fl_Gl_Window_Virtual_Funcs* funcs);
    ~Fl_DerivedGl_Window();
  };
#endif
  /* Fl_Window inherited*/
  FL_EXPORT_C(unsigned int, Fl_Gl_Window_changed)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_fullscreen)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_fullscreen_off)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_fullscreen_off_with_resize)(fl_Gl_Window win,int X,int Y,int W,int H);
  FL_EXPORT_C(void*, Fl_Gl_Window_other_data)(fl_Gl_Window gl_window);
  FL_EXPORT_C(void, Fl_Gl_Window_set_other_data)(fl_Gl_Window gl_window, void* v);
  FL_EXPORT_C(fl_Gl_Window,    Fl_Gl_Window_New_WithLabel)(int w, int h, const char* title);
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_New_WithLabel)(int w, int h, const char* title, fl_Gl_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Gl_Window,    Fl_Gl_Window_New)(int w, int h);
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_New)(int w, int h,fl_Gl_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Gl_Window,    Fl_Gl_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title);
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_NewXY_WithLabel)(int x, int y, int w, int h, const char* title,fl_Gl_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Gl_Window,    Fl_Gl_Window_NewXY)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Gl_Window, Fl_OverriddenGl_Window_NewXY)(int x, int y, int w, int h,fl_Gl_Window_Virtual_Funcs* funcs);
  FL_EXPORT_C(void,         Fl_Gl_Window_hide)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_show)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_show_with_args)(fl_Gl_Window win, int argc, char** argv);
  FL_EXPORT_C(void,         Fl_Gl_Window_Destroy)(fl_Gl_Window win);
  FL_EXPORT_C(void,         Fl_Gl_Window_resize)(fl_Gl_Window win, int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Gl_Window_iconize)(fl_Gl_Window win);
  FL_EXPORT_C(int ,Fl_Gl_Window_handle)(fl_Gl_Window win, int event);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_border)(fl_Gl_Window win, int b);
  FL_EXPORT_C(void ,Fl_Gl_Window_clear_border)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Gl_Window_border)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_override)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_override)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_modal)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_modal)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_non_modal)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int ,Fl_Gl_Window_non_modal)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_menu_window)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_menu_window)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_set_tooltip_window)(fl_Gl_Window win);
  FL_EXPORT_C(unsigned int,Fl_Gl_Window_tooltip_window)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_hotspot_with_x_y)(fl_Gl_Window win, int x, int y);
  FL_EXPORT_C(void ,Fl_Gl_Window_hotspot_with_x_y_with_offscreen)(fl_Gl_Window win, int x, int y, int offscreen);
  FL_EXPORT_C(void ,Fl_Gl_Window_hotspot_with_widget)(fl_Gl_Window win, fl_Widget w);//, int offscreen = 0);
  FL_EXPORT_C(void ,Fl_Gl_Window_hotspot_with_widget_with_offscreen)(fl_Gl_Window win, fl_Widget w, int offscreen);
  FL_EXPORT_C(fl_Window_size_range_args*,Fl_Gl_Window_default_size_range_args)();
  FL_EXPORT_C(void ,Fl_Gl_Window_free_position)(fl_Gl_Window win);
  FL_EXPORT_C(void ,Fl_Gl_Window_size_range)(fl_Gl_Window win, int minw, int minh);
  FL_EXPORT_C(void ,Fl_Gl_Window_size_range_with_args)(fl_Gl_Window win, int minw, int minh, fl_Window_size_range_args* args);//int maxw=0, int maxh=0, int dw=0, int dh=0, int aspect=0);
  FL_EXPORT_C(const char*, Fl_Gl_Window_label)(fl_Gl_Window win);
  FL_EXPORT_C(const char*, Fl_Gl_Window_iconlabel)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_label)(fl_Gl_Window win,const char*);
  FL_EXPORT_C(void, Fl_Gl_Window_set_iconlabel)(fl_Gl_Window win,const char*);
  FL_EXPORT_C(void, Fl_Gl_Window_set_label_with_iconlabel)(fl_Gl_Window win,const char* label, const char* iconlabel);
  FL_EXPORT_C(void, Fl_Gl_Window_copy_label)(fl_Gl_Window win,const char* a);
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_xclass)(const char* label);
  FL_EXPORT_C(const char*, Fl_Gl_Window_default_xclass)();
  FL_EXPORT_C(const char*, Fl_Gl_Window_xclass)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_xclass)(fl_Gl_Window win,const char* c);
  FL_EXPORT_C(const void*, Fl_Gl_Window_icon)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_icon)(fl_Gl_Window win,const void * ic);
  FL_EXPORT_C(int, Fl_Gl_Window_shown)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_iconize)(fl_Gl_Window win);
  FL_EXPORT_C(int, Fl_Gl_Window_x_root)(fl_Gl_Window win);
  FL_EXPORT_C(int, Fl_Gl_Window_y_root)(fl_Gl_Window win);
  FL_EXPORT_C(fl_Gl_Window, Fl_Gl_Window_current)();
  FL_EXPORT_C(void, Fl_Gl_Window_make_current)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_cursor_with_bg)(fl_Gl_Window win, Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Gl_Window_set_cursor_with_fg)(fl_Gl_Window win,Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Gl_Window_set_cursor_with_fg_bg)(fl_Gl_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );/* =FL_BLACK *//*=FL_WHITE*/
  FL_EXPORT_C(void, Fl_Gl_Window_set_cursor)(fl_Gl_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_cursor_with_bg)(fl_Gl_Window win,Fl_Cursor cursor, Fl_Color bg);
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_cursor_with_fg)(fl_Gl_Window win, Fl_Cursor cursor, Fl_Color fg);
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_cursor_with_fg_bg)(fl_Gl_Window win,Fl_Cursor cursor, Fl_Color fg , Fl_Color bg );
  FL_EXPORT_C(void, Fl_Gl_Window_set_default_cursor)(fl_Gl_Window win,Fl_Cursor cursor);
  FL_EXPORT_C(void, Fl_Gl_Window_default_callback)(fl_Gl_Window win, void* v);
  FL_EXPORT_C(int, Fl_Gl_Window_decorated_w)(fl_Gl_Window win);
  FL_EXPORT_C(int, Fl_Gl_Window_decorated_h)(fl_Gl_Window win);
  // Fl_Gl_Window specific
  FL_EXPORT_C(char, Fl_Gl_Window_valid)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_valid)(fl_Gl_Window win, char v);
  FL_EXPORT_C(void, Fl_Gl_Window_invalidate)(fl_Gl_Window win);
  FL_EXPORT_C(char, Fl_Gl_Window_context_valid)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_context_valid)(fl_Gl_Window win,char v);
  FL_EXPORT_C(int, Fl_Gl_Window_can_do_with_m)(int m);
  FL_EXPORT_C(int, Fl_Gl_Window_can_do)(fl_Gl_Window win);
  FL_EXPORT_C(Fl_Mode, Fl_Gl_Window_mode)(fl_Gl_Window win);
  FL_EXPORT_C(int, Fl_Gl_Window_set_mode)(fl_Gl_Window win,int a);
  FL_EXPORT_C(void*, Fl_Gl_Window_context)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_set_context)(fl_Gl_Window win,void* context);
  FL_EXPORT_C(void, Fl_Gl_Window_set_context_with_destroy_flag)(fl_Gl_Window win,void* context, int destroy_flag);
  FL_EXPORT_C(void, Fl_Gl_Window_swap_buffers)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_ortho)(fl_Gl_Window win);
  FL_EXPORT_C(int, Fl_Gl_Window_can_do_overlay)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_redraw_overlay)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_hide_overlay)(fl_Gl_Window win);
  FL_EXPORT_C(void, Fl_Gl_Window_make_overlay_current)(fl_Gl_Window win);
  FL_EXPORT_C(int,Fl_Gl_Window_handle_super)(fl_Gl_Window self, int event);
  FL_EXPORT_C(void,Fl_Gl_Window_draw_super)(fl_Gl_Window self);
  FL_EXPORT_C(fl_Group,Fl_Gl_Window_as_group_super)(fl_Gl_Window win);
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_window_super)(fl_Gl_Window win);
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_window)(fl_Gl_Window win);
  FL_EXPORT_C(fl_Gl_Window,Fl_Gl_Window_as_gl_window_super)(fl_Gl_Window win);
  FL_EXPORT_C(void,Fl_Gl_Window_hide_super)(fl_Gl_Window win);
  FL_EXPORT_C(void,Fl_Gl_Window_flush_super)(fl_Gl_Window win);
  FL_EXPORT_C(void,Fl_Gl_Window_flush)(fl_Gl_Window win);
  FL_EXPORT_C(void,Fl_Gl_Window_show_super)(fl_Gl_Window win);
  FL_EXPORT_C(void,Fl_Gl_Window_resize_super)(fl_Gl_Window win,int X,int Y,int W,int H);

#ifdef __cplusplus
}
#endif

#endif /* __FL_GL_WINDOW_C__ */
