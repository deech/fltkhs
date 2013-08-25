#ifndef __FL_SELECT_BROWSER_C__
#define __FL_SELECT_BROWSER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Select_Browser.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif

  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int ,         Fl_Select_Browser_handle_super)(fl_Select_Browser select_browser,int event);
  FL_EXPORT_C(int ,         Fl_Select_Browser_handle )(fl_Select_Browser select_browser,int event);
  FL_EXPORT_C(void,         Fl_Select_Browser_resize_super)(fl_Select_Browser select_browser,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Select_Browser_resize )(fl_Select_Browser select_browser,int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Select_Browser_show_super)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_show )(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_hide_super)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_hide )(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_as_window_super)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_as_window )(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Select_Browser_as_gl_window_super)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Select_Browser_as_gl_window)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Group,     Fl_Select_Browser_parent)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_parent)(fl_Select_Browser select_browser, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Select_Browser_type)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_type)(fl_Select_Browser select_browser, uchar t);

  FL_EXPORT_C(int,          Fl_Select_Browser_x)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int,          Fl_Select_Browser_y)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int,          Fl_Select_Browser_w)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int,          Fl_Select_Browser_h)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_align)(fl_Select_Browser select_browser, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Select_Browser_align)(fl_Select_Browser select_browser);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Select_Browser_box)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_box)(fl_Select_Browser select_browser, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Select_Browser_color)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_color)(fl_Select_Browser select_browser, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_color_with_bg_sel)(fl_Select_Browser select_browser,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Select_Browser_selection_color)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_selection_color)(fl_Select_Browser select_browser, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Select_Browser_label)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_copy_label)(fl_Select_Browser select_browser, const char* new_label);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_label)(fl_Select_Browser select_browser, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Select_Browser_labeltype)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_labeltype)(fl_Select_Browser select_browser, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Select_Browser_labelcolor)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_labelcolor)(fl_Select_Browser select_browser, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Select_Browser_labelfont)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_labelfont)(fl_Select_Browser select_browser, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Select_Browser_labelsize)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_labelsize)(fl_Select_Browser select_browser, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Select_Browser_image)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_image)(fl_Select_Browser select_browser, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Select_Browser_deimage)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_deimage)(fl_Select_Browser select_browser, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Select_Browser_tooltip)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_copy_tooltip)(fl_Select_Browser select_browser, const char* text);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_tooltip)(fl_Select_Browser select_browser, const char* text);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_callback_with_user_data)(fl_Select_Browser select_browser, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_callback)(fl_Select_Browser select_browser, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Select_Browser_user_data)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_user_data)(fl_Select_Browser select_browser, void* v);
  FL_EXPORT_C(long,         Fl_Select_Browser_argument)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_argument)(fl_Select_Browser select_browser, long v);
  FL_EXPORT_C(Fl_When,      Fl_Select_Browser_when)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_when)(fl_Select_Browser select_browser, uchar i);
  FL_EXPORT_C(int,          Fl_Select_Browser_visible_r)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_visible)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_visible)(fl_Select_Browser select_browser);
  FL_EXPORT_C(unsigned int, Fl_Select_Browser_active)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int,          Fl_Select_Browser_active_r)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_activate)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_deactivate)(fl_Select_Browser select_browser);
  FL_EXPORT_C(unsigned int, Fl_Select_Browser_output)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_output)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_output)(fl_Select_Browser select_browser);
  FL_EXPORT_C(unsigned int, Fl_Select_Browser_takesevents)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_changed)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_changed)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int,          Fl_Select_Browser_take_focus)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_visible_focus)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_visible_focus)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_modify_visible_focus)(fl_Select_Browser select_browser, int v);
  FL_EXPORT_C(unsigned int, Fl_Select_Browser_visible_focus)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_do_callback)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_do_callback_with_widget_and_user_data)(fl_Select_Browser select_browser, fl_Widget w, long arg);
  FL_EXPORT_C(void,         Fl_Select_Browser_do_callback_with_widget_and_default_user_data)(fl_Select_Browser select_browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Select_Browser_contains)(fl_Select_Browser select_browser, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Select_Browser_inside)(fl_Select_Browser select_browser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Select_Browser_redraw)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_redraw_label)(fl_Select_Browser select_browser);
  FL_EXPORT_C(uchar,        Fl_Select_Browser_damage)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_damage_with_bitmask)(fl_Select_Browser select_browser, uchar c);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear_damage)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,         Fl_Select_Browser_damage_with_text)(fl_Select_Browser select_browser, uchar c);
  FL_EXPORT_C(void,         Fl_Select_Browser_damage_inside_widget)(fl_Select_Browser select_browser, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Select_Browser_draw_label_with_xywh_alignment)(fl_Select_Browser select_browser, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Select_Browser_measure_label)(fl_Select_Browser select_browser, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_window)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_top_window)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Window ,   Fl_Select_Browser_top_window_offset)(fl_Select_Browser select_browser, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Select_Browser_as_group)(fl_Select_Browser select_browser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Select_Browser_as_gl_window)(fl_Select_Browser select_browser);
  /* Inherited from Fl_Group */
  FL_EXPORT_C(void,         Fl_Select_Browser_begin)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_end)(fl_Select_Browser self);
  FL_EXPORT_C(int,          Fl_Select_Browser_find)(fl_Select_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Select_Browser_remove_index)(fl_Select_Browser self, int index);
  FL_EXPORT_C(void,         Fl_Select_Browser_remove_widget)(fl_Select_Browser self, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Select_Browser_clear)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_resizable_by_reference)(fl_Select_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_resizable)(fl_Select_Browser self,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Select_Browser_resizable)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_add_resizable)(fl_Select_Browser self,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Select_Browser_init_sizes)(fl_Select_Browser self);
  FL_EXPORT_C(int,          Fl_Select_Browser_children)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_set_clip_children)(fl_Select_Browser self,int c);
  FL_EXPORT_C(unsigned int, Fl_Select_Browser_clip_children)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_focus)(fl_Select_Browser self,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Select_Browser__ddfdesign_kludge)(fl_Select_Browser self);
  FL_EXPORT_C(void,         Fl_Select_Browser_insert_with_before)(fl_Select_Browser self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Select_Browser_array)(fl_Select_Browser self);
  FL_EXPORT_C(fl_Widget,    Fl_Select_Browser_child)(fl_Select_Browser self, int n);
  FL_EXPORT_C(void,         Fl_Select_Browser_forms_end)(fl_Select_Browser self);

  /* Fl_Select_Browser specific functions */
  FL_EXPORT_C(fl_Select_Browser, Fl_Select_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label); 
  FL_EXPORT_C(fl_Select_Browser, Fl_Select_Browser_New)(int x, int y, int w, int h); 
  FL_EXPORT_C(void,Fl_Select_Browser_Destroy)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void,Fl_Select_Browser_remove)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_add)(fl_Select_Browser select_browser, const char* newtext);
  FL_EXPORT_C(void, Fl_Select_Browser_add_with_d)(fl_Select_Browser select_browser, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_Select_Browser_insert)(fl_Select_Browser select_browser, int line, const char* newtext);
  FL_EXPORT_C(void, Fl_Select_Browser_insert_with_d)(fl_Select_Browser select_browser, int line, const char* newtext, void* d);
  FL_EXPORT_C(void, Fl_Select_Browser_move)(fl_Select_Browser select_browser, int to, int from);
  FL_EXPORT_C(int , Fl_Select_Browser_load)(fl_Select_Browser select_browser, const char* filename);
  FL_EXPORT_C(void, Fl_Select_Browser_swap)(fl_Select_Browser select_browser, int a, int b);
  FL_EXPORT_C(void, Fl_Select_Browser_clear)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int, Fl_Select_Browser_size)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_size)(fl_Select_Browser select_browser, int W, int H);
  FL_EXPORT_C(int, Fl_Select_Browser_topline)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_lineposition)(fl_Select_Browser select_browser, int line, Fl_Line_Position pos);
  FL_EXPORT_C(void, Fl_Select_Browser_set_topline)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_bottomline)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_middleline)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(int, Fl_Select_Browser_select)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(int, Fl_Select_Browser_select_with_val)(fl_Select_Browser select_browser, int line, int val);
  FL_EXPORT_C(int, Fl_Select_Browser_selected)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_show_with_line)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_show)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_hide_with_line)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_hide)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int, Fl_Select_Browser_visible)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(int, Fl_Select_Browser_value)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_value)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(const char*, Fl_Select_Browser_text)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_set_text)(fl_Select_Browser select_browser, int line, const char* newtext);
  FL_EXPORT_C(void*, Fl_Select_Browser_data)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_set_data)(fl_Select_Browser select_browser, int line, void* d);
  FL_EXPORT_C(char, Fl_Select_Browser_format_char)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_format_char)(fl_Select_Browser select_browser, char c);
  FL_EXPORT_C(char, Fl_Select_Browser_column_char)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_column_char)(fl_Select_Browser select_browser, char c);
  FL_EXPORT_C(const int*, Fl_Select_Browser_column_widths)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_column_widths)(fl_Select_Browser select_browser, const int* arr);
  FL_EXPORT_C(int, Fl_Select_Browser_displayed)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_make_visible)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_set_icon)(fl_Select_Browser select_browser, int line, fl_Image icon);
  FL_EXPORT_C(fl_Image, Fl_Select_Browser_icon)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(void, Fl_Select_Browser_remove_icon)(fl_Select_Browser select_browser, int line);
  FL_EXPORT_C(int, Fl_Select_Browser_select_only)(fl_Select_Browser select_browser,void *item);
  FL_EXPORT_C(int, Fl_Select_Browser_select_only_with_docallbacks)(fl_Select_Browser select_browser,void *item,int docallbacks);
  FL_EXPORT_C(int, Fl_Select_Browser_deselect)(fl_Select_Browser select_browser);
  FL_EXPORT_C(int, Fl_Select_Browser_deselect_with_docallbacks)(fl_Select_Browser select_browser,int docallbacks);
  FL_EXPORT_C(int, Fl_Select_Browser_position)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_position)(fl_Select_Browser select_browser,int pos); // scroll to here
  FL_EXPORT_C(int, Fl_Select_Browser_hposition)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_hposition)(fl_Select_Browser select_browser,int); // pan to here
  FL_EXPORT_C(uchar, Fl_Select_Browser_has_scrollbar)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_set_has_scrollbar)(fl_Select_Browser select_browser,uchar mode); 
  FL_EXPORT_C(Fl_Font, Fl_Select_Browser_textfont)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_textfont)(fl_Select_Browser select_browser,Fl_Font font); 
  FL_EXPORT_C(Fl_Fontsize, Fl_Select_Browser_textsize)(fl_Select_Browser select_browser);  
  FL_EXPORT_C(void, Fl_Select_Browser_set_textsize)(fl_Select_Browser select_browser,Fl_Fontsize newSize); 
  FL_EXPORT_C(Fl_Color, Fl_Select_Browser_textcolor)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_textcolor)(fl_Select_Browser select_browser,Fl_Color col); 
  FL_EXPORT_C(int, Fl_Select_Browser_scrollbar_size)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_scrollbar_size)(fl_Select_Browser select_browser,int newSize); 
  FL_EXPORT_C(int, Fl_Select_Browser_scrollbar_width)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_scrollbar_width)(fl_Select_Browser select_browser,int width); 
  FL_EXPORT_C(void, Fl_Select_Browser_scrollbar_right)(fl_Select_Browser select_browser); 
  FL_EXPORT_C(void, Fl_Select_Browser_set_scrollbar_left)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_sort)(fl_Select_Browser select_browser);
  FL_EXPORT_C(void, Fl_Select_Browser_sort_with_flags)(fl_Select_Browser select_browser,int flags);
#ifdef __cplusplus
}
#endif
#endif /*#ifndef __FL_SELECT_BROWSER_C__*/
