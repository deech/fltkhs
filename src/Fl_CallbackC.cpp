#include <FL/Fl.H>
#include "FL/Fl_Window.H"
#include <FL/Fl_Widget.H>
#include "Fl_CallbackC.h"

C_to_Fl_Callback::C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback, void* user_data) {
  this->callback = callback;
  this->user_data = user_data;
  invoker->callback(intercept, this);
}
C_to_Fl_Callback::C_to_Fl_Callback(Fl_Widget* invoker, fl_Callback* callback) {
  this->callback = callback;
  this->user_data = NULL;
  invoker->callback(intercept, this);
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Callback* callback){
  this->callback = callback;
  this->user_data = NULL;
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Callback* callback, void* user_data){
  this->callback = callback;
  this->user_data = user_data;
}
void C_to_Fl_Callback::set_callback(Fl_Menu_Item* item){
  item->callback(intercept,this);
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_Item* item, int index, char* name, int shortcut, int flags){
  return item->insert(index,name,shortcut,intercept,this,flags);
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_* menu_, int index, char* name, int shortcut, int flags){
  return menu_->insert(index,name,shortcut,intercept,this,flags);
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_* menu_, int index, char* name, char* shortcut, int flags){
  return menu_->insert(index,name,shortcut,intercept,this,flags);
}
int C_to_Fl_Callback::menu_add(Fl_Menu_Item* item, char* name, int shortcut, int flags){
  return item->add(name, shortcut, intercept, this, flags);
}
int C_to_Fl_Callback::menu_add(Fl_Menu_Item* item, char* name, char* shortcut, int flags){
  return item->add(name, shortcut, intercept, this, flags);
}
int C_to_Fl_Callback::menu_add(Fl_Menu_* menu_, char* name, char* shortcut, int flags){
  return menu_->add(name,shortcut,intercept,this,flags);
}
int C_to_Fl_Callback::menu_add(Fl_Menu_* menu_, char* name, int shortcut, int flags){
  return menu_->add(name,shortcut,intercept,this,flags);
}
void C_to_Fl_Callback::runCallback(Fl_Widget* w) {
  (*callback)((fl_Widget) w, user_data);
}
