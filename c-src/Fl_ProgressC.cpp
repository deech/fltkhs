#include "Fl_ProgressC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedProgress::Fl_DerivedProgress(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Progress(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedProgress::Fl_DerivedProgress(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Progress(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedProgress::~Fl_DerivedProgress(){
    free(overriddenFuncs);
  }
  void Fl_DerivedProgress::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Progress) this);
    }
    else {
      Fl_Progress::draw();
    }
  }

  void Fl_DerivedProgress::draw_super(){
    Fl_Progress::draw();
  }

  int Fl_DerivedProgress::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Progress) this,event);
    }
    else {
      i = Fl_Progress::handle(event);
    }
    return i;
  }
  int Fl_DerivedProgress::handle_super(int event){
    return Fl_Progress::handle(event);
  }

  void Fl_DerivedProgress::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Progress) this,x,y,w,h);
    }
    else {
      Fl_Progress::resize(x,y,w,h);
    }
  }

  void Fl_DerivedProgress::resize_super(int x, int y, int w, int h){
    Fl_Progress::resize(x,y,w,h);
  }
  void Fl_DerivedProgress::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Progress) this);
    }
    else {
      Fl_Progress::show();
    }
  }
  void Fl_DerivedProgress::show_super(){
    Fl_Progress::show();
  }

  void Fl_DerivedProgress::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Progress) this);
    }
    else {
      Fl_Progress::hide();
    }
  }
  void Fl_DerivedProgress::hide_super(){
    Fl_Progress::hide();
  }


