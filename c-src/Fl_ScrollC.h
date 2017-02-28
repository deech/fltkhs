#ifndef __FL_SCROLL_C__
#define __FL_SCROLL_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Scrollbar is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Scroll.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedScroll : public Fl_Scroll {
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
    Fl_DerivedScroll(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedScroll(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedScroll();
  };
#endif
  FL_EXPORT_C(void,        Fl_Scroll_set_scrollbar_size)(fl_Scroll widget, int size);
  FL_EXPORT_C(int,         Fl_Scroll_get_scrollbar_size)(fl_Scroll widget);
  FL_EXPORT_C(void,        Fl_Scroll_clear)(fl_Scroll widget);
  FL_EXPORT_C(void,        Fl_Scroll_scroll_to)(fl_Scroll widget, int x, int y);
  FL_EXPORT_C(int,         Fl_Scroll_yposition)(fl_Scroll widget);
  FL_EXPORT_C(int,         Fl_Scroll_xposition)(fl_Scroll widget);
  FL_EXPORT_C(uchar,        Fl_Scroll_type)(fl_Scroll widget);
  FL_EXPORT_C(void,         Fl_Scroll_set_type)(fl_Scroll widget, uchar t);
  FL_EXPORT_C(void,         Fl_Scroll_resize)(fl_Scroll scroll,int X, int Y, int W, int H);
  FL_EXPORT_C(int,Fl_Scroll_handle)(fl_Scroll scroll, int event);
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Scroll,    Fl_Scroll_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Scroll,    Fl_OverriddenScroll_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Scroll,    Fl_OverriddenScroll_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Scroll_draw)(fl_Scroll o);
  FL_EXPORT_C(void, Fl_Scroll_draw_super)(fl_Scroll o);
  FL_EXPORT_C(int, Fl_Scroll_handle)(fl_Scroll o, int event);
  FL_EXPORT_C(int, Fl_Scroll_handle_super)(fl_Scroll o, int event);
  FL_EXPORT_C(void, Fl_Scroll_resize)(fl_Scroll o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Scroll_resize_super)(fl_Scroll o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Scroll_show)(fl_Scroll o);
  FL_EXPORT_C(void, Fl_Scroll_show_super)(fl_Scroll o);
  FL_EXPORT_C(void, Fl_Scroll_hide)(fl_Scroll o);
  FL_EXPORT_C(void, Fl_Scroll_hide_super)(fl_Scroll o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_SCROLL_C__ */
