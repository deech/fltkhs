#ifndef __FL_CALLBACK_C__
#define __FL_CALLBACK_C__

#ifdef __cplusplus
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include <FL/Fl.H>
#include "FL/Fl_Window.H"
#include <FL/Fl_Widget.H>
#include <FL/Fl_Menu_Item.H>
#include <FL/Fl_Menu_.H>
#/**
   Pass a C callback function to an Fl_Window
*/
class C_to_Fl_Callback {
 private:
  fl_Callback* callback;
  void* user_data;
  void runCallback(Fl_Widget* w);
  static void intercept(Fl_Widget* w, void* self) {
    ((C_to_Fl_Callback*)self)->runCallback(w);
  }
 public:
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback, void* user_data);
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback);
  C_to_Fl_Callback(fl_Callback* callback);
  C_to_Fl_Callback(fl_Callback* callback, void* user_data);
  void set_callback(Fl_Menu_Item* item);
  int menu_insert(Fl_Menu_Item* item, int index, char* name, int shortcut, int flags = 0);
  int menu_insert(Fl_Menu_* menu_, int index, char* name, int shortcut, int flags = 0);
  int menu_insert(Fl_Menu_* menu_, int index, char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_Item* item, char* name, int shortcut, int flags = 0);
  int menu_add(Fl_Menu_Item* item, char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_* menu,char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_* menu,char* name, int shortcut, int flags = 0);
};
#endif
#endif /* __FL_CALLBACK_C__ */
