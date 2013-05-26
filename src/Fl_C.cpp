#include <FL/Fl.H>
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
#include "Fl_C.h"
EXPORT {
#endif
  FL_EXPORT_C(int, Fl_run)(){ return Fl::run(); }
  FL_EXPORT_C(int, Fl_check)() { return Fl::check(); }
  FL_EXPORT_C(int, Fl_ready)() { return Fl::ready(); }
#ifdef __cplusplus
}
#endif
