// Unimplemented until I figure out what to do with all the varargs functions
#include "Fl_AskC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_beep)(){
    return fl_beep();
  }
  FL_EXPORT_C(void,flc_beep_with_type)(int type){
    return fl_beep(type);
  }
  FL_EXPORT_C(void,flc_message)(const char* message){
    return fl_message(message, NULL);
  }
  FL_EXPORT_C(void,flc_message_with_args)(const char* fmt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_message(fmt,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(void,flc_alert)(const char* alert){
    return fl_alert(alert, NULL);
  }
  FL_EXPORT_C(void,flc_alert_with_args)(const char* fmt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_alert(fmt,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(int,flc_choice)(const char* q, const char* b0, const char* b1, const char* b2){
    return fl_choice(q, b0,b1,b2,NULL);
  }
  FL_EXPORT_C(int,flc_choice_with_args)(const char *q,const char *b0,const char *b1,const char *b2,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_choice(q,b0,b1,b2,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(const char*,flc_input)(const char *label){
    return fl_input(label,0,NULL);
  }
  FL_EXPORT_C(const char*,flc_input_with_deflt)(const char *label,const char* deflt){
    return fl_input(label,deflt, NULL);
  }
  FL_EXPORT_C(const char*,flc_input_with_args)(const char *label,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_input(label,0,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(const char *,flc_input_with_args_deflt)(const char *label,const char *deflt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_input(label,deflt,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(const char *,flc_password)(const char *label){
    return fl_password(label,0,NULL);
  }
  FL_EXPORT_C(const char *,flc_password_with_deflt)(const char *label,const char* deflt){
    return fl_password(label,deflt,NULL);
  }
  FL_EXPORT_C(const char *,flc_password_with_args)(const char *label,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_password(label,0,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
  FL_EXPORT_C(const char *,flc_password_with_args_deflt)(const char *label,const char *deflt,const char* arg1,const char* arg2,const char* arg3,const char* arg4,const char* arg5,const char* arg6,const char* arg7,const char* arg8,const char* arg9,const char* arg10){
    return fl_password(label,deflt,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10);
  }
#ifdef __cplusplus
}
#endif
