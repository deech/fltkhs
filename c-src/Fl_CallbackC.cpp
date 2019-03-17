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

int C_to_Fl_Callback::function_pointers_to_free(fl_Widget_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 9;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->draw);
  res[1] = (fl_DoNotCall)(fs->handle);
  res[2] = (fl_DoNotCall)(fs->resize);
  res[3] = (fl_DoNotCall)(fs->show );
  res[4] = (fl_DoNotCall)(fs->hide);
  res[5] = (fl_DoNotCall)(fs->as_window);
  res[6] = (fl_DoNotCall)(fs->as_gl_window);
  res[7] = (fl_DoNotCall)(fs->as_group);
  res[8] = (fl_DoNotCall)(fs->destroy_data);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Table_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 13;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->draw);
  res[1] = (fl_DoNotCall)(fs->handle);
  res[2] = (fl_DoNotCall)(fs->resize);
  res[3] = (fl_DoNotCall)(fs->show);
  res[4] = (fl_DoNotCall)(fs->hide);
  res[5] = (fl_DoNotCall)(fs->as_window);
  res[6] = (fl_DoNotCall)(fs->as_gl_window);
  res[7] = (fl_DoNotCall)(fs->as_group);
  res[8] = (fl_DoNotCall)(fs->draw_cell);
  res[9] = (fl_DoNotCall)(fs->clear);
  res[11] = (fl_DoNotCall)(fs->set_cols);
  res[12] = (fl_DoNotCall)(fs->destroy_data);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Window_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 9;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->draw);
  res[1] = (fl_DoNotCall)(fs->handle);
  res[2] = (fl_DoNotCall)(fs->resize);
  res[3] = (fl_DoNotCall)(fs->show);
  res[4] = (fl_DoNotCall)(fs->hide);
  res[5] = (fl_DoNotCall)(fs->as_window);
  res[6] = (fl_DoNotCall)(fs->as_gl_window);
  res[7] = (fl_DoNotCall)(fs->as_group);
  res[8] = (fl_DoNotCall)(fs->flush);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Browser_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 10;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->draw);
  res[1] = (fl_DoNotCall)(fs->handle);
  res[2] = (fl_DoNotCall)(fs->resize);
  res[3] = (fl_DoNotCall)(fs->as_window);
  res[4] = (fl_DoNotCall)(fs->as_gl_window);
  res[5] = (fl_DoNotCall)(fs->as_group);
  res[6] = (fl_DoNotCall)(fs->show);
  res[7] = (fl_DoNotCall)(fs->show_with_line);
  res[8] = (fl_DoNotCall)(fs->hide);
  res[9] = (fl_DoNotCall)(fs->hide_with_line);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Image_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 5;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->color_average);
  res[1] = (fl_DoNotCall)(fs->copy);
  res[2] = (fl_DoNotCall)(fs->desaturate);
  res[3] = (fl_DoNotCall)(fs->draw);
  res[4] = (fl_DoNotCall)(fs->uncache);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Valuator_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 9;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->draw);
  res[1] = (fl_DoNotCall)(fs->handle);
  res[2] = (fl_DoNotCall)(fs->resize);
  res[3] = (fl_DoNotCall)(fs->show);
  res[4] = (fl_DoNotCall)(fs->hide);
  res[5] = (fl_DoNotCall)(fs->as_window);
  res[6] = (fl_DoNotCall)(fs->as_gl_window);
  res[7] = (fl_DoNotCall)(fs->as_group);
  res[8] = (fl_DoNotCall)(fs->format);
  return fsSize;
}

int C_to_Fl_Callback::function_pointers_to_free(fl_Tab_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 6;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->tab_draw);
  res[1] = (fl_DoNotCall)(fs->tab_positions);
  res[2] = (fl_DoNotCall)(fs->tab_height);
  res[3] = (fl_DoNotCall)(fs->tab_which);
  res[4] = (fl_DoNotCall)(fs->redraw_tabs);
  res[5] = (fl_DoNotCall)(fs->tab_client_area);
  return fsSize;
}


int C_to_Fl_Callback::function_pointers_to_free(fl_Color_Chooser_Virtual_Funcs* fs, fl_DoNotCall* res){
  int fsSize = 10;
  res = (fl_DoNotCall*)malloc(fsSize * sizeof(fl_DoNotCall));
  res[0] = (fl_DoNotCall)(fs->get_mode);
  res[1] = (fl_DoNotCall)(fs->set_mode);
  res[2] = (fl_DoNotCall)(fs->hue);
  res[3] = (fl_DoNotCall)(fs->saturation);
  res[4] = (fl_DoNotCall)(fs->value);
  res[5] = (fl_DoNotCall)(fs->r);
  res[6] = (fl_DoNotCall)(fs->g);
  res[7] = (fl_DoNotCall)(fs->b);
  res[8] = (fl_DoNotCall)(fs->hsv);
  res[9] = (fl_DoNotCall)(fs->rgb);
  return fsSize;
}

Function_Pointers_To_Free* C_to_Fl_Callback::gather_function_pointers(int total_fps, int num_fps, fl_DoNotCall* fps, ...) {
    va_list args;
    va_start(args, fps);
    Function_Pointers_To_Free* fps_to_free = (Function_Pointers_To_Free*)malloc(sizeof(Function_Pointers_To_Free));
    if (num_fps >= total_fps) {
      fps_to_free->length = num_fps;
      fps_to_free->function_pointer_array = fps;
    }
    else {
      int optional_fp_count = total_fps - num_fps;
      fl_DoNotCall* realloced_fps = (fl_DoNotCall*) realloc(fps,total_fps * sizeof(fl_DoNotCall));
      int new_fps_length = num_fps + optional_fp_count;
      int i;
      for (i=num_fps;i<new_fps_length;i++){
        realloced_fps[i] = va_arg(args, fl_DoNotCall);
      }
      fps_to_free->length = total_fps;
      fps_to_free->function_pointer_array = realloced_fps;
    }
    va_end(args);
    return fps_to_free;
}
