#ifndef __FL_CALLBACK_C__
#define __FL_CALLBACK_C__

#ifdef __cplusplus
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
EXPORT {
#endif
/**
   Pass a C callback function to an Fl_Window
 */
class C_to_Fl_Callback {
 private:
  void (C_to_Fl_Callback::*callback) (void*,void*);
  void* user_data;
  void runCallback(Fl_Widget* w);
  static void intercept(Fl_Widget* w, void* self) {
    ((C_to_Fl_Callback*)self)->runCallback(w);
  }
 public:
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback callback, void* user_data);
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback callback);
  Fl_Callback_p getWrappedCallback();
};

#ifdef __cplusplus
}
#endif

#endif /* __FL_CALLBACK_C__ */
