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
#ifndef INTERNAL_LINKAGE
  typedef enum Fl_Beep {
    FL_BEEP_DEFAULT = 0,
    FL_BEEP_MESSAGE = 1,
    FL_BEEP_ERROR = 2,
    FL_BEEP_QUESTION = 3,
    FL_BEEP_PASSWORD = 4,
    FL_BEEP_NOTIFICATION = 5
  } Fl_Beep;
#endif

  FL_EXPORT_C(void,flc_beep)();
  FL_EXPORT_C(void,flc_beep_with_type)(int type);
  FL_EXPORT_C(void,flc_message)(const char* message);
  FL_EXPORT_C(void,flc_message_with_args)(const char* fmt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(void,flc_alert)(const char* alert);
  FL_EXPORT_C(void,flc_alert_with_args)(const char* fmt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(int,flc_choice)(const char *q,const char *b0,const char *b1,const char *b2);
  FL_EXPORT_C(int,flc_choice_with_args)(const char *q,const char *b0,const char *b1,const char *b2,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(const char*,flc_input)(const char *label);
  FL_EXPORT_C(const char*,flc_input_with_deflt)(const char *label,const char* deflt);
  FL_EXPORT_C(const char*,flc_input_with_args)(const char *label,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(const char *,flc_input_with_args_deflt)(const char *label,const char *deflt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(const char *,flc_password)(const char *label);
  FL_EXPORT_C(const char *,flc_password_with_deflt)(const char *label,const char* deflt);
  FL_EXPORT_C(const char *,flc_password_with_args)(const char *label,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
  FL_EXPORT_C(const char *,flc_password_with_args_deflt)(const char *label,const char *deflt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10);
#ifdef __cplusplus
}
#endif
#endif /* __FL_ASK_C__ */
