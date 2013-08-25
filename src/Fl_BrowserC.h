#ifndef __FL_BROWSER_C__
#define __FL_BROWSER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Browser.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedBrowser : public Fl_Browser {
    fl_Browser_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
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
    void resize_super(int x, int y, int w, int h);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void show(int val);
    virtual void hide();
    virtual void hide(int val);
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    virtual Fl_Group* as_group();
    Fl_DerivedBrowser(int X, int Y, int W, int H, const char *l, fl_Browser_Virtual_Funcs* funcs);
    Fl_DerivedBrowser(int X, int Y, int W, int H, fl_Browser_Virtual_Funcs* funcs);
    ~Fl_DerivedBrowser();
  };
#endif

  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int ,         Fl_Browser_handle_super)(fl_Browser browser,int event);
  FL_EXPORT_C(int ,         Fl_Browser_handle )(fl_Browser browser,int event);
  FL_EXPORT_C(void,         Fl_Browser_resize_super)(fl_Browser browser,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Browser_resize )(fl_Browser browser,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Browser_show_super)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_show )(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_hide_super)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_hide )(fl_Browser browser);
  FL_EXPORT_C(fl_Window,    Fl_Browser_as_window_super)(fl_Browser browser);
  FL_EXPORT_C(fl_Window,    Fl_Browser_as_window )(fl_Browser browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Browser_as_gl_window_super)(fl_Browser browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Browser_as_gl_window)(fl_Browser browser);
  FL_EXPORT_C(fl_Group,     Fl_Browser_parent)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_parent)(fl_Browser browser, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Browser_type)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_type)(fl_Browser browser, uchar t);

