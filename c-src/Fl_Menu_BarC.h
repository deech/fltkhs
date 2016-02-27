#ifndef __FL_MENU_BAR_C__
#define __FL_MENU_BAR_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Menu_Bar.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(int,          Fl_Menu_Bar_handle)(fl_Group self, int event);
  FL_EXPORT_C(fl_Menu_Bar,   Fl_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Menu_Bar   , Fl_Menu_Bar_New)(int x, int y, int w, int h);
  FL_EXPORT_C(void   , Fl_Menu_Bar_Destroy)(fl_Menu_Bar menu_bar);
#ifdef __cplusplus
}
#endif
#endif /* __FL_MENU_BAR_C__ */