#endif
  FL_EXPORT_C(fl_Window,Fl_Progress_as_window )(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->as_window();
  }
  FL_EXPORT_C(fl_Group,Fl_Progress_parent)(fl_Progress progress){
    return (fl_Group) (static_cast<Fl_Progress*>(progress))->parent();
  }
  FL_EXPORT_C(void,Fl_Progress_set_parent)(fl_Progress progress,fl_Group grp){
    (static_cast<Fl_Progress*>(progress))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Progress_type)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->type();
  }
  FL_EXPORT_C(void,Fl_Progress_set_type)(fl_Progress progress,uchar t){
    (static_cast<Fl_Progress*>(progress))->type(t);
  }

  FL_EXPORT_C(int,Fl_Progress_x)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->x();
  }
  FL_EXPORT_C(int,Fl_Progress_y)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->y();
  }
  FL_EXPORT_C(int,Fl_Progress_w)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->w();
  }
  FL_EXPORT_C(int,Fl_Progress_h)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->h();
  }
  FL_EXPORT_C(void,Fl_Progress_set_align)(fl_Progress progress, Fl_Align alignment){
    (static_cast<Fl_Progress*>(progress))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Progress_align)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Progress_box)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->box();
  }
  FL_EXPORT_C(void,Fl_Progress_set_box)(fl_Progress progress,Fl_Boxtype new_box){
    (static_cast<Fl_Progress*>(progress))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Progress_color)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->color();
  }
  FL_EXPORT_C(void,Fl_Progress_set_color)(fl_Progress progress,Fl_Color bg){
    (static_cast<Fl_Progress*>(progress))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Progress_set_color_with_bg_sel)(fl_Progress progress,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Progress*>(progress))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Progress_selection_color)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Progress_set_selection_color)(fl_Progress progress,Fl_Color a){
    (static_cast<Fl_Progress*>(progress))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Progress_label)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->label();
  }
  FL_EXPORT_C(void,Fl_Progress_copy_label)(fl_Progress progress,const char* new_label){
    (static_cast<Fl_Progress*>(progress))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Progress_set_label)(fl_Progress progress,const char* text){
    (static_cast<Fl_Progress*>(progress))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Progress_labeltype)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Progress_set_labeltype)(fl_Progress progress,Fl_Labeltype a){
    (static_cast<Fl_Progress*>(progress))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Progress_set_labelcolor)(fl_Progress progress,Fl_Color c){
    (static_cast<Fl_Progress*>(progress))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Progress_labelcolor)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Progress_labelfont)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Progress_set_labelfont)(fl_Progress progress,Fl_Font c){
    (static_cast<Fl_Progress*>(progress))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Progress_labelsize)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Progress_set_labelsize)(fl_Progress progress,Fl_Fontsize pix){
    (static_cast<Fl_Progress*>(progress))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Progress_image)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->image();
  }
  FL_EXPORT_C(void,Fl_Progress_set_image)(fl_Progress progress,fl_Image pix){
    (static_cast<Fl_Progress*>(progress))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Progress_deimage)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->deimage();
  }
  FL_EXPORT_C(void,Fl_Progress_set_deimage)(fl_Progress progress,fl_Image pix){
    (static_cast<Fl_Progress*>(progress))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Progress_tooltip)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Progress_copy_tooltip)(fl_Progress progress,const char* text){
    (static_cast<Fl_Progress*>(progress))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Progress_set_tooltip)(fl_Progress progress,const char* text){
    (static_cast<Fl_Progress*>(progress))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Progress_set_callback_with_user_data)(fl_Progress progress,fl_Callback* cb,void* p){
    Fl_Progress* castedButton = (static_cast<Fl_Progress*>(progress));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Progress_set_callback)(fl_Progress progress,fl_Callback* cb){
    Fl_Progress* castedButton = (static_cast<Fl_Progress*>(progress));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Progress_user_data)(fl_Progress progress){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Progress*>(progress))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Progress*>(progress))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Progress_set_user_data)(fl_Progress progress,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Progress*>(progress))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Progress*>(progress))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Progress*>(progress))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Progress_argument)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->argument();
  }
  FL_EXPORT_C(void,Fl_Progress_set_argument)(fl_Progress progress,long v){
    (static_cast<Fl_Progress*>(progress))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Progress_when)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->when();
  }
  FL_EXPORT_C(void,Fl_Progress_set_when)(fl_Progress progress,uchar i){
    (static_cast<Fl_Progress*>(progress))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Progress_visible)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->visible();
  }
  FL_EXPORT_C(int,Fl_Progress_visible_r)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Progress_set_visible)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->visible();
  }
  FL_EXPORT_C(void,Fl_Progress_clear_visible)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Progress_active)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->active();
  }
  FL_EXPORT_C(int,Fl_Progress_active_r)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->active_r();
  }
  FL_EXPORT_C(void,Fl_Progress_activate)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->activate();
  }
  FL_EXPORT_C(void,Fl_Progress_deactivate)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Progress_output)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->output();
  }
  FL_EXPORT_C(void,Fl_Progress_set_output)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->output();
  }
  FL_EXPORT_C(void,Fl_Progress_clear_output)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Progress_takesevents)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Progress_set_changed)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->changed();
  }
  FL_EXPORT_C(void,Fl_Progress_clear_changed)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Progress_take_focus)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Progress_set_visible_focus)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Progress_clear_visible_focus)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Progress_modify_visible_focus)(fl_Progress progress,int v){
    (static_cast<Fl_Progress*>(progress))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Progress_visible_focus)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Progress_do_callback)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Progress_do_callback_with_widget_and_user_data)(fl_Progress progress,fl_Widget w,long arg){
    (static_cast<Fl_Progress*>(progress))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Progress_do_callback_with_widget_and_default_user_data)(fl_Progress progress,fl_Widget w){
    (static_cast<Fl_Progress*>(progress))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Progress_contains)(fl_Progress progress,fl_Widget w){
    return (static_cast<Fl_Progress*>(progress))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Progress_inside)(fl_Progress progress,fl_Widget w){
    return (static_cast<Fl_Progress*>(progress))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Progress_redraw)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->redraw();
  }
  FL_EXPORT_C(void,Fl_Progress_redraw_label)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Progress_damage)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->damage();
  }
  FL_EXPORT_C(void,Fl_Progress_clear_damage_with_bitmask)(fl_Progress progress,uchar c){
    (static_cast<Fl_Progress*>(progress))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Progress_clear_damage)(fl_Progress progress){
    (static_cast<Fl_Progress*>(progress))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Progress_damage_with_text)(fl_Progress progress,uchar c){
    (static_cast<Fl_Progress*>(progress))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Progress_damage_inside_widget)(fl_Progress progress,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Progress*>(progress))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Progress_draw_label_with_xywh_alignment)(fl_Progress progress,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Progress*>(progress))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Progress_measure_label)(fl_Progress progress,int* ww,int* hh){
    (static_cast<Fl_Progress*>(progress))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Progress_window)(fl_Progress progress){
    return (fl_Window) (static_cast<Fl_Progress*>(progress))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Progress_top_window)(fl_Progress progress){
    return (fl_Window) (static_cast<Fl_Progress*>(progress))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Progress_top_window_offset)(fl_Progress progress, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Progress*>(progress))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Progress_as_group)(fl_Progress progress){
    return (fl_Group) (static_cast<Fl_Progress*>(progress))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Progress_as_gl_window)(fl_Progress progress){
    return (fl_Gl_Window) (static_cast<Fl_Progress*>(progress))->as_gl_window();
  }
  FL_EXPORT_C(void , Fl_Progress_Destroy)(fl_Progress progress){
    delete (static_cast<Fl_Progress*>(progress));
  }
  FL_EXPORT_C(void,Fl_Progress_set_maximum)(fl_Progress progress,float v){
    return (static_cast<Fl_Progress*>(progress))->maximum(v);
  }
  FL_EXPORT_C(float,Fl_Progress_maximum)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->maximum();
  }
  FL_EXPORT_C(void,Fl_Progress_set_minimum)(fl_Progress progress,float v){
    return (static_cast<Fl_Progress*>(progress))->minimum(v);
  }
  FL_EXPORT_C(float,Fl_Progress_minimum)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->minimum();
  }
  FL_EXPORT_C(void,Fl_Progress_set_value)(fl_Progress progress,float v){
    return (static_cast<Fl_Progress*>(progress))->value(v);
  }
  FL_EXPORT_C(float,Fl_Progress_value)(fl_Progress progress){
    return (static_cast<Fl_Progress*>(progress))->value();
  }
  FL_EXPORT_C(fl_Progress,    Fl_Progress_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedProgress* w = new Fl_DerivedProgress(X,Y,W,H,fs);
    return (fl_Progress)w;
  }
  FL_EXPORT_C(fl_Progress,    Fl_Progress_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedProgress* w = new Fl_DerivedProgress(X,Y,W,H,label,fs);
    return (fl_Progress)w;
  }
  FL_EXPORT_C(fl_Progress,    Fl_OverriddenProgress_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedProgress* w = new Fl_DerivedProgress(X,Y,W,H,fs);
    return (fl_Progress)w;
  }
  FL_EXPORT_C(fl_Progress,    Fl_OverriddenProgress_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedProgress* w = new Fl_DerivedProgress(X,Y,W,H,label,fs);
    return (fl_Progress)w;
  }
  FL_EXPORT_C(void, Fl_Progress_draw)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Progress_draw_super)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Progress_handle)(fl_Progress o, int event){
    return (static_cast<Fl_DerivedProgress*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Progress_handle_super)(fl_Progress o, int event){
    return (static_cast<Fl_DerivedProgress*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Progress_resize)(fl_Progress o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedProgress*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Progress_resize_super)(fl_Progress o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedProgress*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Progress_show)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Progress_show_super)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Progress_hide)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Progress_hide_super)(fl_Progress o){
    (static_cast<Fl_DerivedProgress*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
