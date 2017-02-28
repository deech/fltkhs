#include "Fl_InputC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedInput::Fl_DerivedInput(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Input(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedInput::Fl_DerivedInput(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Input(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedInput::~Fl_DerivedInput(){
    free(overriddenFuncs);
  }
  void Fl_DerivedInput::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Input) this);
    }
    else {
      Fl_Input::draw();
    }
  }

  void Fl_DerivedInput::draw_super(){
    Fl_Input::draw();
  }

  int Fl_DerivedInput::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Input) this,event);
    }
    else {
      i = Fl_Input::handle(event);
    }
    return i;
  }
  int Fl_DerivedInput::handle_super(int event){
    return Fl_Input::handle(event);
  }

  void Fl_DerivedInput::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Input) this,x,y,w,h);
    }
    else {
      Fl_Input::resize(x,y,w,h);
    }
  }

  void Fl_DerivedInput::resize_super(int x, int y, int w, int h){
    Fl_Input::resize(x,y,w,h);
  }
  void Fl_DerivedInput::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Input) this);
    }
    else {
      Fl_Input::show();
    }
  }
  void Fl_DerivedInput::show_super(){
    Fl_Input::show();
  }

  void Fl_DerivedInput::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Input) this);
    }
    else {
      Fl_Input::hide();
    }
  }
  void Fl_DerivedInput::hide_super(){
    Fl_Input::hide();
  }
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Input_parent)(fl_Input input){
    return (fl_Group) (static_cast<Fl_Input*>(input))->parent();
  }
  FL_EXPORT_C(void,Fl_Input_set_parent)(fl_Input input,fl_Group grp){
    (static_cast<Fl_Input*>(input))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Input_type)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->type();
  }
  FL_EXPORT_C(void,Fl_Input_set_type)(fl_Input input,uchar t){
    (static_cast<Fl_Input*>(input))->type(t);
  }

  FL_EXPORT_C(int,Fl_Input_x)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->x();
  }
  FL_EXPORT_C(int,Fl_Input_y)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->y();
  }
  FL_EXPORT_C(int,Fl_Input_w)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->w();
  }
  FL_EXPORT_C(int,Fl_Input_h)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->h();
  }
  FL_EXPORT_C(void,Fl_Input_set_align)(fl_Input input, Fl_Align alignment){
    (static_cast<Fl_Input*>(input))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Input_align)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Input_box)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->box();
  }
  FL_EXPORT_C(void,Fl_Input_set_box)(fl_Input input,Fl_Boxtype new_box){
    (static_cast<Fl_Input*>(input))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Input_color)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->color();
  }
  FL_EXPORT_C(void,Fl_Input_set_color)(fl_Input input,Fl_Color bg){
    (static_cast<Fl_Input*>(input))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Input_set_color_with_bg_sel)(fl_Input input,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Input*>(input))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input_selection_color)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Input_set_selection_color)(fl_Input input,Fl_Color a){
    (static_cast<Fl_Input*>(input))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Input_label)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->label();
  }
  FL_EXPORT_C(void,Fl_Input_copy_label)(fl_Input input,const char* new_label){
    (static_cast<Fl_Input*>(input))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Input_set_label)(fl_Input input,const char* text){
    (static_cast<Fl_Input*>(input))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Input_labeltype)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Input_set_labeltype)(fl_Input input,Fl_Labeltype a){
    (static_cast<Fl_Input*>(input))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Input_set_labelcolor)(fl_Input input,Fl_Color c){
    (static_cast<Fl_Input*>(input))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Input_labelcolor)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Input_labelfont)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Input_set_labelfont)(fl_Input input,Fl_Font c){
    (static_cast<Fl_Input*>(input))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Input_labelsize)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Input_set_labelsize)(fl_Input input,Fl_Fontsize pix){
    (static_cast<Fl_Input*>(input))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Input_image)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->image();
  }
  FL_EXPORT_C(void,Fl_Input_set_image)(fl_Input input,fl_Image pix){
    (static_cast<Fl_Input*>(input))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Input_deimage)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->deimage();
  }
  FL_EXPORT_C(void,Fl_Input_set_deimage)(fl_Input input,fl_Image pix){
    (static_cast<Fl_Input*>(input))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Input_tooltip)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Input_copy_tooltip)(fl_Input input,const char* text){
    (static_cast<Fl_Input*>(input))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Input_set_tooltip)(fl_Input input,const char* text){
    (static_cast<Fl_Input*>(input))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Input_set_callback_with_user_data)(fl_Input input,fl_Callback* cb,void* p){
    Fl_Input* castedInput_dow = (static_cast<Fl_Input*>(input));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Input_set_callback)(fl_Input input,fl_Callback* cb){
    Fl_Input* castedInput_dow = (static_cast<Fl_Input*>(input));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_Input_user_data)(fl_Input input){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Input*>(input))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Input*>(input))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Input_set_user_data)(fl_Input input,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Input*>(input))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Input*>(input))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Input*>(input))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Input_argument)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->argument();
  }
  FL_EXPORT_C(void,Fl_Input_set_argument)(fl_Input input,long v){
    (static_cast<Fl_Input*>(input))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Input_when)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->when();
  }
  FL_EXPORT_C(void,Fl_Input_set_when)(fl_Input input,uchar i){
    (static_cast<Fl_Input*>(input))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Input_visible)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->visible();
  }
  FL_EXPORT_C(int,Fl_Input_visible_r)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Input_set_visible)(fl_Input input){
    (static_cast<Fl_Input*>(input))->visible();
  }
  FL_EXPORT_C(void,Fl_Input_clear_visible)(fl_Input input){
    (static_cast<Fl_Input*>(input))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Input_active)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->active();
  }
  FL_EXPORT_C(int,Fl_Input_active_r)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->active_r();
  }
  FL_EXPORT_C(void,Fl_Input_activate)(fl_Input input){
    (static_cast<Fl_Input*>(input))->activate();
  }
  FL_EXPORT_C(void,Fl_Input_deactivate)(fl_Input input){
    (static_cast<Fl_Input*>(input))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Input_output)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->output();
  }
  FL_EXPORT_C(void,Fl_Input_set_output)(fl_Input input){
    (static_cast<Fl_Input*>(input))->output();
  }
  FL_EXPORT_C(void,Fl_Input_clear_output)(fl_Input input){
    (static_cast<Fl_Input*>(input))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Input_takesevents)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Input_set_changed)(fl_Input input){
    (static_cast<Fl_Input*>(input))->changed();
  }
  FL_EXPORT_C(void,Fl_Input_clear_changed)(fl_Input input){
    (static_cast<Fl_Input*>(input))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Input_take_focus)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Input_set_visible_focus)(fl_Input input){
    (static_cast<Fl_Input*>(input))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input_clear_visible_focus)(fl_Input input){
    (static_cast<Fl_Input*>(input))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input_modify_visible_focus)(fl_Input input,int v){
    (static_cast<Fl_Input*>(input))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Input_visible_focus)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input_do_callback)(fl_Input input){
    (static_cast<Fl_Input*>(input))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Input_do_callback_with_widget_and_user_data)(fl_Input input,fl_Widget w,long arg){
    (static_cast<Fl_Input*>(input))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Input_do_callback_with_widget_and_default_user_data)(fl_Input input,fl_Widget w){
    (static_cast<Fl_Input*>(input))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Input_contains)(fl_Input input,fl_Widget w){
    return (static_cast<Fl_Input*>(input))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Input_inside)(fl_Input input,fl_Widget w){
    return (static_cast<Fl_Input*>(input))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Input_redraw)(fl_Input input){
    (static_cast<Fl_Input*>(input))->redraw();
  }
  FL_EXPORT_C(void,Fl_Input_redraw_label)(fl_Input input){
    (static_cast<Fl_Input*>(input))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Input_damage)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->damage();
  }
  FL_EXPORT_C(void,Fl_Input_clear_damage_with_bitmask)(fl_Input input,uchar c){
    (static_cast<Fl_Input*>(input))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Input_clear_damage)(fl_Input input){
    (static_cast<Fl_Input*>(input))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Input_damage_with_text)(fl_Input input,uchar c){
    (static_cast<Fl_Input*>(input))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Input_damage_inside_widget)(fl_Input input,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Input*>(input))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Input_draw_label_with_xywh_alignment)(fl_Input input,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Input*>(input))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Input_measure_label)(fl_Input input,int* ww,int* hh){
    (static_cast<Fl_Input*>(input))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Input_window)(fl_Input input){
    return (fl_Window) (static_cast<Fl_Input*>(input))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Input_top_window)(fl_Input input){
    return (fl_Window) (static_cast<Fl_Input*>(input))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Input_top_window_offset)(fl_Input input, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Input*>(input))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Input_as_group)(fl_Input input){
    return (fl_Group) (static_cast<Fl_Input*>(input))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Input_as_gl_window)(fl_Input input){
    return (fl_Gl_Window) (static_cast<Fl_Input*>(input))->as_gl_window();
  }
  /* Fl_Input specific functions */
  FL_EXPORT_C(void,Fl_Input_Destroy)(fl_Input input){
    delete (static_cast<Fl_Input*>(input));
  }
  FL_EXPORT_C(int,Fl_Input_set_value)(fl_Input input,const char* text){
    return (static_cast<Fl_Input*>(input))->value(text);
  }
  FL_EXPORT_C(int,Fl_Input_set_value_with_length)(fl_Input input,const char* text,int length){
    return (static_cast<Fl_Input*>(input))->value(text,length);
  }
  FL_EXPORT_C(int,Fl_Input_static_value)(fl_Input input,const char* text){
    return (static_cast<Fl_Input*>(input))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_Input_static_value_with_length)(fl_Input input,const char* text,int length){
    return (static_cast<Fl_Input*>(input))->static_value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_Input_value)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->value();
  }
  FL_EXPORT_C(Fl_Char,Fl_Input_index)(fl_Input input,int i){
    return (static_cast<Fl_Input*>(input))->index(i);
  }
  FL_EXPORT_C(int,Fl_Input_size)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->size();
  }
  FL_EXPORT_C(void,Fl_Input_set_size)(fl_Input input,int W,int H){
    (static_cast<Fl_Input*>(input))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Input_maximum_size)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_Input_set_maximum_size)(fl_Input input,int m){
    (static_cast<Fl_Input*>(input))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_Input_position)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->position();
  }
  FL_EXPORT_C(int,Fl_Input_mark)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->mark();
  }
  FL_EXPORT_C(int,Fl_Input_set_position_with_cursor_mark)(fl_Input input,int p,int m){
    return (static_cast<Fl_Input*>(input))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_Input_set_position_n_n)(fl_Input input,int p){
    return (static_cast<Fl_Input*>(input))->position(p);
  }
  FL_EXPORT_C(int,Fl_Input_set_mark)(fl_Input input,int m){
    return (static_cast<Fl_Input*>(input))->mark(m);
  }
  FL_EXPORT_C(int,Fl_Input_replace)(fl_Input input,int b,int e,const char* text){
    return (static_cast<Fl_Input*>(input))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_Input_replace_with_ilen)(fl_Input input,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_Input*>(input))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_Input_cut)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->cut();
  }
  FL_EXPORT_C(int,Fl_Input_cut_bytes)(fl_Input input,int n){
    return (static_cast<Fl_Input*>(input))->cut(n);
  }
  FL_EXPORT_C(int,Fl_Input_cut_range)(fl_Input input,int a,int b){
    return (static_cast<Fl_Input*>(input))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_Input_insert)(fl_Input input,const char* t){
    return (static_cast<Fl_Input*>(input))->insert(t);
  }
  FL_EXPORT_C(int,Fl_Input_insert_with_length)(fl_Input input,const char* t,int l){
    return (static_cast<Fl_Input*>(input))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_Input_copy)(fl_Input input,int clipboard){
    return (static_cast<Fl_Input*>(input))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_Input_undo)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->undo();
  }
  FL_EXPORT_C(int,Fl_Input_copy_cuts)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_Input_shortcut)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Input_set_shortcut)(fl_Input input,int s){
    (static_cast<Fl_Input*>(input))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Input_textfont)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->textfont();
  }
  FL_EXPORT_C(void,Fl_Input_set_textfont)(fl_Input input,Fl_Font s){
    (static_cast<Fl_Input*>(input))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Input_textsize)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->textsize();
  }
  FL_EXPORT_C(void,Fl_Input_set_textsize)(fl_Input input,Fl_Fontsize s){
    (static_cast<Fl_Input*>(input))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input_textcolor)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Input_set_textcolor)(fl_Input input,Fl_Color n){
    (static_cast<Fl_Input*>(input))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input_cursor_color)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Input_set_cursor_color)(fl_Input input,Fl_Color n){
    (static_cast<Fl_Input*>(input))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Input_input_type)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->input_type();
  }
  FL_EXPORT_C(void,Fl_Input_set_input_type)(fl_Input input,int t){
    (static_cast<Fl_Input*>(input))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_Input_readonly)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->readonly();
  }
  FL_EXPORT_C(void,Fl_Input_set_readonly)(fl_Input input,int b){
    (static_cast<Fl_Input*>(input))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_Input_wrap)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->wrap();
  }
  FL_EXPORT_C(void,Fl_Input_set_wrap)(fl_Input input,int b){
    (static_cast<Fl_Input*>(input))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_Input_tab_nav)(fl_Input input,int val){
    (static_cast<Fl_Input*>(input))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_Input_set_tab_nav)(fl_Input input){
    return (static_cast<Fl_Input*>(input))->tab_nav();
  }
  FL_EXPORT_C(void, Fl_Input_draw)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Input_draw_super)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Input_handle)(fl_Input o, int event){
    return (static_cast<Fl_DerivedInput*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Input_handle_super)(fl_Input o, int event){
    return (static_cast<Fl_DerivedInput*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Input_resize)(fl_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedInput*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Input_resize_super)(fl_Input o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedInput*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Input_show)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Input_show_super)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Input_hide)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Input_hide_super)(fl_Input o){
    (static_cast<Fl_DerivedInput*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Input,    Fl_Input_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedInput* w = new Fl_DerivedInput(X,Y,W,H,fs);
    return (fl_Input)w;
  }
  FL_EXPORT_C(fl_Input,    Fl_Input_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedInput* w = new Fl_DerivedInput(X,Y,W,H,label,fs);
    return (fl_Input)w;
  }
  FL_EXPORT_C(fl_Input,    Fl_OverriddenInput_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedInput* w = new Fl_DerivedInput(X,Y,W,H,fs);
    return (fl_Input)w;
  }
  FL_EXPORT_C(fl_Input,    Fl_OverriddenInput_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedInput* w = new Fl_DerivedInput(X,Y,W,H,label,fs);
    return (fl_Input)w;
  }

#ifdef __cplusplus
}
#endif
