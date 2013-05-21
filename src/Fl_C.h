#ifndef __FLKC__
#define __FLKC__
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
#include "FL/Fl.H"
#include "Fl_WindowC.h"
#include "Fl_ButtonC.h"
#include "Fl_Check_ButtonC.h"
#include "Fl_Radio_ButtonC.h"
#include "Fl_Light_ButtonC.h"
#include "Fl_Toggle_ButtonC.h"
#include "Fl_InputC.h"
#include "Fl_Types.h"
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
