#include "Fl_Round_ButtonC.h"

#ifdef __cplusplus
EXPORT {
  Fl_DerivedRound_Button::Fl_DerivedRound_Button(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Round_Button(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedRound_Button::Fl_DerivedRound_Button(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Round_Button(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedRound_Button::~Fl_DerivedRound_Button(){
    this->destroy_data();
    free(overriddenFuncs);
  }
void Fl_DerivedRound_Button::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    fl_DoNotCall* fps = NULL;
    int num_fps = C_to_Fl_Callback::function_pointers_to_free(this->overriddenFuncs,fps);
    Function_Pointers_To_Free* res = C_to_Fl_Callback::gather_function_pointers(num_fps+1,num_fps,fps,(fl_DoNotCall)(this->callback()));
    this->overriddenFuncs->destroy_data((fl_Round_Button)this,res);
    if (fps) { free(fps); }
    free(res);
  }
}
  void Fl_DerivedRound_Button::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Round_Button) this);
    }
    else {
      Fl_Round_Button::draw();
    }
  }

  void Fl_DerivedRound_Button::draw_super(){
    Fl_Round_Button::draw();
  }

  int Fl_DerivedRound_Button::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Round_Button) this,event);
    }
    else {
      i = Fl_Round_Button::handle(event);
    }
    return i;
  }
  int Fl_DerivedRound_Button::handle_super(int event){
    return Fl_Round_Button::handle(event);
  }

  void Fl_DerivedRound_Button::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Round_Button) this,x,y,w,h);
    }
    else {
      Fl_Round_Button::resize(x,y,w,h);
    }
  }

  void Fl_DerivedRound_Button::resize_super(int x, int y, int w, int h){
    Fl_Round_Button::resize(x,y,w,h);
  }
  void Fl_DerivedRound_Button::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Round_Button) this);
    }
    else {
      Fl_Round_Button::show();
    }
  }
  void Fl_DerivedRound_Button::show_super(){
    Fl_Round_Button::show();
  }

  void Fl_DerivedRound_Button::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Round_Button) this);
    }
    else {
      Fl_Round_Button::hide();
    }
  }
  void Fl_DerivedRound_Button::hide_super(){
    Fl_Round_Button::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Round_Button_parent)(fl_Round_Button b){
    return (fl_Group) (static_cast<Fl_Round_Button*>(b))->parent();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_parent)(fl_Round_Button b,fl_Group grp){
    (static_cast<Fl_Round_Button*>(b))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Round_Button_type)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->type();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_type)(fl_Round_Button b,uchar t){
    (static_cast<Fl_Round_Button*>(b))->type(t);
  }

  FL_EXPORT_C(int,Fl_Round_Button_x)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->x();
  }
  FL_EXPORT_C(int,Fl_Round_Button_y)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->y();
  }
  FL_EXPORT_C(int,Fl_Round_Button_w)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->w();
  }
  FL_EXPORT_C(int,Fl_Round_Button_h)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->h();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_align)(fl_Round_Button round_button, Fl_Align alignment){
    (static_cast<Fl_Round_Button*>(round_button))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Round_Button_align)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Round_Button_box)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->box();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_box)(fl_Round_Button b,Fl_Boxtype new_box){
    (static_cast<Fl_Round_Button*>(b))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Round_Button_color)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->color();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_color)(fl_Round_Button b,Fl_Color bg){
    (static_cast<Fl_Round_Button*>(b))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_color_with_bg_sel)(fl_Round_Button b,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Round_Button*>(b))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Round_Button_selection_color)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_selection_color)(fl_Round_Button b,Fl_Color a){
    (static_cast<Fl_Round_Button*>(b))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Round_Button_label)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->label();
  }
  FL_EXPORT_C(void,Fl_Round_Button_copy_label)(fl_Round_Button b,const char* new_label){
    (static_cast<Fl_Round_Button*>(b))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_label)(fl_Round_Button b,const char* text){
    (static_cast<Fl_Round_Button*>(b))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Round_Button_labeltype)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_labeltype)(fl_Round_Button b,Fl_Labeltype a){
    (static_cast<Fl_Round_Button*>(b))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_labelcolor)(fl_Round_Button b,Fl_Color c){
    (static_cast<Fl_Round_Button*>(b))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Round_Button_labelcolor)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Round_Button_labelfont)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_labelfont)(fl_Round_Button b,Fl_Font c){
    (static_cast<Fl_Round_Button*>(b))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Round_Button_labelsize)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_labelsize)(fl_Round_Button b,Fl_Fontsize pix){
    (static_cast<Fl_Round_Button*>(b))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Round_Button_image)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->image();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_image)(fl_Round_Button b,fl_Image pix){
    (static_cast<Fl_Round_Button*>(b))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Round_Button_deimage)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->deimage();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_deimage)(fl_Round_Button b,fl_Image pix){
    (static_cast<Fl_Round_Button*>(b))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Round_Button_tooltip)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Round_Button_copy_tooltip)(fl_Round_Button b,const char* text){
    (static_cast<Fl_Round_Button*>(b))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_tooltip)(fl_Round_Button b,const char* text){
    (static_cast<Fl_Round_Button*>(b))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_callback_with_user_data)(fl_Round_Button b,fl_Callback* cb,void* p){
    Fl_Round_Button* castedButton = (static_cast<Fl_Round_Button*>(b));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_callback)(fl_Round_Button b,fl_Callback* cb){
    Fl_Round_Button* castedButton = (static_cast<Fl_Round_Button*>(b));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Round_Button_user_data)(fl_Round_Button b){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Round_Button*>(b))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Round_Button*>(b))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_user_data)(fl_Round_Button b,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Round_Button*>(b))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Round_Button*>(b))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Round_Button*>(b))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Round_Button_argument)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->argument();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_argument)(fl_Round_Button b,long v){
    (static_cast<Fl_Round_Button*>(b))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Round_Button_when)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->when();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_when)(fl_Round_Button b,uchar i){
    (static_cast<Fl_Round_Button*>(b))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Round_Button_visible)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->visible();
  }
  FL_EXPORT_C(int,Fl_Round_Button_visible_r)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_visible)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->visible();
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_visible)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Round_Button_active)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->active();
  }
  FL_EXPORT_C(int,Fl_Round_Button_active_r)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->active_r();
  }
  FL_EXPORT_C(void,Fl_Round_Button_activate)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->activate();
  }
  FL_EXPORT_C(void,Fl_Round_Button_deactivate)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Round_Button_output)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_output)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->output();
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_output)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Round_Button_takesevents)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_changed)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->changed();
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_changed)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Round_Button_take_focus)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_visible_focus)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_visible_focus)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Round_Button_modify_visible_focus)(fl_Round_Button b,int v){
    (static_cast<Fl_Round_Button*>(b))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Round_Button_visible_focus)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Round_Button_do_callback)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Round_Button_do_callback_with_widget_and_user_data)(fl_Round_Button b,fl_Widget w,long arg){
    (static_cast<Fl_Round_Button*>(b))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Round_Button_do_callback_with_widget_and_default_user_data)(fl_Round_Button b,fl_Widget w){
    (static_cast<Fl_Round_Button*>(b))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Round_Button_contains)(fl_Round_Button b,fl_Widget w){
    return (static_cast<Fl_Round_Button*>(b))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Round_Button_inside)(fl_Round_Button b,fl_Widget w){
    return (static_cast<Fl_Round_Button*>(b))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Round_Button_redraw)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->redraw();
  }
  FL_EXPORT_C(void,Fl_Round_Button_redraw_label)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Round_Button_damage)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->damage();
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_damage_with_bitmask)(fl_Round_Button b,uchar c){
    (static_cast<Fl_Round_Button*>(b))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Round_Button_clear_damage)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Round_Button_damage_with_text)(fl_Round_Button b,uchar c){
    (static_cast<Fl_Round_Button*>(b))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Round_Button_damage_inside_widget)(fl_Round_Button b,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Round_Button*>(b))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Round_Button_draw_label_with_xywh_alignment)(fl_Round_Button b,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Round_Button*>(b))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Round_Button_measure_label)(fl_Round_Button b,int* ww,int* hh){
    (static_cast<Fl_Round_Button*>(b))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Round_Button_window)(fl_Round_Button round_button){
    return (fl_Window) (static_cast<Fl_Round_Button*>(round_button))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Round_Button_top_window)(fl_Round_Button round_button){
    return (fl_Window) (static_cast<Fl_Round_Button*>(round_button))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Round_Button_top_window_offset)(fl_Round_Button round_button, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Round_Button*>(round_button))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Round_Button_as_group)(fl_Round_Button round_button){
    return (fl_Group) (static_cast<Fl_Round_Button*>(round_button))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Round_Button_as_gl_window)(fl_Round_Button round_button){
    return (fl_Gl_Window) (static_cast<Fl_Round_Button*>(round_button))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Round_Button_Destroy)(fl_Round_Button button){
    delete (static_cast<Fl_Round_Button*>(button));
  }
  FL_EXPORT_C(int,Fl_Round_Button_set_value)(fl_Round_Button b,int v){
    return (static_cast<Fl_Round_Button*>(b))->value(v);
  }
  FL_EXPORT_C(char,Fl_Round_Button_value)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->value();
  }
  FL_EXPORT_C(int,Fl_Round_Button_clear)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->clear();
  }
  FL_EXPORT_C(void,Fl_Round_Button_setonly)(fl_Round_Button b){
    (static_cast<Fl_Round_Button*>(b))->setonly();
  }
  FL_EXPORT_C(int,Fl_Round_Button_get_shortcut)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_shortcut)(fl_Round_Button b,int s){
    (static_cast<Fl_Round_Button*>(b))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Round_Button_down_box)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->down_box();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_down_box)(fl_Round_Button b,Fl_Boxtype boxtype){
    (static_cast<Fl_Round_Button*>(b))->down_box(boxtype);
  }
  FL_EXPORT_C(Fl_Color,Fl_Round_Button_down_color)(fl_Round_Button b){
    return (static_cast<Fl_Round_Button*>(b))->down_color();
  }
  FL_EXPORT_C(void,Fl_Round_Button_set_down_color)(fl_Round_Button b,Fl_Color c){
    (static_cast<Fl_Round_Button*>(b))->down_color(c);
  }
  FL_EXPORT_C(fl_Round_Button,    Fl_Round_Button_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedRound_Button* w = new Fl_DerivedRound_Button(X,Y,W,H,fs);
    return (fl_Round_Button)w;
  }
  FL_EXPORT_C(fl_Round_Button,    Fl_Round_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedRound_Button* w = new Fl_DerivedRound_Button(X,Y,W,H,label,fs);
    return (fl_Round_Button)w;
  }
  FL_EXPORT_C(fl_Round_Button,    Fl_OverriddenRound_Button_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedRound_Button* w = new Fl_DerivedRound_Button(X,Y,W,H,fs);
    return (fl_Round_Button)w;
  }
  FL_EXPORT_C(fl_Round_Button,    Fl_OverriddenRound_Button_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedRound_Button* w = new Fl_DerivedRound_Button(X,Y,W,H,label,fs);
    return (fl_Round_Button)w;
  }
  FL_EXPORT_C(void, Fl_Round_Button_draw)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Round_Button_draw_super)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Round_Button_handle)(fl_Round_Button o, int event){
    return (static_cast<Fl_DerivedRound_Button*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Round_Button_handle_super)(fl_Round_Button o, int event){
    return (static_cast<Fl_DerivedRound_Button*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Round_Button_resize)(fl_Round_Button o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedRound_Button*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Round_Button_resize_super)(fl_Round_Button o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedRound_Button*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Round_Button_show)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Round_Button_show_super)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Round_Button_hide)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Round_Button_hide_super)(fl_Round_Button o){
    (static_cast<Fl_DerivedRound_Button*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
