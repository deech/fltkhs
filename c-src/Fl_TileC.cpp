#include "Fl_TileC.h"
#ifdef __cplusplus
EXPORT {
  Fl_DerivedTile::Fl_DerivedTile(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Tile(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedTile::Fl_DerivedTile(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Tile(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedTile::~Fl_DerivedTile(){
    free(overriddenFuncs);
  }
  void Fl_DerivedTile::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Tile) this);
    }
    else {
      Fl_Tile::draw();
    }
  }

  void Fl_DerivedTile::draw_super(){
    Fl_Tile::draw();
  }

  int Fl_DerivedTile::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Tile) this,event);
    }
    else {
      i = Fl_Tile::handle(event);
    }
    return i;
  }
  int Fl_DerivedTile::handle_super(int event){
    return Fl_Tile::handle(event);
  }

  void Fl_DerivedTile::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Tile) this,x,y,w,h);
    }
    else {
      Fl_Tile::resize(x,y,w,h);
    }
  }

  void Fl_DerivedTile::resize_super(int x, int y, int w, int h){
    Fl_Tile::resize(x,y,w,h);
  }
  void Fl_DerivedTile::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Tile) this);
    }
    else {
      Fl_Tile::show();
    }
  }
  void Fl_DerivedTile::show_super(){
    Fl_Tile::show();
  }

  void Fl_DerivedTile::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Tile) this);
    }
    else {
      Fl_Tile::hide();
    }
  }
  void Fl_DerivedTile::hide_super(){
    Fl_Tile::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Tile_parent)(fl_Tile tile){
    return (fl_Group) (static_cast<Fl_Tile*>(tile))->parent();
  }
  FL_EXPORT_C(void,Fl_Tile_set_parent)(fl_Tile tile,fl_Group grp){
    (static_cast<Fl_Tile*>(tile))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Tile_type)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->type();
  }
  FL_EXPORT_C(void,Fl_Tile_set_type)(fl_Tile tile,uchar t){
    (static_cast<Fl_Tile*>(tile))->type(t);
  }

  FL_EXPORT_C(int,Fl_Tile_x)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->x();
  }
  FL_EXPORT_C(int,Fl_Tile_y)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->y();
  }
  FL_EXPORT_C(int,Fl_Tile_w)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->w();
  }
  FL_EXPORT_C(int,Fl_Tile_h)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->h();
  }
  FL_EXPORT_C(void,Fl_Tile_set_align)(fl_Tile tile, Fl_Align alignment){
    (static_cast<Fl_Tile*>(tile))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Tile_align)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Tile_box)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->box();
  }
  FL_EXPORT_C(void,Fl_Tile_set_box)(fl_Tile tile,Fl_Boxtype new_box){
    (static_cast<Fl_Tile*>(tile))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Tile_color)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->color();
  }
  FL_EXPORT_C(void,Fl_Tile_set_color)(fl_Tile tile,Fl_Color bg){
    (static_cast<Fl_Tile*>(tile))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Tile_set_color_with_bg_sel)(fl_Tile tile,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Tile*>(tile))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tile_selection_color)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Tile_set_selection_color)(fl_Tile tile,Fl_Color a){
    (static_cast<Fl_Tile*>(tile))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Tile_label)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->label();
  }
  FL_EXPORT_C(void,Fl_Tile_copy_label)(fl_Tile tile,const char* new_label){
    (static_cast<Fl_Tile*>(tile))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Tile_set_label)(fl_Tile tile,const char* text){
    (static_cast<Fl_Tile*>(tile))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Tile_labeltype)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Tile_set_labeltype)(fl_Tile tile,Fl_Labeltype a){
    (static_cast<Fl_Tile*>(tile))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Tile_set_labelcolor)(fl_Tile tile,Fl_Color c){
    (static_cast<Fl_Tile*>(tile))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Tile_labelcolor)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Tile_labelfont)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Tile_set_labelfont)(fl_Tile tile,Fl_Font c){
    (static_cast<Fl_Tile*>(tile))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Tile_labelsize)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Tile_set_labelsize)(fl_Tile tile,Fl_Fontsize pix){
    (static_cast<Fl_Tile*>(tile))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tile_image)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->image();
  }
  FL_EXPORT_C(void,Fl_Tile_set_image)(fl_Tile tile,fl_Image pix){
    (static_cast<Fl_Tile*>(tile))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Tile_deimage)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->deimage();
  }
  FL_EXPORT_C(void,Fl_Tile_set_deimage)(fl_Tile tile,fl_Image pix){
    (static_cast<Fl_Tile*>(tile))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Tile_tooltip)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Tile_copy_tooltip)(fl_Tile tile,const char* text){
    (static_cast<Fl_Tile*>(tile))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tile_set_tooltip)(fl_Tile tile,const char* text){
    (static_cast<Fl_Tile*>(tile))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Tile_set_callback_with_user_data)(fl_Tile tile,fl_Callback* cb,void* p){
    Fl_Tile* castedWindow = (static_cast<Fl_Tile*>(tile));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Tile_set_callback)(fl_Tile tile,fl_Callback* cb){
    Fl_Tile* castedWindow = (static_cast<Fl_Tile*>(tile));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Tile_user_data)(fl_Tile tile){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Tile*>(tile))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Tile*>(tile))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Tile_set_user_data)(fl_Tile tile,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Tile*>(tile))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Tile*>(tile))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Tile*>(tile))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Tile_argument)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->argument();
  }
  FL_EXPORT_C(void,Fl_Tile_set_argument)(fl_Tile tile,long v){
    (static_cast<Fl_Tile*>(tile))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Tile_when)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->when();
  }
  FL_EXPORT_C(void,Fl_Tile_set_when)(fl_Tile tile,uchar i){
    (static_cast<Fl_Tile*>(tile))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_visible)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->visible();
  }
  FL_EXPORT_C(int,Fl_Tile_visible_r)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Tile_set_visible)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->visible();
  }
  FL_EXPORT_C(void,Fl_Tile_clear_visible)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_active)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->active();
  }
  FL_EXPORT_C(int,Fl_Tile_active_r)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->active_r();
  }
  FL_EXPORT_C(void,Fl_Tile_activate)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->activate();
  }
  FL_EXPORT_C(void,Fl_Tile_deactivate)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_output)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->output();
  }
  FL_EXPORT_C(void,Fl_Tile_set_output)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->output();
  }
  FL_EXPORT_C(void,Fl_Tile_clear_output)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_takesevents)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Tile_set_changed)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->changed();
  }
  FL_EXPORT_C(void,Fl_Tile_clear_changed)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Tile_take_focus)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Tile_set_visible_focus)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tile_clear_visible_focus)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tile_modify_visible_focus)(fl_Tile tile,int v){
    (static_cast<Fl_Tile*>(tile))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_visible_focus)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Tile_do_callback)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Tile_do_callback_with_widget_and_user_data)(fl_Tile tile,fl_Widget w,long arg){
    (static_cast<Fl_Tile*>(tile))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Tile_do_callback_with_widget_and_default_user_data)(fl_Tile tile,fl_Widget w){
    (static_cast<Fl_Tile*>(tile))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tile_contains)(fl_Tile tile,fl_Widget w){
    return (static_cast<Fl_Tile*>(tile))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Tile_inside)(fl_Tile tile,fl_Widget w){
    return (static_cast<Fl_Tile*>(tile))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Tile_redraw)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->redraw();
  }
  FL_EXPORT_C(void,Fl_Tile_redraw_label)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Tile_damage)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->damage();
  }
  FL_EXPORT_C(void,Fl_Tile_clear_damage_with_bitmask)(fl_Tile tile,uchar c){
    (static_cast<Fl_Tile*>(tile))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Tile_clear_damage)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Tile_damage_with_text)(fl_Tile tile,uchar c){
    (static_cast<Fl_Tile*>(tile))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Tile_damage_inside_widget)(fl_Tile tile,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Tile*>(tile))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Tile_position)(fl_Tile tile,int x,int y,int w,int h){
    (static_cast<Fl_Tile*>(tile))->position(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Tile_draw_label_with_xywh_alignment)(fl_Tile tile,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Tile*>(tile))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Tile_measure_label)(fl_Tile tile,int* ww,int* hh){
    (static_cast<Fl_Tile*>(tile))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Tile_window)(fl_Tile tile){
    return (fl_Window) (static_cast<Fl_Tile*>(tile))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Tile_top_window)(fl_Tile tile){
    return (fl_Window) (static_cast<Fl_Tile*>(tile))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Tile_top_window_offset)(fl_Tile tile, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Tile*>(tile))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Tile_as_group)(fl_Tile tile){
    return (fl_Group) (static_cast<Fl_Tile*>(tile))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Tile_as_gl_window)(fl_Tile tile){
    return (fl_Gl_Window) (static_cast<Fl_Tile*>(tile))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Tile_begin)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->begin();
  }
  FL_EXPORT_C(void,Fl_Tile_end)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->end();
  }
  FL_EXPORT_C(int,Fl_Tile_find)(fl_Tile tile,fl_Widget w){
    return (static_cast<Fl_Tile*>(tile))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Tile_add)(fl_Tile tile,fl_Widget w){
    (static_cast<Fl_Tile*>(tile))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Tile_insert)(fl_Tile tile,fl_Widget w,int i){
    (static_cast<Fl_Tile*>(tile))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Tile_remove_index)(fl_Tile tile,int index){
    (static_cast<Fl_Tile*>(tile))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Tile_remove_widget)(fl_Tile tile,fl_Widget w){
    (static_cast<Fl_Tile*>(tile))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Tile_clear)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->clear();
  }
  FL_EXPORT_C(void,Fl_Tile_set_resizable_by_reference)(fl_Tile tile,fl_Widget o){
    (static_cast<Fl_Tile*>(tile))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tile_set_resizable)(fl_Tile tile,fl_Widget o){
    (static_cast<Fl_Tile*>(tile))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tile_resizable)(fl_Tile tile){
    return (fl_Widget)(static_cast<Fl_Tile*>(tile))->resizable();
  }
  FL_EXPORT_C(void,Fl_Tile_add_resizable)(fl_Tile tile,fl_Widget o){
    return (static_cast<Fl_Tile*>(tile))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Tile_init_sizes)(fl_Tile tile){
    (static_cast<Fl_Tile*>(tile))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Tile_children)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->children();
  }
  FL_EXPORT_C(void,Fl_Tile_set_clip_children)(fl_Tile tile,int c){
    return (static_cast<Fl_Tile*>(tile))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Tile_clip_children)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Tile_focus)(fl_Tile tile, fl_Widget W){
    return (static_cast<Fl_Tile*>(tile))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Tile__ddfdesign_kludge)(fl_Tile tile){
    return (static_cast<Fl_Tile*>(tile))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Tile_insert_with_before)(fl_Tile tile, fl_Widget w, fl_Widget before){
    (static_cast<Fl_Tile*>(tile))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Tile_array)(fl_Tile tile){
    return (fl_Widget*)(static_cast<Fl_Tile*>(tile))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Tile_child)(fl_Tile tile, int n){
    return (fl_Widget)(static_cast<Fl_Tile*>(tile))->child(n);
  }
  FL_EXPORT_C(fl_Tile,    Fl_Tile_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedTile* w = new Fl_DerivedTile(X,Y,W,H,fs);
    return (fl_Tile)w;
  }
  FL_EXPORT_C(fl_Tile,    Fl_Tile_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedTile* w = new Fl_DerivedTile(X,Y,W,H,label,fs);
    return (fl_Tile)w;
  }
  FL_EXPORT_C(fl_Tile,    Fl_OverriddenTile_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTile* w = new Fl_DerivedTile(X,Y,W,H,fs);
    return (fl_Tile)w;
  }
  FL_EXPORT_C(fl_Tile,    Fl_OverriddenTile_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedTile* w = new Fl_DerivedTile(X,Y,W,H,label,fs);
    return (fl_Tile)w;
  }
  FL_EXPORT_C(void, Fl_Tile_draw)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Tile_draw_super)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Tile_handle)(fl_Tile o, int event){
    return (static_cast<Fl_DerivedTile*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Tile_handle_super)(fl_Tile o, int event){
    return (static_cast<Fl_DerivedTile*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Tile_resize)(fl_Tile o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTile*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tile_resize_super)(fl_Tile o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedTile*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Tile_show)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Tile_show_super)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Tile_hide)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Tile_hide_super)(fl_Tile o){
    (static_cast<Fl_DerivedTile*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
