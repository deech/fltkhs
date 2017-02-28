#ifndef __FL_TABLE_ROW_C__
#define __FL_TABLE_ROW_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Table_Row.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Table_Row_handle_super)(fl_Table_Row self, int event);
  FL_EXPORT_C(int,Fl_Table_Row_handle)(fl_Table_Row self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Table_Row_parent)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_parent)(fl_Table_Row table, fl_Group grp);
  FL_EXPORT_C(void, Fl_Table_Row_draw_box)(fl_Table_Row Table_Row);
  FL_EXPORT_C(void, Fl_Table_Row_draw_box_with_tc)(fl_Table_Row Table_Row,Fl_Boxtype t, Fl_Color c);
  FL_EXPORT_C(void, Fl_Table_Row_draw_box_with_txywhc)(fl_Table_Row Table_Row,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
  FL_EXPORT_C(void, Fl_Table_Row_draw_backdrop)(fl_Table_Row Table_Row);
  FL_EXPORT_C(void, Fl_Table_Row_draw_focus)(fl_Table_Row Table_Row);
  FL_EXPORT_C(void, Fl_Table_Row_draw_focus_with_txywh)(fl_Table_Row Table_Row,Fl_Boxtype t, int x,int y,int w,int h);
  FL_EXPORT_C(void, Fl_Table_Row_draw_label)(fl_Table_Row Table_Row);

  FL_EXPORT_C(int,          Fl_Table_Row_x)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_y)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_w)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_h)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_align)(fl_Table_Row table_row, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Table_Row_align)(fl_Table_Row table);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Table_Row_box)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_box)(fl_Table_Row table, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Table_Row_color)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_color)(fl_Table_Row table, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Table_Row_set_color_with_bg_sel)(fl_Table_Row table,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Table_Row_selection_color)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_selection_color)(fl_Table_Row table, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Table_Row_label)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_copy_label)(fl_Table_Row table, const char* new_label);
  FL_EXPORT_C(void,         Fl_Table_Row_set_label)(fl_Table_Row table, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Table_Row_labeltype)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_labeltype)(fl_Table_Row table, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Table_Row_labelcolor)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_labelcolor)(fl_Table_Row table, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Table_Row_item_labelfont)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_item_labelfont)(fl_Table_Row table, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Table_Row_item_labelsize)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_item_labelsize)(fl_Table_Row table, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Table_Row_image)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_image)(fl_Table_Row table, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Table_Row_deimage)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_deimage)(fl_Table_Row table, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Table_Row_tooltip)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_copy_tooltip)(fl_Table_Row table, const char* text);
  FL_EXPORT_C(void,         Fl_Table_Row_set_tooltip)(fl_Table_Row table, const char* text);
  FL_EXPORT_C(void,         Fl_Table_Row_set_callback_with_user_data)(fl_Table_Row table, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Table_Row_set_callback)(fl_Table_Row table, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Table_Row_other_data)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_other_data)(fl_Table_Row table, void* v);
  FL_EXPORT_C(void*,        Fl_Table_Row_user_data)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_user_data)(fl_Table_Row table, void* v);
  FL_EXPORT_C(long,         Fl_Table_Row_argument)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_argument)(fl_Table_Row table, long v);
  FL_EXPORT_C(Fl_When,      Fl_Table_Row_when)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_when)(fl_Table_Row table, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_visible)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_visible_r)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_show_super)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_show)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_hide_super)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_hide)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_visible)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_visible)(fl_Table_Row table);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_active)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_active_r)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_activate)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_deactivate)(fl_Table_Row table);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_output)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_output)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_output)(fl_Table_Row table);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_takesevents)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_changed)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_changed)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_take_focus)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_visible_focus)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_visible_focus)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_modify_visible_focus)(fl_Table_Row table, int v);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_visible_focus)(fl_Table_Row table);
  FL_EXPORT_C(int,          Fl_Table_Row_contains)(fl_Table_Row table, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Table_Row_inside)(fl_Table_Row table, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Table_Row_redraw)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_redraw_label)(fl_Table_Row table);
  FL_EXPORT_C(uchar,        Fl_Table_Row_damage)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_damage_with_bitmask)(fl_Table_Row table, uchar c);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_damage)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_damage_with_text)(fl_Table_Row table, uchar c);
  FL_EXPORT_C(void,         Fl_Table_Row_damage_inside_widget)(fl_Table_Row table, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Table_Row_draw_label_with_xywh_alignment)(fl_Table_Row table, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Table_Row_measure_label)(fl_Table_Row table, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Table_Row_window)(fl_Table_Row table);
  FL_EXPORT_C(fl_Window,    Fl_Table_Row_top_window)(fl_Table_Row table);
  FL_EXPORT_C(fl_Window ,   Fl_Table_Row_top_window_offset)(fl_Table_Row table, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Table_Row_as_group_super)(fl_Table_Row table);
  FL_EXPORT_C(fl_Group,     Fl_Table_Row_as_group)(fl_Table_Row table);
  FL_EXPORT_C(fl_Gl_Window, Fl_Table_Row_as_gl_window_super)(fl_Table_Row table);
  FL_EXPORT_C(fl_Gl_Window, Fl_Table_Row_as_gl_window)(fl_Table_Row table);

  /* Fl_Group specific */
  FL_EXPORT_C(void,         Fl_Table_Row_remove_widget)(fl_Table_Row table, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Table_Row_clear_super)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_clear)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_resizable_by_reference)(fl_Table_Row table,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Table_Row_set_resizable)(fl_Table_Row table,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Table_Row_resizable)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_add_resizable)(fl_Table_Row table,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Table_Row_init_sizes)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_set_clip_children)(fl_Table_Row table,int c);
  FL_EXPORT_C(unsigned int, Fl_Table_Row_clip_children)(fl_Table_Row table);
  FL_EXPORT_C(void,         Fl_Table_Row_focus)(fl_Table_Row table,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Table_Row__ddfdesign_kludge)(fl_Table_Row table);
  FL_EXPORT_C(void,Fl_Table_Row_draw_super)(fl_Table_Row table_row);

  FL_EXPORT_C(void,         Fl_Table_Row_insert_with_before)(fl_Table_Row self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*, Fl_Table_Row_array)(fl_Table_Row self);
  FL_EXPORT_C(fl_Widget, Fl_Table_Row_child)(fl_Table_Row self, int n);
  /* FL_EXPORT_C(void     , Fl_Table_Row_forms_end)(fl_Table_Row self); */

  /* Inherited from Fl_Table_Row */
