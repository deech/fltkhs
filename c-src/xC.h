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
 FL_EXPORT_C_HEADER(void,flc_open_display,());
 FL_EXPORT_C_HEADER(fl_Window_Handle ,flc_xid,(fl_Window w));
 FL_EXPORT_C_HEADER(Fl_Bitmask,flc_create_bitmask,(int w, int h, const uchar *data));
 FL_EXPORT_C_HEADER(Fl_Bitmask,flc_create_alphamask,(int w, int h, int d, int ld, const uchar *data));
 FL_EXPORT_C_HEADER(void,flc_delete_bitmask,(Fl_Bitmask bm));
 FL_EXPORT_C_HEADER(void,flc_open_callback,(fl_Open_Callback* cb));
#if !defined(WIN32) && !defined(__APPLE__)
 typedef ulong Fl_Bitmask;
 FL_EXPORT_C_HEADER(void,flc_close_display,());
 FL_EXPORT_C_HEADER(ulong,flc_xpixel,(Fl_Color i));
 FL_EXPORT_C_HEADER(ulong,flc_xpixel_with_rgb,(uchar r, uchar g, uchar b));
 FL_EXPORT_C_HEADER(void,flc_set_fl_screen,(int screen));
 FL_EXPORT_C_HEADER(int,flc_fl_screen,());
 FL_EXPORT_C_HEADER(Display*,flc_fl_display,());
 FL_EXPORT_C_HEADER(void,flc_set_fl_display,(Display* d));
 FL_EXPORT_C_HEADER(void,flc_set_fl_colormap,(Colormap c));
 FL_EXPORT_C_HEADER(Colormap,flc_fl_colormap,());
 FL_EXPORT_C_HEADER(void,flc_set_fl_visual,(XVisualInfo* i));
 FL_EXPORT_C_HEADER(XVisualInfo*,flc_fl_visual,());
#endif
#ifdef __cplusplus
}
#endif
#endif /* __X_C__ */
