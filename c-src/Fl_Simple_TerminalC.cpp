#include "Fl_Simple_TerminalC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedSimple_Terminal::Fl_DerivedSimple_Terminal(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Simple_Terminal(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSimple_Terminal::Fl_DerivedSimple_Terminal(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Simple_Terminal(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedSimple_Terminal::~Fl_DerivedSimple_Terminal(){
    this->destroy_data();
    free(overriddenFuncs);
  }
void Fl_DerivedSimple_Terminal::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    fl_DoNotCall* fps = NULL;
    int num_fps = C_to_Fl_Callback::function_pointers_to_free(this->overriddenFuncs,fps);
    Function_Pointers_To_Free* res = C_to_Fl_Callback::gather_function_pointers(num_fps+1,num_fps,fps,(fl_DoNotCall)(this->callback()));
    this->overriddenFuncs->destroy_data((fl_Simple_Terminal)this,res);
    if (fps) { free(fps); }
    free(res);
  }
}
  void Fl_DerivedSimple_Terminal::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Simple_Terminal) this);
    }
    else {
      Fl_Simple_Terminal::draw();
    }
  }
  void Fl_DerivedSimple_Terminal::draw_super(){
    Fl_Simple_Terminal::draw();
  }
  int Fl_DerivedSimple_Terminal::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Simple_Terminal) this,event);
    }
    else {
      i = Fl_Simple_Terminal::handle(event);
    }
    return i;
  }
  int Fl_DerivedSimple_Terminal::handle_super(int event){
    return Fl_Simple_Terminal::handle(event);
  }

  void Fl_DerivedSimple_Terminal::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Simple_Terminal) this,x,y,w,h);
    }
    else {
      Fl_Simple_Terminal::resize(x,y,w,h);
    }
  }

  void Fl_DerivedSimple_Terminal::resize_super(int x, int y, int w, int h){
    Fl_Simple_Terminal::resize(x,y,w,h);
  }
  void Fl_DerivedSimple_Terminal::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Simple_Terminal) this);
    }
    else {
      Fl_Simple_Terminal::show();
    }
  }
  void Fl_DerivedSimple_Terminal::show_super(){
    Fl_Simple_Terminal::show();
  }

  void Fl_DerivedSimple_Terminal::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Simple_Terminal) this);
    }
    else {
      Fl_Simple_Terminal::hide();
    }
  }
  void Fl_DerivedSimple_Terminal::hide_super(){
    Fl_Simple_Terminal::hide();
  }
#endif
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_stay_at_bottom)(fl_Simple_Terminal t, int b) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->stay_at_bottom(b > 0);
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_stay_at_bottom)(fl_Simple_Terminal t) {
    bool ret = (static_cast<Fl_DerivedSimple_Terminal*>(t))->stay_at_bottom();
    if (ret) { return 1; } else { return 0; }
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_ansi)(fl_Simple_Terminal t, int b) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->ansi(b > 0);
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_ansi)(fl_Simple_Terminal t) {
    bool ret = (static_cast<Fl_DerivedSimple_Terminal*>(t))->ansi();
    if (ret) { return 1; } else { return 0; }
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_history_lines)(fl_Simple_Terminal t, int i) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->history_lines(i);
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_history_lines)(fl_Simple_Terminal t) {
    return (static_cast<Fl_DerivedSimple_Terminal*>(t))->history_lines();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_normal_style_index)(fl_Simple_Terminal t, int i) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->normal_style_index(i);
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_normal_style_index)(fl_Simple_Terminal t) {
    return (static_cast<Fl_DerivedSimple_Terminal*>(t))->normal_style_index();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_current_style_index)(fl_Simple_Terminal t, int i) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->current_style_index(i);
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_current_style_index)(fl_Simple_Terminal t) {
    return (static_cast<Fl_DerivedSimple_Terminal*>(t))->current_style_index();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_style_table)(fl_Simple_Terminal t, Style_Table_Entry *styleTable, int stable_size, int normal_style_index){
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->style_table((static_cast<Fl_Text_Display::Style_Table_Entry*>((void*)styleTable)), stable_size, normal_style_index);
  };
  FL_EXPORT_C(Style_Table_Entry*, Fl_Simple_Terminal_get_style_table)(fl_Simple_Terminal t) {
    const Fl_Text_Display::Style_Table_Entry* s = (static_cast<Fl_DerivedSimple_Terminal*>(t))->style_table();
    return (Style_Table_Entry*)s;
  };
  FL_EXPORT_C(int, Fl_Simple_Terminal_get_style_table_size)(fl_Simple_Terminal t) {
    return (static_cast<Fl_DerivedSimple_Terminal*>(t))->style_table_size();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_append)(fl_Simple_Terminal t, const char *s){
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->append(s);
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_set_text)(fl_Simple_Terminal t, const char *s){
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->text(s);
  };
  FL_EXPORT_C(const char*, Fl_Simple_Terminal_get_text)(fl_Simple_Terminal t) {
    return (static_cast<Fl_DerivedSimple_Terminal*>(t))->text();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_clear)(fl_Simple_Terminal t) {
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->clear();
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_remove_lines)(fl_Simple_Terminal t, int start, int count){
    (static_cast<Fl_DerivedSimple_Terminal*>(t))->remove_lines(start,count);
  };
  FL_EXPORT_C(fl_Simple_Terminal,    Fl_Simple_Terminal_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSimple_Terminal* w = new Fl_DerivedSimple_Terminal(X,Y,W,H,fs);
    return (fl_Simple_Terminal)w;
  };
  FL_EXPORT_C(fl_Simple_Terminal,    Fl_Simple_Terminal_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedSimple_Terminal* w = new Fl_DerivedSimple_Terminal(X,Y,W,H,label,fs);
    return (fl_Simple_Terminal)w;
  };
  FL_EXPORT_C(fl_Simple_Terminal,    Fl_OverriddenSimple_Terminal_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSimple_Terminal* w = new Fl_DerivedSimple_Terminal(X,Y,W,H,fs);
    return (fl_Simple_Terminal)w;
  };
  FL_EXPORT_C(fl_Simple_Terminal,    Fl_OverriddenSimple_Terminal_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedSimple_Terminal* w = new Fl_DerivedSimple_Terminal(X,Y,W,H,label,fs);
    return (fl_Simple_Terminal)w;
  };
  FL_EXPORT_C(void, Fl_Simple_Terminal_draw_super)(fl_Simple_Terminal o){
    (static_cast<Fl_DerivedSimple_Terminal*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Simple_Terminal_handle_super)(fl_Simple_Terminal o, int event){
    return (static_cast<Fl_DerivedSimple_Terminal*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Simple_Terminal_resize_super)(fl_Simple_Terminal o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedSimple_Terminal*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Simple_Terminal_show_super)(fl_Simple_Terminal o){
    (static_cast<Fl_DerivedSimple_Terminal*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Simple_Terminal_hide_super)(fl_Simple_Terminal o){
    (static_cast<Fl_DerivedSimple_Terminal*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
