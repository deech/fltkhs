#include "Fl_PositionerC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedPositioner::Fl_DerivedPositioner(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Positioner(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedPositioner::Fl_DerivedPositioner(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Positioner(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedPositioner::~Fl_DerivedPositioner(){
    free(overriddenFuncs);
  }
  void Fl_DerivedPositioner::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Positioner) this);
    }
    else {
      Fl_Positioner::draw();
    }
  }

  void Fl_DerivedPositioner::draw_super(){
    Fl_Positioner::draw();
  }

  int Fl_DerivedPositioner::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Positioner) this,event);
    }
    else {
      i = Fl_Positioner::handle(event);
    }
    return i;
  }
  int Fl_DerivedPositioner::handle_super(int event){
    return Fl_Positioner::handle(event);
  }

  void Fl_DerivedPositioner::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Positioner) this,x,y,w,h);
    }
    else {
      Fl_Positioner::resize(x,y,w,h);
    }
  }

  void Fl_DerivedPositioner::resize_super(int x, int y, int w, int h){
    Fl_Positioner::resize(x,y,w,h);
  }
  void Fl_DerivedPositioner::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Positioner) this);
    }
    else {
      Fl_Positioner::show();
    }
  }
  void Fl_DerivedPositioner::show_super(){
    Fl_Positioner::show();
  }

  void Fl_DerivedPositioner::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Positioner) this);
    }
    else {
      Fl_Positioner::hide();
    }
  }
  void Fl_DerivedPositioner::hide_super(){
    Fl_Positioner::hide();
  }
