#ifndef fl_show_colormapC_H
#define fl_show_colormapC_H
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/fl_show_colormap.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(Fl_Color, flc_show_colormap)(Fl_Color oldcol);
#ifdef __cplusplus
}
#endif
#endif
