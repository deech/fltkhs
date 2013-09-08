#ifndef __FL_TOOLTIP_C__
#define __FL_TOOLTIP_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Tooltip.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(float, Fl_Tooltip_delay)();
  FL_EXPORT_C(void, Fl_Tooltip_set_delay)(float f);
  FL_EXPORT_C(float, Fl_Tooltip_hoverdelay)();
  FL_EXPORT_C(void, Fl_Tooltip_set_hoverdelay)(float f);
  FL_EXPORT_C(int, Fl_Tooltip_enabled)();
  FL_EXPORT_C(void, Fl_Tooltip_enable)();
  FL_EXPORT_C(void, Fl_Tooltip_enable_with_b)(int b);
  FL_EXPORT_C(void, Fl_Tooltip_disable)();
  typedef void (*fl_enter)(fl_Widget w);
  FL_EXPORT_C(void, Fl_Tooltip_enter_area)(fl_Widget w, int X, int Y, int W, int H, const char* tip);
  typedef void (*fl_exit)(fl_Widget w);
  FL_EXPORT_C(fl_Widget, Fl_Tooltip_current)();
  FL_EXPORT_C(void, Fl_Tooltip_set_current)(fl_Widget w);
  FL_EXPORT_C(Fl_Font, Fl_Tooltip_font)();
  FL_EXPORT_C(void, Fl_Tooltip_set_font)(Fl_Font i);
  FL_EXPORT_C(Fl_Fontsize, Fl_Tooltip_size)();
  FL_EXPORT_C(void, Fl_Tooltip_set_size)(Fl_Fontsize s);
  FL_EXPORT_C(Fl_Color, Fl_Tooltip_color)();
  FL_EXPORT_C(void, Fl_Tooltip_set_color)(Fl_Color c);
  FL_EXPORT_C(Fl_Color, Fl_Tooltip_textcolor)();
  FL_EXPORT_C(void, Fl_Tooltip_set_textcolor)(Fl_Color c);
#if FLTK_ABI_VERSION >= 10301
  FL_EXPORT_C(int, Fl_Tooltip_margin_width)();
  FL_EXPORT_C(void, Fl_Tooltip_set_margin_width)(int v);
  FL_EXPORT_C(int, Fl_Tooltip_margin_height)();
  FL_EXPORT_C(void, Fl_Tooltip_set_margin_height)(int v);
  FL_EXPORT_C(int, Fl_Tooltip_wrap_width)();
  FL_EXPORT_C(void, Fl_Tooltip_set_wrap_width)(int v);
#else
  FL_EXPORT_C(int, Fl_Tooltip_margin_width)();
  FL_EXPORT_C(int, Fl_Tooltip_margin_height)();
  FL_EXPORT_C(int, Fl_Tooltip_wrap_width)();
#endif
#ifdef __APPLE__
  FL_EXPORT_C(fl_Window, Fl_Tooltip_current_window)(void);
#endif
#ifdef __cplusplus
}
#endif
#endif /* __FL_TOOLTIP_C__ */