#ifdef __cplusplus
  class Fl_DerivedTable_Row : public Fl_Table_Row {
    fl_Table_Row_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    using Fl_Table_Row::rows;
    using Fl_Table_Row::cols;
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    int find_cell(TableContext context, int R, int C, int &X, int &Y, int &W, int &H);
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
    int handle_super(int event);
    void resize_super(int x, int y, int w, int h);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Group* as_group();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    virtual void draw_cell(TableContext tableContext, int R, int C, int X, int Y, int W, int H);
    virtual void clear();
    virtual void rows(int val);
    virtual void cols(int val);
    Fl_DerivedTable_Row(int X, int Y, int W, int H, const char *l, fl_Table_Row_Virtual_Funcs* funcs);
    Fl_DerivedTable_Row(int X, int Y, int W, int H, fl_Table_Row_Virtual_Funcs* funcs);
    ~Fl_DerivedTable_Row();
  };
#endif
  FL_EXPORT_C(fl_Table_Row_Virtual_Funcs*, Fl_Table_Row_default_virtual_funcs)();
  FL_EXPORT_C(void, Fl_Table_Row_set_table_box)(fl_Table_Row table,Fl_Boxtype val);
  FL_EXPORT_C(Fl_Boxtype, Fl_Table_Row_table_box)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_rows_super)(fl_Table_Row table,int val);
  FL_EXPORT_C(void, Fl_Table_Row_set_rows)(fl_Table_Row table,int val);
  FL_EXPORT_C(int, Fl_Table_Row_rows)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_cols_super)(fl_Table_Row table, int val);
  FL_EXPORT_C(void, Fl_Table_Row_set_cols)(fl_Table_Row table, int val);
  FL_EXPORT_C(int, Fl_Table_Row_cols)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_visible_cells)(fl_Table_Row table,int* r1, int* r2, int* c1, int* c2);
  FL_EXPORT_C(int, Fl_Table_Row_is_interactive_resize)(fl_Table_Row table);
  FL_EXPORT_C(int, Fl_Table_Row_row_resize)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_resize)(fl_Table_Row table,int flag);
  FL_EXPORT_C(int, Fl_Table_Row_col_resize)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_resize)(fl_Table_Row table,int flag);
  FL_EXPORT_C(int, Fl_Table_Row_col_resize_min)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_resize_min)(fl_Table_Row table,int val);
  FL_EXPORT_C(int, Fl_Table_Row_row_resize_min)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_resize_min)(fl_Table_Row table,int val);
  FL_EXPORT_C(int, Fl_Table_Row_row_header)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_header)(fl_Table_Row table,int flag);
  FL_EXPORT_C(int, Fl_Table_Row_col_header)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_header)(fl_Table_Row table,int flag);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_header_height)(fl_Table_Row table,int height);
  FL_EXPORT_C(int, Fl_Table_Row_col_header_height)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_header_width)(fl_Table_Row table,int width);
  FL_EXPORT_C(int, Fl_Table_Row_row_header_width)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_header_color)(fl_Table_Row table,Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Table_Row_row_header_color)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_header_color)(fl_Table_Row table,Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Table_Row_col_header_color)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_height)(fl_Table_Row table,int row, int height);
  FL_EXPORT_C(int, Fl_Table_Row_row_height)(fl_Table_Row table,int row);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_width)(fl_Table_Row table,int col, int width);
  FL_EXPORT_C(int, Fl_Table_Row_col_width)(fl_Table_Row table,int col);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_height_all)(fl_Table_Row table,int height);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_width_all)(fl_Table_Row table,int width);
  FL_EXPORT_C(void, Fl_Table_Row_set_row_position)(fl_Table_Row table,int row);
  FL_EXPORT_C(void, Fl_Table_Row_set_col_position)(fl_Table_Row table,int col);
  FL_EXPORT_C(int, Fl_Table_Row_row_position)(fl_Table_Row table);
  FL_EXPORT_C(int, Fl_Table_Row_col_position)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_set_top_row)(fl_Table_Row table,int row);
  FL_EXPORT_C(int, Fl_Table_Row_top_row)(fl_Table_Row table);
  FL_EXPORT_C(int, Fl_Table_Row_is_selected)(fl_Table_Row table,int r, int c);
  FL_EXPORT_C(void, Fl_Table_Row_get_selection)(fl_Table_Row table,int *row_top, int *col_left, int *row_bot, int *col_right);
  FL_EXPORT_C(void, Fl_Table_Row_set_selection)(fl_Table_Row table,int row_top, int col_left, int row_bot, int col_right);
  FL_EXPORT_C(int, Fl_Table_Row_move_cursor)(fl_Table_Row table,int R, int C);
  FL_EXPORT_C(void, Fl_Table_Row_resize_super)(fl_Table_Row table,int X, int Y, int W, int H);
  FL_EXPORT_C(void, Fl_Table_Row_resize)(fl_Table_Row table,int X, int Y, int W, int H);
  FL_EXPORT_C(void, Fl_Table_Row_draw)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_init_sizes)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_add)(fl_Table_Row table,fl_Widget wgt);
  FL_EXPORT_C(void, Fl_Table_Row_add)(fl_Table_Row table,fl_Widget wgt);
  FL_EXPORT_C(void, Fl_Table_Row_insert)(fl_Table_Row table,fl_Widget wgt, int n);
  FL_EXPORT_C(void, Fl_Table_Row_insert_with_widget)(fl_Table_Row table,fl_Widget wgt, fl_Widget w2);
  FL_EXPORT_C(void, Fl_Table_Row_begin)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_end)(fl_Table_Row table);
  FL_EXPORT_C(fl_Widget*, Fl_Table_Row_array)(fl_Table_Row table);
  FL_EXPORT_C(fl_Widget, Fl_Table_Row_child)(fl_Table_Row table,int n);
  FL_EXPORT_C(int, Fl_Table_Row_children)(fl_Table_Row table);
  FL_EXPORT_C(int, Fl_Table_Row_find)(fl_Table_Row table,fl_Widget wgt);
  FL_EXPORT_C(int, Fl_Table_Row_callback_row)(fl_Table_Row table);
  FL_EXPORT_C(int, Fl_Table_Row_callback_col)(fl_Table_Row table);
  FL_EXPORT_C(TableContextC, Fl_Table_Row_callback_context)(fl_Table_Row table);
  FL_EXPORT_C(void, Fl_Table_Row_do_callback)(fl_Table_Row table, TableContextC tableContext, int row, int col);
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(void, Fl_Table_Row_set_tab_cell_nav)(fl_Table_Row table, int val);
  FL_EXPORT_C(int,  Fl_Table_Row_tab_cell_nav)(fl_Table_Row table);
