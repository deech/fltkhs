#ifndef __DERIVEDTEXT_EDITOR__
#define __DERIVEDTEXT_EDITOR__
#include "FL/Fl.H"
#include "FL/Fl_Text_Editor.H"
#include "Fl_Types.h"
class C_to_Fl_Callback;

class DerivedText_Editor : public Fl_Text_Editor {
 private:
  C_to_Fl_Callback* curr_callback_context;
  fl_Widget_Virtual_Funcs* overriddenFuncs;
  void* other_data;
 public:
  typedef int (*Key_Func)(int key, DerivedText_Editor* editor);
  struct Key_Binding_With_Callback {
    int               key;
    int               state;
    Key_Func          callback;
    C_to_Fl_Callback* callback_context;
    Key_Binding_With_Callback*   next;
  };
  // points to the head of the list after it's done converting
  static Key_Binding_With_Callback* convert_keybindings (Fl_Text_Editor::Key_Binding* bindings);
  Key_Binding_With_Callback* get_default_keybindings(){
    Fl_Text_Editor::Key_Binding* default_bindings = 0;
    Fl_Text_Editor::add_default_key_bindings(&default_bindings);
    return DerivedText_Editor::convert_keybindings(default_bindings);
  }

  void add_default_key_bindings(Key_Binding_With_Callback** list){
    Key_Binding_With_Callback* default_bindings = get_default_keybindings();
    add_key_binding(default_bindings,list);
  }

  // Unlike Fl_Text_Editor a new binding is appended rather than prepended
  void add_key_binding(int key, int state, C_to_Fl_Callback* callback_context,
                       Key_Binding_With_Callback** list);

  void add_key_binding(Key_Binding_With_Callback* new_bindings,
                       Key_Binding_With_Callback** old_bindings){
    Key_Binding_With_Callback* curr = *old_bindings;
    // iterate to the last binding
    while(curr->next){curr = curr->next;}
    curr->next = new_bindings;
  }
  void default_callback_context(C_to_Fl_Callback* context) {
    default_callback_context_ = context;
  }
  void add_key_binding(int key, int state, C_to_Fl_Callback* context){
    add_key_binding(key,state,context,&key_bindings);
  }
  C_to_Fl_Callback* bound_key_function(int key, int state, Key_Binding_With_Callback* list);
  void remove_all_key_bindings(Key_Binding_With_Callback** list);
  void remove_all_key_bindings();
  void remove_key_binding(int key, int state, Key_Binding_With_Callback** list);
  void remove_key_binding(int key, int state);
  void replace_key_bindings(Key_Binding_With_Callback** l1, Key_Binding_With_Callback** l2);
  void replace_key_bindings(Key_Binding_With_Callback** l);
  Key_Binding_With_Callback* key_bindings;
  C_to_Fl_Callback* get_curr_callback_context();
  C_to_Fl_Callback* get_default_callback_context();
  DerivedText_Editor(int x,int y,int w,int h,const char* t=0);
  DerivedText_Editor(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
  DerivedText_Editor(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
  virtual void draw();
  void draw_super();
  virtual int handle(int event);
  int handle_super(int event);
  virtual void resize(int x, int y, int w, int h);
  void resize_super(int x, int y, int w, int h);
  virtual void show();
  void show_super();
  virtual void hide();
  void hide_super();
  ~DerivedText_Editor();
 protected:
  int handle_key();
  Key_Func default_key_function_;
  static Key_Binding_With_Callback* global_key_bindings;
  C_to_Fl_Callback* default_callback_context_;
};
#endif /* __DERIVEDTEXT_EDITOR__  */
