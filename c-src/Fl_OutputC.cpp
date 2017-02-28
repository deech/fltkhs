#include "Fl_OutputC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedOutput::Fl_DerivedOutput(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Output(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedOutput::Fl_DerivedOutput(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Output(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedOutput::~Fl_DerivedOutput(){
    free(overriddenFuncs);
  }
  void Fl_DerivedOutput::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Output) this);
    }
    else {
      Fl_Output::draw();
    }
  }

  void Fl_DerivedOutput::draw_super(){
    Fl_Output::draw();
  }

  int Fl_DerivedOutput::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Output) this,event);
    }
    else {
      i = Fl_Output::handle(event);
    }
    return i;
  }
  int Fl_DerivedOutput::handle_super(int event){
    return Fl_Output::handle(event);
  }

  void Fl_DerivedOutput::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Output) this,x,y,w,h);
    }
    else {
      Fl_Output::resize(x,y,w,h);
    }
  }

  void Fl_DerivedOutput::resize_super(int x, int y, int w, int h){
    Fl_Output::resize(x,y,w,h);
  }
  void Fl_DerivedOutput::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Output) this);
    }
    else {
      Fl_Output::show();
    }
  }
  void Fl_DerivedOutput::show_super(){
    Fl_Output::show();
  }

  void Fl_DerivedOutput::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Output) this);
    }
    else {
      Fl_Output::hide();
    }
  }
  void Fl_DerivedOutput::hide_super(){
    Fl_Output::hide();
  }


