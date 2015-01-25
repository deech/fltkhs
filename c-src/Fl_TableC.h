#ifndef __FL_TABLE_C__
#define __FL_TABLE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Table.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Table_handle)(fl_Table self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Table_parent)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_parent)(fl_Table table, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Table_type)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_type)(fl_Table table, uchar t);

FL_EXPORT_C(void, Fl_Table_draw_box)(fl_Table Table);
FL_EXPORT_C(void, Fl_Table_draw_box_with_tc)(fl_Table Table,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Table_draw_box_with_txywhc)(fl_Table Table,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Table_draw_backdrop)(fl_Table Table);
FL_EXPORT_C(void, Fl_Table_draw_focus)(fl_Table Table);
FL_EXPORT_C(void, Fl_Table_draw_focus_with_txywh)(fl_Table Table,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Table_draw_label)(fl_Table Table);
  FL_EXPORT_C(int,          Fl_Table_x)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_y)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_w)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_h)(fl_Table table);
  FL_EXPORT_C(void,     Fl_Table_set_align)(fl_Table table, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Table_align)(fl_Table table);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Table_box)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_box)(fl_Table table, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Table_color)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_color)(fl_Table table, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Table_set_color_with_bg_sel)(fl_Table table,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Table_selection_color)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_selection_color)(fl_Table table, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Table_label)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_copy_label)(fl_Table table, const char* new_label);
  FL_EXPORT_C(void,         Fl_Table_set_label)(fl_Table table, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Table_labeltype)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_labeltype)(fl_Table table, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Table_labelcolor)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_labelcolor)(fl_Table table, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Table_item_labelfont)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_item_labelfont)(fl_Table table, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Table_item_labelsize)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_item_labelsize)(fl_Table table, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Table_image)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_image)(fl_Table table, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Table_deimage)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_deimage)(fl_Table table, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Table_tooltip)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_copy_tooltip)(fl_Table table, const char* text);
  FL_EXPORT_C(void,         Fl_Table_set_tooltip)(fl_Table table, const char* text);
  FL_EXPORT_C(void,         Fl_Table_set_callback_with_user_data)(fl_Table table, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Table_set_callback)(fl_Table table, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Table_other_data)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_other_data)(fl_Table table, void* v);
  FL_EXPORT_C(void*,        Fl_Table_user_data)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_user_data)(fl_Table table, void* v);
  FL_EXPORT_C(long,         Fl_Table_argument)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_argument)(fl_Table table, long v);
  FL_EXPORT_C(Fl_When,      Fl_Table_when)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_when)(fl_Table table, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Table_visible)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_visible_r)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_show_super)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_show)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_hide_super)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_hide)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_visible)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear_visible)(fl_Table table);
  FL_EXPORT_C(unsigned int, Fl_Table_active)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_active_r)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_activate)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_deactivate)(fl_Table table);
  FL_EXPORT_C(unsigned int, Fl_Table_output)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_output)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear_output)(fl_Table table);
  FL_EXPORT_C(unsigned int, Fl_Table_takesevents)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_changed)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear_changed)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_take_focus)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_visible_focus)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear_visible_focus)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_modify_visible_focus)(fl_Table table, int v);
  FL_EXPORT_C(unsigned int, Fl_Table_visible_focus)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_contains)(fl_Table table, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Table_inside)(fl_Table table, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Table_redraw)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_redraw_label)(fl_Table table);
  FL_EXPORT_C(uchar,        Fl_Table_damage)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear_damage_with_bitmask)(fl_Table table, uchar c);
  FL_EXPORT_C(void,         Fl_Table_clear_damage)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_damage_with_text)(fl_Table table, uchar c);
  FL_EXPORT_C(void,         Fl_Table_damage_inside_widget)(fl_Table table, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Table_draw_label_with_xywh_alignment)(fl_Table table, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Table_measure_label)(fl_Table table, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Table_window)(fl_Table table);
  FL_EXPORT_C(fl_Window,    Fl_Table_top_window)(fl_Table table);
  FL_EXPORT_C(fl_Window ,   Fl_Table_top_window_offset)(fl_Table table, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Window,    Fl_Table_as_window_super)(fl_Table table);
  FL_EXPORT_C(fl_Window,    Fl_Table_as_window)(fl_Table table);
  FL_EXPORT_C(fl_Group,     Fl_Table_as_group_super)(fl_Table table);
  FL_EXPORT_C(fl_Group,     Fl_Table_as_group)(fl_Table table);
  FL_EXPORT_C(fl_Gl_Window, Fl_Table_as_gl_window_super)(fl_Table table);
  FL_EXPORT_C(fl_Gl_Window, Fl_Table_as_gl_window)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_draw_super)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_draw)(fl_Table table);
  FL_EXPORT_C(int,          Fl_Table_handle_super)(fl_Table table, int event);
  FL_EXPORT_C(int,          Fl_Table_handle)(fl_Table table, int event);
  FL_EXPORT_C(void,         Fl_Table_resize_super)(fl_Table table, int x, int y, int w, int h);
  FL_EXPORT_C(void,         Fl_Table_resize)(fl_Table table, int x, int y, int w, int h);
  /* Fl_Group specific */
  FL_EXPORT_C(void,         Fl_Table_remove_widget)(fl_Table table, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Table_clear_super)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_clear)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_resizable_by_reference)(fl_Table table,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Table_set_resizable)(fl_Table table,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Table_resizable)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_add_resizable)(fl_Table table,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Table_init_sizes)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_set_clip_children)(fl_Table table,int c);
  FL_EXPORT_C(unsigned int, Fl_Table_clip_children)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_focus)(fl_Table table,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Table__ddfdesign_kludge)(fl_Table table);
  FL_EXPORT_C(void,         Fl_Table_insert_with_before)(fl_Table self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Table_array)(fl_Table self);
  FL_EXPORT_C(fl_Widget,    Fl_Table_child)(fl_Table self, int n);
  FL_EXPORT_C(void,         Fl_Table_forms_end)(fl_Table self);


  /* Fl_Table specific functions */
