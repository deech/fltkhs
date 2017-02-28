#include "Fl_File_InputC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedFile_Input::Fl_DerivedFile_Input(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_File_Input(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedFile_Input::Fl_DerivedFile_Input(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_File_Input(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedFile_Input::~Fl_DerivedFile_Input(){
    free(overriddenFuncs);
  }
  void Fl_DerivedFile_Input::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_File_Input) this);
    }
    else {
      Fl_File_Input::draw();
    }
  }

  void Fl_DerivedFile_Input::draw_super(){
    Fl_File_Input::draw();
  }

  int Fl_DerivedFile_Input::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_File_Input) this,event);
    }
    else {
      i = Fl_File_Input::handle(event);
    }
    return i;
  }
  int Fl_DerivedFile_Input::handle_super(int event){
    return Fl_File_Input::handle(event);
  }

  void Fl_DerivedFile_Input::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_File_Input) this,x,y,w,h);
    }
    else {
      Fl_File_Input::resize(x,y,w,h);
    }
  }

  void Fl_DerivedFile_Input::resize_super(int x, int y, int w, int h){
    Fl_File_Input::resize(x,y,w,h);
  }
  void Fl_DerivedFile_Input::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_File_Input) this);
    }
    else {
      Fl_File_Input::show();
    }
  }
  void Fl_DerivedFile_Input::show_super(){
    Fl_File_Input::show();
  }

  void Fl_DerivedFile_Input::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_File_Input) this);
    }
    else {
      Fl_File_Input::hide();
    }
  }
  void Fl_DerivedFile_Input::hide_super(){
    Fl_File_Input::hide();
  }
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_File_Input_parent)(fl_File_Input file_input){
    return (fl_Group) (static_cast<Fl_File_Input*>(file_input))->parent();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_parent)(fl_File_Input file_input,fl_Group grp){
    (static_cast<Fl_File_Input*>(file_input))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_File_Input_type)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->type();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_type)(fl_File_Input file_input,uchar t){
    (static_cast<Fl_File_Input*>(file_input))->type(t);
  }

  FL_EXPORT_C(int,Fl_File_Input_x)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->x();
  }
  FL_EXPORT_C(int,Fl_File_Input_y)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->y();
  }
  FL_EXPORT_C(int,Fl_File_Input_w)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->w();
  }
  FL_EXPORT_C(int,Fl_File_Input_h)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->h();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_align)(fl_File_Input file_input, Fl_Align alignment){
    (static_cast<Fl_File_Input*>(file_input))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_File_Input_align)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_File_Input_box)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->box();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_box)(fl_File_Input file_input,Fl_Boxtype new_box){
    (static_cast<Fl_File_Input*>(file_input))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Input_color)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->color();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_color)(fl_File_Input file_input,Fl_Color bg){
    (static_cast<Fl_File_Input*>(file_input))->color(bg);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_color_with_bg_sel)(fl_File_Input file_input,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_File_Input*>(file_input))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Input_selection_color)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->selection_color();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_selection_color)(fl_File_Input file_input,Fl_Color a){
    (static_cast<Fl_File_Input*>(file_input))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_File_Input_label)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->label();
  }
  FL_EXPORT_C(void,Fl_File_Input_copy_label)(fl_File_Input file_input,const char* new_label){
    (static_cast<Fl_File_Input*>(file_input))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_label)(fl_File_Input file_input,const char* text){
    (static_cast<Fl_File_Input*>(file_input))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_File_Input_labeltype)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->labeltype();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_labeltype)(fl_File_Input file_input,Fl_Labeltype a){
    (static_cast<Fl_File_Input*>(file_input))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_labelcolor)(fl_File_Input file_input,Fl_Color c){
    (static_cast<Fl_File_Input*>(file_input))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_File_Input_labelcolor)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_File_Input_labelfont)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->labelfont();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_labelfont)(fl_File_Input file_input,Fl_Font c){
    (static_cast<Fl_File_Input*>(file_input))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_File_Input_labelsize)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->labelsize();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_labelsize)(fl_File_Input file_input,Fl_Fontsize pix){
    (static_cast<Fl_File_Input*>(file_input))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_File_Input_image)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->image();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_image)(fl_File_Input file_input,fl_Image pix){
    (static_cast<Fl_File_Input*>(file_input))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_File_Input_deimage)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->deimage();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_deimage)(fl_File_Input file_input,fl_Image pix){
    (static_cast<Fl_File_Input*>(file_input))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_File_Input_tooltip)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->tooltip();
  }
  FL_EXPORT_C(void,Fl_File_Input_copy_tooltip)(fl_File_Input file_input,const char* text){
    (static_cast<Fl_File_Input*>(file_input))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_tooltip)(fl_File_Input file_input,const char* text){
    (static_cast<Fl_File_Input*>(file_input))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_callback_with_user_data)(fl_File_Input file_input,fl_Callback* cb,void* p){
    Fl_File_Input* castedInput_dow = (static_cast<Fl_File_Input*>(file_input));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_File_Input_set_callback)(fl_File_Input file_input,fl_Callback* cb){
    Fl_File_Input* castedInput_dow = (static_cast<Fl_File_Input*>(file_input));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_File_Input_user_data)(fl_File_Input file_input){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Input*>(file_input))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_File_Input*>(file_input))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_File_Input_set_user_data)(fl_File_Input file_input,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Input*>(file_input))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_File_Input*>(file_input))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_File_Input*>(file_input))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_File_Input_argument)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->argument();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_argument)(fl_File_Input file_input,long v){
    (static_cast<Fl_File_Input*>(file_input))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_File_Input_when)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->when();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_when)(fl_File_Input file_input,uchar i){
    (static_cast<Fl_File_Input*>(file_input))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_File_Input_visible)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->visible();
  }
  FL_EXPORT_C(int,Fl_File_Input_visible_r)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->visible_r();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_visible)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->visible();
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_visible)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Input_active)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->active();
  }
  FL_EXPORT_C(int,Fl_File_Input_active_r)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->active_r();
  }
  FL_EXPORT_C(void,Fl_File_Input_activate)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->activate();
  }
  FL_EXPORT_C(void,Fl_File_Input_deactivate)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Input_output)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->output();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_output)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->output();
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_output)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Input_takesevents)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->takesevents();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_changed)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->changed();
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_changed)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_File_Input_take_focus)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->take_focus();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_visible_focus)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_visible_focus)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_File_Input_modify_visible_focus)(fl_File_Input file_input,int v){
    (static_cast<Fl_File_Input*>(file_input))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_File_Input_visible_focus)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_File_Input_do_callback)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->do_callback();
  }
  FL_EXPORT_C(void,Fl_File_Input_do_callback_with_widget_and_user_data)(fl_File_Input file_input,fl_Widget w,long arg){
    (static_cast<Fl_File_Input*>(file_input))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_File_Input_do_callback_with_widget_and_default_user_data)(fl_File_Input file_input,fl_Widget w){
    (static_cast<Fl_File_Input*>(file_input))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_File_Input_contains)(fl_File_Input file_input,fl_Widget w){
    return (static_cast<Fl_File_Input*>(file_input))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_File_Input_inside)(fl_File_Input file_input,fl_Widget w){
    return (static_cast<Fl_File_Input*>(file_input))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_File_Input_redraw)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->redraw();
  }
  FL_EXPORT_C(void,Fl_File_Input_redraw_label)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_File_Input_damage)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->damage();
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_damage_with_bitmask)(fl_File_Input file_input,uchar c){
    (static_cast<Fl_File_Input*>(file_input))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_File_Input_clear_damage)(fl_File_Input file_input){
    (static_cast<Fl_File_Input*>(file_input))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_File_Input_damage_with_text)(fl_File_Input file_input,uchar c){
    (static_cast<Fl_File_Input*>(file_input))->damage(c);
  }
  FL_EXPORT_C(void,Fl_File_Input_damage_inside_widget)(fl_File_Input file_input,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_File_Input*>(file_input))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_File_Input_draw_label_with_xywh_alignment)(fl_File_Input file_input,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_File_Input*>(file_input))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_File_Input_measure_label)(fl_File_Input file_input,int* ww,int* hh){
    (static_cast<Fl_File_Input*>(file_input))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_File_Input_window)(fl_File_Input file_input){
    return (fl_Window) (static_cast<Fl_File_Input*>(file_input))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_File_Input_top_window)(fl_File_Input file_input){
    return (fl_Window) (static_cast<Fl_File_Input*>(file_input))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_File_Input_top_window_offset)(fl_File_Input file_input, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_File_Input*>(file_input))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_File_Input_as_group)(fl_File_Input file_input){
    return (fl_Group) (static_cast<Fl_File_Input*>(file_input))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_File_Input_as_gl_window)(fl_File_Input file_input){
    return (fl_Gl_Window) (static_cast<Fl_File_Input*>(file_input))->as_gl_window();
  }
  /* Fl_File_Input specific functions */
  FL_EXPORT_C(void,Fl_File_Input_Destroy)(fl_File_Input file_input){
    delete (static_cast<Fl_File_Input*>(file_input));
  }
  FL_EXPORT_C(int,Fl_File_Input_static_value)(fl_File_Input file_input,const char* text){
    return (static_cast<Fl_File_Input*>(file_input))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_File_Input_static_value_with_length)(fl_File_Input file_input,const char* text,int length){
    return (static_cast<Fl_File_Input*>(file_input))->static_value(text,length);
  }
  FL_EXPORT_C(Fl_Char,Fl_File_Input_index)(fl_File_Input file_input,int i){
    return (static_cast<Fl_File_Input*>(file_input))->index(i);
  }
  FL_EXPORT_C(int,Fl_File_Input_size)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->size();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_size)(fl_File_Input file_input,int W,int H){
    (static_cast<Fl_File_Input*>(file_input))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_File_Input_maximum_size)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_maximum_size)(fl_File_Input file_input,int m){
    (static_cast<Fl_File_Input*>(file_input))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_File_Input_position)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->position();
  }
  FL_EXPORT_C(int,Fl_File_Input_mark)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->mark();
  }
  FL_EXPORT_C(int,Fl_File_Input_set_position_with_cursor_mark)(fl_File_Input file_input,int p,int m){
    return (static_cast<Fl_File_Input*>(file_input))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_File_Input_set_position_n_n)(fl_File_Input file_input,int p){
    return (static_cast<Fl_File_Input*>(file_input))->position(p);
  }
  FL_EXPORT_C(int,Fl_File_Input_set_mark)(fl_File_Input file_input,int m){
    return (static_cast<Fl_File_Input*>(file_input))->mark(m);
  }
  FL_EXPORT_C(int,Fl_File_Input_replace)(fl_File_Input file_input,int b,int e,const char* text){
    return (static_cast<Fl_File_Input*>(file_input))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_File_Input_replace_with_ilen)(fl_File_Input file_input,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_File_Input*>(file_input))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_File_Input_cut)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->cut();
  }
  FL_EXPORT_C(int,Fl_File_Input_cut_bytes)(fl_File_Input file_input,int n){
    return (static_cast<Fl_File_Input*>(file_input))->cut(n);
  }
  FL_EXPORT_C(int,Fl_File_Input_cut_range)(fl_File_Input file_input,int a,int b){
    return (static_cast<Fl_File_Input*>(file_input))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_File_Input_insert)(fl_File_Input file_input,const char* t){
    return (static_cast<Fl_File_Input*>(file_input))->insert(t);
  }
  FL_EXPORT_C(int,Fl_File_Input_insert_with_length)(fl_File_Input file_input,const char* t,int l){
    return (static_cast<Fl_File_Input*>(file_input))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_File_Input_copy)(fl_File_Input file_input,int clipboard){
    return (static_cast<Fl_File_Input*>(file_input))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_File_Input_undo)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->undo();
  }
  FL_EXPORT_C(int,Fl_File_Input_copy_cuts)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_File_Input_shortcut)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->shortcut();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_shortcut)(fl_File_Input file_input,int s){
    (static_cast<Fl_File_Input*>(file_input))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_File_Input_textfont)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->textfont();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_textfont)(fl_File_Input file_input,Fl_Font s){
    (static_cast<Fl_File_Input*>(file_input))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_File_Input_textsize)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->textsize();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_textsize)(fl_File_Input file_input,Fl_Fontsize s){
    (static_cast<Fl_File_Input*>(file_input))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Input_textcolor)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->textcolor();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_textcolor)(fl_File_Input file_input,Fl_Color n){
    (static_cast<Fl_File_Input*>(file_input))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Input_cursor_color)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_cursor_color)(fl_File_Input file_input,Fl_Color n){
    (static_cast<Fl_File_Input*>(file_input))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_File_Input_input_type)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->input_type();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_input_type)(fl_File_Input file_input,int t){
    (static_cast<Fl_File_Input*>(file_input))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_File_Input_readonly)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->readonly();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_readonly)(fl_File_Input file_input,int b){
    (static_cast<Fl_File_Input*>(file_input))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_File_Input_wrap)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->wrap();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_wrap)(fl_File_Input file_input,int b){
    (static_cast<Fl_File_Input*>(file_input))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_File_Input_tab_nav)(fl_File_Input file_input,int val){
    (static_cast<Fl_File_Input*>(file_input))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_File_Input_set_tab_nav)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->tab_nav();
  }
  FL_EXPORT_C(int,Fl_File_Input_set_value)(fl_File_Input file_input,const char* text){
    return (static_cast<Fl_File_Input*>(file_input))->value(text);
  }
  FL_EXPORT_C(int,Fl_File_Input_set_value_with_length)(fl_File_Input file_input,const char* text,int length){
    return (static_cast<Fl_File_Input*>(file_input))->value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_File_Input_value)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->value();
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Input_errorcolor)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->errorcolor();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_errorcolor)(fl_File_Input file_input,Fl_Color color){
    (static_cast<Fl_File_Input*>(file_input))->errorcolor(color);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_File_Input_down_box)(fl_File_Input file_input){
    return (static_cast<Fl_File_Input*>(file_input))->down_box();
  }
  FL_EXPORT_C(void,Fl_File_Input_set_down_box)(fl_File_Input file_input,Fl_Boxtype color){
    (static_cast<Fl_File_Input*>(file_input))->down_box(color);
  }
  FL_EXPORT_C(void, Fl_File_Input_draw)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_File_Input_draw_super)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_File_Input_handle)(fl_File_Input o, int event){
    return (static_cast<Fl_DerivedFile_Input*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_File_Input_handle_super)(fl_File_Input o, int event){
    return (static_cast<Fl_DerivedFile_Input*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_File_Input_resize)(fl_File_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedFile_Input*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_File_Input_resize_super)(fl_File_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedFile_Input*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_File_Input_show)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_File_Input_show_super)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_File_Input_hide)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_File_Input_hide_super)(fl_File_Input o){
    (static_cast<Fl_DerivedFile_Input*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_File_Input,    Fl_File_Input_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedFile_Input* w = new Fl_DerivedFile_Input(X,Y,W,H,fs);
    return (fl_File_Input)w;
  }
  FL_EXPORT_C(fl_File_Input,    Fl_File_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedFile_Input* w = new Fl_DerivedFile_Input(X,Y,W,H,label,fs);
    return (fl_File_Input)w;
  }
  FL_EXPORT_C(fl_File_Input,    Fl_OverriddenFile_Input_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedFile_Input* w = new Fl_DerivedFile_Input(X,Y,W,H,fs);
    return (fl_File_Input)w;
  }
  FL_EXPORT_C(fl_File_Input,    Fl_OverriddenFile_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedFile_Input* w = new Fl_DerivedFile_Input(X,Y,W,H,label,fs);
    return (fl_File_Input)w;
  }
#ifdef __cplusplus
}
#endif
