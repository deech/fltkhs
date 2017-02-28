#include "Fl_Text_DisplayC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedText_Display::Fl_DerivedText_Display(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Text_Display(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedText_Display::Fl_DerivedText_Display(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Text_Display(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedText_Display::~Fl_DerivedText_Display(){
    free(overriddenFuncs);
  }
  void Fl_DerivedText_Display::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Text_Display) this);
    }
    else {
      Fl_Text_Display::draw();
    }
  }

  void Fl_DerivedText_Display::draw_super(){
    Fl_Text_Display::draw();
  }

  int Fl_DerivedText_Display::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Text_Display) this,event);
    }
    else {
      i = Fl_Text_Display::handle(event);
    }
    return i;
  }
  int Fl_DerivedText_Display::handle_super(int event){
    return Fl_Text_Display::handle(event);
  }

  void Fl_DerivedText_Display::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Text_Display) this,x,y,w,h);
    }
    else {
      Fl_Text_Display::resize(x,y,w,h);
    }
  }

  void Fl_DerivedText_Display::resize_super(int x, int y, int w, int h){
    Fl_Text_Display::resize(x,y,w,h);
  }
  void Fl_DerivedText_Display::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Text_Display) this);
    }
    else {
      Fl_Text_Display::show();
    }
  }
  void Fl_DerivedText_Display::show_super(){
    Fl_Text_Display::show();
  }

  void Fl_DerivedText_Display::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Text_Display) this);
    }
    else {
      Fl_Text_Display::hide();
    }
  }
  void Fl_DerivedText_Display::hide_super(){
    Fl_Text_Display::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Text_Display_parent)(fl_Text_Display text_display){
    return (fl_Group) (static_cast<Fl_Text_Display*>(text_display))->parent();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_parent)(fl_Text_Display text_display,fl_Text_Display grp){
    (static_cast<Fl_Text_Display*>(text_display))->parent((static_cast<Fl_Text_Display*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Text_Display_type)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->type();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_type)(fl_Text_Display text_display,uchar t){
    (static_cast<Fl_Text_Display*>(text_display))->type(t);
  }

  FL_EXPORT_C(int,Fl_Text_Display_x)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->x();
  }
  FL_EXPORT_C(int,Fl_Text_Display_y)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->y();
  }
  FL_EXPORT_C(int,Fl_Text_Display_w)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->w();
  }
  FL_EXPORT_C(int,Fl_Text_Display_h)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->h();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_align)(fl_Text_Display text_display, Fl_Align alignment){
    (static_cast<Fl_Text_Display*>(text_display))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Text_Display_align)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Text_Display_box)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->box();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_box)(fl_Text_Display text_display,Fl_Boxtype new_box){
    (static_cast<Fl_Text_Display*>(text_display))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_color)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->color();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_color)(fl_Text_Display text_display,Fl_Color bg){
    (static_cast<Fl_Text_Display*>(text_display))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_color_with_bg_sel)(fl_Text_Display text_display,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Text_Display*>(text_display))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_selection_color)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_selection_color)(fl_Text_Display text_display,Fl_Color a){
    (static_cast<Fl_Text_Display*>(text_display))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Text_Display_label)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->label();
  }
  FL_EXPORT_C(void,Fl_Text_Display_copy_label)(fl_Text_Display text_display,const char* new_label){
    (static_cast<Fl_Text_Display*>(text_display))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_label)(fl_Text_Display text_display,const char* text){
    (static_cast<Fl_Text_Display*>(text_display))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Text_Display_labeltype)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labeltype)(fl_Text_Display text_display,Fl_Labeltype a){
    (static_cast<Fl_Text_Display*>(text_display))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelcolor)(fl_Text_Display text_display,Fl_Color c){
    (static_cast<Fl_Text_Display*>(text_display))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Text_Display_labelcolor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Text_Display_labelfont)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelfont)(fl_Text_Display text_display,Fl_Font c){
    (static_cast<Fl_Text_Display*>(text_display))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Text_Display_labelsize)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelsize)(fl_Text_Display text_display,Fl_Fontsize pix){
    (static_cast<Fl_Text_Display*>(text_display))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Display_image)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->image();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_image)(fl_Text_Display text_display,fl_Image pix){
    (static_cast<Fl_Text_Display*>(text_display))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Display_deimage)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->deimage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_deimage)(fl_Text_Display text_display,fl_Image pix){
    (static_cast<Fl_Text_Display*>(text_display))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Text_Display_tooltip)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Text_Display_copy_tooltip)(fl_Text_Display text_display,const char* text){
    (static_cast<Fl_Text_Display*>(text_display))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_tooltip)(fl_Text_Display text_display,const char* text){
    (static_cast<Fl_Text_Display*>(text_display))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_callback_with_user_data)(fl_Text_Display text_display,fl_Callback* cb,void* p){
    Fl_Text_Display* castedWindow = (static_cast<Fl_Text_Display*>(text_display));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_callback)(fl_Text_Display text_display,fl_Callback* cb){
    Fl_Text_Display* castedWindow = (static_cast<Fl_Text_Display*>(text_display));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Text_Display_user_data)(fl_Text_Display text_display){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Display*>(text_display))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Text_Display*>(text_display))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_user_data)(fl_Text_Display text_display,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Display*>(text_display))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Text_Display*>(text_display))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Text_Display*>(text_display))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Text_Display_argument)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->argument();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_argument)(fl_Text_Display text_display,long v){
    (static_cast<Fl_Text_Display*>(text_display))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Text_Display_when)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->when();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_when)(fl_Text_Display text_display,uchar i){
    (static_cast<Fl_Text_Display*>(text_display))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_visible)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->visible();
  }
  FL_EXPORT_C(int,Fl_Text_Display_visible_r)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_visible)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->visible();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_visible)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_active)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->active();
  }
  FL_EXPORT_C(int,Fl_Text_Display_active_r)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->active_r();
  }
  FL_EXPORT_C(void,Fl_Text_Display_activate)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->activate();
  }
  FL_EXPORT_C(void,Fl_Text_Display_deactivate)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_output)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_output)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_output)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_takesevents)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_changed)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->changed();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_changed)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Text_Display_take_focus)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_visible_focus)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_visible_focus)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_modify_visible_focus)(fl_Text_Display text_display,int v){
    (static_cast<Fl_Text_Display*>(text_display))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_visible_focus)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback_with_widget_and_user_data)(fl_Text_Display text_display,fl_Widget w,long arg){
    (static_cast<Fl_Text_Display*>(text_display))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback_with_widget_and_default_user_data)(fl_Text_Display text_display,fl_Widget w){
    (static_cast<Fl_Text_Display*>(text_display))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Display_contains)(fl_Text_Display text_display,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(text_display))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Display_inside)(fl_Text_Display text_display,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(text_display))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_redraw)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->redraw();
  }
  FL_EXPORT_C(void,Fl_Text_Display_redraw_label)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Text_Display_damage)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->damage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_damage_with_bitmask)(fl_Text_Display text_display,uchar c){
    (static_cast<Fl_Text_Display*>(text_display))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_damage)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_damage_with_text)(fl_Text_Display text_display,uchar c){
    (static_cast<Fl_Text_Display*>(text_display))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Display_damage_inside_widget)(fl_Text_Display text_display,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Text_Display*>(text_display))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Text_Display_draw_label_with_xywh_alignment)(fl_Text_Display text_display,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Text_Display*>(text_display))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Text_Display_measure_label)(fl_Text_Display text_display,int* ww,int* hh){
    (static_cast<Fl_Text_Display*>(text_display))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_window)(fl_Text_Display text_display){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_top_window)(fl_Text_Display text_display){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Text_Display_top_window_offset)(fl_Text_Display text_display, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Text_Display_as_group)(fl_Text_Display text_display){
    return (fl_Text_Display) (static_cast<Fl_Text_Display*>(text_display))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Text_Display_as_gl_window)(fl_Text_Display text_display){
    return (fl_Gl_Window) (static_cast<Fl_Text_Display*>(text_display))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Text_Display_begin)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->begin();
  }
  FL_EXPORT_C(void,Fl_Text_Display_end)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->end();
  }
  FL_EXPORT_C(int,Fl_Text_Display_find)(fl_Text_Display text_display,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(text_display))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Text_Display_add)(fl_Text_Display text_display,fl_Widget w){
    (static_cast<Fl_Text_Display*>(text_display))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_remove_index)(fl_Text_Display text_display,int index){
    (static_cast<Fl_Text_Display*>(text_display))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Text_Display_remove_widget)(fl_Text_Display text_display,fl_Widget w){
    (static_cast<Fl_Text_Display*>(text_display))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->clear();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_resizable_by_reference)(fl_Text_Display text_display,fl_Widget o){
    (static_cast<Fl_Text_Display*>(text_display))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_resizable)(fl_Text_Display text_display,fl_Widget o){
    (static_cast<Fl_Text_Display*>(text_display))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Display_resizable)(fl_Text_Display text_display){
    return (fl_Widget)(static_cast<Fl_Text_Display*>(text_display))->resizable();
  }
  FL_EXPORT_C(void,Fl_Text_Display_add_resizable)(fl_Text_Display text_display,fl_Widget o){
    return (static_cast<Fl_Text_Display*>(text_display))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_init_sizes)(fl_Text_Display text_display){
    (static_cast<Fl_Text_Display*>(text_display))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Text_Display_children)(fl_Text_Display self){
    return (static_cast<Fl_Text_Display*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_clip_children)(fl_Text_Display text_display,int c){
    return (static_cast<Fl_Text_Display*>(text_display))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_clip_children)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Text_Display_focus)(fl_Text_Display text_display, fl_Widget W){
    return (static_cast<Fl_Text_Display*>(text_display))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Display__ddfdesign_kludge)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(fl_Widget*, Fl_Text_Display_array)(fl_Text_Display self){
    return (fl_Widget*)(static_cast<Fl_Text_Display*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Text_Display_child)(fl_Text_Display self, int n){
    return (fl_Widget)(static_cast<Fl_Text_Display*>(self))->child(n);
  }
  FL_EXPORT_C(void, Fl_Text_Display_Destroy)(fl_Text_Display text_display){
    delete (static_cast<Fl_Text_Display*>(text_display));
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_buffer)(fl_Text_Display text_display,fl_Text_Buffer buf){
    return (static_cast<Fl_Text_Display*>(text_display))->buffer((static_cast<Fl_Text_Buffer*>(buf)));
  }
  FL_EXPORT_C(fl_Text_Buffer,Fl_Text_Display_buffer)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->buffer();
  }
  FL_EXPORT_C(void,Fl_Text_Display_redisplay_range)(fl_Text_Display text_display,int start,int end){
    return (static_cast<Fl_Text_Display*>(text_display))->redisplay_range(start,end);
  }
  FL_EXPORT_C(void,Fl_Text_Display_scroll)(fl_Text_Display text_display,int topLineNum,int horizOffset){
    return (static_cast<Fl_Text_Display*>(text_display))->scroll(topLineNum,horizOffset);
  }
  FL_EXPORT_C(void,Fl_Text_Display_insert)(fl_Text_Display text_display,const char* text){
    return (static_cast<Fl_Text_Display*>(text_display))->insert(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_overstrike)(fl_Text_Display text_display,const char* text){
    return (static_cast<Fl_Text_Display*>(text_display))->overstrike(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_insert_position)(fl_Text_Display text_display,int newPos){
    return (static_cast<Fl_Text_Display*>(text_display))->insert_position(newPos);
  }
  FL_EXPORT_C(int,Fl_Text_Display_insert_position)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->insert_position();
  }
  FL_EXPORT_C(int,Fl_Text_Display_position_to_xy)(fl_Text_Display text_display,int pos,int* x,int* y){
    return (static_cast<Fl_Text_Display*>(text_display))->position_to_xy(pos,x,y);
  }
  FL_EXPORT_C(int,Fl_Text_Display_in_selection)(fl_Text_Display text_display,int x,int y){
    return (static_cast<Fl_Text_Display*>(text_display))->in_selection(x,y);
  }
  FL_EXPORT_C(void,Fl_Text_Display_show_insert_position)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->show_insert_position();
  }
  FL_EXPORT_C(int,Fl_Text_Display_move_right)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->move_right();
  }
  FL_EXPORT_C(int,Fl_Text_Display_move_left)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->move_left();
  }
  FL_EXPORT_C(int,Fl_Text_Display_move_up)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->move_up();
  }
  FL_EXPORT_C(int,Fl_Text_Display_move_down)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->move_down();
  }
  FL_EXPORT_C(int,Fl_Text_Display_count_lines)(fl_Text_Display text_display,int start,int end,int start_pos_is_line_start){
    return (static_cast<Fl_Text_Display*>(text_display))->count_lines(start,end,start_pos_is_line_start >= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Display_line_start)(fl_Text_Display text_display,int pos){
    return (static_cast<Fl_Text_Display*>(text_display))->line_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Display_line_end)(fl_Text_Display text_display,int startPos,int startPosIsLineStart){
    return (static_cast<Fl_Text_Display*>(text_display))->line_end(startPos,startPosIsLineStart >= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Display_skip_lines)(fl_Text_Display text_display,int startPos,int nLines,int startPosIsLineStart){
    return (static_cast<Fl_Text_Display*>(text_display))->skip_lines(startPos,nLines,startPosIsLineStart>= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Display_rewind_lines)(fl_Text_Display text_display,int startPos,int nLines){
    return (static_cast<Fl_Text_Display*>(text_display))->rewind_lines(startPos,nLines);
  }
  FL_EXPORT_C(void,Fl_Text_Display_next_word)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->next_word();
  }
  FL_EXPORT_C(void,Fl_Text_Display_previous_word)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->previous_word();
  }
  FL_EXPORT_C(void,Fl_Text_Display_show_cursor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->show_cursor();
  }
  FL_EXPORT_C(void,Fl_Text_Display_show_cursor_with_b)(fl_Text_Display text_display,int b){
    return (static_cast<Fl_Text_Display*>(text_display))->show_cursor(b);
  }
  FL_EXPORT_C(void,Fl_Text_Display_hide_cursor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->hide_cursor();
  }
  // FL_EXPORT_C(int ,Fl_Text_Display_cursor_style)(fl_Text_Display text_display){
  //  return (static_cast<Fl_Text_Display*>(text_display))->cursor_style();
  // }
  FL_EXPORT_C(void,Fl_Text_Display_set_cursor_style)(fl_Text_Display text_display,int style){
    (static_cast<Fl_Text_Display*>(text_display))->cursor_style(style);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_cursor_color)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_cursor_color)(fl_Text_Display text_display,Fl_Color n){
    return (static_cast<Fl_Text_Display*>(text_display))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Text_Display_scrollbar_width)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_scrollbar_width)(fl_Text_Display text_display,int W){
    return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_width(W);
  }
  FL_EXPORT_C(Fl_Align,Fl_Text_Display_scrollbar_align)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_align();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_scrollbar_align)(fl_Text_Display text_display,Fl_Align a){
    return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_align(a);
  }
  FL_EXPORT_C(int,Fl_Text_Display_word_start)(fl_Text_Display text_display,int pos){
    return (static_cast<Fl_Text_Display*>(text_display))->word_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Display_word_end)(fl_Text_Display text_display,int pos){
    return (static_cast<Fl_Text_Display*>(text_display))->word_end(pos);
  }
  FL_EXPORT_C(void,Fl_Text_Display_highlight_data)(fl_Text_Display text_display,fl_Text_Buffer styleBuffer,Style_Table_Entry *styleTable,int nStyles,char unfinishedStyle,Unfinished_Style_Cb unfinishedHighlightCB,void *cbArg){
    Fl_Text_Display::Style_Table_Entry* s = new Fl_Text_Display::Style_Table_Entry[nStyles]();
    int i = 0;
    for (;i<nStyles;i++){
      Fl_Text_Display::Style_Table_Entry x =  Fl_Text_Display::Style_Table_Entry();
      x.color = styleTable[i].color;
      x.font = styleTable[i].font;
      x.size = styleTable[i].size;
      x.attr = styleTable[i].attr;
      s[i] = x;
    }
    (static_cast<Fl_Text_Display*>(text_display))->highlight_data((static_cast<Fl_Text_Buffer*>(styleBuffer)),s,nStyles,unfinishedStyle,unfinishedHighlightCB,cbArg);
  }
  FL_EXPORT_C(int,Fl_Text_Display_position_style)(fl_Text_Display text_display,int lineStartPos,int lineLen,int lineIndex){
    return (static_cast<Fl_Text_Display*>(text_display))->position_style(lineStartPos,lineLen,lineIndex);
  }
  FL_EXPORT_C(int,Fl_Text_Display_shortcut)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_shortcut)(fl_Text_Display text_display,int s){
    return (static_cast<Fl_Text_Display*>(text_display))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Text_Display_textfont)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->textfont();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_textfont)(fl_Text_Display text_display,Fl_Font s){
    return (static_cast<Fl_Text_Display*>(text_display))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Text_Display_textsize)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->textsize();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_textsize)(fl_Text_Display text_display,Fl_Fontsize s){
    return (static_cast<Fl_Text_Display*>(text_display))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_textcolor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_textcolor)(fl_Text_Display text_display,Fl_Color n){
    return (static_cast<Fl_Text_Display*>(text_display))->textcolor(n);
  }
  FL_EXPORT_C(int,Fl_Text_Display_wrapped_column)(fl_Text_Display text_display,int row,int column){
    return (static_cast<Fl_Text_Display*>(text_display))->wrapped_column(row,column);
  }
  FL_EXPORT_C(int,Fl_Text_Display_wrapped_row)(fl_Text_Display text_display,int row){
    return (static_cast<Fl_Text_Display*>(text_display))->wrapped_row(row);
  }
  FL_EXPORT_C(void,Fl_Text_Display_wrap_mode)(fl_Text_Display text_display,int wrap,int wrap_margin){
    return (static_cast<Fl_Text_Display*>(text_display))->wrap_mode(wrap,wrap_margin);
  }
  FL_EXPORT_C(double,Fl_Text_Display_x_to_col)(fl_Text_Display text_display,double x){
    return (static_cast<Fl_Text_Display*>(text_display))->x_to_col(x);
  }
  FL_EXPORT_C(double,Fl_Text_Display_col_to_x)(fl_Text_Display text_display,double col){
    return (static_cast<Fl_Text_Display*>(text_display))->col_to_x(col);
  }
  FL_EXPORT_C(void,set_linenumber_width)(fl_Text_Display text_display,int width){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_width(width);
  }
  FL_EXPORT_C(int         ,linenumber_width)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_width();
  }
  FL_EXPORT_C(void        ,set_linenumber_font)(fl_Text_Display text_display,Fl_Font val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_font(val);
  }
  FL_EXPORT_C(Fl_Font     ,linenumber_font)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_font();
  }
  FL_EXPORT_C(void        ,set_linenumber_size)(fl_Text_Display text_display,Fl_Fontsize val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_size(val);
  }
  FL_EXPORT_C(Fl_Fontsize ,linenumber_size)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_size();
  }
  FL_EXPORT_C(void        ,set_linenumber_fgcolor)(fl_Text_Display text_display,Fl_Color val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_fgcolor(val);
  }
  FL_EXPORT_C(Fl_Color    ,linenumber_fgcolor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_fgcolor();
  }
  FL_EXPORT_C(void        ,set_linenumber_bgcolor)(fl_Text_Display text_display,Fl_Color val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_bgcolor(val);
  }
  FL_EXPORT_C(Fl_Color    ,linenumber_bgcolor)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_bgcolor();
  }
  FL_EXPORT_C(void        ,set_linenumber_align)(fl_Text_Display text_display,Fl_Align val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_align(val);
  }
  FL_EXPORT_C(Fl_Align    ,linenumber_align)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_align();
  }
  FL_EXPORT_C(void        ,set_linenumber_format)(fl_Text_Display text_display,const char* val){
    (static_cast<Fl_Text_Display*>(text_display))->linenumber_format(val);
  }
  FL_EXPORT_C(const char* ,linenumber_format)(fl_Text_Display text_display){
    return (static_cast<Fl_Text_Display*>(text_display))->linenumber_format();
  }
  FL_EXPORT_C(fl_Text_Display,    Fl_Text_Display_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedText_Display* w = new Fl_DerivedText_Display(X,Y,W,H,fs);
    return (fl_Text_Display)w;
  }
  FL_EXPORT_C(fl_Text_Display,    Fl_Text_Display_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedText_Display* w = new Fl_DerivedText_Display(X,Y,W,H,label,fs);
    return (fl_Text_Display)w;
  }
  FL_EXPORT_C(fl_Text_Display,    Fl_OverriddenText_Display_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedText_Display* w = new Fl_DerivedText_Display(X,Y,W,H,fs);
    return (fl_Text_Display)w;
  }
  FL_EXPORT_C(fl_Text_Display,    Fl_OverriddenText_Display_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedText_Display* w = new Fl_DerivedText_Display(X,Y,W,H,label,fs);
    return (fl_Text_Display)w;
  }
  FL_EXPORT_C(void, Fl_Text_Display_draw)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Text_Display_draw_super)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Text_Display_handle)(fl_Text_Display o, int event){
    return (static_cast<Fl_DerivedText_Display*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Text_Display_handle_super)(fl_Text_Display o, int event){
    return (static_cast<Fl_DerivedText_Display*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Text_Display_resize)(fl_Text_Display o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedText_Display*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Text_Display_resize_super)(fl_Text_Display o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedText_Display*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Text_Display_show)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Text_Display_show_super)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Text_Display_hide)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Text_Display_hide_super)(fl_Text_Display o){
    (static_cast<Fl_DerivedText_Display*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