#ifdef __cplusplus
  class Fl_DerivedTable : public Fl_Table {
    fl_Table_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    using Fl_Table::rows;
    using Fl_Table::cols;
    void* get_other_data();
    void set_other_data(void*);
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
    Fl_DerivedTable(int X, int Y, int W, int H, const char *l, fl_Table_Virtual_Funcs* funcs);
    Fl_DerivedTable(int X, int Y, int W, int H, fl_Table_Virtual_Funcs* funcs);
    ~Fl_DerivedTable();
  };
#endif
  FL_EXPORT_C(fl_Table_Virtual_Funcs*, Fl_Table_default_virtual_funcs)();
  FL_EXPORT_C(fl_Table, Fl_Table_New_WithLabel)(int X, int Y, int W, int H, const char *l, fl_Table_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Table, Fl_Table_New)(int X, int Y, int W, int H, fl_Table_Virtual_Funcs* funcs);
  FL_EXPORT_C(void, Fl_Table_Destroy)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_table_box)(fl_Table table,Fl_Boxtype val);
  FL_EXPORT_C(Fl_Boxtype, Fl_Table_table_box)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_rows_super)(fl_Table table,int val);
  FL_EXPORT_C(void, Fl_Table_set_rows)(fl_Table table,int val);
  FL_EXPORT_C(int, Fl_Table_rows)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_cols_super)(fl_Table table, int val);
  FL_EXPORT_C(void, Fl_Table_set_cols)(fl_Table table, int val);
  FL_EXPORT_C(int, Fl_Table_cols)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_visible_cells)(fl_Table table,int* r1, int* r2, int* c1, int* c2);
  FL_EXPORT_C(int, Fl_Table_is_interactive_resize)(fl_Table table);
  FL_EXPORT_C(int, Fl_Table_row_resize)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_resize)(fl_Table table,int flag);
  FL_EXPORT_C(int, Fl_Table_col_resize)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_col_resize)(fl_Table table,int flag);
  FL_EXPORT_C(int, Fl_Table_col_resize_min)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_col_resize_min)(fl_Table table,int val);
  FL_EXPORT_C(int, Fl_Table_row_resize_min)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_resize_min)(fl_Table table,int val);
  FL_EXPORT_C(int, Fl_Table_row_header)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_header)(fl_Table table,int flag);
  FL_EXPORT_C(int, Fl_Table_col_header)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_col_header)(fl_Table table,int flag);
  FL_EXPORT_C(void, Fl_Table_set_col_header_height)(fl_Table table,int height);
  FL_EXPORT_C(int, Fl_Table_col_header_height)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_header_width)(fl_Table table,int width);
  FL_EXPORT_C(int, Fl_Table_row_header_width)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_header_color)(fl_Table table,Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Table_row_header_color)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_col_header_color)(fl_Table table,Fl_Color val);
  FL_EXPORT_C(Fl_Color, Fl_Table_col_header_color)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_row_height)(fl_Table table,int row, int height);
  FL_EXPORT_C(int, Fl_Table_row_height)(fl_Table table,int row);
  FL_EXPORT_C(void, Fl_Table_set_col_width)(fl_Table table,int col, int width);
  FL_EXPORT_C(int, Fl_Table_col_width)(fl_Table table,int col);
  FL_EXPORT_C(void, Fl_Table_set_row_height_all)(fl_Table table,int height);
  FL_EXPORT_C(void, Fl_Table_set_col_width_all)(fl_Table table,int width);
  FL_EXPORT_C(void, Fl_Table_set_row_position)(fl_Table table,int row);
  FL_EXPORT_C(void, Fl_Table_set_col_position)(fl_Table table,int col);
  FL_EXPORT_C(int, Fl_Table_row_position)(fl_Table table);
  FL_EXPORT_C(int, Fl_Table_col_position)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_set_top_row)(fl_Table table,int row);
  FL_EXPORT_C(int, Fl_Table_top_row)(fl_Table table);
  FL_EXPORT_C(int, Fl_Table_is_selected)(fl_Table table,int r, int c);
  FL_EXPORT_C(void, Fl_Table_get_selection)(fl_Table table,int* row_top, int* col_left, int* row_bot, int* col_right);
  FL_EXPORT_C(void, Fl_Table_set_selection)(fl_Table table,int row_top, int col_left, int row_bot, int col_right);
  FL_EXPORT_C(int, Fl_Table_move_cursor)(fl_Table table,int R, int C);
  FL_EXPORT_C(void, Fl_Table_draw)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_init_sizes)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_add)(fl_Table table,fl_Widget wgt);
  FL_EXPORT_C(void, Fl_Table_add)(fl_Table table,fl_Widget wgt);
  FL_EXPORT_C(void, Fl_Table_insert)(fl_Table table,fl_Widget wgt, int n);
  FL_EXPORT_C(void, Fl_Table_insert_with_widget)(fl_Table table,fl_Widget wgt, fl_Widget w2);
  FL_EXPORT_C(void, Fl_Table_begin)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_end)(fl_Table table);
  FL_EXPORT_C(fl_Widget*, Fl_Table_array)(fl_Table table);
  FL_EXPORT_C(fl_Widget, Fl_Table_child)(fl_Table table,int n);
  FL_EXPORT_C(int, Fl_Table_children)(fl_Table table);
  FL_EXPORT_C(int, Fl_Table_find)(fl_Table table,fl_Widget wgt);
  FL_EXPORT_C(int, Fl_Table_callback_row)(fl_Table table);
  FL_EXPORT_C(int, Fl_Table_callback_col)(fl_Table table);
  FL_EXPORT_C(TableContextC, Fl_Table_callback_context)(fl_Table table);
  FL_EXPORT_C(void, Fl_Table_do_callback)(fl_Table table, TableContextC tableContext, int row, int col);
#if FLTK_ABI_VERSION >= 10303
  FL_EXPORT_C(void, Fl_Table_set_tab_cell_nav)(fl_Table table, int val);
  FL_EXPORT_C(int,  Fl_Table_tab_cell_nav)(fl_Table table);
#endif
  FL_EXPORT_C(int,  Fl_Table_find_cell)(fl_Table table, TableContextC context, int R, int C, int* X, int* Y, int* W, int* H);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TABLE_C__ */
