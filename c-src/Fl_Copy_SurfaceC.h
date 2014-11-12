#ifndef __FL_COPY_SURFACE_C__
#define __FL_COPY_SURFACE_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "FL/Fl_Copy_Surface.H"
EXPORT {
#endif
  FL_EXPORT_C(const char* ,Fl_Copy_Surface_class_name)(fl_Copy_Surface copy_surface);
  FL_EXPORT_C(void        ,Fl_Copy_Surface_set_current)(fl_Copy_Surface copy_surface);
  FL_EXPORT_C(void        ,Fl_Copy_Surface_draw)(fl_Copy_Surface copy_surface, fl_Widget widget, int delta_x, int delta_y);
  FL_EXPORT_C(fl_Copy_Surface, Fl_Copy_Surface_New)(int w, int h);
  FL_EXPORT_C(void, Fl_Copy_Surface_Destroy)(fl_Copy_Surface copy_surface);
#ifdef __cplusplus
}
#endif
#endif /* __FL_COPY_SURFACE_C__ */
