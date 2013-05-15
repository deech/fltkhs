#ifndef __FL_CALLBACK_C__
#define __FL_CALLBACK_C__
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
class Fl_to_C_Callback {
 protected:
  Fl_Callback func;
 public:
  Fl_to_C_Callback(Fl_Callback func);
  ~Fl_to_C_Callback();
  void runCallback(void* w, void* user_data);
};

class C_to_Fl_Callback {
 private:
  fl_Callback func;
 public:
  C_to_Fl_Callback(fl_Callback func);
  ~C_to_Fl_Callback();
  void runCallback (Fl_Widget* w, void* user_data);
};
#endif /* __FL_CALLBACK_C__ */
