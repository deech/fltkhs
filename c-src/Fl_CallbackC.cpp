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
  this->user_data = invoker->user_data();
  invoker->callback(intercept, this);
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Callback* callback){
  this->callback = callback;
  this->user_data = NULL;
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Text_Buffer_Callback* callback, void* invoker){
  this->text_buffer_callback = callback;
  this->user_data = invoker;
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Key_Func* key_func){
  this->c_key_func = key_func;
}
C_to_Fl_Callback::C_to_Fl_Callback(Fl_Text_Editor::Key_Func* key_func){
  this->cpp_key_func = key_func;
}
C_to_Fl_Callback::C_to_Fl_Callback(fl_Callback* callback, void* user_data){
  this->callback = callback;
  this->user_data = user_data;
}
void C_to_Fl_Callback::set_callback(Fl_File_Chooser* c){
  if (this->callback) {
    c->callback(intercept, this);
  }
  else {
    void* p = 0;
    c->callback(NULL,p);
  }
}
void C_to_Fl_Callback::set_callback(Fl_Menu_Item* item){
  if (this->callback) {
    item->callback(intercept, this);
  }
  else {
    void* p = 0;
    item->callback(NULL,p);
  }
}
void C_to_Fl_Callback::set_callback(Fl_Text_Buffer* b){
  b->transcoding_warning_action = intercept;
}
void* C_to_Fl_Callback::get_user_data(){
  return this->user_data;
}
void C_to_Fl_Callback::set_user_data(void* user_data){
  this->user_data = user_data;
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_Item* item, int index, char* name, int shortcut, int flags){
  if (this->callback) {
    return item->insert(index,name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return item->insert(index,name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_* menu_, int index, char* name, int shortcut, int flags){
  if (this->callback) {
    return menu_->insert(index,name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->insert(index,name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_insert(Fl_Menu_* menu_, int index, char* name, char* shortcut, int flags){
  if (this->callback) {
    return menu_->insert(index,name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->insert(index,name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_insert(Fl_Sys_Menu_Bar* menu_, int index, char* name, int shortcut, int flags){
  if (this->callback) {
    return menu_->insert(index,name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->insert(index,name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_insert(Fl_Sys_Menu_Bar* menu_, int index, char* name, char* shortcut, int flags){
  if (this->callback) {
    return menu_->insert(index,name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->insert(index,name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Menu_Item* item, char* name, int shortcut, int flags){
  if (this->callback) {
    return item->add(name, shortcut, intercept, this, flags);
  }
  else {
    void* p = 0;
    return item->add(name, shortcut, NULL, p, flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Menu_Item* item, char* name, char* shortcut, int flags){
  if (this->callback) {
    return item->add(name, shortcut, intercept, this, flags);
  }
  else {
    void* p = 0;
    return item->add(name, shortcut, NULL, p, flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Menu_* menu_, char* name, char* shortcut, int flags){
  if (this->callback) {
    return menu_->add(name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->add(name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Menu_* menu_, char* name, int shortcut, int flags){
  if (this->callback) {
    return menu_->add(name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->add(name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Sys_Menu_Bar* menu_, char* name, char* shortcut, int flags){
  if (this->callback) {
    return menu_->add(name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->add(name,shortcut,NULL,p,flags);
  }
}
int C_to_Fl_Callback::menu_add(Fl_Sys_Menu_Bar* menu_, char* name, int shortcut, int flags){
  if (this->callback) {
    return menu_->add(name,shortcut,intercept,this,flags);
  }
  else {
    void* p = 0;
    return menu_->add(name,shortcut,NULL,p,flags);
  }
}
void C_to_Fl_Callback::runCallback(Fl_Widget* w) {
  (*callback)((fl_Widget) w, user_data);
}
void C_to_Fl_Callback::runCallback() {
  (*text_buffer_callback)(user_data);
}
int C_to_Fl_Callback::runCallback(int key, DerivedText_Editor* editor){
  int result = 0;
  if (c_key_func){
    result = (*c_key_func)(key, (fl_Text_Editor) editor);
  }
  else if (cpp_key_func) {
    result = (*cpp_key_func)(key, editor);
  }
  return result;
}
void C_to_Fl_Callback::runCallback(Fl_File_Chooser* c){
  (*callback)((fl_File_Chooser) c, user_data);
}
int C_to_Fl_Callback::intercept(int key, fl_Text_Editor editor){
  DerivedText_Editor* e = (static_cast<DerivedText_Editor*>(editor));
  C_to_Fl_Callback* context = e->get_curr_callback_context();
  return context->runCallback(key,e);
}
