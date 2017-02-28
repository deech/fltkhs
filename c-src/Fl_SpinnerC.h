#ifndef __FL_SPINNER_C__
#define __FL_SPINNER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Spinner is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Spinner.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedSpinner : public Fl_Spinner {
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
    Fl_DerivedSpinner(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedSpinner(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedSpinner();
  };

#endif
#ifndef INTERNAL_LINKAGE
  typedef enum Spinner_Type {
    FL_FLOAT_INPUTC = 1,
    FL_INT_INPUTC = 2
  } Spinner_Type;
#endif
  FL_EXPORT_C(int,       Fl_Spinner_handle)(fl_Spinner counter, int event);
  FL_EXPORT_C(Fl_Color,     Fl_Spinner_color)(fl_Spinner counter);
  FL_EXPORT_C(void,         Fl_Spinner_set_color)(fl_Spinner counter, Fl_Color bg);
  FL_EXPORT_C(Fl_Color,     Fl_Spinner_selection_color)(fl_Spinner counter);
  FL_EXPORT_C(void,         Fl_Spinner_set_selection_color)(fl_Spinner counter, Fl_Color a);
  FL_EXPORT_C(uchar,        Fl_Spinner_type)(fl_Spinner counter);
  FL_EXPORT_C(void,         Fl_Spinner_set_type)(fl_Spinner counter, uchar t);
  FL_EXPORT_C(void,         Fl_Spinner_resize)(fl_Spinner spinner,int X, int Y, int W, int H);
  FL_EXPORT_C(double, Fl_Spinner_minimum)(fl_Spinner spinner);
  FL_EXPORT_C(void, Fl_Spinner_set_minimum)(fl_Spinner spinner, double a);
  FL_EXPORT_C(double, Fl_Spinner_maximum)(fl_Spinner spinner);
  FL_EXPORT_C(void, Fl_Spinner_set_maximum)(fl_Spinner spinner, double a);
  FL_EXPORT_C(void, Fl_Spinner_range)(fl_Spinner spinner, double a, double b);
  FL_EXPORT_C(void, Fl_Spinner_set_step)(fl_Spinner spinner, double a);
  FL_EXPORT_C(double, Fl_Spinner_step)(fl_Spinner spinner);
  FL_EXPORT_C(double, Fl_Spinner_value)(fl_Spinner spinner);
  FL_EXPORT_C(void, Fl_Spinner_set_value)(fl_Spinner spinner, double v);
  FL_EXPORT_C(void, Fl_Spinner_set_format)(fl_Spinner spinner, const char* format);
  FL_EXPORT_C(const char*, Fl_Spinner_format)(fl_Spinner spinner);
  FL_EXPORT_C(void,         Fl_Spinner_set_textfont)(fl_Spinner spinner, Fl_Font text);
  FL_EXPORT_C(Fl_Font,     Fl_Spinner_textfont)(fl_Spinner spinner);
  FL_EXPORT_C(void,         Fl_Spinner_set_textsize)(fl_Spinner spinner, Fl_Fontsize text);
  FL_EXPORT_C(Fl_Fontsize,     Fl_Spinner_textsize)(fl_Spinner spinner);
  FL_EXPORT_C(void,         Fl_Spinner_set_textcolor)(fl_Spinner spinner, Fl_Color text);
  FL_EXPORT_C(Fl_Color,     Fl_Spinner_textcolor)(fl_Spinner spinner);
  FL_EXPORT_C(fl_Spinner,    Fl_Spinner_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Spinner   , Fl_Spinner_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Spinner,    Fl_OverriddenSpinner_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Spinner,    Fl_OverriddenSpinner_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Spinner_draw)(fl_Spinner o);
  FL_EXPORT_C(void, Fl_Spinner_draw_super)(fl_Spinner o);
  FL_EXPORT_C(int, Fl_Spinner_handle)(fl_Spinner o, int event);
  FL_EXPORT_C(int, Fl_Spinner_handle_super)(fl_Spinner o, int event);
  FL_EXPORT_C(void, Fl_Spinner_resize)(fl_Spinner o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Spinner_resize_super)(fl_Spinner o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Spinner_show)(fl_Spinner o);
  FL_EXPORT_C(void, Fl_Spinner_show_super)(fl_Spinner o);
  FL_EXPORT_C(void, Fl_Spinner_hide)(fl_Spinner o);
  FL_EXPORT_C(void, Fl_Spinner_hide_super)(fl_Spinner o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SPINNER_C__ */
