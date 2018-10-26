#include "Fl_TabsC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedTabs::Fl_DerivedTabs(int X, int Y, int W, int H, const char *l, fl_Tab_Virtual_Funcs* fs, fl_Widget_Virtual_Funcs* funcs) : Fl_Tabs(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
    this->fs = fs;
  }
  Fl_DerivedTabs::Fl_DerivedTabs(int X, int Y, int W, int H, fl_Tab_Virtual_Funcs* fs, fl_Widget_Virtual_Funcs* funcs):Fl_Tabs(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
    this->fs = fs;
  }
  Fl_DerivedTabs::~Fl_DerivedTabs(){
    free(overriddenFuncs);
    free(fs);
  }
  void Fl_DerivedTabs::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Tabs) this);
    }
    else {
      Fl_Tabs::draw();
    }
  }

  void Fl_DerivedTabs::draw_super(){
    Fl_Tabs::draw();
  }

  Fl_Widget* Fl_DerivedTabs::which(int event_x, int event_y) {
    if (this->fs->tab_which != NULL) {
      return (Fl_Widget*)(this->fs->tab_which((fl_Tabs)this, event_x, event_y));
    }
    else {
      return Fl_Tabs::which(event_x,event_y);
    }
  }

  int Fl_DerivedTabs::tab_positions(){
    if (this->fs->tab_positions != NULL) {
      const int nc = children();
      if (nc != tab_count) {
          clear_tab_positions();
          if (nc) {
              tab_pos = (int*)malloc((nc+1)*sizeof(int));
              tab_width = (int*)malloc((nc+1)*sizeof(int));
          }
          tab_count = nc;
      }
      return this->fs->tab_positions((fl_Tabs)this, tab_pos, tab_width);
    }
    else {
      return Fl_Tabs::tab_positions();
    }
  }

  int Fl_DerivedTabs::tab_height() {
      if (this->fs->tab_height != NULL) {
          return this->fs->tab_height((fl_Tabs)this);
      }
      else {
          return Fl_Tabs::tab_height();
      }
  }

  int Fl_DerivedTabs::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Tabs) this,event);
    }
    else {
      i = Fl_Tabs::handle(event);
    }
    return i;
  }
  int Fl_DerivedTabs::handle_super(int event){
    return Fl_Tabs::handle(event);
  }

  void Fl_DerivedTabs::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Tabs) this,x,y,w,h);
    }
    else {
      Fl_Tabs::resize(x,y,w,h);
    }
  }

  void Fl_DerivedTabs::resize_super(int x, int y, int w, int h){
    Fl_Tabs::resize(x,y,w,h);
  }
  void Fl_DerivedTabs::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Tabs) this);
    }
    else {
      Fl_Tabs::show();
    }
  }
  void Fl_DerivedTabs::show_super(){
    Fl_Tabs::show();
  }

  void Fl_DerivedTabs::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Tabs) this);
    }
    else {
      Fl_Tabs::hide();
    }
  }
  void Fl_DerivedTabs::hide_super(){
    Fl_Tabs::hide();
  }

  void Fl_DerivedTabs::redraw_tabs(){
    if (this->fs->redraw_tabs != NULL) {
      this->fs->redraw_tabs((fl_Tabs)this);
    }
    else {
      Fl_Tabs::redraw_tabs();
    }
  }
  void Fl_DerivedTabs::client_area(int &rx, int &ry, int &rw, int &rh, int tabh){
    if (this->fs->tab_client_area != NULL) {
      this->fs->tab_client_area((fl_Tabs)this, &rx,&ry,&rw,&rh,tabh);
    }
    else {
      Fl_Tabs::client_area(rx,ry,rw,rh,tabh);
    }
  }

