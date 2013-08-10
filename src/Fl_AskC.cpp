// Unimplemented until I figure out what to do with all the varargs functions
#include "Fl_AskC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_beep)(){
    fl_beep();
  }
  FL_EXPORT_C(void,flc_beep_with_type)(int type){
    fl_beep(type);
  }
#ifdef __cplusplus
}
#endif