FL_EXPORT_C(void, Fl_Browser_draw_box)(fl_Browser Browser);
FL_EXPORT_C(void, Fl_Browser_draw_box_with_tc)(fl_Browser Browser,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Browser_draw_box_with_txywhc)(fl_Browser Browser,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Browser_draw_backdrop)(fl_Browser Browser);
FL_EXPORT_C(void, Fl_Browser_draw_focus)(fl_Browser Browser);
FL_EXPORT_C(void, Fl_Browser_draw_focus_with_txywh)(fl_Browser Browser,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Browser_draw_label)(fl_Browser Browser);
  FL_EXPORT_C(int,          Fl_Browser_x)(fl_Browser browser);
  FL_EXPORT_C(int,          Fl_Browser_y)(fl_Browser browser);
  FL_EXPORT_C(int,          Fl_Browser_w)(fl_Browser browser);
  FL_EXPORT_C(int,          Fl_Browser_h)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_align)(fl_Browser browser, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Browser_align)(fl_Browser browser);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Browser_box)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_box)(fl_Browser browser, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Browser_color)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_color)(fl_Browser browser, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Browser_set_color_with_bg_sel)(fl_Browser browser,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Browser_selection_color)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_selection_color)(fl_Browser browser, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Browser_label)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_copy_label)(fl_Browser browser, const char* new_label);
  FL_EXPORT_C(void,         Fl_Browser_set_label)(fl_Browser browser, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Browser_labeltype)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_labeltype)(fl_Browser browser, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Browser_labelcolor)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_labelcolor)(fl_Browser browser, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Browser_labelfont)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_labelfont)(fl_Browser browser, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Browser_labelsize)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_labelsize)(fl_Browser browser, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Browser_image)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_image)(fl_Browser browser, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Browser_deimage)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_deimage)(fl_Browser browser, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Browser_tooltip)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_copy_tooltip)(fl_Browser browser, const char* text);
  FL_EXPORT_C(void,         Fl_Browser_set_tooltip)(fl_Browser browser, const char* text);
  FL_EXPORT_C(void,         Fl_Browser_set_callback_with_user_data)(fl_Browser browser, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Browser_set_callback)(fl_Browser browser, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Browser_user_data)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_user_data)(fl_Browser browser, void* v);
  FL_EXPORT_C(long,         Fl_Browser_argument)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_argument)(fl_Browser browser, long v);
  FL_EXPORT_C(Fl_When,      Fl_Browser_when)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_when)(fl_Browser browser, uchar i);
  FL_EXPORT_C(int,          Fl_Browser_visible_r)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_visible)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_clear_visible)(fl_Browser browser);
  FL_EXPORT_C(unsigned int, Fl_Browser_active)(fl_Browser browser);
  FL_EXPORT_C(int,          Fl_Browser_active_r)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_activate)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_deactivate)(fl_Browser browser);
  FL_EXPORT_C(unsigned int, Fl_Browser_output)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_output)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_clear_output)(fl_Browser browser);
  FL_EXPORT_C(unsigned int, Fl_Browser_takesevents)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_changed)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_clear_changed)(fl_Browser browser);
  FL_EXPORT_C(int,          Fl_Browser_take_focus)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_set_visible_focus)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_clear_visible_focus)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_modify_visible_focus)(fl_Browser browser, int v);
  FL_EXPORT_C(unsigned int, Fl_Browser_visible_focus)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_do_callback)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_do_callback_with_widget_and_user_data)(fl_Browser browser, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Browser_do_callback_with_widget_and_default_user_data)(fl_Browser browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Browser_contains)(fl_Browser browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Browser_inside)(fl_Browser browser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Browser_redraw)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_redraw_label)(fl_Browser browser);
  FL_EXPORT_C(uchar,        Fl_Browser_damage)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_clear_damage_with_bitmask)(fl_Browser browser, uchar c);
  FL_EXPORT_C(void,         Fl_Browser_clear_damage)(fl_Browser browser);
  FL_EXPORT_C(void,         Fl_Browser_damage_with_text)(fl_Browser browser, uchar c);
  FL_EXPORT_C(void,         Fl_Browser_damage_inside_widget)(fl_Browser browser, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Browser_draw_label_with_xywh_alignment)(fl_Browser browser, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Browser_measure_label)(fl_Browser browser, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Browser_window)(fl_Browser browser);
  FL_EXPORT_C(fl_Window,    Fl_Browser_top_window)(fl_Browser browser);
  FL_EXPORT_C(fl_Window ,   Fl_Browser_top_window_offset)(fl_Browser browser, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Browser_as_group)(fl_Browser browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Browser_as_gl_window)(fl_Browser browser);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Browser_begin)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_end)(fl_Browser self);
  FL_EXPORT_C(int,          Fl_Browser_find)(fl_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Browser_remove_index)(fl_Browser self, int index);
  FL_EXPORT_C(void,         Fl_Browser_remove_widget)(fl_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Browser_clear)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_set_resizable_by_reference)(fl_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Browser_set_resizable)(fl_Browser self,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Browser_resizable)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_add_resizable)(fl_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Browser_init_sizes)(fl_Browser self);
  FL_EXPORT_C(int,          Fl_Browser_children)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_set_clip_children)(fl_Browser self,int c);
  FL_EXPORT_C(unsigned int, Fl_Browser_clip_children)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_focus)(fl_Browser self,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Browser__ddfdesign_kludge)(fl_Browser self);
  FL_EXPORT_C(void,         Fl_Browser_insert_with_before)(fl_Browser self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Browser_array)(fl_Browser self);
  FL_EXPORT_C(fl_Widget,    Fl_Browser_child)(fl_Browser self, int n);
  FL_EXPORT_C(void,         Fl_Browser_forms_end)(fl_Browser self);

  /* Fl_Browser specific functions */
  FL_EXPORT_C(void*, Fl_Browser_other_data)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_other_data)(fl_Browser browser, void* v);
  FL_EXPORT_C(fl_Browser_Virtual_Funcs*, Fl_Browser_default_virtual_funcs)();
  FL_EXPORT_C(fl_Browser, Fl_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label); 
  FL_EXPORT_C(fl_Browser, Fl_Browser_New)(int x, int y, int w, int h); 
  FL_EXPORT_C(fl_Browser, Fl_OverriddenBrowser_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Browser_Virtual_Funcs* funcs); 
  FL_EXPORT_C(fl_Browser, Fl_OverriddenBrowser_New)(int x, int y, int w, int h, fl_Browser_Virtual_Funcs* funcs); 
  FL_EXPORT_C(void,Fl_Browser_Destroy)(fl_Browser browser);
  FL_EXPORT_C(void,Fl_Browser_remove)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_add)(fl_Browser browser, const char* newtext);
  FL_EXPORT_C(void, Fl_Browser_add_with_d)(fl_Browser browser, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_Browser_insert)(fl_Browser browser, int line, const char* newtext);
  FL_EXPORT_C(void, Fl_Browser_insert_with_d)(fl_Browser browser, int line, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_Browser_move)(fl_Browser browser, int to, int from);
  FL_EXPORT_C(int , Fl_Browser_load)(fl_Browser browser, const char* filename);
  FL_EXPORT_C(void, Fl_Browser_swap)(fl_Browser browser, int a, int b);
  FL_EXPORT_C(void, Fl_Browser_clear)(fl_Browser browser);
  FL_EXPORT_C(int, Fl_Browser_size)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_size)(fl_Browser browser, int W, int H);
  FL_EXPORT_C(int, Fl_Browser_topline)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_lineposition)(fl_Browser browser, int line, Fl_Line_Position pos);
  FL_EXPORT_C(void, Fl_Browser_set_topline)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_bottomline)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_middleline)(fl_Browser browser, int line);
  FL_EXPORT_C(int, Fl_Browser_select)(fl_Browser browser, int line);
  FL_EXPORT_C(int, Fl_Browser_select_with_val)(fl_Browser browser, int line, int val);
  FL_EXPORT_C(int, Fl_Browser_selected)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_show_with_line)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_show)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_hide_with_line)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_hide)(fl_Browser browser);
  FL_EXPORT_C(int, Fl_Browser_visible)(fl_Browser browser, int line);
  FL_EXPORT_C(int, Fl_Browser_value)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_value)(fl_Browser browser, int line);
  FL_EXPORT_C(const char*, Fl_Browser_text)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_set_text)(fl_Browser browser, int line, const char* newtext);
  FL_EXPORT_C(void*, Fl_Browser_data)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_set_data)(fl_Browser browser, int line, void* d);
  FL_EXPORT_C(char, Fl_Browser_format_char)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_format_char)(fl_Browser browser, char c);
  FL_EXPORT_C(char, Fl_Browser_column_char)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_column_char)(fl_Browser browser, char c);
  FL_EXPORT_C(const int*, Fl_Browser_column_widths)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_column_widths)(fl_Browser browser, const int* arr);
  FL_EXPORT_C(int, Fl_Browser_displayed)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_make_visible)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_set_icon)(fl_Browser browser, int line, fl_Image icon);
  FL_EXPORT_C(fl_Image, Fl_Browser_icon)(fl_Browser browser, int line);
  FL_EXPORT_C(void, Fl_Browser_remove_icon)(fl_Browser browser, int line);
  FL_EXPORT_C(int, Fl_Browser_select_only)(fl_Browser browser,void *item);
  FL_EXPORT_C(int, Fl_Browser_select_only_with_docallbacks)(fl_Browser browser,void *item,int docallbacks);
  FL_EXPORT_C(int, Fl_Browser_deselect)(fl_Browser browser);
  FL_EXPORT_C(int, Fl_Browser_deselect_with_docallbacks)(fl_Browser browser,int docallbacks);
  FL_EXPORT_C(int, Fl_Browser_position)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_position)(fl_Browser browser,int pos); // scroll to here
  FL_EXPORT_C(int, Fl_Browser_hposition)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_hposition)(fl_Browser browser,int); // pan to here
  FL_EXPORT_C(uchar, Fl_Browser_has_scrollbar)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_set_has_scrollbar)(fl_Browser browser,uchar mode); 
  FL_EXPORT_C(Fl_Font, Fl_Browser_textfont)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_textfont)(fl_Browser browser,Fl_Font font); 
  FL_EXPORT_C(Fl_Fontsize, Fl_Browser_textsize)(fl_Browser browser);  
  FL_EXPORT_C(void, Fl_Browser_set_textsize)(fl_Browser browser,Fl_Fontsize newSize); 
  FL_EXPORT_C(Fl_Color, Fl_Browser_textcolor)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_textcolor)(fl_Browser browser,Fl_Color col); 
  FL_EXPORT_C(int, Fl_Browser_scrollbar_size)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_scrollbar_size)(fl_Browser browser,int newSize); 
  FL_EXPORT_C(int, Fl_Browser_scrollbar_width)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_scrollbar_width)(fl_Browser browser,int width); 
  FL_EXPORT_C(void, Fl_Browser_scrollbar_right)(fl_Browser browser); 
  FL_EXPORT_C(void, Fl_Browser_set_scrollbar_left)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_sort)(fl_Browser browser);
  FL_EXPORT_C(void, Fl_Browser_sort_with_flags)(fl_Browser browser,int flags);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_BROWSER_C__*/
