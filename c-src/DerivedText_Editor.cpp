#include "DerivedText_Editor.h"
#include "Fl_CallbackC.h"

#ifndef FL_DOXYGEN
DerivedText_Editor::Key_Binding_With_Callback* DerivedText_Editor::global_key_bindings = 0;
#endif

DerivedText_Editor::DerivedText_Editor(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Text_Editor(X,Y,W,H,l){
  overriddenFuncs = funcs;
  other_data = (void*)0;
}
DerivedText_Editor::DerivedText_Editor(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Text_Editor(X,Y,W,H){
  overriddenFuncs = funcs;
  other_data = (void*)0;
}
DerivedText_Editor::~DerivedText_Editor(){
  free(overriddenFuncs);
}
DerivedText_Editor::DerivedText_Editor(int x,int y,int w,int h,const char* t) : Fl_Text_Editor(x,y,w,h,t){
  key_bindings = 0;
  key_bindings = get_default_keybindings();
  curr_callback_context = 0;
  default_callback_context_ = 0;
  default_key_function_ = C_to_Fl_Callback::intercept;
}
C_to_Fl_Callback* DerivedText_Editor::get_curr_callback_context(){
  return curr_callback_context;
}
C_to_Fl_Callback* DerivedText_Editor::get_default_callback_context(){
  return default_callback_context_;
}
// straight copy from Fl_Text_Editor
static void kill_selection(Fl_Text_Editor* e) {
  if (e->buffer()->selected()) {
    e->insert_position(e->buffer()->primary_selection()->start());
    e->buffer()->remove_selection();
  }
}

void DerivedText_Editor::replace_key_bindings(Key_Binding_With_Callback** l1, Key_Binding_With_Callback** l2){
  remove_all_key_bindings(l1);
  l1 = l2;
}
void DerivedText_Editor::replace_key_bindings(Key_Binding_With_Callback** l) {
  replace_key_bindings(&key_bindings, l);
}
void DerivedText_Editor::add_key_binding(int key,
                                         int state,
                                         C_to_Fl_Callback* callback_context,
                                         Key_Binding_With_Callback** list){
  Key_Binding_With_Callback* curr = *list;
  // iterate to the last binding
  while(curr->next){curr = curr->next;}

  Key_Binding_With_Callback* kb = new Key_Binding_With_Callback();
  kb->key = key;
  kb->state = state;
  kb->callback = C_to_Fl_Callback::intercept;
  kb->callback_context = callback_context;
  kb->next = NULL;
  curr->next = kb;
}

DerivedText_Editor::Key_Binding_With_Callback* DerivedText_Editor::convert_keybindings (Key_Binding* bindings){
  Key_Binding_With_Callback* start = new Key_Binding_With_Callback();
  Key_Binding* curr_super = bindings;
  Key_Binding_With_Callback* curr = start;
  for (;curr_super;curr_super = curr_super->next){
    curr->key = curr_super->key;
    curr->state = curr_super->state;
    curr->callback = C_to_Fl_Callback::intercept;
    C_to_Fl_Callback* cb_object = new C_to_Fl_Callback(&(curr_super->function));
    curr->callback_context = cb_object;
    if (curr_super->next) {
      curr->next = new Key_Binding_With_Callback();
      curr = curr->next;
    }
  }
  return start;
}
C_to_Fl_Callback* DerivedText_Editor::bound_key_function(int key, int state, Key_Binding_With_Callback* list){
  Key_Binding_With_Callback* curr = list;
  for (;curr;curr = curr->next){
    if (curr->key == key)
      if (curr->state == FL_TEXT_EDITOR_ANY_STATE || curr->state == state)
        break;
  }
  if (!curr) return NULL;
  return curr->callback_context;
}

void DerivedText_Editor::remove_all_key_bindings(Key_Binding_With_Callback** list){
  Key_Binding_With_Callback* curr = *list;
  Key_Binding_With_Callback* next;
  for (;curr;curr = next){
    next = curr->next;
    delete curr;
  }
  *list = 0;
}
void DerivedText_Editor::remove_all_key_bindings(){
  remove_all_key_bindings(&key_bindings);
}
void DerivedText_Editor::remove_key_binding(int key, int state, Key_Binding_With_Callback** list) {
  Key_Binding_With_Callback* curr = *list;
  Key_Binding_With_Callback* last = NULL;
  for (;curr;last = curr, curr = curr->next){
    if (curr->key == key && curr->state == state) break;
  }
  if (!curr) return;
  if (last) last->next = curr->next;
  else *list = curr->next;
  delete curr;
}

void DerivedText_Editor::remove_key_binding(int key, int state) {
  remove_key_binding(key,state,&key_bindings);
}
int DerivedText_Editor::handle_key(){
  // Call FLTK's rules to try to turn this into a printing character.
  // This uses the right-hand ctrl key as a "compose prefix" and returns
  // the changes that should be made to the text, as a number of
  // bytes to delete and a string to insert:
  int del = 0;
  if (Fl::compose(del)) {
    if (del) {
      // del is a number of bytes
      int dp = insert_position() - del;
      if ( dp < 0 ) dp = 0;
      buffer()->select(dp, insert_position());
    }
    kill_selection(this);
    if (Fl::event_length()) {
      if (insert_mode()) insert(Fl::event_text());
      else overstrike(Fl::event_text());
    }
#ifdef __APPLE__
    if (Fl::compose_state) {
      int pos = this->insert_position();
      this->buffer()->select(pos - Fl::compose_state, pos);
    }
#endif
    show_insert_position();
    set_changed();
    if (when()&FL_WHEN_CHANGED) do_callback();
    return 1;
  }

  int key = Fl::event_key(), state = Fl::event_state(), c = Fl::event_text()[0];
  state &= FL_SHIFT|FL_CTRL|FL_ALT|FL_META; // only care about these states
  C_to_Fl_Callback* f;
  f = bound_key_function(key, state, global_key_bindings);
  this->curr_callback_context = f;
  if (!f) f = bound_key_function(key, state, key_bindings);
  if (f) return C_to_Fl_Callback::intercept(key, this);
  if (default_key_function_ && !state) return default_key_function_(c, this);
  return 0;
}

void DerivedText_Editor::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Text_Editor) this);
  }
  else {
    Fl_Text_Editor::draw();
  }
}

void DerivedText_Editor::draw_super(){
  Fl_Text_Editor::draw();
}

int DerivedText_Editor::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Text_Editor) this,event);
  }
  else {
    i = Fl_Text_Editor::handle(event);
  }
  return i;
}
int DerivedText_Editor::handle_super(int event){
  return Fl_Text_Editor::handle(event);
}

void DerivedText_Editor::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Text_Editor) this,x,y,w,h);
  }
  else {
    Fl_Text_Editor::resize(x,y,w,h);
  }
}

void DerivedText_Editor::resize_super(int x, int y, int w, int h){
  Fl_Text_Editor::resize(x,y,w,h);
}
void DerivedText_Editor::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Text_Editor) this);
  }
  else {
    Fl_Text_Editor::show();
  }
}
void DerivedText_Editor::show_super(){
  Fl_Text_Editor::show();
}

void DerivedText_Editor::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Text_Editor) this);
  }
  else {
    Fl_Text_Editor::hide();
  }
}
void DerivedText_Editor::hide_super(){
  Fl_Text_Editor::hide();
}
