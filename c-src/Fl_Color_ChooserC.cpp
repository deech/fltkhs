#include "Fl_Color_ChooserC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedColor_Chooser::Fl_DerivedColor_Chooser(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Color_Chooser(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedColor_Chooser::Fl_DerivedColor_Chooser(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Color_Chooser(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedColor_Chooser::~Fl_DerivedColor_Chooser(){
    free(overriddenFuncs);
  }
  void Fl_DerivedColor_Chooser::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Color_Chooser) this);
    }
    else {
      Fl_Color_Chooser::draw();
    }
  }

  void Fl_DerivedColor_Chooser::draw_super(){
    Fl_Color_Chooser::draw();
  }

  int Fl_DerivedColor_Chooser::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Color_Chooser) this,event);
    }
    else {
      i = Fl_Color_Chooser::handle(event);
    }
    return i;
  }
  int Fl_DerivedColor_Chooser::handle_super(int event){
    return Fl_Color_Chooser::handle(event);
  }

  void Fl_DerivedColor_Chooser::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Color_Chooser) this,x,y,w,h);
    }
    else {
      Fl_Color_Chooser::resize(x,y,w,h);
    }
  }

  void Fl_DerivedColor_Chooser::resize_super(int x, int y, int w, int h){
    Fl_Color_Chooser::resize(x,y,w,h);
  }
  void Fl_DerivedColor_Chooser::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Color_Chooser) this);
    }
    else {
      Fl_Color_Chooser::show();
    }
  }
  void Fl_DerivedColor_Chooser::show_super(){
    Fl_Color_Chooser::show();
  }

  void Fl_DerivedColor_Chooser::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Color_Chooser) this);
    }
    else {
      Fl_Color_Chooser::hide();
    }
  }
  void Fl_DerivedColor_Chooser::hide_super(){
    Fl_Color_Chooser::hide();
  }


