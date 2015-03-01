#ifndef __X_C__
#define __X_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// X is included transitively and needed for
// the callback mechanism included below to work.
#ifdef _WIN32
 #define FL_LIBRARY 1
#endif
#include "FL/Fl.H"
#include "Fl_CallbackC.h"
#include "FL/x.H"
EXPORT {
#endif
#if !defined(WIN32) && !defined(__APPLE__)
# include <X11/Xlib.h>
# include <X11/Xutil.h>
#endif
 FL_EXPORT_C(void, flc_open_display)();
 FL_EXPORT_C(Fl_Bitmask, flc_create_bitmask)(int w, int h, const uchar *data);
 FL_EXPORT_C(Fl_Bitmask, flc_create_alphamask)(int w, int h, int d, int ld, const uchar *data);
 FL_EXPORT_C(void, flc_delete_bitmask)(Fl_Bitmask bm);
#if !defined(WIN32) && !defined(__APPLE__)
 typedef ulong Fl_Bitmask;
 FL_EXPORT_C(void, flc_close_display)();
 FL_EXPORT_C(ulong, flc_xpixel)(Fl_Color i);
 FL_EXPORT_C(ulong, flc_xpixel_with_rgb)(uchar r, uchar g, uchar b);
 FL_EXPORT_C(void, flc_set_fl_screen)(int screen);
 FL_EXPORT_C(int, flc_fl_screen)();
 FL_EXPORT_C(Display*, flc_fl_display)();
 FL_EXPORT_C(void, flc_set_fl_display)(Display* d);
 FL_EXPORT_C(void, flc_open_display_with_d)(Display* d);
 FL_EXPORT_C(void, flc_set_fl_colormap)(Colormap c);
 FL_EXPORT_C(Colormap, flc_fl_colormap)();
 FL_EXPORT_C(void, flc_set_fl_visual)(XVisualInfo* i);
 FL_EXPORT_C(XVisualInfo*, flc_fl_visual)();
#endif
#ifdef __cplusplus
}
#endif
#endif /* __X_C__ */