#endif
  FL_EXPORT_C(fl_Tab_Virtual_Funcs*, Fl_Tab_default_virtual_funcs)() {
    fl_Tab_Virtual_Funcs* ptr = (fl_Tab_Virtual_Funcs*)malloc(sizeof(fl_Tab_Virtual_Funcs));
    ptr->tab_draw = NULL;
    ptr->tab_positions = NULL;
    ptr->tab_height = NULL;
    ptr->tab_which = NULL;
    ptr->redraw_tabs = NULL;
    ptr->tab_client_area = NULL;
    return ptr;
  }
  FL_EXPORT_C(fl_Group,Fl_Tabs_parent)(fl_Tabs tabs){
    return (fl_Group) (static_cast<Fl_DerivedTabs*>(tabs))->parent();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_parent)(fl_Tabs tabs,fl_Group grp){
    (static_cast<Fl_DerivedTabs*>(tabs))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Tabs_type)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->type();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_type)(fl_Tabs tabs,uchar t){
    (static_cast<Fl_DerivedTabs*>(tabs))->type(t);
  }
  FL_EXPORT_C(int,Fl_Tabs_x)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->x();
  }
  FL_EXPORT_C(int,Fl_Tabs_y)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->y();
  }
  FL_EXPORT_C(int,Fl_Tabs_w)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->w();
  }
  FL_EXPORT_C(int,Fl_Tabs_h)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->h();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_align)(fl_Tabs tabs, Fl_Align alignment){
    (static_cast<Fl_DerivedTabs*>(tabs))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Tabs_align)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Tabs_box)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->box();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_box)(fl_Tabs tabs,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedTabs*>(tabs))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Tabs_color)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->color();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_color)(fl_Tabs tabs,Fl_Color bg){
    (static_cast<Fl_DerivedTabs*>(tabs))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_color_with_bg_sel)(fl_Tabs tabs,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedTabs*>(tabs))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tabs_selection_color)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_selection_color)(fl_Tabs tabs,Fl_Color a){
    (static_cast<Fl_DerivedTabs*>(tabs))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Tabs_label)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->label();
  }
  FL_EXPORT_C(void,Fl_Tabs_copy_label)(fl_Tabs tabs,const char* new_label){
    (static_cast<Fl_DerivedTabs*>(tabs))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_label)(fl_Tabs tabs,const char* text){
    (static_cast<Fl_DerivedTabs*>(tabs))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Tabs_labeltype)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_labeltype)(fl_Tabs tabs,Fl_Labeltype a){
    (static_cast<Fl_DerivedTabs*>(tabs))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_labelcolor)(fl_Tabs tabs,Fl_Color c){
    (static_cast<Fl_DerivedTabs*>(tabs))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Tabs_labelcolor)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->labelcolor();
  }
  FL_EXPORT_C(fl_Image,Fl_Tabs_image)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->image();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_image)(fl_Tabs tabs,fl_Image pix){
    (static_cast<Fl_DerivedTabs*>(tabs))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tabs_deimage)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->deimage();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_deimage)(fl_Tabs tabs,fl_Image pix){
    (static_cast<Fl_DerivedTabs*>(tabs))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Tabs_tooltip)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Tabs_copy_tooltip)(fl_Tabs tabs,const char* text){
    (static_cast<Fl_DerivedTabs*>(tabs))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_tooltip)(fl_Tabs tabs,const char* text){
    (static_cast<Fl_DerivedTabs*>(tabs))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_callback_with_user_data)(fl_Tabs tabs,fl_Callback* cb,void* p){
    Fl_Tabs* castedButton = (static_cast<Fl_DerivedTabs*>(tabs));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Tabs_set_callback)(fl_Tabs tabs,fl_Callback* cb){
    Fl_Tabs* castedButton = (static_cast<Fl_DerivedTabs*>(tabs));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Tabs_user_data)(fl_Tabs tabs){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedTabs*>(tabs))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedTabs*>(tabs))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Tabs_set_user_data)(fl_Tabs tabs,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedTabs*>(tabs))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_DerivedTabs*>(tabs))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_DerivedTabs*>(tabs))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Tabs_argument)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->argument();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_argument)(fl_Tabs tabs,long v){
    (static_cast<Fl_DerivedTabs*>(tabs))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Tabs_when)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->when();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_when)(fl_Tabs tabs,uchar i){
    (static_cast<Fl_DerivedTabs*>(tabs))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_visible)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->visible();
  }
  FL_EXPORT_C(int,Fl_Tabs_visible_r)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_visible)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->visible();
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_visible)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_active)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->active();
  }
  FL_EXPORT_C(int,Fl_Tabs_active_r)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->active_r();
  }
  FL_EXPORT_C(void,Fl_Tabs_activate)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->activate();
  }
  FL_EXPORT_C(void,Fl_Tabs_deactivate)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_output)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->output();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_output)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->output();
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_output)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_takesevents)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_changed)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->changed();
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_changed)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Tabs_take_focus)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_visible_focus)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_visible_focus)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tabs_modify_visible_focus)(fl_Tabs tabs,int v){
    (static_cast<Fl_DerivedTabs*>(tabs))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_visible_focus)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tabs_do_callback)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Tabs_do_callback_with_widget_and_user_data)(fl_Tabs tabs,fl_Widget w,long arg){
    (static_cast<Fl_DerivedTabs*>(tabs))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Tabs_do_callback_with_widget_and_default_user_data)(fl_Tabs tabs,fl_Widget w){
    (static_cast<Fl_DerivedTabs*>(tabs))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tabs_contains)(fl_Tabs tabs,fl_Widget w){
    return (static_cast<Fl_DerivedTabs*>(tabs))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tabs_inside)(fl_Tabs tabs,fl_Widget w){
    return (static_cast<Fl_DerivedTabs*>(tabs))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Tabs_redraw)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->redraw();
  }
  FL_EXPORT_C(void,Fl_Tabs_redraw_label)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Tabs_damage)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->damage();
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_damage_with_bitmask)(fl_Tabs tabs,uchar c){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Tabs_clear_damage)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Tabs_damage_with_text)(fl_Tabs tabs,uchar c){
    (static_cast<Fl_DerivedTabs*>(tabs))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Tabs_damage_inside_widget)(fl_Tabs tabs,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedTabs*>(tabs))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Tabs_draw_label_with_xywh_alignment)(fl_Tabs tabs,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedTabs*>(tabs))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Tabs_measure_label)(fl_Tabs tabs,int* ww,int* hh){
    (static_cast<Fl_DerivedTabs*>(tabs))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Tabs_window)(fl_Tabs tabs){
    return (fl_Window) (static_cast<Fl_DerivedTabs*>(tabs))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Tabs_top_window)(fl_Tabs tabs){
    return (fl_Window) (static_cast<Fl_DerivedTabs*>(tabs))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Tabs_top_window_offset)(fl_Tabs tabs, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedTabs*>(tabs))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Tabs_as_group)(fl_Tabs tabs){
    return (fl_Group) (static_cast<Fl_DerivedTabs*>(tabs))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Tabs_as_gl_window)(fl_Tabs tabs){
    return (fl_Gl_Window) (static_cast<Fl_DerivedTabs*>(tabs))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Tabs_begin)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->begin();
  }
  FL_EXPORT_C(void,Fl_Tabs_end)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->end();
  }
  FL_EXPORT_C(int,Fl_Tabs_find)(fl_Tabs tabs,fl_Widget w){
    return (static_cast<Fl_DerivedTabs*>(tabs))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Tabs_set_resizable_by_reference)(fl_Tabs tabs,fl_Widget o){
    (static_cast<Fl_DerivedTabs*>(tabs))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tabs_set_resizable)(fl_Tabs tabs,fl_Widget o){
    (static_cast<Fl_DerivedTabs*>(tabs))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tabs_resizable)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->resizable();
  }
  FL_EXPORT_C(void,Fl_Tabs_add_resizable)(fl_Tabs tabs,fl_Widget o){
    return (static_cast<Fl_DerivedTabs*>(tabs))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tabs_init_sizes)(fl_Tabs tabs){
    (static_cast<Fl_DerivedTabs*>(tabs))->init_sizes();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_clip_children)(fl_Tabs tabs,int c){
    return (static_cast<Fl_DerivedTabs*>(tabs))->clip_children(c);
  }
  FL_EXPORT_C(int,Fl_Tabs_children)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->children();
  }
  FL_EXPORT_C(unsigned int,Fl_Tabs_clip_children)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Tabs_focus)(fl_Tabs tabs, fl_Widget W){
    return (static_cast<Fl_DerivedTabs*>(tabs))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tabs__ddfdesign_kludge)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(fl_Widget*, Fl_Tabs_array)(fl_Tabs self){
    return (fl_Widget*)(static_cast<Fl_DerivedTabs*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Tabs_child)(fl_Tabs self, int n){
    return (fl_Widget)(static_cast<Fl_DerivedTabs*>(self))->child(n);
  }
  FL_EXPORT_C(fl_Widget,Fl_Tabs_value)(fl_Tabs tabs){
    return (fl_Widget)(static_cast<Fl_DerivedTabs*>(tabs))->value();
  }
  FL_EXPORT_C(int,Fl_Tabs_set_value)(fl_Tabs tabs,fl_Widget w){
    return (static_cast<Fl_DerivedTabs*>(tabs))->value((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tabs_push)(fl_Tabs tabs){
    return (fl_Widget)(static_cast<Fl_DerivedTabs*>(tabs))->push();
  }
  FL_EXPORT_C(int,Fl_Tabs_set_push)(fl_Tabs tabs,fl_Widget w){
    return (static_cast<Fl_DerivedTabs*>(tabs))->push((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tabs_which)(fl_Tabs tabs,int event_x,int event_y){
    return (fl_Widget)(static_cast<Fl_DerivedTabs*>(tabs))->which(event_x,event_y);
  }
  FL_EXPORT_C(void,Fl_Tabs_client_area)(fl_Tabs tabs,int* rx,int* ry,int* rw,int* rh){
    (static_cast<Fl_DerivedTabs*>(tabs))->client_area(*rx,*ry,*rw,*rh,0);
  }
  FL_EXPORT_C(void,Fl_Tabs_client_area_with_tabh)(fl_Tabs tabs,int* rx,int* ry,int* rw,int* rh,int tabh){
    (static_cast<Fl_DerivedTabs*>(tabs))->client_area(*rx,*ry,*rw,*rh,tabh);
  }
  FL_EXPORT_C(void, Fl_Tabs_draw)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Tabs_draw_super)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Tabs_handle)(fl_Tabs o, int event){
    return (static_cast<Fl_DerivedTabs*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Tabs_handle_super)(fl_Tabs o, int event){
    return (static_cast<Fl_DerivedTabs*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Tabs_resize)(fl_Tabs o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTabs*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tabs_resize_super)(fl_Tabs o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTabs*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tabs_show)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Tabs_show_super)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Tabs_hide)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Tabs_hide_super)(fl_Tabs o){
    (static_cast<Fl_DerivedTabs*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Tabs,    Fl_Tabs_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    fl_Tab_Virtual_Funcs* tfs = Fl_Tab_default_virtual_funcs();
    Fl_DerivedTabs* w = new Fl_DerivedTabs(X,Y,W,H,tfs,fs);
    return (fl_Tabs)w;
  }
  FL_EXPORT_C(fl_Tabs,    Fl_Tabs_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    fl_Tab_Virtual_Funcs* tfs = Fl_Tab_default_virtual_funcs();
    Fl_DerivedTabs* w = new Fl_DerivedTabs(X,Y,W,H,label,tfs,fs);
    return (fl_Tabs)w;
  }
  FL_EXPORT_C(fl_Tabs,    Fl_OverriddenTabs_New)(int X, int Y, int W, int H,fl_Tab_Virtual_Funcs* tfs, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTabs* w = new Fl_DerivedTabs(X,Y,W,H,tfs,fs);
    return (fl_Tabs)w;
  }
  FL_EXPORT_C(fl_Tabs,    Fl_OverriddenTabs_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Tab_Virtual_Funcs* tfs, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTabs* w = new Fl_DerivedTabs(X,Y,W,H,label,tfs,fs);
    return (fl_Tabs)w;
  }
  FL_EXPORT_C(int,Fl_Tabs_tab_positions)(fl_Tabs tabs){
    return (static_cast<Fl_DerivedTabs*>(tabs))->tab_positions();
  }
  FL_EXPORT_C(int,Fl_Tabs_tab_height)(fl_Tabs tabs) {
    return (static_cast<Fl_DerivedTabs*>(tabs))->tab_height();
  }
  FL_EXPORT_C(Fl_Align,Fl_Tabs_get_tab_align)(fl_Tabs o){
    return (static_cast<Fl_DerivedTabs*>(o))->tab_align();
  }
  FL_EXPORT_C(void,Fl_Tabs_set_tab_align)(fl_Tabs o, Fl_Align a){
    (static_cast<Fl_DerivedTabs*>(o))->tab_align(a);
  }
#ifdef __cplusplus
}
#endif
