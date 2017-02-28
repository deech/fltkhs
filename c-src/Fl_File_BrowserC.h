#ifndef __FL_FILE_BROWSER_C__
#define __FL_FILE_BROWSER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedFile_Browser : public Fl_File_Browser {
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
    Fl_DerivedFile_Browser(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedFile_Browser(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedFile_Browser();
  };
#endif
#include "filenameC.h"

#ifndef INTERNAL_LINKAGE
  typedef enum FILE_BROWSER_TYPE {
    FILES,
    DIRECTORIES
  } FILE_BROWSER_TYPE;
#endif

  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_as_window_super)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_as_window )(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_File_Browser_as_gl_window_super)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_File_Browser_as_gl_window)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Group,     Fl_File_Browser_parent)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_parent)(fl_File_Browser file_browser, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_File_Browser_type)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_type)(fl_File_Browser file_browser, uchar t);

  FL_EXPORT_C(int,          Fl_File_Browser_x)(fl_File_Browser file_browser);
  FL_EXPORT_C(int,          Fl_File_Browser_y)(fl_File_Browser file_browser);
  FL_EXPORT_C(int,          Fl_File_Browser_w)(fl_File_Browser file_browser);
  FL_EXPORT_C(int,          Fl_File_Browser_h)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_align)(fl_File_Browser file_browser, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_File_Browser_align)(fl_File_Browser file_browser);
  FL_EXPORT_C(Fl_Boxtype,   Fl_File_Browser_box)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_box)(fl_File_Browser file_browser, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_File_Browser_color)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_color)(fl_File_Browser file_browser, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_File_Browser_set_color_with_bg_sel)(fl_File_Browser file_browser,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_File_Browser_selection_color)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_selection_color)(fl_File_Browser file_browser, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_File_Browser_label)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_copy_label)(fl_File_Browser file_browser, const char* new_label);
  FL_EXPORT_C(void,         Fl_File_Browser_set_label)(fl_File_Browser file_browser, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_File_Browser_labeltype)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_labeltype)(fl_File_Browser file_browser, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_File_Browser_labelcolor)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_labelcolor)(fl_File_Browser file_browser, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_File_Browser_labelfont)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_labelfont)(fl_File_Browser file_browser, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_File_Browser_labelsize)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_labelsize)(fl_File_Browser file_browser, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_File_Browser_image)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_image)(fl_File_Browser file_browser, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_File_Browser_deimage)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_deimage)(fl_File_Browser file_browser, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_File_Browser_tooltip)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_copy_tooltip)(fl_File_Browser file_browser, const char* text);
  FL_EXPORT_C(void,         Fl_File_Browser_set_tooltip)(fl_File_Browser file_browser, const char* text);
  FL_EXPORT_C(void,         Fl_File_Browser_set_callback_with_user_data)(fl_File_Browser file_browser, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_File_Browser_set_callback)(fl_File_Browser file_browser, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_File_Browser_user_data)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_user_data)(fl_File_Browser file_browser, void* v);
  FL_EXPORT_C(long,         Fl_File_Browser_argument)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_argument)(fl_File_Browser file_browser, long v);
  FL_EXPORT_C(Fl_When,      Fl_File_Browser_when)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_when)(fl_File_Browser file_browser, uchar i);
  FL_EXPORT_C(int,          Fl_File_Browser_visible_r)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_visible)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_visible)(fl_File_Browser file_browser);
  FL_EXPORT_C(unsigned int, Fl_File_Browser_active)(fl_File_Browser file_browser);
  FL_EXPORT_C(int,          Fl_File_Browser_active_r)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_activate)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_deactivate)(fl_File_Browser file_browser);
  FL_EXPORT_C(unsigned int, Fl_File_Browser_output)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_output)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_output)(fl_File_Browser file_browser);
  FL_EXPORT_C(unsigned int, Fl_File_Browser_takesevents)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_changed)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_changed)(fl_File_Browser file_browser);
  FL_EXPORT_C(int,          Fl_File_Browser_take_focus)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_set_visible_focus)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_visible_focus)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_modify_visible_focus)(fl_File_Browser file_browser, int v);
  FL_EXPORT_C(unsigned int, Fl_File_Browser_visible_focus)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_do_callback)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_do_callback_with_widget_and_user_data)(fl_File_Browser file_browser, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_File_Browser_do_callback_with_widget_and_default_user_data)(fl_File_Browser file_browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_File_Browser_contains)(fl_File_Browser file_browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_File_Browser_inside)(fl_File_Browser file_browser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_File_Browser_redraw)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_redraw_label)(fl_File_Browser file_browser);
  FL_EXPORT_C(uchar,        Fl_File_Browser_damage)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_damage_with_bitmask)(fl_File_Browser file_browser, uchar c);
  FL_EXPORT_C(void,         Fl_File_Browser_clear_damage)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,         Fl_File_Browser_damage_with_text)(fl_File_Browser file_browser, uchar c);
  FL_EXPORT_C(void,         Fl_File_Browser_damage_inside_widget)(fl_File_Browser file_browser, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_File_Browser_draw_label_with_xywh_alignment)(fl_File_Browser file_browser, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_File_Browser_measure_label)(fl_File_Browser file_browser, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_window)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_top_window)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Window ,   Fl_File_Browser_top_window_offset)(fl_File_Browser file_browser, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_File_Browser_as_group)(fl_File_Browser file_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_File_Browser_as_gl_window)(fl_File_Browser file_browser);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_File_Browser_begin)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_end)(fl_File_Browser self);
  FL_EXPORT_C(int,          Fl_File_Browser_find)(fl_File_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_File_Browser_remove_index)(fl_File_Browser self, int index);
  FL_EXPORT_C(void,         Fl_File_Browser_remove_widget)(fl_File_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_File_Browser_clear)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_set_resizable_by_reference)(fl_File_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_File_Browser_set_resizable)(fl_File_Browser self,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_File_Browser_resizable)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_add_resizable)(fl_File_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_File_Browser_init_sizes)(fl_File_Browser self);
  FL_EXPORT_C(int,          Fl_File_Browser_children)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_set_clip_children)(fl_File_Browser self,int c);
  FL_EXPORT_C(unsigned int, Fl_File_Browser_clip_children)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_focus)(fl_File_Browser self,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_File_Browser__ddfdesign_kludge)(fl_File_Browser self);
  FL_EXPORT_C(void,         Fl_File_Browser_insert_with_before)(fl_File_Browser self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_File_Browser_array)(fl_File_Browser self);
  FL_EXPORT_C(fl_Widget,    Fl_File_Browser_child)(fl_File_Browser self, int n);
  FL_EXPORT_C(void,         Fl_File_Browser_forms_end)(fl_File_Browser self);

  /* Fl_File_Browser specific functions */
  FL_EXPORT_C(fl_File_Browser, Fl_File_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_File_Browser, Fl_File_Browser_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void,Fl_File_Browser_Destroy)(fl_File_Browser file_browser);
  FL_EXPORT_C(void,Fl_File_Browser_remove)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_add)(fl_File_Browser file_browser, const char* newtext);
  FL_EXPORT_C(void, Fl_File_Browser_add_with_d)(fl_File_Browser file_browser, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_File_Browser_insert)(fl_File_Browser file_browser, int line, const char* newtext);
  FL_EXPORT_C(void, Fl_File_Browser_insert_with_d)(fl_File_Browser file_browser, int line, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_File_Browser_move)(fl_File_Browser file_browser, int to, int from);
  FL_EXPORT_C(void, Fl_File_Browser_swap)(fl_File_Browser file_browser, int a, int b);
  FL_EXPORT_C(void, Fl_File_Browser_clear)(fl_File_Browser file_browser);
  FL_EXPORT_C(int, Fl_File_Browser_size)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_size)(fl_File_Browser file_browser, int W, int H);
  FL_EXPORT_C(int, Fl_File_Browser_topline)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_lineposition)(fl_File_Browser file_browser, int line, Fl_Line_Position pos);
  FL_EXPORT_C(void, Fl_File_Browser_set_topline)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_bottomline)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_middleline)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(int, Fl_File_Browser_select)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(int, Fl_File_Browser_select_with_val)(fl_File_Browser file_browser, int line, int val);
  FL_EXPORT_C(int, Fl_File_Browser_selected)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_show_with_line)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_show)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_hide_with_line)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_hide)(fl_File_Browser file_browser);
  FL_EXPORT_C(int, Fl_File_Browser_visible)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(int, Fl_File_Browser_value)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_value)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(const char*, Fl_File_Browser_text)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_set_text)(fl_File_Browser file_browser, int line, const char* newtext);
  FL_EXPORT_C(void*, Fl_File_Browser_data)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_set_data)(fl_File_Browser file_browser, int line, void* d);
  FL_EXPORT_C(char, Fl_File_Browser_format_char)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_format_char)(fl_File_Browser file_browser, char c);
  FL_EXPORT_C(char, Fl_File_Browser_column_char)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_column_char)(fl_File_Browser file_browser, char c);
  FL_EXPORT_C(const int*, Fl_File_Browser_column_widths)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_column_widths)(fl_File_Browser file_browser, const int* arr);
  FL_EXPORT_C(int, Fl_File_Browser_displayed)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_make_visible)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_set_icon)(fl_File_Browser file_browser, int line, fl_Image icon);
  FL_EXPORT_C(fl_Image, Fl_File_Browser_icon)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(void, Fl_File_Browser_remove_icon)(fl_File_Browser file_browser, int line);
  FL_EXPORT_C(int, Fl_File_Browser_select_only)(fl_File_Browser file_browser,void *item);
  FL_EXPORT_C(int, Fl_File_Browser_select_only_with_docallbacks)(fl_File_Browser file_browser,void *item,int docallbacks);
  FL_EXPORT_C(int, Fl_File_Browser_deselect)(fl_File_Browser file_browser);
  FL_EXPORT_C(int, Fl_File_Browser_deselect_with_docallbacks)(fl_File_Browser file_browser,int docallbacks);
  FL_EXPORT_C(int, Fl_File_Browser_position)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_position)(fl_File_Browser file_browser,int pos); // scroll to here
  FL_EXPORT_C(int, Fl_File_Browser_hposition)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_hposition)(fl_File_Browser file_browser,int); // pan to here
  FL_EXPORT_C(uchar, Fl_File_Browser_has_scrollbar)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_has_scrollbar)(fl_File_Browser file_browser,uchar mode);
  FL_EXPORT_C(Fl_Font, Fl_File_Browser_textfont)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_textfont)(fl_File_Browser file_browser,Fl_Font font);
  FL_EXPORT_C(Fl_Fontsize, Fl_File_Browser_textsize)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_textsize)(fl_File_Browser file_browser,Fl_Fontsize newSize);
  FL_EXPORT_C(Fl_Color, Fl_File_Browser_textcolor)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_textcolor)(fl_File_Browser file_browser,Fl_Color col);
  FL_EXPORT_C(int, Fl_File_Browser_scrollbar_size)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_scrollbar_size)(fl_File_Browser file_browser,int newSize);
  FL_EXPORT_C(int, Fl_File_Browser_scrollbar_width)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_scrollbar_width)(fl_File_Browser file_browser,int width);
  FL_EXPORT_C(void, Fl_File_Browser_scrollbar_right)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_scrollbar_left)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_sort)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_sort_with_flags)(fl_File_Browser file_browser,int flags);
  FL_EXPORT_C(uchar,	Fl_File_Browser_iconsize)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_iconsize)(fl_File_Browser file_browser,uchar s);
  FL_EXPORT_C(void, Fl_File_Browser_set_filter)(fl_File_Browser file_browser,const char* pattern);
  FL_EXPORT_C(const char*, Fl_File_Browser_filter)(fl_File_Browser file_browser);
  FL_EXPORT_C(int, Fl_File_Browser_load)(fl_File_Browser file_browser,const char *directory, Fl_File_Sort_F* sort);
  FL_EXPORT_C(int, Fl_File_Browser_filetype)(fl_File_Browser file_browser);
  FL_EXPORT_C(void, Fl_File_Browser_set_filetype)(fl_File_Browser file_browser,int t);
  FL_EXPORT_C(fl_File_Browser,    Fl_OverriddenFile_Browser_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_File_Browser,    Fl_OverriddenFile_Browser_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_File_Browser_draw)(fl_File_Browser o);
  FL_EXPORT_C(void, Fl_File_Browser_draw_super)(fl_File_Browser o);
  FL_EXPORT_C(int, Fl_File_Browser_handle)(fl_File_Browser o, int event);
  FL_EXPORT_C(int, Fl_File_Browser_handle_super)(fl_File_Browser o, int event);
  FL_EXPORT_C(void, Fl_File_Browser_resize)(fl_File_Browser o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_File_Browser_resize_super)(fl_File_Browser o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_File_Browser_show)(fl_File_Browser o);
  FL_EXPORT_C(void, Fl_File_Browser_show_super)(fl_File_Browser o);
  FL_EXPORT_C(void, Fl_File_Browser_hide)(fl_File_Browser o);
  FL_EXPORT_C(void, Fl_File_Browser_hide_super)(fl_File_Browser o);

#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_FILE_BROWSER_C__*/
