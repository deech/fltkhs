#ifndef __FL_PACK_C__
#define __FL_PACK_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Pack.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(uchar,   Fl_Pack_type)(fl_Pack pack);
  FL_EXPORT_C(void,    Fl_Pack_set_type)(fl_Pack pack, uchar);
  FL_EXPORT_C(int,     Fl_Pack_get_spacing)(fl_Pack p);
  FL_EXPORT_C(void,    Fl_Pack_set_spacing)(fl_Pack p, int pixels);
  FL_EXPORT_C(uchar,   Fl_Pack_horizontal)(fl_Pack p);
  FL_EXPORT_C(fl_Pack, Fl_Pack_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Pack, Fl_Pack_New_WithLabel)(int x, int y, int w, int h, const char* t);
#ifdef __cplusplus
}
#endif
#endif /* __FL_PACK_C__ */
