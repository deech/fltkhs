#ifndef __FL_SIMPLE_TERMINAL_C__
#define __FL_SIMPLE_TERMINAL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Simple_Terminal.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedSimple_Terminal : public Fl_Simple_Terminal {
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
    void destroy_data();
    Fl_DerivedSimple_Terminal(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedSimple_Terminal(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedSimple_Terminal();
  };
#endif
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_stay_at_bottom, (fl_Simple_Terminal t, int));
  FL_EXPORT_C_HEADER(int, Fl_Simple_Terminal_get_stay_at_bottom, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_history_lines, (fl_Simple_Terminal t, int));
  FL_EXPORT_C_HEADER(int,  Fl_Simple_Terminal_get_history_lines, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_ansi, (fl_Simple_Terminal t, int val));
  FL_EXPORT_C_HEADER(int, Fl_Simple_Terminal_get_ansi, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_style_table, (fl_Simple_Terminal t, Style_Table_Entry *styleTable, int stable_size, int normal_style_index));
  FL_EXPORT_C_HEADER(Style_Table_Entry*, Fl_Simple_Terminal_get_style_table, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(int, Fl_Simple_Terminal_get_style_table_size, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_normal_style_index, (fl_Simple_Terminal t, int));
  FL_EXPORT_C_HEADER(int,  Fl_Simple_Terminal_get_normal_style_index, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_current_style_index, (fl_Simple_Terminal t, int));
  FL_EXPORT_C_HEADER(int,  Fl_Simple_Terminal_get_current_style_index, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_append, (fl_Simple_Terminal t, const char *s));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_set_text, (fl_Simple_Terminal t, const char *s));
  FL_EXPORT_C_HEADER(const char*, Fl_Simple_Terminal_get_text, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_clear, (fl_Simple_Terminal t));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_remove_lines, (fl_Simple_Terminal t, int start, int count));
  FL_EXPORT_C_HEADER(fl_Simple_Terminal,Fl_Simple_Terminal_New_WithLabel,(int x, int y, int w, int h, const char* label));
  FL_EXPORT_C_HEADER(fl_Simple_Terminal,Fl_Simple_Terminal_New,(int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(fl_Simple_Terminal,Fl_OverriddenSimple_Terminal_New_WithLabel,(int x, int y, int w, int h, const char* label, fl_Widget_Virtual_Funcs* funcs));
  FL_EXPORT_C_HEADER(fl_Simple_Terminal,Fl_OverriddenSimple_Terminal_New,(int x, int y, int w, int h, fl_Widget_Virtual_Funcs* funcs));
  FL_EXPORT_C_HEADER(void,Fl_Simple_Terminal_draw_super,(fl_Simple_Terminal o));
  FL_EXPORT_C_HEADER(int,Fl_Simple_Terminal_handle_super,(fl_Simple_Terminal o, int event));
  FL_EXPORT_C_HEADER(void,Fl_Simple_Terminal_resize_super,(fl_Simple_Terminal o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void,Fl_Simple_Terminal_show_super,(fl_Simple_Terminal o));
  FL_EXPORT_C_HEADER(void,Fl_Simple_Terminal_hide_super,(fl_Simple_Terminal o));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_draw,(fl_Simple_Terminal o));
  FL_EXPORT_C_HEADER(int, Fl_Simple_Terminal_handle,(fl_Simple_Terminal o, int event));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_resize,(fl_Simple_Terminal o, int x, int y, int w, int h));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_show,(fl_Simple_Terminal o));
  FL_EXPORT_C_HEADER(void, Fl_Simple_Terminal_hide,(fl_Simple_Terminal o));
#ifdef __cplusplus
}
#endif
#endif /* __FL_SIMPLE_TERMINAL_C__ */
