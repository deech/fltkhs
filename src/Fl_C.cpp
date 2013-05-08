#include <FL/Fl.H>
#include "Fl_C.h"
#include "Fl_ExportMacros.h"
EXPORT {
  FL_EXPORT_C(int, flkc_run)(){ return Fl::run(); }
}
