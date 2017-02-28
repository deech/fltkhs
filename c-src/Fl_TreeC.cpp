#include "Fl_TreeC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedTree::Fl_DerivedTree(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Tree(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedTree::Fl_DerivedTree(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Tree(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedTree::~Fl_DerivedTree(){
    free(overriddenFuncs);
  }
  void Fl_DerivedTree::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Tree) this);
    }
    else {
      Fl_Tree::draw();
    }
  }

  void Fl_DerivedTree::draw_super(){
    Fl_Tree::draw();
  }

  int Fl_DerivedTree::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Tree) this,event);
    }
    else {
      i = Fl_Tree::handle(event);
    }
    return i;
  }
  int Fl_DerivedTree::handle_super(int event){
    return Fl_Tree::handle(event);
  }

  void Fl_DerivedTree::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Tree) this,x,y,w,h);
    }
    else {
      Fl_Tree::resize(x,y,w,h);
    }
  }

  void Fl_DerivedTree::resize_super(int x, int y, int w, int h){
    Fl_Tree::resize(x,y,w,h);
  }
  void Fl_DerivedTree::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Tree) this);
    }
    else {
      Fl_Tree::show();
    }
  }
  void Fl_DerivedTree::show_super(){
    Fl_Tree::show();
  }

  void Fl_DerivedTree::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Tree) this);
    }
    else {
      Fl_Tree::hide();
    }
  }
  void Fl_DerivedTree::hide_super(){
    Fl_Tree::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Tree_parent)(fl_Tree tree){
    return (fl_Group) (static_cast<Fl_Tree*>(tree))->parent();
  }
  FL_EXPORT_C(void,Fl_Tree_set_parent)(fl_Tree tree,fl_Group grp){
    (static_cast<Fl_Tree*>(tree))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Tree_type)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->type();
  }
  FL_EXPORT_C(void,Fl_Tree_set_type)(fl_Tree tree,uchar t){
    (static_cast<Fl_Tree*>(tree))->type(t);
  }

  FL_EXPORT_C(int,Fl_Tree_x)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->x();
  }
  FL_EXPORT_C(int,Fl_Tree_y)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->y();
  }
  FL_EXPORT_C(int,Fl_Tree_w)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->w();
  }
  FL_EXPORT_C(int,Fl_Tree_h)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->h();
  }
  FL_EXPORT_C(void,Fl_Tree_set_align)(fl_Tree tree, Fl_Align alignment){
    (static_cast<Fl_Tree*>(tree))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Tree_align)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Tree_box)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->box();
  }
  FL_EXPORT_C(void,Fl_Tree_set_box)(fl_Tree tree,Fl_Boxtype new_box){
    (static_cast<Fl_Tree*>(tree))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_color)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->color();
  }
  FL_EXPORT_C(void,Fl_Tree_set_color)(fl_Tree tree,Fl_Color bg){
    (static_cast<Fl_Tree*>(tree))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Tree_set_color_with_bg_sel)(fl_Tree tree,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Tree*>(tree))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_selection_color)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Tree_set_selection_color)(fl_Tree tree,Fl_Color a){
    (static_cast<Fl_Tree*>(tree))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Tree_label)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->label();
  }
  FL_EXPORT_C(void,Fl_Tree_copy_label)(fl_Tree tree,const char* new_label){
    (static_cast<Fl_Tree*>(tree))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Tree_set_label)(fl_Tree tree,const char* text){
    (static_cast<Fl_Tree*>(tree))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Tree_labeltype)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Tree_set_labeltype)(fl_Tree tree,Fl_Labeltype a){
    (static_cast<Fl_Tree*>(tree))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Tree_set_labelcolor)(fl_Tree tree,Fl_Color c){
    (static_cast<Fl_Tree*>(tree))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Tree_labelcolor)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->labelcolor();
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_image)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->image();
  }
  FL_EXPORT_C(void,Fl_Tree_set_image)(fl_Tree tree,fl_Image pix){
    (static_cast<Fl_Tree*>(tree))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_deimage)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->deimage();
  }
  FL_EXPORT_C(void,Fl_Tree_set_deimage)(fl_Tree tree,fl_Image pix){
    (static_cast<Fl_Tree*>(tree))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Tree_tooltip)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Tree_copy_tooltip)(fl_Tree tree,const char* text){
    (static_cast<Fl_Tree*>(tree))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tree_set_tooltip)(fl_Tree tree,const char* text){
    (static_cast<Fl_Tree*>(tree))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tree_set_callback_with_user_data)(fl_Tree tree,fl_Callback* cb,void* p){
    Fl_Tree* castedButton = (static_cast<Fl_Tree*>(tree));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Tree_set_callback)(fl_Tree tree,fl_Callback* cb){
    Fl_Tree* castedButton = (static_cast<Fl_Tree*>(tree));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Tree_user_data)(fl_Tree tree){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Tree*>(tree))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Tree*>(tree))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Tree_set_user_data)(fl_Tree tree,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Tree*>(tree))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Tree*>(tree))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Tree*>(tree))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Tree_argument)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->argument();
  }
  FL_EXPORT_C(void,Fl_Tree_set_argument)(fl_Tree tree,long v){
    (static_cast<Fl_Tree*>(tree))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Tree_when)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->when();
  }
  FL_EXPORT_C(void,Fl_Tree_set_when)(fl_Tree tree,uchar i){
    (static_cast<Fl_Tree*>(tree))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_visible)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->visible();
  }
  FL_EXPORT_C(int,Fl_Tree_visible_r)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Tree_set_visible)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->visible();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_visible)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_active)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->active();
  }
  FL_EXPORT_C(int,Fl_Tree_active_r)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->active_r();
  }
  FL_EXPORT_C(void,Fl_Tree_activate)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->activate();
  }
  FL_EXPORT_C(void,Fl_Tree_deactivate)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_output)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->output();
  }
  FL_EXPORT_C(void,Fl_Tree_set_output)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->output();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_output)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_takesevents)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Tree_set_changed)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->changed();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_changed)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Tree_take_focus)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Tree_set_visible_focus)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_visible_focus)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tree_modify_visible_focus)(fl_Tree tree,int v){
    (static_cast<Fl_Tree*>(tree))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_visible_focus)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tree_do_callback)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Tree_do_callback_with_widget_and_user_data)(fl_Tree tree,fl_Widget w,long arg){
    (static_cast<Fl_Tree*>(tree))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Tree_do_callback_with_widget_and_default_user_data)(fl_Tree tree,fl_Widget w){
    (static_cast<Fl_Tree*>(tree))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tree_contains)(fl_Tree tree,fl_Widget w){
    return (static_cast<Fl_Tree*>(tree))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tree_inside)(fl_Tree tree,fl_Widget w){
    return (static_cast<Fl_Tree*>(tree))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Tree_redraw)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->redraw();
  }
  FL_EXPORT_C(void,Fl_Tree_redraw_label)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Tree_damage)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->damage();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_damage_with_bitmask)(fl_Tree tree,uchar c){
    (static_cast<Fl_Tree*>(tree))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Tree_clear_damage)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Tree_damage_with_text)(fl_Tree tree,uchar c){
    (static_cast<Fl_Tree*>(tree))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Tree_damage_inside_widget)(fl_Tree tree,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Tree*>(tree))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Tree_draw_label_with_xywh_alignment)(fl_Tree tree,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Tree*>(tree))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Tree_measure_label)(fl_Tree tree,int* ww,int* hh){
    (static_cast<Fl_Tree*>(tree))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Tree_window)(fl_Tree tree){
    return (fl_Window) (static_cast<Fl_Tree*>(tree))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Tree_top_window)(fl_Tree tree){
    return (fl_Window) (static_cast<Fl_Tree*>(tree))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Tree_top_window_offset)(fl_Tree tree, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Tree*>(tree))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Tree_as_group)(fl_Tree tree){
    return (fl_Group) (static_cast<Fl_Tree*>(tree))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Tree_as_gl_window)(fl_Tree tree){
    return (fl_Gl_Window) (static_cast<Fl_Tree*>(tree))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Tree_begin)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->begin();
  }
  FL_EXPORT_C(void,Fl_Tree_end)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->end();
  }
  FL_EXPORT_C(int,Fl_Tree_find)(fl_Tree tree,fl_Widget w){
    return (static_cast<Fl_Tree*>(tree))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Tree_set_resizable_by_reference)(fl_Tree tree,fl_Widget o){
    (static_cast<Fl_Tree*>(tree))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tree_set_resizable)(fl_Tree tree,fl_Widget o){
    (static_cast<Fl_Tree*>(tree))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tree_resizable)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->resizable();
  }
  FL_EXPORT_C(void,Fl_Tree_add_resizable)(fl_Tree tree,fl_Widget o){
    return (static_cast<Fl_Tree*>(tree))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tree_init_sizes)(fl_Tree tree){
    (static_cast<Fl_Tree*>(tree))->init_sizes();
  }
  FL_EXPORT_C(void,Fl_Tree_set_clip_children)(fl_Tree tree,int c){
    return (static_cast<Fl_Tree*>(tree))->clip_children(c);
  }
  FL_EXPORT_C(int,Fl_Tree_children)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->children();
  }
  FL_EXPORT_C(unsigned int,Fl_Tree_clip_children)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Tree_focus)(fl_Tree tree, fl_Widget W){
    return (static_cast<Fl_Tree*>(tree))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tree__ddfdesign_kludge)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(fl_Widget*, Fl_Tree_array)(fl_Tree self){
    return (fl_Widget*)(static_cast<Fl_Tree*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Tree_child)(fl_Tree self, int n){
    return (fl_Widget)(static_cast<Fl_Tree*>(self))->child(n);
  }
  FL_EXPORT_C(void,Fl_Tree_Destroy)(fl_Tree tree){
    delete (static_cast<Fl_Tree*>(tree));
  }
  FL_EXPORT_C(void,Fl_Tree_show_self)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->show_self();
  }
  FL_EXPORT_C(void,Fl_Tree_root_label)(fl_Tree tree,const char *new_label){
    return (static_cast<Fl_Tree*>(tree))->root_label(new_label);
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_root)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->root();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_add)(fl_Tree tree,const char *path){
    return (fl_Tree_Item)(static_cast<Fl_Tree*>(tree))->add(path);
  }
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_add_with_item_name)(fl_Tree tree,fl_Tree_Item item, const char *name){
    return (fl_Tree_Item)(static_cast<Fl_Tree*>(tree))->add((static_cast<Fl_Tree_Item*>(item)),name);
  };
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_insert_above)(fl_Tree tree,fl_Tree_Item above,const char *name){
    return (static_cast<Fl_Tree*>(tree))->insert_above((static_cast<Fl_Tree_Item*>(above)),name);
  }
  FL_EXPORT_C(int,Fl_Tree_remove)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->remove((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_clear)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->clear();
  }
  FL_EXPORT_C(void,Fl_Tree_clear_children)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->clear_children((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_find_item)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->find_item(path);
  }
  FL_EXPORT_C(int,Fl_Tree_item_pathname)(fl_Tree tree,char *pathname,int pathnamelen,const fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->item_pathname(pathname,pathnamelen,(static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_item_clicked)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->item_clicked();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_first)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->first();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_first_visible)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->first_visible();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_next)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->next();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_next_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->next((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_prev)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->prev();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_prev_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->prev((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_last)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->last();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_last_visible)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->last_visible();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_first_selected_item)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->first_selected_item();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_last_selected_item)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->last_selected_item();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_next_selected_item)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->next_selected_item();
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_next_selected_item_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->next_selected_item((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_next_selected_item_with_item_direction)(fl_Tree tree,fl_Tree_Item item, int dir){
    return (static_cast<Fl_Tree*>(tree))->next_selected_item((static_cast<Fl_Tree_Item*>(item)), dir);
  }
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_next_item)(fl_Tree tree,fl_Tree_Item item, int dir, int visible) {
    return (static_cast<Fl_Tree*>(tree))->next_item((static_cast<Fl_Tree_Item*>(item)), dir, visible);
  }
  FL_EXPORT_C(int,Fl_Tree_open_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->open((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_open_with_item_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->open((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_open_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->open(path);
  }
  FL_EXPORT_C(int,Fl_Tree_open_with_path_docallback)(fl_Tree tree,const char* path,int docallback){
    return (static_cast<Fl_Tree*>(tree))->open(path,docallback);
  }
  FL_EXPORT_C(void,Fl_Tree_open_toggle)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->open_toggle((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_open_toggle_with_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->open_toggle((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_close_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->close((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_close_with_item_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->close((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_close_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->close(path);
  }
  FL_EXPORT_C(int,Fl_Tree_close_with_path_docallback)(fl_Tree tree,const char* path,int docallback){
    return (static_cast<Fl_Tree*>(tree))->close(path,docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_is_open_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->is_open((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_is_open_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->is_open(path);
  }
  FL_EXPORT_C(int,Fl_Tree_is_close_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->is_close((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_is_close_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->is_close(path);
  }
  FL_EXPORT_C(int,Fl_Tree_select_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->select((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_select_with_item_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->select((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_select_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->select(path);
  }
  FL_EXPORT_C(int,Fl_Tree_select_with_path_docallback)(fl_Tree tree,const char* path,int docallback){
    return (static_cast<Fl_Tree*>(tree))->select(path,docallback);
  }
  FL_EXPORT_C(void,Fl_Tree_select_toggle)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->select_toggle((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_select_toggle_with_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->select_toggle((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->deselect((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_with_item_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->deselect((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->deselect(path);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_with_path_docallback)(fl_Tree tree,const char* path,int docallback){
    return (static_cast<Fl_Tree*>(tree))->deselect(path,docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_all_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->deselect_all((static_cast<Fl_Tree_Item*>(item)),1);
  }
  FL_EXPORT_C(fl_Tree_Item, Fl_Tree_insert)(fl_Tree tree,fl_Tree_Item item, const char *name, int pos){
    return (static_cast<Fl_Tree*>(tree))->insert((static_cast<Fl_Tree_Item*>(item)), name, pos);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_all_with_docallback)(fl_Tree tree,int docallback){
    return (static_cast<Fl_Tree*>(tree))->deselect_all(0,docallback);
  }
  FL_EXPORT_C(int,Fl_Tree_deselect_all_with_item_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    return (static_cast<Fl_Tree*>(tree))->deselect_all((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(void,Fl_Tree_select_only)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->select_only((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_select_only_with_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    (static_cast<Fl_Tree*>(tree))->select_only((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(void,Fl_Tree_select_all)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->select_all((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_select_all_with_docallback)(fl_Tree tree,fl_Tree_Item item,int docallback){
    (static_cast<Fl_Tree*>(tree))->select_all((static_cast<Fl_Tree_Item*>(item)),docallback);
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_focus)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->set_item_focus((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_get_item_focus)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->get_item_focus();
  }
  FL_EXPORT_C(int,Fl_Tree_is_selected_with_item)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->is_selected((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_is_selected_with_path)(fl_Tree tree,const char *path){
    return (static_cast<Fl_Tree*>(tree))->is_selected(path);
  }
  FL_EXPORT_C(Fl_Font,Fl_Tree_item_labelfont)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_labelfont)(fl_Tree tree,Fl_Font val){
    return (static_cast<Fl_Tree*>(tree))->item_labelfont(val);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Tree_item_labelsize)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_labelsize)(fl_Tree tree,Fl_Fontsize val){
    return (static_cast<Fl_Tree*>(tree))->item_labelsize(val);
  }

  FL_EXPORT_C(Fl_Color,Fl_Tree_item_labelfgcolor)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->item_labelfgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_labelfgcolor)(fl_Tree tree,Fl_Color val){
    return (static_cast<Fl_Tree*>(tree))->item_labelfgcolor(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_item_labelbgcolor)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->item_labelbgcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_labelbgcolor)(fl_Tree tree,Fl_Color val){
    return (static_cast<Fl_Tree*>(tree))->item_labelbgcolor(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tree_connectorcolor)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->connectorcolor();
  }
  FL_EXPORT_C(void,Fl_Tree_set_connectorcolor)(fl_Tree tree,Fl_Color val){
    return (static_cast<Fl_Tree*>(tree))->connectorcolor(val);
  }
  FL_EXPORT_C(int,Fl_Tree_marginleft)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->marginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_set_marginleft)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->marginleft(val);
  }
  FL_EXPORT_C(int,Fl_Tree_margintop)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->margintop();
  }
  FL_EXPORT_C(void,Fl_Tree_set_margintop)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->margintop(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int,Fl_Tree_marginbottom)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->marginbottom();
  }
  FL_EXPORT_C(void,Fl_Tree_set_marginbottom)(fl_Tree tree,int val){
    (static_cast<Fl_Tree*>(tree))->marginbottom(val);
  }
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int,Fl_Tree_linespacing)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->linespacing();
  }
  FL_EXPORT_C(void,Fl_Tree_set_linespacing)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->linespacing(val);
  }
  FL_EXPORT_C(int,Fl_Tree_openchild_marginbottom)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->openchild_marginbottom();
  }
  FL_EXPORT_C(void,Fl_Tree_set_openchild_marginbottom)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->openchild_marginbottom(val);
  }
  FL_EXPORT_C(int,Fl_Tree_usericonmarginleft)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->usericonmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_set_usericonmarginleft)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->usericonmarginleft(val);
  }
  FL_EXPORT_C(int,Fl_Tree_labelmarginleft)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->labelmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_set_labelmarginleft)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->labelmarginleft(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(int,Fl_Tree_widgetmarginleft)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->widgetmarginleft();
  }
  FL_EXPORT_C(void,Fl_Tree_set_widgetmarginleft)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->widgetmarginleft(val);
  }
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int,Fl_Tree_connectorwidth)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->connectorwidth();
  }
  FL_EXPORT_C(void,Fl_Tree_set_connectorwidth)(fl_Tree tree,int val){
    return (static_cast<Fl_Tree*>(tree))->connectorwidth(val);
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_usericon)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->usericon();
  }
  FL_EXPORT_C(void,Fl_Tree_set_usericon)(fl_Tree tree,fl_Image val){
    return (static_cast<Fl_Tree*>(tree))->usericon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_openicon)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->openicon();
  }
  FL_EXPORT_C(void,Fl_Tree_set_openicon)(fl_Tree tree,fl_Image val){
    return (static_cast<Fl_Tree*>(tree))->openicon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tree_closeicon)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->closeicon();
  }
  FL_EXPORT_C(void,Fl_Tree_set_closeicon)(fl_Tree tree,fl_Image val){
    (static_cast<Fl_Tree*>(tree))->closeicon((static_cast<Fl_Image*>(val)));
  }
  FL_EXPORT_C(int,Fl_Tree_showcollapse)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->showcollapse();
  }
  FL_EXPORT_C(void,Fl_Tree_set_showcollapse)(fl_Tree tree,int val){
    (static_cast<Fl_Tree*>(tree))->showcollapse(val);
  }
  FL_EXPORT_C(int,Fl_Tree_showroot)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->showroot();
  }
  FL_EXPORT_C(void,Fl_Tree_set_showroot)(fl_Tree tree,int val){
    (static_cast<Fl_Tree*>(tree))->showroot(val);
  }
  FL_EXPORT_C(Fl_Tree_Connector,Fl_Tree_connectorstyle)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->connectorstyle();
  }
  FL_EXPORT_C(void,Fl_Tree_set_connectorstyle)(fl_Tree tree,Fl_Tree_Connector val){
    (static_cast<Fl_Tree*>(tree))->connectorstyle(val);
  }
  FL_EXPORT_C(Fl_Tree_Sort,Fl_Tree_sortorder)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->sortorder();
  }
  FL_EXPORT_C(void,Fl_Tree_set_sortorder)(fl_Tree tree,Fl_Tree_Sort val){
    (static_cast<Fl_Tree*>(tree))->sortorder(val);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Tree_selectbox)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->selectbox();
  }
  FL_EXPORT_C(void,Fl_Tree_set_selectbox)(fl_Tree tree,Fl_Boxtype val){
    (static_cast<Fl_Tree*>(tree))->selectbox(val);
  }
  FL_EXPORT_C(Fl_Tree_Select,Fl_Tree_selectmode)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->selectmode();
  }
  FL_EXPORT_C(void,Fl_Tree_set_selectmode)(fl_Tree tree,Fl_Tree_Select val){
    (static_cast<Fl_Tree*>(tree))->selectmode(val);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(Fl_Tree_Item_Reselect_Mode,Fl_Tree_item_reselect_mode)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->item_reselect_mode();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_reselect_mode)(fl_Tree tree,Fl_Tree_Item_Reselect_Mode mode){
    (static_cast<Fl_Tree*>(tree))->item_reselect_mode(mode);
  }
  FL_EXPORT_C(Fl_Tree_Item_Draw_Mode,Fl_Tree_item_draw_mode)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->item_draw_mode();
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_draw_mode)(fl_Tree tree,Fl_Tree_Item_Draw_Mode mode){
    (static_cast<Fl_Tree*>(tree))->item_draw_mode(mode);
  }
  FL_EXPORT_C(void,Fl_Tree_set_item_draw_mode_with_int)(fl_Tree tree,int mode){
    (static_cast<Fl_Tree*>(tree))->item_draw_mode(mode);
  }
#endif /*FLTK_ABI_VERSION*/
  FL_EXPORT_C(int,Fl_Tree_displayed)(fl_Tree tree,fl_Tree_Item item){
    return (static_cast<Fl_Tree*>(tree))->displayed((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_show_item_with_yoff)(fl_Tree tree,fl_Tree_Item item,int yoff){
    (static_cast<Fl_Tree*>(tree))->show_item((static_cast<Fl_Tree_Item*>(item)),yoff);
  }
  FL_EXPORT_C(void,Fl_Tree_show_item)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->show_item((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_show_item_top)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->show_item_top((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_show_item_middle)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->show_item_middle((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_show_item_bottom)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->show_item_bottom((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(void,Fl_Tree_display)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->display((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(int,Fl_Tree_vposition)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->vposition();
  }
  FL_EXPORT_C(void,Fl_Tree_set_vposition)(fl_Tree tree,int pos){
    (static_cast<Fl_Tree*>(tree))->vposition(pos);
  }
  FL_EXPORT_C(void,Fl_Tree_load)(fl_Tree tree,fl_Preferences preferences){
    (static_cast<Fl_Tree*>(tree))->load(*(static_cast<Fl_Preferences*>(preferences)));
  }
  FL_EXPORT_C(int, Fl_Tree_is_scrollbar)(fl_Tree tree,fl_Widget w){
    return (static_cast<Fl_Tree*>(tree))->is_scrollbar((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tree_scrollbar_size)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Tree_set_scrollbar_size)(fl_Tree tree,int size){
    (static_cast<Fl_Tree*>(tree))->scrollbar_size(size);
  }
  FL_EXPORT_C(int,Fl_Tree_is_vscroll_visible)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->is_vscroll_visible();
  }
  FL_EXPORT_C(void,Fl_Tree_set_callback_item)(fl_Tree tree,fl_Tree_Item item){
    (static_cast<Fl_Tree*>(tree))->callback_item((static_cast<Fl_Tree_Item*>(item)));
  }
  FL_EXPORT_C(fl_Tree_Item,Fl_Tree_callback_item)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->callback_item();
  }
  FL_EXPORT_C(void,Fl_Tree_set_callback_reason)(fl_Tree tree,Fl_Tree_Reason reason){
    (static_cast<Fl_Tree*>(tree))->callback_reason(reason);
  }
  FL_EXPORT_C(Fl_Tree_Reason,Fl_Tree_callback_reason)(fl_Tree tree){
    return (static_cast<Fl_Tree*>(tree))->callback_reason();
  }
  FL_EXPORT_C(fl_Tree,    Fl_Tree_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedTree* w = new Fl_DerivedTree(X,Y,W,H,fs);
    return (fl_Tree)w;
  }
  FL_EXPORT_C(fl_Tree,    Fl_Tree_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedTree* w = new Fl_DerivedTree(X,Y,W,H,label,fs);
    return (fl_Tree)w;
  }
  FL_EXPORT_C(fl_Tree,    Fl_OverriddenTree_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTree* w = new Fl_DerivedTree(X,Y,W,H,fs);
    return (fl_Tree)w;
  }
  FL_EXPORT_C(fl_Tree,    Fl_OverriddenTree_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTree* w = new Fl_DerivedTree(X,Y,W,H,label,fs);
    return (fl_Tree)w;
  }
  FL_EXPORT_C(void, Fl_Tree_draw)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Tree_draw_super)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Tree_handle)(fl_Tree o, int event){
    return (static_cast<Fl_DerivedTree*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Tree_handle_super)(fl_Tree o, int event){
    return (static_cast<Fl_DerivedTree*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Tree_resize)(fl_Tree o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTree*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tree_resize_super)(fl_Tree o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTree*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tree_show)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Tree_show_super)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Tree_hide)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Tree_hide_super)(fl_Tree o){
    (static_cast<Fl_DerivedTree*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
