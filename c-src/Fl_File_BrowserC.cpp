#include "Fl_File_BrowserC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedFile_Browser::Fl_DerivedFile_Browser(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_File_Browser(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedFile_Browser::Fl_DerivedFile_Browser(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_File_Browser(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedFile_Browser::~Fl_DerivedFile_Browser(){
    free(overriddenFuncs);
  }
  void Fl_DerivedFile_Browser::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_File_Browser) this);
    }
    else {
      Fl_File_Browser::draw();
    }
  }

  void Fl_DerivedFile_Browser::draw_super(){
    Fl_File_Browser::draw();
  }

  int Fl_DerivedFile_Browser::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_File_Browser) this,event);
    }
    else {
      i = Fl_File_Browser::handle(event);
    }
    return i;
  }
  int Fl_DerivedFile_Browser::handle_super(int event){
    return Fl_File_Browser::handle(event);
  }

  void Fl_DerivedFile_Browser::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_File_Browser) this,x,y,w,h);
    }
    else {
      Fl_File_Browser::resize(x,y,w,h);
    }
  }

  void Fl_DerivedFile_Browser::resize_super(int x, int y, int w, int h){
    Fl_File_Browser::resize(x,y,w,h);
  }
  void Fl_DerivedFile_Browser::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_File_Browser) this);
    }
    else {
      Fl_File_Browser::show();
    }
  }
  void Fl_DerivedFile_Browser::show_super(){
    Fl_File_Browser::show();
  }

  void Fl_DerivedFile_Browser::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_File_Browser) this);
    }
    else {
      Fl_File_Browser::hide();
    }
  }
  void Fl_DerivedFile_Browser::hide_super(){
    Fl_File_Browser::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_File_Browser_parent)(fl_File_Browser file_browser){
    return (fl_Group) (static_cast<Fl_File_Browser*>(file_browser))->parent();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_parent)(fl_File_Browser file_browser,fl_Group grp){
    (static_cast<Fl_File_Browser*>(file_browser))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_File_Browser_type)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->type();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_type)(fl_File_Browser file_browser,uchar t){
    (static_cast<Fl_File_Browser*>(file_browser))->type(t);
  }

  FL_EXPORT_C(int,Fl_File_Browser_x)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->x();
  }
  FL_EXPORT_C(int,Fl_File_Browser_y)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->y();
  }
  FL_EXPORT_C(int,Fl_File_Browser_w)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->w();
  }
  FL_EXPORT_C(int,Fl_File_Browser_h)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->h();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_align)(fl_File_Browser file_browser, Fl_Align alignment){
    (static_cast<Fl_File_Browser*>(file_browser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_File_Browser_align)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_File_Browser_box)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->box();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_box)(fl_File_Browser file_browser,Fl_Boxtype new_box){
    (static_cast<Fl_File_Browser*>(file_browser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Browser_color)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->color();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_color)(fl_File_Browser file_browser,Fl_Color bg){
    (static_cast<Fl_File_Browser*>(file_browser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_color_with_bg_sel)(fl_File_Browser file_browser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_File_Browser*>(file_browser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Browser_selection_color)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_selection_color)(fl_File_Browser file_browser,Fl_Color a){
    (static_cast<Fl_File_Browser*>(file_browser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_File_Browser_label)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->label();
  }
  FL_EXPORT_C(void,Fl_File_Browser_copy_label)(fl_File_Browser file_browser,const char* new_label){
    (static_cast<Fl_File_Browser*>(file_browser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_label)(fl_File_Browser file_browser,const char* text){
    (static_cast<Fl_File_Browser*>(file_browser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_File_Browser_labeltype)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_labeltype)(fl_File_Browser file_browser,Fl_Labeltype a){
    (static_cast<Fl_File_Browser*>(file_browser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_labelcolor)(fl_File_Browser file_browser,Fl_Color c){
    (static_cast<Fl_File_Browser*>(file_browser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_File_Browser_labelcolor)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_File_Browser_labelfont)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_labelfont)(fl_File_Browser file_browser,Fl_Font c){
    (static_cast<Fl_File_Browser*>(file_browser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_File_Browser_labelsize)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_labelsize)(fl_File_Browser file_browser,Fl_Fontsize pix){
    (static_cast<Fl_File_Browser*>(file_browser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_File_Browser_image)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->image();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_image)(fl_File_Browser file_browser,fl_Image pix){
    (static_cast<Fl_File_Browser*>(file_browser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_File_Browser_deimage)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->deimage();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_deimage)(fl_File_Browser file_browser,fl_Image pix){
    (static_cast<Fl_File_Browser*>(file_browser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_File_Browser_tooltip)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_File_Browser_copy_tooltip)(fl_File_Browser file_browser,const char* text){
    (static_cast<Fl_File_Browser*>(file_browser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_tooltip)(fl_File_Browser file_browser,const char* text){
    (static_cast<Fl_File_Browser*>(file_browser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_callback_with_user_data)(fl_File_Browser file_browser,fl_Callback* cb,void* p){
    Fl_File_Browser* castedWindow = (static_cast<Fl_File_Browser*>(file_browser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_callback)(fl_File_Browser file_browser,fl_Callback* cb){
    Fl_File_Browser* castedWindow = (static_cast<Fl_File_Browser*>(file_browser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_File_Browser_user_data)(fl_File_Browser file_browser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Browser*>(file_browser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_File_Browser*>(file_browser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_user_data)(fl_File_Browser file_browser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_File_Browser*>(file_browser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_File_Browser*>(file_browser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_File_Browser*>(file_browser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_File_Browser_argument)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->argument();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_argument)(fl_File_Browser file_browser,long v){
    (static_cast<Fl_File_Browser*>(file_browser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_File_Browser_when)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->when();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_when)(fl_File_Browser file_browser,uchar i){
    (static_cast<Fl_File_Browser*>(file_browser))->when(i);
  }
  FL_EXPORT_C(int,Fl_File_Browser_visible_r)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_visible)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Browser_active)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->active();
  }
  FL_EXPORT_C(int,Fl_File_Browser_active_r)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->active_r();
  }
  FL_EXPORT_C(void,Fl_File_Browser_activate)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->activate();
  }
  FL_EXPORT_C(void,Fl_File_Browser_deactivate)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Browser_output)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->output();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_output)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->output();
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_output)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_File_Browser_takesevents)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_changed)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->changed();
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_changed)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_File_Browser_take_focus)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_visible_focus)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_visible_focus)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_File_Browser_modify_visible_focus)(fl_File_Browser file_browser,int v){
    (static_cast<Fl_File_Browser*>(file_browser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_File_Browser_visible_focus)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_File_Browser_contains)(fl_File_Browser file_browser,fl_Widget w){
    return (static_cast<Fl_File_Browser*>(file_browser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_File_Browser_inside)(fl_File_Browser file_browser,fl_Widget w){
    return (static_cast<Fl_File_Browser*>(file_browser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_File_Browser_redraw)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->redraw();
  }
  FL_EXPORT_C(void,Fl_File_Browser_redraw_label)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_File_Browser_damage)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->damage();
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_damage_with_bitmask)(fl_File_Browser file_browser,uchar c){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear_damage)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_File_Browser_damage_with_text)(fl_File_Browser file_browser,uchar c){
    (static_cast<Fl_File_Browser*>(file_browser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_File_Browser_damage_inside_widget)(fl_File_Browser file_browser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_File_Browser*>(file_browser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_File_Browser_draw_label_with_xywh_alignment)(fl_File_Browser file_browser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_File_Browser*>(file_browser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_File_Browser_measure_label)(fl_File_Browser file_browser,int* ww,int* hh){
    (static_cast<Fl_File_Browser*>(file_browser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_window)(fl_File_Browser file_browser){
    return (fl_Window) (static_cast<Fl_File_Browser*>(file_browser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_File_Browser_top_window)(fl_File_Browser file_browser){
    return (fl_Window) (static_cast<Fl_File_Browser*>(file_browser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_File_Browser_top_window_offset)(fl_File_Browser file_browser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_File_Browser*>(file_browser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_File_Browser_as_group_super)(fl_File_Browser file_browser){
    return (fl_Group) (static_cast<Fl_File_Browser*>(file_browser))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_File_Browser_as_group)(fl_File_Browser file_browser){
    return (fl_Group) (static_cast<Fl_File_Browser*>(file_browser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_File_Browser_as_gl_window_super)(fl_File_Browser file_browser){
    return (fl_Gl_Window) (static_cast<Fl_File_Browser*>(file_browser))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_File_Browser_as_gl_window)(fl_File_Browser file_browser){
    return (fl_Gl_Window) (static_cast<Fl_File_Browser*>(file_browser))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_resizable_by_reference)(fl_File_Browser file_browser,fl_Widget o){
    (static_cast<Fl_File_Browser*>(file_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_resizable)(fl_File_Browser file_browser,fl_Widget o){
    (static_cast<Fl_File_Browser*>(file_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_File_Browser_resizable)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->resizable();
  }
  FL_EXPORT_C(void,Fl_File_Browser_add_resizable)(fl_File_Browser file_browser,fl_Widget o){
    return (static_cast<Fl_File_Browser*>(file_browser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_clip_children)(fl_File_Browser file_browser,int c){
    return (static_cast<Fl_File_Browser*>(file_browser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_File_Browser_clip_children)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_File_Browser_focus)(fl_File_Browser file_browser, fl_Widget W){
    return (static_cast<Fl_File_Browser*>(file_browser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_File_Browser__ddfdesign_kludge)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void,Fl_File_Browser_Destroy)(fl_File_Browser file_browser){
    delete (static_cast<Fl_File_Browser*>(file_browser));
  }
  FL_EXPORT_C(void,Fl_File_Browser_remove)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->remove(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_add)(fl_File_Browser file_browser,const char* newtext){
    return (static_cast<Fl_File_Browser*>(file_browser))->add(newtext);
  }
  FL_EXPORT_C(void,Fl_File_Browser_add_with_d)(fl_File_Browser file_browser,const char* newtext,void* d){
    return (static_cast<Fl_File_Browser*>(file_browser))->add(newtext,d);
  }
  FL_EXPORT_C(void,Fl_File_Browser_insert)(fl_File_Browser file_browser,int line,const char* newtext){
    return (static_cast<Fl_File_Browser*>(file_browser))->insert(line,newtext);
  }
  FL_EXPORT_C(void,Fl_File_Browser_insert_with_d)(fl_File_Browser file_browser,int line,const char* newtext,void* d){
    return (static_cast<Fl_File_Browser*>(file_browser))->insert(line,newtext,d);
  }
  FL_EXPORT_C(void,Fl_File_Browser_move)(fl_File_Browser file_browser,int to,int from){
    return (static_cast<Fl_File_Browser*>(file_browser))->move(to,from);
  }
  FL_EXPORT_C(void,Fl_File_Browser_clear)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->clear();
  }
  FL_EXPORT_C(int,Fl_File_Browser_size)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->size();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_size)(fl_File_Browser file_browser,int W,int H){
    return (static_cast<Fl_File_Browser*>(file_browser))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_File_Browser_topline)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->topline();
  }
  FL_EXPORT_C(void,Fl_File_Browser_lineposition)(fl_File_Browser file_browser,int line,Fl_Line_Position pos){
    Fl_File_Browser::Fl_Line_Position p = (Fl_File_Browser::Fl_Line_Position)-1;
    switch(p){
    case TOP :    {p = Fl_File_Browser::TOP; break;}
    case BOTTOM : {p = Fl_File_Browser::BOTTOM; break;}
    case MIDDLE : {p = Fl_File_Browser::MIDDLE; break;}
    default:      {p = (Fl_File_Browser::Fl_Line_Position)-1; break;}
    }
    return (static_cast<Fl_File_Browser*>(file_browser))->lineposition(line,p);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_topline)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->topline(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_bottomline)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->bottomline(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_middleline)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->middleline(line);
  }
  FL_EXPORT_C(int,Fl_File_Browser_select)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->select(line);
  }
  FL_EXPORT_C(int,Fl_File_Browser_select_with_val)(fl_File_Browser file_browser,int line,int val){
    return (static_cast<Fl_File_Browser*>(file_browser))->select(line,val);
  }
  FL_EXPORT_C(int,Fl_File_Browser_selected)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->selected(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_show_with_line)(fl_File_Browser file_browser,int line){
    (static_cast<Fl_File_Browser*>(file_browser))->show(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_hide_with_line)(fl_File_Browser file_browser,int line){
    (static_cast<Fl_File_Browser*>(file_browser))->hide(line);
  }
  FL_EXPORT_C(int,Fl_File_Browser_visible)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->visible(line);
  }
  FL_EXPORT_C(int,Fl_File_Browser_value)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->value();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_value)(fl_File_Browser file_browser,int line){
    (static_cast<Fl_File_Browser*>(file_browser))->value(line);
  }
  FL_EXPORT_C(const char*,Fl_File_Browser_text)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->text(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_text)(fl_File_Browser file_browser,int line,const char* newtext){
    (static_cast<Fl_File_Browser*>(file_browser))->text(line,newtext);
  }
  FL_EXPORT_C(void*,Fl_File_Browser_data)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->data(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_data)(fl_File_Browser file_browser,int line,void* d){
    (static_cast<Fl_File_Browser*>(file_browser))->data(line,d);
  }
  FL_EXPORT_C(char,Fl_File_Browser_format_char)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->format_char();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_format_char)(fl_File_Browser file_browser,char c){
    (static_cast<Fl_File_Browser*>(file_browser))->format_char(c);
  }
  FL_EXPORT_C(char,Fl_File_Browser_column_char)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->column_char();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_column_char)(fl_File_Browser file_browser,char c){
    (static_cast<Fl_File_Browser*>(file_browser))->column_char(c);
  }
  FL_EXPORT_C(const int*,Fl_File_Browser_column_widths)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->column_widths();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_column_widths)(fl_File_Browser file_browser,const int* arr){
    (static_cast<Fl_File_Browser*>(file_browser))->column_widths(arr);
  }
  FL_EXPORT_C(int,Fl_File_Browser_displayed)(fl_File_Browser file_browser,int line){
    return (static_cast<Fl_File_Browser*>(file_browser))->displayed(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_make_visible)(fl_File_Browser file_browser,int line){
    (static_cast<Fl_File_Browser*>(file_browser))->make_visible(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_icon)(fl_File_Browser file_browser,int line,fl_Image icon){
    (static_cast<Fl_File_Browser*>(file_browser))->icon(line,(static_cast<Fl_Image*>(icon)));
  }
  FL_EXPORT_C(fl_Image,Fl_File_Browser_icon)(fl_File_Browser file_browser,int line){
    return (fl_Image)(static_cast<Fl_File_Browser*>(file_browser))->icon(line);
  }
  FL_EXPORT_C(void,Fl_File_Browser_remove_icon)(fl_File_Browser file_browser,int line){
    (static_cast<Fl_File_Browser*>(file_browser))->remove_icon(line);
  }
  FL_EXPORT_C(int,Fl_File_Browser_select_only)(fl_File_Browser file_browser,void *item){
    return (static_cast<Fl_File_Browser*>(file_browser))->select_only(item);
  }
  FL_EXPORT_C(int,Fl_File_Browser_select_only_with_docallbacks)(fl_File_Browser file_browser,void *item,int docallbacks){
    return (static_cast<Fl_File_Browser*>(file_browser))->select_only(item,docallbacks);
  }
  FL_EXPORT_C(int,Fl_File_Browser_deselect)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->deselect();
  }
  FL_EXPORT_C(int,Fl_File_Browser_deselect_with_docallbacks)(fl_File_Browser file_browser,int docallbacks){
    return (static_cast<Fl_File_Browser*>(file_browser))->deselect(docallbacks);
  }
  FL_EXPORT_C(int,Fl_File_Browser_position)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->position();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_position)(fl_File_Browser file_browser,int pos){
    (static_cast<Fl_File_Browser*>(file_browser))->position(pos);
  }
  FL_EXPORT_C(int,Fl_File_Browser_hposition)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->hposition();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_hposition)(fl_File_Browser file_browser,int ){
    (static_cast<Fl_File_Browser*>(file_browser))->hposition();
  }
  FL_EXPORT_C(uchar,Fl_File_Browser_has_scrollbar)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->has_scrollbar();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_has_scrollbar)(fl_File_Browser file_browser,uchar mode){
    (static_cast<Fl_File_Browser*>(file_browser))->has_scrollbar(mode);
  }
  FL_EXPORT_C(Fl_Font,Fl_File_Browser_textfont)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->textfont();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_textfont)(fl_File_Browser file_browser,Fl_Font font){
    (static_cast<Fl_File_Browser*>(file_browser))->textfont(font);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_File_Browser_textsize)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->textsize();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_textsize)(fl_File_Browser file_browser,Fl_Fontsize newSize){
    (static_cast<Fl_File_Browser*>(file_browser))->textsize(newSize);
  }
  FL_EXPORT_C(Fl_Color,Fl_File_Browser_textcolor)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->textcolor();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_textcolor)(fl_File_Browser file_browser,Fl_Color col){
    (static_cast<Fl_File_Browser*>(file_browser))->textcolor(col);
  }
  FL_EXPORT_C(int,Fl_File_Browser_scrollbar_size)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_scrollbar_size)(fl_File_Browser file_browser,int newSize){
    (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_size(newSize);
  }
  FL_EXPORT_C(int,Fl_File_Browser_scrollbar_width)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_scrollbar_width)(fl_File_Browser file_browser,int width){
    (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_width(width);
  }
  FL_EXPORT_C(void,Fl_File_Browser_scrollbar_right)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_right();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_scrollbar_left)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->scrollbar_left();
  }
  FL_EXPORT_C(void,Fl_File_Browser_sort)(fl_File_Browser file_browser){
    (static_cast<Fl_File_Browser*>(file_browser))->sort();
  }
  FL_EXPORT_C(void,Fl_File_Browser_sort_with_flags)(fl_File_Browser file_browser,int flags){
    (static_cast<Fl_File_Browser*>(file_browser))->sort(flags);
  }
  FL_EXPORT_C(uchar,Fl_File_Browser_iconsize)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->iconsize();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_iconsize)(fl_File_Browser file_browser,uchar s){
    (static_cast<Fl_File_Browser*>(file_browser))->iconsize(s);
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_filter)(fl_File_Browser file_browser,const char* pattern){
    (static_cast<Fl_File_Browser*>(file_browser))->filter(pattern);
  }
  FL_EXPORT_C(const char*,Fl_File_Browser_filter)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->filter();
  }
  FL_EXPORT_C(int,Fl_File_Browser_load)(fl_File_Browser file_browser,const char* directory,Fl_File_Sort_F* sort){
    return (static_cast<Fl_File_Browser*>(file_browser))->load(directory,sort);
  }
  FL_EXPORT_C(int,Fl_File_Browser_filetype)(fl_File_Browser file_browser){
    return (static_cast<Fl_File_Browser*>(file_browser))->filetype();
  }
  FL_EXPORT_C(void,Fl_File_Browser_set_filetype)(fl_File_Browser file_browser,int t){
    (static_cast<Fl_File_Browser*>(file_browser))->filetype(t);
  }
  FL_EXPORT_C(void, Fl_File_Browser_draw)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_File_Browser_draw_super)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_File_Browser_handle)(fl_File_Browser o, int event){
    return (static_cast<Fl_DerivedFile_Browser*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_File_Browser_handle_super)(fl_File_Browser o, int event){
    return (static_cast<Fl_DerivedFile_Browser*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_File_Browser_resize)(fl_File_Browser o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedFile_Browser*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_File_Browser_resize_super)(fl_File_Browser o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedFile_Browser*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_File_Browser_show)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_File_Browser_show_super)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_File_Browser_hide)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_File_Browser_hide_super)(fl_File_Browser o){
    (static_cast<Fl_DerivedFile_Browser*>(o))->hide_super();
  }
#ifdef __cplusplus
}
#endif
