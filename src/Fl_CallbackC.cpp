#include <FL/Fl.H>
#include <FL/Fl_Widget.H>
#include "Fl_CallbackC.h"

C_to_Fl_Callback::C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback, void* user_data) {
  callback = callback;
  user_data = user_data;
  invoker->callback(intercept, this);
}
C_to_Fl_Callback::C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* c) {
  callback = c;
  user_data = NULL;
  invoker->callback(intercept, this);
}

Fl_Callback_p C_to_Fl_Callback::getWrappedCallback() {
  return &C_to_Fl_Callback::intercept;
}
void C_to_Fl_Callback::runCallback(Fl_Widget* w) {
  (*callback)((fl_Widget) w, user_data);
  delete this;
}
