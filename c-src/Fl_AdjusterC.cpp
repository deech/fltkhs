#include "Fl_AdjusterC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedAdjuster::Fl_DerivedAdjuster(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Adjuster(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedAdjuster::Fl_DerivedAdjuster(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Adjuster(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedAdjuster::~Fl_DerivedAdjuster(){
    free(overriddenFuncs);
  }
  void Fl_DerivedAdjuster::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Adjuster) this);
    }
    else {
      Fl_Adjuster::draw();
    }
  }

  void Fl_DerivedAdjuster::draw_super(){
    Fl_Adjuster::draw();
  }

  int Fl_DerivedAdjuster::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Adjuster) this,event);
    }
    else {
      i = Fl_Adjuster::handle(event);
    }
    return i;
  }
  int Fl_DerivedAdjuster::handle_super(int event){
    return Fl_Adjuster::handle(event);
  }

  void Fl_DerivedAdjuster::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Adjuster) this,x,y,w,h);
    }
    else {
      Fl_Adjuster::resize(x,y,w,h);
    }
  }

  void Fl_DerivedAdjuster::resize_super(int x, int y, int w, int h){
    Fl_Adjuster::resize(x,y,w,h);
  }
  void Fl_DerivedAdjuster::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Adjuster) this);
    }
    else {
      Fl_Adjuster::show();
    }
  }
  void Fl_DerivedAdjuster::show_super(){
    Fl_Adjuster::show();
  }

  void Fl_DerivedAdjuster::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Adjuster) this);
    }
    else {
      Fl_Adjuster::hide();
    }
  }
  void Fl_DerivedAdjuster::hide_super(){
    Fl_Adjuster::hide();
  }