#endif
  FL_EXPORT_C(int,  Fl_Table_Row_find_cell)(fl_Table_Row table, TableContextC context, int R, int C, int *X, int *Y, int *W, int *H);

  /* Fl_Table_Row specific */
  FL_EXPORT_C(fl_Table_Row, Fl_Table_Row_New_WithLabel)(int X, int Y, int W, int H, const char *l);
  FL_EXPORT_C(fl_Table_Row, Fl_Table_Row_New)(int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Table_Row, Fl_OverriddenTable_Row_New_WithLabel)(int X, int Y, int W, int H, const char *l, fl_Table_Row_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Table_Row, Fl_OverriddenTable_Row_New)(int X, int Y, int W, int H, fl_Table_Row_Virtual_Funcs* funcs);
  FL_EXPORT_C(void, Fl_Table_Row_Destroy)(fl_Table_Row table);
  FL_EXPORT_C(TableRowSelectModeC,Fl_Table_Row_type)(fl_Table_Row table);
  FL_EXPORT_C(void,Fl_Table_Row_set_type)(fl_Table_Row table, TableRowSelectModeC t);
  FL_EXPORT_C(int, Fl_Table_Row_row_selected)(fl_Table_Row row, int rowIndex);
  FL_EXPORT_C(int, Fl_Table_Row_select_row)(fl_Table_Row row, int rowIndex);
  FL_EXPORT_C(int, Fl_Table_Row_select_row_with_flag)(fl_Table_Row row, int rowIndex, int flag); // flag = 1
  FL_EXPORT_C(void, Fl_Table_Row_select_all_rows)(fl_Table_Row row);
  FL_EXPORT_C(void, Fl_Table_Row_select_all_rows_with_flag)(fl_Table_Row row, int flag); // flag = 1
  FL_EXPORT_C(void, Fl_Table_Row_clear)(fl_Table_Row row);
#ifdef __cplusplus
}
#endif
#endif
