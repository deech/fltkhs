#ifndef __FL_PACK_C__
#define __FL_PACK_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Pack.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedPack : public Fl_Pack {
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
    Fl_DerivedPack(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedPack(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedPack();
  };
#endif
  FL_EXPORT_C(uchar,   Fl_Pack_type)(fl_Pack pack);
  FL_EXPORT_C(void,    Fl_Pack_set_type)(fl_Pack pack, uchar);
  FL_EXPORT_C(int,     Fl_Pack_get_spacing)(fl_Pack p);
  FL_EXPORT_C(void,    Fl_Pack_set_spacing)(fl_Pack p, int pixels);
  FL_EXPORT_C(uchar,   Fl_Pack_horizontal)(fl_Pack p);
  FL_EXPORT_C(fl_Pack, Fl_Pack_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Pack, Fl_Pack_New_WithLabel)(int x, int y, int w, int h, const char* t);
  FL_EXPORT_C(fl_Pack,    Fl_OverriddenPack_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Pack,    Fl_OverriddenPack_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Pack_draw)(fl_Pack o);
  FL_EXPORT_C(void, Fl_Pack_draw_super)(fl_Pack o);
  FL_EXPORT_C(int, Fl_Pack_handle)(fl_Pack o, int event);
  FL_EXPORT_C(int, Fl_Pack_handle_super)(fl_Pack o, int event);
  FL_EXPORT_C(void, Fl_Pack_resize)(fl_Pack o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Pack_resize_super)(fl_Pack o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Pack_show)(fl_Pack o);
  FL_EXPORT_C(void, Fl_Pack_show_super)(fl_Pack o);
  FL_EXPORT_C(void, Fl_Pack_hide)(fl_Pack o);
  FL_EXPORT_C(void, Fl_Pack_hide_super)(fl_Pack o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_PACK_C__ */
