#include <FL/Fl.H>
#include "Fl_C.h"
extern "C" {
  int flkc_run(){ return Fl::run(); }
}
