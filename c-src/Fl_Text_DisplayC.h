#ifndef __FL_TEXT_DISPLAY_C__
#define __FL_TEXT_DISPLAY_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Text_Display.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedText_Display : public Fl_Text_Display {
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
    Fl_DerivedText_Display(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedText_Display(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedText_Display();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Text_Display_handle)(fl_Text_Display self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Text_Display_parent)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_parent)(fl_Text_Display text_display, fl_Text_Display grp);
  FL_EXPORT_C(uchar,        Fl_Text_Display_type)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_type)(fl_Text_Display text_display, uchar t);

  FL_EXPORT_C(int,          Fl_Text_Display_x)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_y)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_w)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_h)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_align)(fl_Text_Display text_display, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Text_Display_align)(fl_Text_Display text_display);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Text_Display_box)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_box)(fl_Text_Display text_display, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Display_color)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_color)(fl_Text_Display text_display, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Text_Display_set_color_with_bg_sel)(fl_Text_Display text_display,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Display_selection_color)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_selection_color)(fl_Text_Display text_display, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Text_Display_label)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_copy_label)(fl_Text_Display text_display, const char* new_label);
  FL_EXPORT_C(void,         Fl_Text_Display_set_label)(fl_Text_Display text_display, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Text_Display_labeltype)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_labeltype)(fl_Text_Display text_display, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Display_labelcolor)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_labelcolor)(fl_Text_Display text_display, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Text_Display_item_labelfont)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_item_labelfont)(fl_Text_Display text_display, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Text_Display_item_labelsize)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_item_labelsize)(fl_Text_Display text_display, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Text_Display_image)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_image)(fl_Text_Display text_display, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Text_Display_deimage)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_deimage)(fl_Text_Display text_display, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Text_Display_tooltip)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_copy_tooltip)(fl_Text_Display text_display, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Display_set_tooltip)(fl_Text_Display text_display, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Display_set_callback_with_user_data)(fl_Text_Display text_display, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Text_Display_set_callback)(fl_Text_Display text_display, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Text_Display_other_data)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_other_data)(fl_Text_Display text_display, void* v);
  FL_EXPORT_C(void*,        Fl_Text_Display_user_data)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_user_data)(fl_Text_Display text_display, void* v);
  FL_EXPORT_C(long,         Fl_Text_Display_argument)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_argument)(fl_Text_Display text_display, long v);
  FL_EXPORT_C(Fl_When,      Fl_Text_Display_when)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_when)(fl_Text_Display text_display, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_visible)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_visible_r)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_show_super)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_show)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_hide_super)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_hide)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_visible)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_visible)(fl_Text_Display text_display);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_active)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_active_r)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_activate)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_deactivate)(fl_Text_Display text_display);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_output)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_output)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_output)(fl_Text_Display text_display);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_takesevents)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_changed)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_changed)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_take_focus)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_visible_focus)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_visible_focus)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_modify_visible_focus)(fl_Text_Display text_display, int v);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_visible_focus)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_contains)(fl_Text_Display text_display, fl_Text_Display w);
  FL_EXPORT_C(int,          Fl_Text_Display_inside)(fl_Text_Display text_display, fl_Text_Display w);
  FL_EXPORT_C(void,         Fl_Text_Display_redraw)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_redraw_label)(fl_Text_Display text_display);
  FL_EXPORT_C(uchar,        Fl_Text_Display_damage)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_damage_with_bitmask)(fl_Text_Display text_display, uchar c);
  FL_EXPORT_C(void,         Fl_Text_Display_clear_damage)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_damage_with_text)(fl_Text_Display text_display, uchar c);
  FL_EXPORT_C(void,         Fl_Text_Display_damage_inside_text_display)(fl_Text_Display text_display, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Text_Display_draw_label_with_xywh_alignment)(fl_Text_Display text_display, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Text_Display_measure_label)(fl_Text_Display text_display, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_window)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_top_window)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Window ,   Fl_Text_Display_top_window_offset)(fl_Text_Display text_display, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Text_Display,     Fl_Text_Display_as_text_display_super)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Text_Display,     Fl_Text_Display_as_text_display)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Gl_Window, Fl_Text_Display_as_gl_window_super)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Gl_Window, Fl_Text_Display_as_gl_window)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_resize)(fl_Text_Display text_display,int X, int Y, int W, int H);

  /* Fl_Group specific */
  FL_EXPORT_C(void,         Fl_Text_Display_begin)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_end)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_find)(fl_Text_Display text_display, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Display_add)(fl_Text_Display text_display, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Display_insert)(fl_Text_Display text_display, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Display_remove_index)(fl_Text_Display text_display, int index);
  FL_EXPORT_C(void,         Fl_Text_Display_remove_widget)(fl_Text_Display text_display, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Display_clear)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_resizable_by_reference)(fl_Text_Display text_display,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Text_Display_set_resizable)(fl_Text_Display text_display,fl_Widget o);
  FL_EXPORT_C(fl_Widget,         Fl_Text_Display_resizable)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_add_resizable)(fl_Text_Display text_display,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Text_Display_init_sizes)(fl_Text_Display text_display);
  FL_EXPORT_C(int,          Fl_Text_Display_children)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_set_clip_children)(fl_Text_Display text_display,int c);
  FL_EXPORT_C(unsigned int, Fl_Text_Display_clip_children)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_focus)(fl_Text_Display text_display,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Text_Display__ddfdesign_kludge)(fl_Text_Display text_display);
  FL_EXPORT_C(void,         Fl_Text_Display_insert_with_before)(fl_Text_Display self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Text_Display_array)(fl_Text_Display self);
  FL_EXPORT_C(fl_Widget,    Fl_Text_Display_child)(fl_Text_Display self, int n);
  FL_EXPORT_C(fl_Group,     Fl_Text_Display_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Group,     Fl_Text_Display_New_WithLabel)(int x, int y, int w, int h, const char* t);

  /* Fl_Text_Display specific */
  FL_EXPORT_C(fl_Text_Display, Fl_Text_Display_New)(int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Text_Display, Fl_Text_Display_New_WithLabel)(int X, int Y, int W, int H, const char* l);
  FL_EXPORT_C(void, Fl_Text_Display_Destroy)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_handle)(fl_Text_Display text_display, int e);
  FL_EXPORT_C(void, Fl_Text_Display_set_buffer)(fl_Text_Display text_display, fl_Text_Buffer buf);
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Display_buffer)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_redisplay_range)(fl_Text_Display text_display, int start, int end);
  FL_EXPORT_C(void, Fl_Text_Display_scroll)(fl_Text_Display text_display, int topLineNum, int horizOffset);
  FL_EXPORT_C(void, Fl_Text_Display_overstrike)(fl_Text_Display text_display, const char* text);
  FL_EXPORT_C(void, Fl_Text_Display_set_insert_position)(fl_Text_Display text_display, int newPos);
  FL_EXPORT_C(int, Fl_Text_Display_insert_position)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_position_to_xy)(fl_Text_Display text_display, int pos, int* x, int* y);
  FL_EXPORT_C(int, Fl_Text_Display_in_selection)(fl_Text_Display text_display, int x, int y);
  FL_EXPORT_C(void, Fl_Text_Display_show_insert_position)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_move_right)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_move_left)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_move_up)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_move_down)(fl_Text_Display text_display);
  FL_EXPORT_C(int, Fl_Text_Display_count_lines)(fl_Text_Display text_display, int start, int end, int start_pos_is_line_start);
  FL_EXPORT_C(int, Fl_Text_Display_line_start)(fl_Text_Display text_display, int pos);
  FL_EXPORT_C(int, Fl_Text_Display_line_end)(fl_Text_Display text_display, int startPos, int startPosIsLineStart);
  FL_EXPORT_C(int, Fl_Text_Display_skip_lines)(fl_Text_Display text_display, int startPos, int nLines, int startPosIsLineStart);
  FL_EXPORT_C(int, Fl_Text_Display_rewind_lines)(fl_Text_Display text_display, int startPos, int nLines);
  FL_EXPORT_C(void, Fl_Text_Display_next_word)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_previous_word)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_show_cursor)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_show_cursor_with_b)(fl_Text_Display text_display, int b);
  FL_EXPORT_C(void, Fl_Text_Display_hide_cursor)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_cursor_style)(fl_Text_Display text_display, int style);
  // FL_EXPORT_C(int, Fl_Text_Display_cursor_style)(fl_Text_Display text_display);
  FL_EXPORT_C(Fl_Color, Fl_Text_Display_cursor_color)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_cursor_color)(fl_Text_Display text_display, Fl_Color n);
  FL_EXPORT_C(int, Fl_Text_Display_scrollbar_width)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_scrollbar_width)(fl_Text_Display text_display, int W);
  FL_EXPORT_C(Fl_Align, Fl_Text_Display_scrollbar_align)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_scrollbar_align)(fl_Text_Display text_display, Fl_Align a);
  FL_EXPORT_C(int, Fl_Text_Display_word_start)(fl_Text_Display text_display, int pos);
  FL_EXPORT_C(int, Fl_Text_Display_word_end)(fl_Text_Display text_display, int pos);
  FL_EXPORT_C(void, Fl_Text_Display_highlight_data)(fl_Text_Display text_display, fl_Text_Buffer styleBuffer, Style_Table_Entry *styleTable, int nStyles, char unfinishedStyle, Unfinished_Style_Cb unfinishedHighlightCB, void *cbArg);
  FL_EXPORT_C(int, Fl_Text_Display_position_style)(fl_Text_Display text_display, int lineStartPos, int lineLen, int lineIndex);
  FL_EXPORT_C(int, Fl_Text_Display_shortcut)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_shortcut)(fl_Text_Display text_display, int s);
  FL_EXPORT_C(Fl_Font, Fl_Text_Display_textfont)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_textfont)(fl_Text_Display text_display, Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize, Fl_Text_Display_textsize)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_textsize)(fl_Text_Display text_display, Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color, Fl_Text_Display_textcolor)(fl_Text_Display text_display);
  FL_EXPORT_C(void, Fl_Text_Display_set_textcolor)(fl_Text_Display text_display, Fl_Color n);
  FL_EXPORT_C(int, Fl_Text_Display_wrapped_column)(fl_Text_Display text_display, int row, int column);
  FL_EXPORT_C(int, Fl_Text_Display_wrapped_row)(fl_Text_Display text_display, int row);
  FL_EXPORT_C(void, Fl_Text_Display_wrap_mode)(fl_Text_Display text_display, int wrap, int wrap_margin);
  FL_EXPORT_C(double, Fl_Text_Display_x_to_col)(fl_Text_Display text_display, double x);
  FL_EXPORT_C(double, Fl_Text_Display_col_to_x)(fl_Text_Display text_display,double col);
  FL_EXPORT_C(void        ,set_linenumber_width)(fl_Text_Display text_display,int width);
  FL_EXPORT_C(int         ,linenumber_width)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_font)(fl_Text_Display text_display,Fl_Font val);
  FL_EXPORT_C(Fl_Font     ,linenumber_font)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_size)(fl_Text_Display text_display,Fl_Fontsize val);
  FL_EXPORT_C(Fl_Fontsize ,linenumber_size)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_fgcolor)(fl_Text_Display text_display,Fl_Color val);
  FL_EXPORT_C(Fl_Color    ,linenumber_fgcolor)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_bgcolor)(fl_Text_Display text_display,Fl_Color val);
  FL_EXPORT_C(Fl_Color    ,linenumber_bgcolor)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_align)(fl_Text_Display text_display,Fl_Align val);
  FL_EXPORT_C(Fl_Align    ,linenumber_align)(fl_Text_Display text_display);
  FL_EXPORT_C(void        ,set_linenumber_format)(fl_Text_Display text_display,const char* val);
  FL_EXPORT_C(const char* ,linenumber_format)(fl_Text_Display text_display);
  FL_EXPORT_C(fl_Text_Display,    Fl_OverriddenText_Display_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Text_Display,    Fl_OverriddenText_Display_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Text_Display_draw)(fl_Text_Display o);
  FL_EXPORT_C(void, Fl_Text_Display_draw_super)(fl_Text_Display o);
  FL_EXPORT_C(int, Fl_Text_Display_handle)(fl_Text_Display o, int event);
  FL_EXPORT_C(int, Fl_Text_Display_handle_super)(fl_Text_Display o, int event);
  FL_EXPORT_C(void, Fl_Text_Display_resize)(fl_Text_Display o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Text_Display_resize_super)(fl_Text_Display o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Text_Display_show)(fl_Text_Display o);
  FL_EXPORT_C(void, Fl_Text_Display_show_super)(fl_Text_Display o);
  FL_EXPORT_C(void, Fl_Text_Display_hide)(fl_Text_Display o);
  FL_EXPORT_C(void, Fl_Text_Display_hide_super)(fl_Text_Display o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TEXT_DISPLAY_C__ */
