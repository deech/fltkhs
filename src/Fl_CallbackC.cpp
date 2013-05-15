#include <FL/Fl.H>
#include "Fl_Callback_C.h"

Fl_to_C_Callback::Fl_to_C_Callback(Fl_Callback func) {
  func = func;
}
void* Fl_to_C_Callback::runCallback(fl_Widget w, void* user_data) {
  func((static_cast<Fl_Widget*>(w)), user_data);
  delete this;
}

C_to_Fl_Callback::C_to_Fl_Callback(fl_Callback func) {
  func = func;
}
void* C_to_Fl_Callback::runCallback (Fl_Widget* w, void* user_data) {
  func(((fl_Widget)w), user_data);
  delete this;
}