#endif
  FL_EXPORT_C(int,Fl_Color_Chooser_handle)(fl_Color_Chooser color_chooser, int event){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Color_Chooser_parent)(fl_Color_Chooser color_chooser){
    return (fl_Group) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->parent();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_parent)(fl_Color_Chooser color_chooser,fl_Group grp){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->parent((static_cast<Fl_DerivedColor_Chooser*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Color_Chooser_type)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->type();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_type)(fl_Color_Chooser color_chooser,uchar t){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->type(t);
  }

  FL_EXPORT_C(int,Fl_Color_Chooser_x)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->x();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_y)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->y();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_w)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->w();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_h)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->h();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_align)(fl_Color_Chooser color_chooser, Fl_Align alignment){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Color_Chooser_align)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Color_Chooser_box)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->box();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_box)(fl_Color_Chooser color_chooser,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Color_Chooser_color)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->color();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_color)(fl_Color_Chooser color_chooser,Fl_Color bg){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_color_with_bg_sel)(fl_Color_Chooser color_chooser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Color_Chooser_selection_color)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_selection_color)(fl_Color_Chooser color_chooser,Fl_Color a){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Color_Chooser_label)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->label();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_copy_label)(fl_Color_Chooser color_chooser,const char* new_label){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_label)(fl_Color_Chooser color_chooser,const char* text){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Color_Chooser_labeltype)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_labeltype)(fl_Color_Chooser color_chooser,Fl_Labeltype a){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_labelcolor)(fl_Color_Chooser color_chooser,Fl_Color c){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Color_Chooser_labelfont)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_labelfont)(fl_Color_Chooser color_chooser,Fl_Font c){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Color_Chooser_labelsize)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_labelsize)(fl_Color_Chooser color_chooser,Fl_Fontsize pix){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Color_Chooser_image)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->image();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_image)(fl_Color_Chooser color_chooser,fl_Image pix){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Color_Chooser_deimage)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->deimage();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_deimage)(fl_Color_Chooser color_chooser,fl_Image pix){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Color_Chooser_tooltip)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_copy_tooltip)(fl_Color_Chooser color_chooser,const char* text){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_tooltip)(fl_Color_Chooser color_chooser,const char* text){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_callback_with_user_data)(fl_Color_Chooser color_chooser,fl_Callback* cb,void* p){
    Fl_Color_Chooser* castedWindow = (static_cast<Fl_DerivedColor_Chooser*>(color_chooser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_callback)(fl_Color_Chooser color_chooser,fl_Callback* cb){
    Fl_Color_Chooser* castedWindow = (static_cast<Fl_DerivedColor_Chooser*>(color_chooser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Color_Chooser_user_data)(fl_Color_Chooser color_chooser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_user_data)(fl_Color_Chooser color_chooser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Color_Chooser_argument)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->argument();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_argument)(fl_Color_Chooser color_chooser,long v){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Color_Chooser_when)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->when();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_when)(fl_Color_Chooser color_chooser,uchar i){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_visible)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->visible();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_visible_r)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_visible)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->visible();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_visible)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_active)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->active();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_active_r)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->active_r();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_activate)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->activate();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_deactivate)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_output)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->output();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_output)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->output();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_output)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_takesevents)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_changed)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->changed();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_changed)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_take_focus)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_visible_focus)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_visible_focus)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_modify_visible_focus)(fl_Color_Chooser color_chooser,int v){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_visible_focus)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_do_callback)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_do_callback_with_widget_and_user_data)(fl_Color_Chooser color_chooser,fl_Widget w,long arg){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_do_callback_with_widget_and_default_user_data)(fl_Color_Chooser color_chooser,fl_Widget w){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_contains)(fl_Color_Chooser color_chooser,fl_Widget w){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_inside)(fl_Color_Chooser color_chooser,fl_Widget w){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_redraw)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->redraw();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_redraw_label)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Color_Chooser_damage)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->damage();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_damage_with_bitmask)(fl_Color_Chooser color_chooser,uchar c){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear_damage)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_damage_with_text)(fl_Color_Chooser color_chooser,uchar c){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_damage_inside_widget)(fl_Color_Chooser color_chooser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_draw_label_with_xywh_alignment)(fl_Color_Chooser color_chooser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_measure_label)(fl_Color_Chooser color_chooser,int* ww,int* hh){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Color_Chooser_window)(fl_Color_Chooser color_chooser){
    return (fl_Window) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Color_Chooser_top_window)(fl_Color_Chooser color_chooser){
    return (fl_Window) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Color_Chooser_top_window_offset)(fl_Color_Chooser color_chooser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Color_Chooser_as_group)(fl_Color_Chooser color_chooser){
    return (fl_Group) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Color_Chooser_as_gl_window)(fl_Color_Chooser color_chooser){
    return (fl_Gl_Window) (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Color_Chooser_begin)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->begin();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_end)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->end();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_find)(fl_Color_Chooser color_chooser,fl_Widget w){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_add)(fl_Color_Chooser color_chooser,fl_Widget w){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_insert)(fl_Color_Chooser color_chooser,fl_Widget w,int i){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_remove_index)(fl_Color_Chooser color_chooser,int index){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_remove_widget)(fl_Color_Chooser color_chooser,fl_Widget w){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_clear)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clear();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_resizable_by_reference)(fl_Color_Chooser color_chooser,fl_Widget o){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_resizable)(fl_Color_Chooser color_chooser,fl_Widget o){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Color_Chooser_resizable)(fl_Color_Chooser color_chooser){
    return (fl_Widget)(static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->resizable();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_add_resizable)(fl_Color_Chooser color_chooser,fl_Widget o){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_init_sizes)(fl_Color_Chooser color_chooser){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_children)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->children();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_clip_children)(fl_Color_Chooser color_chooser,int c){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Color_Chooser_clip_children)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_focus)(fl_Color_Chooser color_chooser, fl_Widget W){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Color_Chooser__ddfdesign_kludge)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_insert_with_before)(fl_Color_Chooser color_chooser, fl_Widget w, fl_Widget before){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Color_Chooser_array)(fl_Color_Chooser color_chooser){
    return (fl_Widget*)(static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Color_Chooser_child)(fl_Color_Chooser color_chooser, int n){
    return (fl_Widget)(static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->child(n);
  }
  FL_EXPORT_C(fl_Color_Chooser,    Fl_Color_Chooser_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedColor_Chooser* w = new Fl_DerivedColor_Chooser(X,Y,W,H,fs);
    return (fl_Color_Chooser)w;
  }
  FL_EXPORT_C(fl_Color_Chooser,    Fl_Color_Chooser_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedColor_Chooser* w = new Fl_DerivedColor_Chooser(X,Y,W,H,label,fs);
    return (fl_Color_Chooser)w;
  }
  FL_EXPORT_C(fl_Color_Chooser,    Fl_OverriddenColor_Chooser_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedColor_Chooser* w = new Fl_DerivedColor_Chooser(X,Y,W,H,fs);
    return (fl_Color_Chooser)w;
  }
  FL_EXPORT_C(fl_Color_Chooser,    Fl_OverriddenColor_Chooser_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedColor_Chooser* w = new Fl_DerivedColor_Chooser(X,Y,W,H,label,fs);
    return (fl_Color_Chooser)w;
  }

  FL_EXPORT_C(int,Fl_Color_Chooser_mode)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->mode();
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_set_mode)(fl_Color_Chooser color_chooser,int newMode){
    (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->mode(newMode);
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_hue)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->hue();
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_saturation)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->saturation();
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_value)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->value();
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_r)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->r();
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_g)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->g();
  }
  FL_EXPORT_C(double,Fl_Color_Chooser_b)(fl_Color_Chooser color_chooser){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->b();
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_hsv)(fl_Color_Chooser color_chooser,double H,double S,double V){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->hsv(H,S,V);
  }
  FL_EXPORT_C(int,Fl_Color_Chooser_rgb)(fl_Color_Chooser color_chooser,double R,double G,double B){
    return (static_cast<Fl_DerivedColor_Chooser*>(color_chooser))->rgb(R,G,B);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_hsv2rgb)(double H,double S,double V,double* R,double* G,double* B){
    Fl_Color_Chooser::hsv2rgb(H,S,V,*R,*G,*B);
  }
  FL_EXPORT_C(void,Fl_Color_Chooser_rgb2hsv)(double R,double G,double B,double* H,double* S,double* V){
    Fl_Color_Chooser::rgb2hsv(R,G,B,*H,*S,*V);
  }
  FL_EXPORT_C(int, flc_color_chooser)(const char* name, double* r, double* g, double* b){
    return fl_color_chooser(name,*r,*g,*b);
  }
  FL_EXPORT_C(int, flc_color_chooser_with_m)(const char* name, double* r, double* g, double* b, int m){
    return fl_color_chooser(name,*r,*g,*b,m);
  }
  FL_EXPORT_C(int, flc_color_chooser_with_uchar)(const char* name, uchar* r, uchar* g, uchar* b){
    return fl_color_chooser(name,*r,*g,*b);
  }
  FL_EXPORT_C(int, flc_color_chooser_with_uchar_m)(const char* name, uchar* r, uchar* g, uchar* b, int m){
    return fl_color_chooser(name,*r,*g,*b,m);
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_draw)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_draw_super)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Color_Chooser_handle_super)(fl_Color_Chooser o, int event){
    return (static_cast<Fl_DerivedColor_Chooser*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_resize)(fl_Color_Chooser o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_resize_super)(fl_Color_Chooser o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_show)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_show_super)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_hide)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Color_Chooser_hide_super)(fl_Color_Chooser o){
    (static_cast<Fl_DerivedColor_Chooser*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
