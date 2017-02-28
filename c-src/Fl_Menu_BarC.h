#ifndef __FL_MENU_BAR_C__
#define __FL_MENU_BAR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_Bar.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedMenu_Bar : public Fl_Menu_Bar {
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
    Fl_DerivedMenu_Bar(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedMenu_Bar(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedMenu_Bar();
  };
#endif
  FL_EXPORT_C(int,          Fl_Menu_Bar_handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Menu_Bar,   Fl_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Menu_Bar   , Fl_Menu_Bar_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void   , Fl_Menu_Bar_Destroy)(fl_Menu_Bar menu_bar);
  FL_EXPORT_C(fl_Menu_Bar,    Fl_OverriddenMenu_Bar_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Menu_Bar,    Fl_OverriddenMenu_Bar_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Menu_Bar_draw)(fl_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Menu_Bar_draw_super)(fl_Menu_Bar o);
  FL_EXPORT_C(int, Fl_Menu_Bar_handle)(fl_Menu_Bar o, int event);
  FL_EXPORT_C(int, Fl_Menu_Bar_handle_super)(fl_Menu_Bar o, int event);
  FL_EXPORT_C(void, Fl_Menu_Bar_resize)(fl_Menu_Bar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Menu_Bar_resize_super)(fl_Menu_Bar o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Menu_Bar_show)(fl_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Menu_Bar_show_super)(fl_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Menu_Bar_hide)(fl_Menu_Bar o);
  FL_EXPORT_C(void, Fl_Menu_Bar_hide_super)(fl_Menu_Bar o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU_BAR_C__ */
