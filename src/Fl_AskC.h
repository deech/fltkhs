// Unimplemented until I figure out what to do with all the vararg
#ifndef __FL_ASK_C__
#define __FL_ASK_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/fl_ask.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C(void,flc_beep)();
  FL_EXPORT_C(void,flc_beep_with_type)(int type);
#ifdef __cplusplus
}
#endif
#endif /* __FL_ASK_C__ */
