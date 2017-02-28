#ifndef __FL_CALLBACK_C__
#define __FL_CALLBACK_C__

#ifdef __cplusplus
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "DerivedText_Editor.h"
#include <FL/Fl.H>
#include "FL/Fl_Window.H"
#include <FL/Fl_Widget.H>
#include <FL/Fl_Menu_Item.H>
#include <FL/Fl_Menu_.H>
#include <FL/Fl_Sys_Menu_Bar.H>
#include <FL/Fl_Text_Buffer.H>
#include <FL/Fl_Text_Editor.H>
#include <FL/Fl_File_Chooser.H>
#include <stdio.h>

/**
  Pass a C callback function to an Fl_Window
*/
class C_to_Fl_Callback {
 private:
  fl_Callback* callback;
  fl_Text_Buffer_Callback* text_buffer_callback;
  fl_Key_Func* c_key_func;
  Fl_Text_Editor::Key_Func* cpp_key_func;
  void* user_data;
  void runCallback(Fl_Widget* w);
  void runCallback();
  int runCallback(int key, DerivedText_Editor* editor);
  void runCallback(Fl_File_Chooser* chooser);
  static void intercept(Fl_Widget* w, void* self) {
    ((C_to_Fl_Callback*)self)->runCallback(w);
  }
  static void intercept(Fl_Text_Buffer* self) {
    ((C_to_Fl_Callback*)self)->runCallback();
  }
  static void intercept(Fl_File_Chooser* c, void* self){
    ((C_to_Fl_Callback*)self)->runCallback(c);
  }
  // implementation needs DerivedText_Editor so it is separated
 public:
  static int intercept(int key, DerivedText_Editor* editor){
    C_to_Fl_Callback* context = editor->get_curr_callback_context();
    if (!context) context = editor->get_default_callback_context();
    return context->runCallback(key,editor);
  };
  static int intercept(int key, fl_Text_Editor editor);
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback, void* user_data);
  C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback);
  C_to_Fl_Callback(fl_Callback* callback);
  C_to_Fl_Callback(fl_Callback* callback, void* user_data);
  C_to_Fl_Callback(fl_Text_Buffer_Callback* callback, void* invoker);
  C_to_Fl_Callback(fl_Key_Func* key_func);
  C_to_Fl_Callback(Fl_Text_Editor::Key_Func* stored_key_func);
  C_to_Fl_Callback(Fl_File_Chooser* chooser, void* user_data);
  C_to_Fl_Callback(Fl_File_Chooser* chooser);
  void* get_user_data();
  void set_callback(Fl_Menu_Item* item);
  void set_callback(Fl_Text_Buffer* b);
  void set_user_data(void* user_data);
  void set_callback(Fl_File_Chooser* b);
  int menu_insert(Fl_Menu_Item* item, int index, char* name, int shortcut, int flags = 0);
  int menu_insert(Fl_Menu_* menu_, int index, char* name, int shortcut, int flags = 0);
  int menu_insert(Fl_Menu_* menu_, int index, char* name, char* shortcut, int flags = 0);
  int menu_insert(Fl_Sys_Menu_Bar* menu_, int index, char* name, int shortcut, int flags = 0);
  int menu_insert(Fl_Sys_Menu_Bar* menu_, int index, char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_Item* item, char* name, int shortcut, int flags = 0);
  int menu_add(Fl_Menu_Item* item, char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_* menu,char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Menu_* menu,char* name, int shortcut, int flags = 0);
  int menu_add(Fl_Sys_Menu_Bar* menu,char* name, char* shortcut, int flags = 0);
  int menu_add(Fl_Sys_Menu_Bar* menu,char* name, int shortcut, int flags = 0);
};
#endif
#endif /* __FL_CALLBACK_C__ */
