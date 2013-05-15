#include <FL/Fl.H>
#include "Fl_C.h"
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
EXPORT {
#endif  
  FL_EXPORT_C(int, flkc_run)(){ return Fl::run(); }
  FL_EXPORT_C(double, flkc_wait_with_args)(double wait) { return Fl::wait(wait); }
  FL_EXPORT_C(int, flkc_wait)() { return Fl::wait(); }
  FL_EXPORT_C(int, flkc_check)() { return Fl::check(); }
  FL_EXPORT_C(int, flkc_ready)() { return Fl::ready(); }
#ifdef __cplusplus
}
#endif
