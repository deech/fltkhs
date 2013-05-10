#ifndef __FLKC__
#define __FLKC__
#include "Fl_WindowC.h"
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int, flkc_run)();
  FL_EXPORT_C(double, flkc_wait_with_args)(double wait);
  FL_EXPORT_C(int, flkc_check)();
  FL_EXPORT_C(int, flkc_ready)();
  FL_EXPORT_C(int, flkc_wait)();
#ifdef __cplusplus
}
#endif

#endif /*__FLKC__ */