#endif
  FL_EXPORT_C(fl_Window,Fl_Positioner_as_window )(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->as_window();
  }
  FL_EXPORT_C(fl_Group,Fl_Positioner_parent)(fl_Positioner positioner){
    return (fl_Group) (static_cast<Fl_Positioner*>(positioner))->parent();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_parent)(fl_Positioner positioner,fl_Group grp){
    (static_cast<Fl_Positioner*>(positioner))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Positioner_type)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->type();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_type)(fl_Positioner positioner,uchar t){
    (static_cast<Fl_Positioner*>(positioner))->type(t);
  }

  FL_EXPORT_C(int,Fl_Positioner_x)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->x();
  }
  FL_EXPORT_C(int,Fl_Positioner_y)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->y();
  }
  FL_EXPORT_C(int,Fl_Positioner_w)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->w();
  }
  FL_EXPORT_C(int,Fl_Positioner_h)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->h();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_align)(fl_Positioner positioner, Fl_Align alignment){
    (static_cast<Fl_Positioner*>(positioner))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Positioner_align)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Positioner_box)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->box();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_box)(fl_Positioner positioner,Fl_Boxtype new_box){
    (static_cast<Fl_Positioner*>(positioner))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Positioner_color)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->color();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_color)(fl_Positioner positioner,Fl_Color bg){
    (static_cast<Fl_Positioner*>(positioner))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_color_with_bg_sel)(fl_Positioner positioner,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Positioner*>(positioner))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Positioner_selection_color)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_selection_color)(fl_Positioner positioner,Fl_Color a){
    (static_cast<Fl_Positioner*>(positioner))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Positioner_label)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->label();
  }
  FL_EXPORT_C(void,Fl_Positioner_copy_label)(fl_Positioner positioner,const char* new_label){
    (static_cast<Fl_Positioner*>(positioner))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_label)(fl_Positioner positioner,const char* text){
    (static_cast<Fl_Positioner*>(positioner))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Positioner_labeltype)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_labeltype)(fl_Positioner positioner,Fl_Labeltype a){
    (static_cast<Fl_Positioner*>(positioner))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_labelcolor)(fl_Positioner positioner,Fl_Color c){
    (static_cast<Fl_Positioner*>(positioner))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Positioner_labelcolor)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Positioner_labelfont)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_labelfont)(fl_Positioner positioner,Fl_Font c){
    (static_cast<Fl_Positioner*>(positioner))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Positioner_labelsize)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_labelsize)(fl_Positioner positioner,Fl_Fontsize pix){
    (static_cast<Fl_Positioner*>(positioner))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Positioner_image)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->image();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_image)(fl_Positioner positioner,fl_Image pix){
    (static_cast<Fl_Positioner*>(positioner))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Positioner_deimage)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->deimage();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_deimage)(fl_Positioner positioner,fl_Image pix){
    (static_cast<Fl_Positioner*>(positioner))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Positioner_tooltip)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Positioner_copy_tooltip)(fl_Positioner positioner,const char* text){
    (static_cast<Fl_Positioner*>(positioner))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_tooltip)(fl_Positioner positioner,const char* text){
    (static_cast<Fl_Positioner*>(positioner))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_callback_with_user_data)(fl_Positioner positioner,fl_Callback* cb,void* p){
    Fl_Positioner* castedButton = (static_cast<Fl_Positioner*>(positioner));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Positioner_set_callback)(fl_Positioner positioner,fl_Callback* cb){
    Fl_Positioner* castedButton = (static_cast<Fl_Positioner*>(positioner));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Positioner_user_data)(fl_Positioner positioner){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Positioner*>(positioner))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Positioner*>(positioner))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Positioner_set_user_data)(fl_Positioner positioner,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Positioner*>(positioner))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Positioner*>(positioner))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Positioner*>(positioner))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Positioner_argument)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->argument();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_argument)(fl_Positioner positioner,long v){
    (static_cast<Fl_Positioner*>(positioner))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Positioner_when)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->when();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_when)(fl_Positioner positioner,uchar i){
    (static_cast<Fl_Positioner*>(positioner))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Positioner_visible)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->visible();
  }
  FL_EXPORT_C(int,Fl_Positioner_visible_r)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_visible)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->visible();
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_visible)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Positioner_active)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->active();
  }
  FL_EXPORT_C(int,Fl_Positioner_active_r)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->active_r();
  }
  FL_EXPORT_C(void,Fl_Positioner_activate)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->activate();
  }
  FL_EXPORT_C(void,Fl_Positioner_deactivate)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Positioner_output)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->output();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_output)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->output();
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_output)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Positioner_takesevents)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_changed)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->changed();
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_changed)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Positioner_take_focus)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_visible_focus)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_visible_focus)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Positioner_modify_visible_focus)(fl_Positioner positioner,int v){
    (static_cast<Fl_Positioner*>(positioner))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Positioner_visible_focus)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Positioner_do_callback)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Positioner_do_callback_with_widget_and_user_data)(fl_Positioner positioner,fl_Widget w,long arg){
    (static_cast<Fl_Positioner*>(positioner))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Positioner_do_callback_with_widget_and_default_user_data)(fl_Positioner positioner,fl_Widget w){
    (static_cast<Fl_Positioner*>(positioner))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Positioner_contains)(fl_Positioner positioner,fl_Widget w){
    return (static_cast<Fl_Positioner*>(positioner))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Positioner_inside)(fl_Positioner positioner,fl_Widget w){
    return (static_cast<Fl_Positioner*>(positioner))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Positioner_redraw)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->redraw();
  }
  FL_EXPORT_C(void,Fl_Positioner_redraw_label)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Positioner_damage)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->damage();
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_damage_with_bitmask)(fl_Positioner positioner,uchar c){
    (static_cast<Fl_Positioner*>(positioner))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Positioner_clear_damage)(fl_Positioner positioner){
    (static_cast<Fl_Positioner*>(positioner))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Positioner_damage_with_text)(fl_Positioner positioner,uchar c){
    (static_cast<Fl_Positioner*>(positioner))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Positioner_damage_inside_widget)(fl_Positioner positioner,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Positioner*>(positioner))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Positioner_draw_label_with_xywh_alignment)(fl_Positioner positioner,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Positioner*>(positioner))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Positioner_measure_label)(fl_Positioner positioner,int* ww,int* hh){
    (static_cast<Fl_Positioner*>(positioner))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Positioner_window)(fl_Positioner positioner){
    return (fl_Window) (static_cast<Fl_Positioner*>(positioner))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Positioner_top_window)(fl_Positioner positioner){
    return (fl_Window) (static_cast<Fl_Positioner*>(positioner))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Positioner_top_window_offset)(fl_Positioner positioner, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Positioner*>(positioner))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Positioner_as_group)(fl_Positioner positioner){
    return (fl_Group) (static_cast<Fl_Positioner*>(positioner))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Positioner_as_gl_window)(fl_Positioner positioner){
    return (fl_Gl_Window) (static_cast<Fl_Positioner*>(positioner))->as_gl_window();
  }
  FL_EXPORT_C(void , Fl_Positioner_Destroy)(fl_Positioner positioner){
    delete (static_cast<Fl_Positioner*>(positioner));
  }
  FL_EXPORT_C(void,Fl_Positioner_set_xvalue)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->xvalue(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_xvalue)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->xvalue();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_yvalue)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->yvalue(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_yvalue)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->yvalue();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_xminimum)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->xminimum(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_xminimum)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->xminimum();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_yminimum)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->yminimum(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_yminimum)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->yminimum();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_xmaximum)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->xmaximum(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_xmaximum)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->xmaximum();
  }
  FL_EXPORT_C(void,Fl_Positioner_set_ymaximum)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->ymaximum(x);
  }
  FL_EXPORT_C(double,Fl_Positioner_ymaximum)(fl_Positioner positioner){
    return (static_cast<Fl_Positioner*>(positioner))->ymaximum();
  }
  FL_EXPORT_C(void,Fl_Positioner_xbounds)(fl_Positioner positioner, double x, double xx){
    return (static_cast<Fl_Positioner*>(positioner))->xbounds(x,xx);
  }
  FL_EXPORT_C(void,Fl_Positioner_ybounds)(fl_Positioner positioner,double y, double yy){
    (static_cast<Fl_Positioner*>(positioner))->ybounds(y, yy);
  }
  FL_EXPORT_C(void,Fl_Positioner_xstep)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->xstep(x);
  }
  FL_EXPORT_C(void,Fl_Positioner_ystep)(fl_Positioner positioner,double x){
    (static_cast<Fl_Positioner*>(positioner))->ystep(x);
  }
  FL_EXPORT_C(fl_Positioner,    Fl_Positioner_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedPositioner* w = new Fl_DerivedPositioner(X,Y,W,H,fs);
    return (fl_Positioner)w;
  }
  FL_EXPORT_C(fl_Positioner,    Fl_Positioner_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedPositioner* w = new Fl_DerivedPositioner(X,Y,W,H,label,fs);
    return (fl_Positioner)w;
  }
  FL_EXPORT_C(fl_Positioner,    Fl_OverriddenPositioner_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedPositioner* w = new Fl_DerivedPositioner(X,Y,W,H,fs);
    return (fl_Positioner)w;
  }
  FL_EXPORT_C(fl_Positioner,    Fl_OverriddenPositioner_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedPositioner* w = new Fl_DerivedPositioner(X,Y,W,H,label,fs);
    return (fl_Positioner)w;
  }
  FL_EXPORT_C(void, Fl_Positioner_draw)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Positioner_draw_super)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Positioner_handle)(fl_Positioner o, int event){
    return (static_cast<Fl_DerivedPositioner*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Positioner_handle_super)(fl_Positioner o, int event){
    return (static_cast<Fl_DerivedPositioner*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Positioner_resize)(fl_Positioner o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedPositioner*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Positioner_resize_super)(fl_Positioner o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedPositioner*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Positioner_show)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Positioner_show_super)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Positioner_hide)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Positioner_hide_super)(fl_Positioner o){
    (static_cast<Fl_DerivedPositioner*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
