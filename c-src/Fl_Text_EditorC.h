#ifndef __FL_TEXT_EDITOR_C__
#define __FL_TEXT_EDITOR_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Text_Editor.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Text_Editor_handle)(fl_Text_Editor self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Text_Editor_parent)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_parent)(fl_Text_Editor text_editor, fl_Text_Editor grp);
  FL_EXPORT_C(uchar,        Fl_Text_Editor_type)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_type)(fl_Text_Editor text_editor, uchar t);

  FL_EXPORT_C(int,          Fl_Text_Editor_x)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_y)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_w)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_h)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_align)(fl_Text_Editor text_editor, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Text_Editor_align)(fl_Text_Editor text_editor);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Text_Editor_box)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_box)(fl_Text_Editor text_editor, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Editor_color)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_color)(fl_Text_Editor text_editor, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_color_with_bg_sel)(fl_Text_Editor text_editor,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Editor_selection_color)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_selection_color)(fl_Text_Editor text_editor, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Text_Editor_label)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_copy_label)(fl_Text_Editor text_editor, const char* new_label);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_label)(fl_Text_Editor text_editor, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Text_Editor_labeltype)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_labeltype)(fl_Text_Editor text_editor, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Text_Editor_labelcolor)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_labelcolor)(fl_Text_Editor text_editor, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Text_Editor_item_labelfont)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_item_labelfont)(fl_Text_Editor text_editor, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Text_Editor_item_labelsize)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_item_labelsize)(fl_Text_Editor text_editor, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Text_Editor_image)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_image)(fl_Text_Editor text_editor, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Text_Editor_deimage)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_deimage)(fl_Text_Editor text_editor, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Text_Editor_tooltip)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_copy_tooltip)(fl_Text_Editor text_editor, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_tooltip)(fl_Text_Editor text_editor, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_callback_with_user_data)(fl_Text_Editor text_editor, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_callback)(fl_Text_Editor text_editor, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Text_Editor_other_data)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_other_data)(fl_Text_Editor text_editor, void* v);
  FL_EXPORT_C(void*,        Fl_Text_Editor_user_data)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_user_data)(fl_Text_Editor text_editor, void* v);
  FL_EXPORT_C(long,         Fl_Text_Editor_argument)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_argument)(fl_Text_Editor text_editor, long v);
  FL_EXPORT_C(Fl_When,      Fl_Text_Editor_when)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_when)(fl_Text_Editor text_editor, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_visible)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_visible_r)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_show_super)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_show)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_hide_super)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_hide)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_visible)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_visible)(fl_Text_Editor text_editor);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_active)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_active_r)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_activate)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_deactivate)(fl_Text_Editor text_editor);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_output)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_output)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_output)(fl_Text_Editor text_editor);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_takesevents)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_changed)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_changed)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_take_focus)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_visible_focus)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_visible_focus)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_modify_visible_focus)(fl_Text_Editor text_editor, int v);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_visible_focus)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_contains)(fl_Text_Editor text_editor, fl_Text_Editor w);
  FL_EXPORT_C(int,          Fl_Text_Editor_inside)(fl_Text_Editor text_editor, fl_Text_Editor w);
  FL_EXPORT_C(void,         Fl_Text_Editor_redraw)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_redraw_label)(fl_Text_Editor text_editor);
  FL_EXPORT_C(uchar,        Fl_Text_Editor_damage)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_damage_with_bitmask)(fl_Text_Editor text_editor, uchar c);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear_damage)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_damage_with_text)(fl_Text_Editor text_editor, uchar c);
  FL_EXPORT_C(void,         Fl_Text_Editor_damage_inside_text_editor)(fl_Text_Editor text_editor, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Text_Editor_draw_label_with_xywh_alignment)(fl_Text_Editor text_editor, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Text_Editor_measure_label)(fl_Text_Editor text_editor, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Text_Editor_window)(fl_Text_Editor text_editor);
  FL_EXPORT_C(fl_Window,    Fl_Text_Editor_top_window)(fl_Text_Editor text_editor);
  FL_EXPORT_C(fl_Window ,   Fl_Text_Editor_top_window_offset)(fl_Text_Editor text_editor, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Text_Editor,     Fl_Text_Editor_as_text_editor_super)(fl_Text_Editor text_editor);
  FL_EXPORT_C(fl_Text_Editor,     Fl_Text_Editor_as_text_editor)(fl_Text_Editor text_editor);
  FL_EXPORT_C(fl_Gl_Window, Fl_Text_Editor_as_gl_window_super)(fl_Text_Editor text_editor);
  FL_EXPORT_C(fl_Gl_Window, Fl_Text_Editor_as_gl_window)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_resize_super)(fl_Text_Editor text_editor,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Text_Editor_resize)(fl_Text_Editor text_editor,int X, int Y, int W, int H);

  /* Fl_Group specific */
  FL_EXPORT_C(void,         Fl_Text_Editor_begin)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_end)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_find)(fl_Text_Editor text_editor, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Editor_add)(fl_Text_Editor text_editor, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Editor_insert)(fl_Text_Editor text_editor, const char* text);
  FL_EXPORT_C(void,         Fl_Text_Editor_remove_index)(fl_Text_Editor text_editor, int index);
  FL_EXPORT_C(void,         Fl_Text_Editor_remove_widget)(fl_Text_Editor text_editor, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Text_Editor_clear)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_resizable_by_reference)(fl_Text_Editor text_editor,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_resizable)(fl_Text_Editor text_editor,fl_Widget o);
  FL_EXPORT_C(fl_Widget,         Fl_Text_Editor_resizable)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_add_resizable)(fl_Text_Editor text_editor,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Text_Editor_init_sizes)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int,          Fl_Text_Editor_children)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_set_clip_children)(fl_Text_Editor text_editor,int c);
  FL_EXPORT_C(unsigned int, Fl_Text_Editor_clip_children)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_focus)(fl_Text_Editor text_editor,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Text_Editor__ddfdesign_kludge)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void,         Fl_Text_Editor_insert_with_before)(fl_Text_Editor self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Text_Editor_array)(fl_Text_Editor self);
  FL_EXPORT_C(fl_Widget,    Fl_Text_Editor_child)(fl_Text_Editor self, int n);

  /* Inherited from Fl_Text_Display */
  FL_EXPORT_C(fl_Text_Editor, Fl_Text_Editor_New)(int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Text_Editor, Fl_Text_Editor_New_WithLabel)(int X, int Y, int W, int H, const char* l);
  FL_EXPORT_C(void,     Fl_Text_Editor_Destroy)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_handle)(fl_Text_Editor text_editor, int e);
  FL_EXPORT_C(void, Fl_Text_Editor_set_buffer)(fl_Text_Editor text_editor, fl_Text_Buffer buf);
  FL_EXPORT_C(fl_Text_Buffer, Fl_Text_Editor_buffer)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_redisplay_range)(fl_Text_Editor text_editor, int start, int end);
  FL_EXPORT_C(void, Fl_Text_Editor_scroll)(fl_Text_Editor text_editor, int topLineNum, int horizOffset);
  FL_EXPORT_C(void, Fl_Text_Editor_overstrike)(fl_Text_Editor text_editor, const char* text);
  FL_EXPORT_C(void, Fl_Text_Editor_set_insert_position)(fl_Text_Editor text_editor, int newPos);
  FL_EXPORT_C(int, Fl_Text_Editor_insert_position)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_position_to_xy)(fl_Text_Editor text_editor, int pos, int* x, int* y);
  FL_EXPORT_C(int, Fl_Text_Editor_in_selection)(fl_Text_Editor text_editor, int x, int y);
  FL_EXPORT_C(void, Fl_Text_Editor_show_insert_position)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_move_right)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_move_left)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_move_up)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_move_down)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_count_lines)(fl_Text_Editor text_editor, int start, int end, int start_pos_is_line_start);
  FL_EXPORT_C(int, Fl_Text_Editor_line_start)(fl_Text_Editor text_editor, int pos);
  FL_EXPORT_C(int, Fl_Text_Editor_line_end)(fl_Text_Editor text_editor, int startPos, int startPosIsLineStart);
  FL_EXPORT_C(int, Fl_Text_Editor_skip_lines)(fl_Text_Editor text_editor, int startPos, int nLines, int startPosIsLineStart);
  FL_EXPORT_C(int, Fl_Text_Editor_rewind_lines)(fl_Text_Editor text_editor, int startPos, int nLines);
  FL_EXPORT_C(void, Fl_Text_Editor_next_word)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_previous_word)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_show_cursor)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_show_cursor_with_b)(fl_Text_Editor text_editor, int b);
  FL_EXPORT_C(void, Fl_Text_Editor_hide_cursor)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_cursor_style)(fl_Text_Editor text_editor, int style);
  FL_EXPORT_C(Fl_Color, Fl_Text_Editor_cursor_color)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_cursor_color)(fl_Text_Editor text_editor, Fl_Color n);
  FL_EXPORT_C(int, Fl_Text_Editor_scrollbar_width)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_scrollbar_width)(fl_Text_Editor text_editor, int W);
  FL_EXPORT_C(Fl_Align, Fl_Text_Editor_scrollbar_align)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_scrollbar_align)(fl_Text_Editor text_editor, Fl_Align a);
  FL_EXPORT_C(int, Fl_Text_Editor_word_start)(fl_Text_Editor text_editor, int pos);
  FL_EXPORT_C(int, Fl_Text_Editor_word_end)(fl_Text_Editor text_editor, int pos);
  FL_EXPORT_C(void, Fl_Text_Editor_highlight_data)(fl_Text_Editor text_editor, fl_Text_Buffer styleBuffer, Style_Table_Entry *styleTable, int nStyles, char unfinishedStyle, Unfinished_Style_Cb unfinishedHighlightCB, void *cbArg);
  FL_EXPORT_C(int, Fl_Text_Editor_position_style)(fl_Text_Editor text_editor, int lineStartPos, int lineLen, int lineIndex);
  FL_EXPORT_C(int, Fl_Text_Editor_shortcut)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_shortcut)(fl_Text_Editor text_editor, int s);
  FL_EXPORT_C(Fl_Font, Fl_Text_Editor_textfont)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_textfont)(fl_Text_Editor text_editor, Fl_Font s);
  FL_EXPORT_C(Fl_Fontsize, Fl_Text_Editor_textsize)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_textsize)(fl_Text_Editor text_editor, Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color, Fl_Text_Editor_textcolor)(fl_Text_Editor text_editor);
  FL_EXPORT_C(void, Fl_Text_Editor_set_textcolor)(fl_Text_Editor text_editor, Fl_Color n);
  FL_EXPORT_C(int, Fl_Text_Editor_wrapped_column)(fl_Text_Editor text_editor, int row, int column);
  FL_EXPORT_C(int, Fl_Text_Editor_wrapped_row)(fl_Text_Editor text_editor, int row);
  FL_EXPORT_C(void, Fl_Text_Editor_wrap_mode)(fl_Text_Editor text_editor, int wrap, int wrap_margin);
  FL_EXPORT_C(double, Fl_Text_Editor_x_to_col)(fl_Text_Editor text_editor, double x);
  FL_EXPORT_C(double, Fl_Text_Editor_col_to_x)(fl_Text_Editor text_editor,double col);

  /* Fl_Text_Editor specific */
  FL_EXPORT_C(void, Fl_Text_Editor_set_insert_mode)(fl_Text_Editor text_editor, int b);
  FL_EXPORT_C(int, Fl_Text_Editor_insert_mode)(fl_Text_Editor text_editor);
  FL_EXPORT_C(int, Fl_Text_Editor_num_key_bindings)(Key_BindingC* list);
  FL_EXPORT_C(void, Fl_Text_Editor_add_key_binding_with_list)(fl_Text_Editor text_editor,int key, int state, fl_Key_Func f, Key_BindingC* list);
  FL_EXPORT_C(void, Fl_Text_Editor_add_key_binding)(fl_Text_Editor text_editor, int key, int state, fl_Key_Func f);
  FL_EXPORT_C(void, Fl_Text_Editor_remove_key_binding_with_list)(fl_Text_Editor text_editor, int key, int state, Key_BindingC* list);
  FL_EXPORT_C(void, Fl_Text_Editor_remove_key_binding)(fl_Text_Editor text_editor, int key, int state);
  FL_EXPORT_C(void, Fl_Text_Editor_remove_all_key_bindings_with_list)(fl_Text_Editor text_editor, Key_BindingC* list);
  FL_EXPORT_C(void, Fl_Text_Editor_remove_all_key_bindings)(fl_Text_Editor text_editor);
  FL_EXPORT_C(Key_BindingC*, Fl_Text_Editor_add_default_key_bindings)(fl_Text_Editor text_editor, Key_BindingC* list);

  // functions for the built in default bindings
  FL_EXPORT_C(int, Fl_Text_Editor_kf_default)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_ignore)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_backspace)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_enter)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_shift_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_ctrl_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_c_s_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_meta_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_m_s_move)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_home)(int, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_end)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_left)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_up)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_right)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_down)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_page_up)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_page_down)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_insert)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_delete)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_copy)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_cut)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_paste)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_select_all)(int c, fl_Text_Editor e);
  FL_EXPORT_C(int, Fl_Text_Editor_kf_undo)(int c, fl_Text_Editor e);
  FL_EXPORT_C(void,Fl_Text_Editor_replace_key_bindings)(fl_Text_Editor text_editor, Key_BindingC* list);
  FL_EXPORT_C(void,Fl_Text_Editor_replace_key_bindings_with_list)(fl_Text_Editor text_editor, Key_BindingC* list1, Key_BindingC* list2);
  FL_EXPORT_C(fl_Text_Editor,    Fl_OverriddenText_Editor_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Text_Editor,    Fl_OverriddenText_Editor_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Text_Editor_draw)(fl_Text_Editor o);
  FL_EXPORT_C(void, Fl_Text_Editor_draw_super)(fl_Text_Editor o);
  FL_EXPORT_C(int, Fl_Text_Editor_handle)(fl_Text_Editor o, int event);
  FL_EXPORT_C(int, Fl_Text_Editor_handle_super)(fl_Text_Editor o, int event);
  FL_EXPORT_C(void, Fl_Text_Editor_resize)(fl_Text_Editor o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Text_Editor_resize_super)(fl_Text_Editor o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Text_Editor_show)(fl_Text_Editor o);
  FL_EXPORT_C(void, Fl_Text_Editor_show_super)(fl_Text_Editor o);
  FL_EXPORT_C(void, Fl_Text_Editor_hide)(fl_Text_Editor o);
  FL_EXPORT_C(void, Fl_Text_Editor_hide_super)(fl_Text_Editor o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TEXT_EDITOR_C__ */