#endif
  FL_EXPORT_C(fl_Group,Fl_Adjuster_parent)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->parent();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_parent)(fl_Adjuster adjuster,fl_Group grp){
    (static_cast<Fl_Adjuster*>(adjuster))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Adjuster_type)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->type();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_type)(fl_Adjuster adjuster,uchar t){
    (static_cast<Fl_Adjuster*>(adjuster))->type(t);
  }
  FL_EXPORT_C(int,Fl_Adjuster_x)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->x();
  }
  FL_EXPORT_C(int,Fl_Adjuster_y)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->y();
  }
  FL_EXPORT_C(int,Fl_Adjuster_w)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->w();
  }
  FL_EXPORT_C(int,Fl_Adjuster_h)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->h();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_align)(fl_Adjuster adjuster,Fl_Align alignment){
    (static_cast<Fl_Adjuster*>(adjuster))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Adjuster_align)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Adjuster_box)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->box();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_box)(fl_Adjuster adjuster,Fl_Boxtype new_box){
    (static_cast<Fl_Adjuster*>(adjuster))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Adjuster_color)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->color();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_color)(fl_Adjuster adjuster,Fl_Color bg){
    (static_cast<Fl_Adjuster*>(adjuster))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_color_with_bg_sel)(fl_Adjuster adjuster,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Adjuster*>(adjuster))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Adjuster_selection_color)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_selection_color)(fl_Adjuster adjuster,Fl_Color a){
    (static_cast<Fl_Adjuster*>(adjuster))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Adjuster_label)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->label();
  }
  FL_EXPORT_C(void,Fl_Adjuster_copy_label)(fl_Adjuster adjuster,const char* new_label){
    (static_cast<Fl_Adjuster*>(adjuster))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_label)(fl_Adjuster adjuster,const char* text){
    (static_cast<Fl_Adjuster*>(adjuster))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Adjuster_labeltype)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_labeltype)(fl_Adjuster adjuster,Fl_Labeltype a){
    (static_cast<Fl_Adjuster*>(adjuster))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Adjuster_labelcolor)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_labelcolor)(fl_Adjuster adjuster,Fl_Color c){
    (static_cast<Fl_Adjuster*>(adjuster))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Adjuster_labelfont)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_labelfont)(fl_Adjuster adjuster,Fl_Font c){
    (static_cast<Fl_Adjuster*>(adjuster))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Adjuster_labelsize)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_labelsize)(fl_Adjuster adjuster,Fl_Fontsize pix){
    (static_cast<Fl_Adjuster*>(adjuster))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Adjuster_image)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->image();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_image)(fl_Adjuster adjuster,fl_Image pix){
    (static_cast<Fl_Adjuster*>(adjuster))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Adjuster_deimage)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->deimage();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_deimage)(fl_Adjuster adjuster,fl_Image pix){
    (static_cast<Fl_Adjuster*>(adjuster))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Adjuster_tooltip)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Adjuster_copy_tooltip)(fl_Adjuster adjuster,const char* text){
    (static_cast<Fl_Adjuster*>(adjuster))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_tooltip)(fl_Adjuster adjuster,const char* text){
    (static_cast<Fl_Adjuster*>(adjuster))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_callback_with_user_data)(fl_Adjuster adjuster,fl_Callback* cb,void* p){
    Fl_Adjuster* castedAdjuster = (static_cast<Fl_Adjuster*>(adjuster));
    new C_to_Fl_Callback(castedAdjuster, cb, p);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_callback)(fl_Adjuster adjuster,fl_Callback* cb){
    Fl_Adjuster* castedAdjuster = (static_cast<Fl_Adjuster*>(adjuster));
    new C_to_Fl_Callback(castedAdjuster, cb);
  }
  FL_EXPORT_C(void*,Fl_Adjuster_user_data)(fl_Adjuster adjuster){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Adjuster*>(adjuster))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Adjuster*>(adjuster))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_user_data)(fl_Adjuster adjuster,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Adjuster*>(adjuster))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Adjuster*>(adjuster))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Adjuster*>(adjuster))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Adjuster_argument)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->argument();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_argument)(fl_Adjuster adjuster,long v){
    (static_cast<Fl_Adjuster*>(adjuster))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Adjuster_when)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->when();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_when)(fl_Adjuster adjuster,uchar i){
    (static_cast<Fl_Adjuster*>(adjuster))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Adjuster_visible)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->visible();
  }
  FL_EXPORT_C(int,Fl_Adjuster_visible_r)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_visible)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->visible();
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_visible)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Adjuster_active)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->active();
  }
  FL_EXPORT_C(int,Fl_Adjuster_active_r)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->active_r();
  }
  FL_EXPORT_C(void,Fl_Adjuster_activate)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->activate();
  }
  FL_EXPORT_C(void,Fl_Adjuster_deactivate)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Adjuster_output)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->output();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_output)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->output();
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_output)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Adjuster_takesevents)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_changed)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->changed();
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_changed)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Adjuster_take_focus)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_visible_focus)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_visible_focus)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Adjuster_modify_visible_focus)(fl_Adjuster adjuster,int v){
    (static_cast<Fl_Adjuster*>(adjuster))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Adjuster_visible_focus)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Adjuster_contains)(fl_Adjuster adjuster,fl_Widget w){
    return (static_cast<Fl_Adjuster*>(adjuster))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Adjuster_inside)(fl_Adjuster adjuster,fl_Widget w){
    return (static_cast<Fl_Adjuster*>(adjuster))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Adjuster_redraw)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->redraw();
  }
  FL_EXPORT_C(void,Fl_Adjuster_redraw_label)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Adjuster_damage)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->damage();
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_damage_with_bitmask)(fl_Adjuster adjuster,uchar c){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Adjuster_clear_damage)(fl_Adjuster adjuster){
    (static_cast<Fl_Adjuster*>(adjuster))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Adjuster_damage_with_text)(fl_Adjuster adjuster,uchar c){
    (static_cast<Fl_Adjuster*>(adjuster))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Adjuster_damage_inside_widget)(fl_Adjuster adjuster,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Adjuster*>(adjuster))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Adjuster_draw_label_with_xywh_alignment)(fl_Adjuster adjuster,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Adjuster*>(adjuster))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Adjuster_measure_label)(fl_Adjuster adjuster,int* ww,int* hh){
    (static_cast<Fl_Adjuster*>(adjuster))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Adjuster_window)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Adjuster_top_window)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Adjuster_top_window_offset)(fl_Adjuster adjuster,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Adjuster*>(adjuster))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Adjuster_as_gl_window)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Adjuster_bounds)(fl_Adjuster adjuster,double a,double b){
    (static_cast<Fl_Adjuster*>(adjuster))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Adjuster_minimum)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->minimum();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_minimum)(fl_Adjuster adjuster,double a){
    (static_cast<Fl_Adjuster*>(adjuster))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Adjuster_maximum)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->maximum();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_maximum)(fl_Adjuster adjuster,double a){
    (static_cast<Fl_Adjuster*>(adjuster))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Adjuster_range)(fl_Adjuster adjuster,double a,double b){
    (static_cast<Fl_Adjuster*>(adjuster))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_step)(fl_Adjuster adjuster,int a){
    (static_cast<Fl_Adjuster*>(adjuster))->step(a);
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_step_with_a_b)(fl_Adjuster adjuster,double a,int b){
    (static_cast<Fl_Adjuster*>(adjuster))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Adjuster_step_with_s)(fl_Adjuster adjuster,double s){
    (static_cast<Fl_Adjuster*>(adjuster))->step(s);
  }
  FL_EXPORT_C(double,Fl_Adjuster_step)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->step();
  }
  FL_EXPORT_C(void,Fl_Adjuster_precision)(fl_Adjuster adjuster,int precision){
    (static_cast<Fl_Adjuster*>(adjuster))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Adjuster_value)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->value();
  }
  FL_EXPORT_C(int,Fl_Adjuster_set_value)(fl_Adjuster adjuster,double v){
    return (static_cast<Fl_Adjuster*>(adjuster))->value(v);
  }
  FL_EXPORT_C(int,Fl_Adjuster_format)(fl_Adjuster adjuster,char* format){
    return (static_cast<Fl_Adjuster*>(adjuster))->format(format);
  }
  FL_EXPORT_C(double,Fl_Adjuster_round)(fl_Adjuster adjuster,double v){
    return (static_cast<Fl_Adjuster*>(adjuster))->round(v);
  }
  FL_EXPORT_C(double,Fl_Adjuster_clamp)(fl_Adjuster adjuster,double v){
    return (static_cast<Fl_Adjuster*>(adjuster))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Adjuster_increment)(fl_Adjuster adjuster,double v,int n){
    return (static_cast<Fl_Adjuster*>(adjuster))->increment(v,n);
  }
  FL_EXPORT_C(void,Fl_Adjuster_Destroy)(fl_Adjuster adjuster){
    delete (static_cast<Fl_Adjuster*>(adjuster));
  }
  FL_EXPORT_C(int,Fl_Adjuster_soft)(fl_Adjuster adjuster){
    return (static_cast<Fl_Adjuster*>(adjuster))->soft();
  }
  FL_EXPORT_C(void,Fl_Adjuster_set_soft)(fl_Adjuster adjuster,int soft){
    (static_cast<Fl_Adjuster*>(adjuster))->soft(soft);
  }
  FL_EXPORT_C(fl_Adjuster,    Fl_Adjuster_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedAdjuster* w = new Fl_DerivedAdjuster(X,Y,W,H,fs);
    return (fl_Adjuster)w;
  }
  FL_EXPORT_C(fl_Adjuster,    Fl_Adjuster_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedAdjuster* w = new Fl_DerivedAdjuster(X,Y,W,H,label,fs);
    return (fl_Adjuster)w;
  }
  FL_EXPORT_C(fl_Adjuster,    Fl_OverriddenAdjuster_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedAdjuster* w = new Fl_DerivedAdjuster(X,Y,W,H,fs);
    return (fl_Adjuster)w;
  }
  FL_EXPORT_C(fl_Adjuster,    Fl_OverriddenAdjuster_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedAdjuster* w = new Fl_DerivedAdjuster(X,Y,W,H,label,fs);
    return (fl_Adjuster)w;
  }
  FL_EXPORT_C(void, Fl_Adjuster_draw)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Adjuster_draw_super)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Adjuster_handle)(fl_Adjuster o, int event){
    return (static_cast<Fl_DerivedAdjuster*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Adjuster_handle_super)(fl_Adjuster o, int event){
    return (static_cast<Fl_DerivedAdjuster*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Adjuster_resize)(fl_Adjuster o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedAdjuster*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Adjuster_resize_super)(fl_Adjuster o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedAdjuster*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Adjuster_show)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Adjuster_show_super)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Adjuster_hide)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Adjuster_hide_super)(fl_Adjuster o){
    (static_cast<Fl_DerivedAdjuster*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