#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Output_parent)(fl_Output output){
    return (fl_Group) (static_cast<Fl_Output*>(output))->parent();
  }
  FL_EXPORT_C(void,Fl_Output_set_parent)(fl_Output output,fl_Group grp){
    (static_cast<Fl_Output*>(output))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Output_type)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->type();
  }
  FL_EXPORT_C(void,Fl_Output_set_type)(fl_Output output,uchar t){
    (static_cast<Fl_Output*>(output))->type(t);
  }

  FL_EXPORT_C(int,Fl_Output_x)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->x();
  }
  FL_EXPORT_C(int,Fl_Output_y)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->y();
  }
  FL_EXPORT_C(int,Fl_Output_w)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->w();
  }
  FL_EXPORT_C(int,Fl_Output_h)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->h();
  }
  FL_EXPORT_C(void,Fl_Output_set_align)(fl_Output output, Fl_Align alignment){
    (static_cast<Fl_Output*>(output))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Output_align)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Output_box)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->box();
  }
  FL_EXPORT_C(void,Fl_Output_set_box)(fl_Output output,Fl_Boxtype new_box){
    (static_cast<Fl_Output*>(output))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Output_color)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->color();
  }
  FL_EXPORT_C(void,Fl_Output_set_color)(fl_Output output,Fl_Color bg){
    (static_cast<Fl_Output*>(output))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Output_set_color_with_bg_sel)(fl_Output output,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Output*>(output))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Output_selection_color)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Output_set_selection_color)(fl_Output output,Fl_Color a){
    (static_cast<Fl_Output*>(output))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Output_label)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->label();
  }
  FL_EXPORT_C(void,Fl_Output_copy_label)(fl_Output output,const char* new_label){
    (static_cast<Fl_Output*>(output))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Output_set_label)(fl_Output output,const char* text){
    (static_cast<Fl_Output*>(output))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Output_labeltype)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Output_set_labeltype)(fl_Output output,Fl_Labeltype a){
    (static_cast<Fl_Output*>(output))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Output_set_labelcolor)(fl_Output output,Fl_Color c){
    (static_cast<Fl_Output*>(output))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Output_labelcolor)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Output_labelfont)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Output_set_labelfont)(fl_Output output,Fl_Font c){
    (static_cast<Fl_Output*>(output))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Output_labelsize)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Output_set_labelsize)(fl_Output output,Fl_Fontsize pix){
    (static_cast<Fl_Output*>(output))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Output_image)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->image();
  }
  FL_EXPORT_C(void,Fl_Output_set_image)(fl_Output output,fl_Image pix){
    (static_cast<Fl_Output*>(output))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Output_deimage)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->deimage();
  }
  FL_EXPORT_C(void,Fl_Output_set_deimage)(fl_Output output,fl_Image pix){
    (static_cast<Fl_Output*>(output))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Output_tooltip)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Output_copy_tooltip)(fl_Output output,const char* text){
    (static_cast<Fl_Output*>(output))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Output_set_tooltip)(fl_Output output,const char* text){
    (static_cast<Fl_Output*>(output))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Output_set_callback_with_user_data)(fl_Output output,fl_Callback* cb,void* p){
    Fl_Output* castedInput_dow = (static_cast<Fl_Output*>(output));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Output_set_callback)(fl_Output output,fl_Callback* cb){
    Fl_Output* castedInput_dow = (static_cast<Fl_Output*>(output));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_Output_user_data)(fl_Output output){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Output*>(output))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Output*>(output))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Output_set_user_data)(fl_Output output,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Output*>(output))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Output*>(output))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Output*>(output))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Output_argument)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->argument();
  }
  FL_EXPORT_C(void,Fl_Output_set_argument)(fl_Output output,long v){
    (static_cast<Fl_Output*>(output))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Output_when)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->when();
  }
  FL_EXPORT_C(void,Fl_Output_set_when)(fl_Output output,uchar i){
    (static_cast<Fl_Output*>(output))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Output_visible)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->visible();
  }
  FL_EXPORT_C(int,Fl_Output_visible_r)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Output_set_visible)(fl_Output output){
    (static_cast<Fl_Output*>(output))->visible();
  }
  FL_EXPORT_C(void,Fl_Output_clear_visible)(fl_Output output){
    (static_cast<Fl_Output*>(output))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Output_active)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->active();
  }
  FL_EXPORT_C(int,Fl_Output_active_r)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->active_r();
  }
  FL_EXPORT_C(void,Fl_Output_activate)(fl_Output output){
    (static_cast<Fl_Output*>(output))->activate();
  }
  FL_EXPORT_C(void,Fl_Output_deactivate)(fl_Output output){
    (static_cast<Fl_Output*>(output))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Output_output)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->output();
  }
  FL_EXPORT_C(void,Fl_Output_set_output)(fl_Output output){
    (static_cast<Fl_Output*>(output))->output();
  }
  FL_EXPORT_C(void,Fl_Output_clear_output)(fl_Output output){
    (static_cast<Fl_Output*>(output))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Output_takesevents)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Output_set_changed)(fl_Output output){
    (static_cast<Fl_Output*>(output))->changed();
  }
  FL_EXPORT_C(void,Fl_Output_clear_changed)(fl_Output output){
    (static_cast<Fl_Output*>(output))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Output_take_focus)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Output_set_visible_focus)(fl_Output output){
    (static_cast<Fl_Output*>(output))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Output_clear_visible_focus)(fl_Output output){
    (static_cast<Fl_Output*>(output))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Output_modify_visible_focus)(fl_Output output,int v){
    (static_cast<Fl_Output*>(output))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Output_visible_focus)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Output_do_callback)(fl_Output output){
    (static_cast<Fl_Output*>(output))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Output_do_callback_with_widget_and_user_data)(fl_Output output,fl_Widget w,long arg){
    (static_cast<Fl_Output*>(output))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Output_do_callback_with_widget_and_default_user_data)(fl_Output output,fl_Widget w){
    (static_cast<Fl_Output*>(output))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Output_contains)(fl_Output output,fl_Widget w){
    return (static_cast<Fl_Output*>(output))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Output_inside)(fl_Output output,fl_Widget w){
    return (static_cast<Fl_Output*>(output))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Output_redraw)(fl_Output output){
    (static_cast<Fl_Output*>(output))->redraw();
  }
  FL_EXPORT_C(void,Fl_Output_redraw_label)(fl_Output output){
    (static_cast<Fl_Output*>(output))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Output_damage)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->damage();
  }
  FL_EXPORT_C(void,Fl_Output_clear_damage_with_bitmask)(fl_Output output,uchar c){
    (static_cast<Fl_Output*>(output))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Output_clear_damage)(fl_Output output){
    (static_cast<Fl_Output*>(output))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Output_damage_with_text)(fl_Output output,uchar c){
    (static_cast<Fl_Output*>(output))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Output_damage_inside_widget)(fl_Output output,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Output*>(output))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Output_draw_label_with_xywh_alignment)(fl_Output output,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Output*>(output))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Output_measure_label)(fl_Output output,int* ww,int* hh){
    (static_cast<Fl_Output*>(output))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Output_window)(fl_Output output){
    return (fl_Window) (static_cast<Fl_Output*>(output))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Output_top_window)(fl_Output output){
    return (fl_Window) (static_cast<Fl_Output*>(output))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Output_top_window_offset)(fl_Output output, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Output*>(output))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Output_as_group)(fl_Output output){
    return (fl_Group) (static_cast<Fl_Output*>(output))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Output_as_gl_window)(fl_Output output){
    return (fl_Gl_Window) (static_cast<Fl_Output*>(output))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Output_Destroy)(fl_Output output){
    delete (static_cast<Fl_Output*>(output));
  }
  FL_EXPORT_C(int,Fl_Output_set_value)(fl_Output output,const char* text){
    return (static_cast<Fl_Output*>(output))->value(text);
  }
  FL_EXPORT_C(int,Fl_Output_set_value_with_length)(fl_Output output,const char* text,int length){
    return (static_cast<Fl_Output*>(output))->value(text,length);
  }
  FL_EXPORT_C(int,Fl_Output_static_value)(fl_Output output,const char* text){
    return (static_cast<Fl_Output*>(output))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_Output_static_value_with_length)(fl_Output output,const char* text,int length){
    return (static_cast<Fl_Output*>(output))->static_value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_Output_value)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->value();
  }
  FL_EXPORT_C(Fl_Char,Fl_Output_index)(fl_Output output,int i){
    return (static_cast<Fl_Output*>(output))->index(i);
  }
  FL_EXPORT_C(int,Fl_Output_size)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->size();
  }
  FL_EXPORT_C(void,Fl_Output_set_size)(fl_Output output,int W,int H){
    (static_cast<Fl_Output*>(output))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Output_maximum_size)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_Output_set_maximum_size)(fl_Output output,int m){
    (static_cast<Fl_Output*>(output))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_Output_position)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->position();
  }
  FL_EXPORT_C(int,Fl_Output_mark)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->mark();
  }
  FL_EXPORT_C(int,Fl_Output_set_position_with_cursor_mark)(fl_Output output,int p,int m){
    return (static_cast<Fl_Output*>(output))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_Output_set_position_n_n)(fl_Output output,int p){
    return (static_cast<Fl_Output*>(output))->position(p);
  }
  FL_EXPORT_C(int,Fl_Output_set_mark)(fl_Output output,int m){
    return (static_cast<Fl_Output*>(output))->mark(m);
  }
  FL_EXPORT_C(int,Fl_Output_replace)(fl_Output output,int b,int e,const char* text){
    return (static_cast<Fl_Output*>(output))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_Output_replace_with_ilen)(fl_Output output,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_Output*>(output))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_Output_cut)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->cut();
  }
  FL_EXPORT_C(int,Fl_Output_cut_bytes)(fl_Output output,int n){
    return (static_cast<Fl_Output*>(output))->cut(n);
  }
  FL_EXPORT_C(int,Fl_Output_cut_range)(fl_Output output,int a,int b){
    return (static_cast<Fl_Output*>(output))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_Output_insert)(fl_Output output,const char* t){
    return (static_cast<Fl_Output*>(output))->insert(t);
  }
  FL_EXPORT_C(int,Fl_Output_insert_with_length)(fl_Output output,const char* t,int l){
    return (static_cast<Fl_Output*>(output))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_Output_copy)(fl_Output output,int clipboard){
    return (static_cast<Fl_Output*>(output))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_Output_undo)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->undo();
  }
  FL_EXPORT_C(int,Fl_Output_copy_cuts)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_Output_shortcut)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Output_set_shortcut)(fl_Output output,int s){
    (static_cast<Fl_Output*>(output))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Output_textfont)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->textfont();
  }
  FL_EXPORT_C(void,Fl_Output_set_textfont)(fl_Output output,Fl_Font s){
    (static_cast<Fl_Output*>(output))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Output_textsize)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->textsize();
  }
  FL_EXPORT_C(void,Fl_Output_set_textsize)(fl_Output output,Fl_Fontsize s){
    (static_cast<Fl_Output*>(output))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Output_textcolor)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Output_set_textcolor)(fl_Output output,Fl_Color n){
    (static_cast<Fl_Output*>(output))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_Output_cursor_color)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Output_set_cursor_color)(fl_Output output,Fl_Color n){
    (static_cast<Fl_Output*>(output))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Output_input_type)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->input_type();
  }
  FL_EXPORT_C(void,Fl_Output_set_input_type)(fl_Output output,int t){
    (static_cast<Fl_Output*>(output))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_Output_readonly)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->readonly();
  }
  FL_EXPORT_C(void,Fl_Output_set_readonly)(fl_Output output,int b){
    (static_cast<Fl_Output*>(output))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_Output_wrap)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->wrap();
  }
  FL_EXPORT_C(void,Fl_Output_set_wrap)(fl_Output output,int b){
    (static_cast<Fl_Output*>(output))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_Output_tab_nav)(fl_Output output,int val){
    (static_cast<Fl_Output*>(output))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_Output_set_tab_nav)(fl_Output output){
    return (static_cast<Fl_Output*>(output))->tab_nav();
  }
  FL_EXPORT_C(fl_Output,    Fl_Output_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedOutput* w = new Fl_DerivedOutput(X,Y,W,H,fs);
    return (fl_Output)w;
  }
  FL_EXPORT_C(fl_Output,    Fl_Output_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedOutput* w = new Fl_DerivedOutput(X,Y,W,H,label,fs);
    return (fl_Output)w;
  }
  FL_EXPORT_C(fl_Output,    Fl_OverriddenOutput_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedOutput* w = new Fl_DerivedOutput(X,Y,W,H,fs);
    return (fl_Output)w;
  }
  FL_EXPORT_C(fl_Output,    Fl_OverriddenOutput_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedOutput* w = new Fl_DerivedOutput(X,Y,W,H,label,fs);
    return (fl_Output)w;
  }
  FL_EXPORT_C(void, Fl_Output_draw)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Output_draw_super)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Output_handle)(fl_Output o, int event){
    return (static_cast<Fl_DerivedOutput*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Output_handle_super)(fl_Output o, int event){
    return (static_cast<Fl_DerivedOutput*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Output_resize)(fl_Output o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedOutput*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Output_resize_super)(fl_Output o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedOutput*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Output_show)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Output_show_super)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Output_hide)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Output_hide_super)(fl_Output o){
    (static_cast<Fl_DerivedOutput*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
