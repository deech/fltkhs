#include "Fl_Table_RowC.h"
#ifdef __cplusplus
Fl_DerivedTable_Row::Fl_DerivedTable_Row(int X, int Y, int W, int H, const char *l, fl_Table_Virtual_Funcs* funcs) : Fl_Table_Row(X,Y,W,H,l){
  overriddenFuncs = funcs;
  other_data = (void*)"INIT";
}
Fl_DerivedTable_Row::Fl_DerivedTable_Row(int X, int Y, int W, int H, fl_Table_Virtual_Funcs* funcs):Fl_Table_Row(X,Y,W,H,0){
  overriddenFuncs = funcs;
  other_data = (void*)"INIT";
}
Fl_DerivedTable_Row::~Fl_DerivedTable_Row(){
  destroy_data();
  free(overriddenFuncs);
}
void* Fl_DerivedTable_Row::get_other_data(){
  return this->other_data;
}
void Fl_DerivedTable_Row::set_other_data(void* data){
  this->other_data = data;
}
void Fl_DerivedTable_Row::destroy_data(){
  if (this->overriddenFuncs->destroy_data != NULL){
    this->overriddenFuncs->destroy_data((fl_Table_Row) this);
  }
}
int Fl_DerivedTable_Row::find_cell(TableContext context, int R, int C, int &X, int &Y, int &W, int &H){
  return Fl_Table_Row::find_cell(context,R,C,X,Y,W,H);
}
void Fl_DerivedTable_Row::draw(){
  if (this->overriddenFuncs->draw != NULL) {
    this->overriddenFuncs->draw((fl_Table_Row) this);
  }
  else {
    Fl_Table_Row::draw();
  }
}
void Fl_DerivedTable_Row::draw_box(){
  Fl_Table_Row::draw_box();
}
void Fl_DerivedTable_Row::draw_box(Fl_Boxtype t, Fl_Color c){
  Fl_Table_Row::draw_box(t,c);
}
void Fl_DerivedTable_Row::draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
  Fl_Table_Row::draw_box(t,x,y,w,h,c);
}
void Fl_DerivedTable_Row::draw_backdrop(){
  Fl_Table_Row::draw_backdrop();
}
void Fl_DerivedTable_Row::draw_focus(){
  Fl_Table_Row::draw_focus();
}
void Fl_DerivedTable_Row::draw_focus(Fl_Boxtype t, int x,int y,int w,int h){
  Fl_Table_Row::draw_focus(t,x,y,w,h);
}
void Fl_DerivedTable_Row::draw_label(){
  Fl_Table_Row::draw_label();
}
void Fl_DerivedTable_Row::draw_label(int x,int y,int w,int h,Fl_Align alignment){
  Fl_Table_Row::draw_label(x,y,w,h,alignment);
}
int Fl_DerivedTable_Row::handle_super(int event){
  return Fl_Table_Row::handle(event);
}
int Fl_DerivedTable_Row::handle(int event){
  int i;
  if (this->overriddenFuncs->handle != NULL) {
    i = this->overriddenFuncs->handle((fl_Table_Row) this,event);
  }
  else {
    i = Fl_Table_Row::handle(event);
  }
  return i;
}
void Fl_DerivedTable_Row::resize_super(int x, int y, int w, int h){
  Fl_Table_Row::resize(x,y,w,h);
}
void Fl_DerivedTable_Row::resize(int x, int y, int w, int h){
  if (this->overriddenFuncs->resize != NULL) {
    this->overriddenFuncs->resize((fl_Table_Row) this,x,y,w,h);
  }
  else {
    Fl_Table_Row::resize(x,y,w,h);
  }
}
void Fl_DerivedTable_Row::show(){
  if (this->overriddenFuncs->show != NULL) {
    this->overriddenFuncs->show((fl_Table_Row) this);
  }
  else {
    Fl_Table_Row::show();
  }
}
void Fl_DerivedTable_Row::hide(){
  if (this->overriddenFuncs->hide != NULL) {
    this->overriddenFuncs->hide((fl_Table_Row) this);
  }
  else {
    Fl_Table_Row::hide();
  }
}
Fl_Group* Fl_DerivedTable_Row::as_group(){
  Fl_Group* grp;
  if (this->overriddenFuncs->as_group != NULL) {
    grp = (static_cast<Fl_Group*>(this->overriddenFuncs->as_group((fl_Table_Row) this)));
  }
  else {
    grp = Fl_Table_Row::as_group();
  }
  return grp;
}
Fl_Window* Fl_DerivedTable_Row::as_window(){
  Fl_Window* win;
  if (this->overriddenFuncs->as_window != NULL) {
    win = (static_cast<Fl_Window*>(this->overriddenFuncs->as_window((fl_Table_Row) this)));
  }
  else {
    win = Fl_Table_Row::as_window();
  }
  return win;
}
Fl_Gl_Window* Fl_DerivedTable_Row::as_gl_window(){
  Fl_Gl_Window* win;
  if (this->overriddenFuncs->as_gl_window != NULL) {
    win = (static_cast<Fl_Gl_Window*>(this->overriddenFuncs->as_gl_window((fl_Table_Row) this)));
  }
  else {
    win = Fl_Table_Row::as_gl_window();
  }
  return win;
}
void Fl_DerivedTable_Row::draw_cell(TableContext tableContext, int R, int C, int X, int Y, int W, int H){
  TableContextC c = (TableContextC)-1;
  switch(tableContext){
  case Fl_Table::CONTEXT_NONE:      {c = CONTEXT_NONEC;      break;}
  case Fl_Table::CONTEXT_STARTPAGE: {c = CONTEXT_STARTPAGEC; break;}
  case Fl_Table::CONTEXT_ENDPAGE:   {c = CONTEXT_ENDPAGEC;   break;}
  case Fl_Table::CONTEXT_ROW_HEADER:{c = CONTEXT_ROW_HEADERC;break;}
  case Fl_Table::CONTEXT_COL_HEADER:{c = CONTEXT_COL_HEADERC;break;}
  case Fl_Table::CONTEXT_CELL:      {c = CONTEXT_CELLC;      break;}
  case Fl_Table::CONTEXT_TABLE:     {c = CONTEXT_TABLEC;     break;}
  case Fl_Table::CONTEXT_RC_RESIZE: {c = CONTEXT_RC_RESIZEC; break;}
  default:                          {c = TableContextC(-1);  break;}
  }
  (*this->overriddenFuncs->draw_cell)((fl_Table_Row) this,c,R,C,X,Y,W,H);
}
void Fl_DerivedTable_Row::clear(){
  if (this->overriddenFuncs->clear != NULL) {
    this->overriddenFuncs->clear((fl_Table_Row) this);
  }
  else {
    Fl_Table_Row::clear();
  }
}
void Fl_DerivedTable_Row::rows(int val){
  if (this->overriddenFuncs->set_rows != NULL) {
    this->overriddenFuncs->set_rows((fl_Table_Row) this, val);
  }
  else {
    Fl_Table_Row::rows(val);
  }
}
void Fl_DerivedTable_Row::cols(int val){
  if (this->overriddenFuncs->set_cols != NULL) {
    this->overriddenFuncs->set_cols((fl_Table_Row) this, val);
  }
  else {
    Fl_Table_Row::cols(val);
  }
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Table_Row_Virtual_Funcs*, Fl_Table_Row_default_virtual_funcs)(){
    fl_Table_Row_Virtual_Funcs* ptr = (fl_Table_Row_Virtual_Funcs*)malloc(sizeof(fl_Table_Row_Virtual_Funcs));
    ptr->draw = NULL;
    ptr->handle = NULL;
    ptr->resize = NULL;
    ptr->show  = NULL;
    ptr->hide = NULL;
    ptr->as_group = NULL;
    ptr->as_window = NULL;
    ptr->as_gl_window = NULL;
    ptr->draw_cell = NULL;
    ptr->clear = NULL;
    ptr->set_rows = NULL;
    ptr->set_cols = NULL;
    ptr->destroy_data = NULL;
    return ptr;
  }
  FL_EXPORT_C(int,Fl_Table_Row_handle)(fl_Table_Row self, int event){
    return (static_cast<Fl_DerivedTable_Row*>(self))->handle(event);
  }

  FL_EXPORT_C(int,Fl_Table_Row_handle_super)(fl_Table_Row self, int event){
    return (static_cast<Fl_DerivedTable_Row*>(self))->handle_super(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Table_Row_parent)(fl_Table_Row table_row){
    return (fl_Group) (static_cast<Fl_DerivedTable_Row*>(table_row))->parent();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_parent)(fl_Table_Row table_row,fl_Group grp){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_box)(fl_Table_Row Table_Row){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_box();
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_box_with_tc)(fl_Table_Row Table_Row,Fl_Boxtype t, Fl_Color c){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_box(t,c);
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_box_with_txywhc)(fl_Table_Row Table_Row,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_box(t,x,y,w,h,c);
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_backdrop)(fl_Table_Row Table_Row){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_backdrop();
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_focus)(fl_Table_Row Table_Row){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_focus();
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_focus_with_txywh)(fl_Table_Row Table_Row,Fl_Boxtype t, int x,int y,int w,int h){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_focus(t,x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Table_Row_draw_label)(fl_Table_Row Table_Row){
    (static_cast<Fl_DerivedTable_Row*>(Table_Row))->draw_label();
  }
  FL_EXPORT_C(int,Fl_Table_Row_x)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->x();
  }
  FL_EXPORT_C(int,Fl_Table_Row_y)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->y();
  }
  FL_EXPORT_C(int,Fl_Table_Row_w)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->w();
  }
  FL_EXPORT_C(int,Fl_Table_Row_h)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->h();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_align)(fl_Table_Row table_row, Fl_Align alignment){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Table_Row_align)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Table_Row_box)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->box();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_box)(fl_Table_Row table_row,Fl_Boxtype new_box){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Table_Row_color)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->color();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_color)(fl_Table_Row table_row,Fl_Color bg){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_color_with_bg_sel)(fl_Table_Row table_row,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Table_Row_selection_color)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_selection_color)(fl_Table_Row table_row,Fl_Color a){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Table_Row_label)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->label();
  }
  FL_EXPORT_C(void,Fl_Table_Row_copy_label)(fl_Table_Row table_row,const char* new_label){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_label)(fl_Table_Row table_row,const char* text){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Table_Row_labeltype)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_labeltype)(fl_Table_Row table_row,Fl_Labeltype a){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_labelcolor)(fl_Table_Row table_row,Fl_Color c){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Table_Row_labelcolor)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Table_Row_labelfont)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_labelfont)(fl_Table_Row table_row,Fl_Font c){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Table_Row_labelsize)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_labelsize)(fl_Table_Row table_row,Fl_Fontsize pix){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Table_Row_image)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->image();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_image)(fl_Table_Row table_row,fl_Image pix){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Table_Row_deimage)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->deimage();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_deimage)(fl_Table_Row table_row,fl_Image pix){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Table_Row_tooltip)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Table_Row_copy_tooltip)(fl_Table_Row table_row,const char* text){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_tooltip)(fl_Table_Row table_row,const char* text){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_callback_with_user_data)(fl_Table_Row table_row,fl_Callback* cb,void* p){
    Fl_DerivedTable_Row* castedWindow = (static_cast<Fl_DerivedTable_Row*>(table_row));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_callback)(fl_Table_Row table_row,fl_Callback* cb){
    Fl_DerivedTable_Row* castedWindow = (static_cast<Fl_DerivedTable_Row*>(table_row));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Table_Row_other_data)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->get_other_data();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_other_data)(fl_Table_Row table_row,void* v){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->set_other_data(v);
  }
  FL_EXPORT_C(void*,Fl_Table_Row_user_data)(fl_Table_Row table_row){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_DerivedTable_Row*>(table_row))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_DerivedTable_Row*>(table_row))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_user_data)(fl_Table_Row table_row,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Table_Row*>(table_row))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Table_Row*>(table_row))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Table_Row*>(table_row))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Table_Row_argument)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->argument();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_argument)(fl_Table_Row table_row,long v){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Table_Row_when)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->when();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_when)(fl_Table_Row table_row,uchar i){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_visible)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->visible();
  }
  FL_EXPORT_C(int,Fl_Table_Row_visible_r)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Table_Row_show_super)(fl_Table_Row table_row){
    return (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::show();
  }
  FL_EXPORT_C(void,Fl_Table_Row_show)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->show();
  }
  FL_EXPORT_C(void,Fl_Table_Row_hide_super)(fl_Table_Row table_row){
    return (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::hide();
  }
  FL_EXPORT_C(void,Fl_Table_Row_hide)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->hide();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_visible)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_active)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->active();
  }
  FL_EXPORT_C(int,Fl_Table_Row_active_r)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->active_r();
  }
  FL_EXPORT_C(void,Fl_Table_Row_activate)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->activate();
  }
  FL_EXPORT_C(void,Fl_Table_Row_deactivate)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_output)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->output();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_output)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->output();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_output)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_takesevents)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_changed)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->changed();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_changed)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Table_Row_take_focus)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_visible_focus)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_visible_focus)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Table_Row_modify_visible_focus)(fl_Table_Row table_row,int v){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_visible_focus)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Table_Row_contains)(fl_Table_Row table_row,fl_Widget w){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Table_Row_inside)(fl_Table_Row table_row,fl_Widget w){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Table_Row_redraw)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->redraw();
  }
  FL_EXPORT_C(void,Fl_Table_Row_redraw_label)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Table_Row_damage)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->damage();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_damage_with_bitmask)(fl_Table_Row table_row,uchar c){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_damage)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Table_Row_damage_with_text)(fl_Table_Row table_row,uchar c){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Table_Row_damage_inside_widget)(fl_Table_Row table_row,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Table_Row_draw_label_with_xywh_alignment)(fl_Table_Row table_row,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Table_Row_measure_label)(fl_Table_Row table_row,int* ww,int* hh){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Table_Row_window)(fl_Table_Row table_row){
    return (fl_Window) (static_cast<Fl_DerivedTable_Row*>(table_row))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Table_Row_top_window)(fl_Table_Row table_row){
    return (fl_Window) (static_cast<Fl_DerivedTable_Row*>(table_row))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Table_Row_top_window_offset)(fl_Table_Row table_row, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_DerivedTable_Row*>(table_row))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Table_Row_as_group_super)(fl_Table_Row table_row){
    return (fl_Group) (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Table_Row_as_group)(fl_Table_Row table_row){
    return (fl_Group) (static_cast<Fl_DerivedTable_Row*>(table_row))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Table_Row_as_gl_window_super)(fl_Table_Row table_row){
    return (fl_Gl_Window) (fl_Gl_Window) (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Table_Row_as_gl_window)(fl_Table_Row table_row){
    return (fl_Gl_Window) (static_cast<Fl_DerivedTable_Row*>(table_row))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_resizable_by_reference)(fl_Table_Row table_row,fl_Widget o){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_resizable)(fl_Table_Row table_row,fl_Widget o){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Table_Row_resizable)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->resizable();
  }
  FL_EXPORT_C(void,Fl_Table_Row_add_resizable)(fl_Table_Row table_row,fl_Widget o){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_clip_children)(fl_Table_Row table_row,int c){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Table_Row_clip_children)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Table_Row_focus)(fl_Table_Row table_row, fl_Widget W){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Table_Row__ddfdesign_kludge)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Table_Row_insert_with_before)(fl_Table_Row self, fl_Widget w, fl_Widget before){
    (static_cast<Fl_DerivedTable_Row*>(self))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Table_Row_array)(fl_Table_Row self){
    return (fl_Widget*)(static_cast<Fl_DerivedTable_Row*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Table_Row_child)(fl_Table_Row self, int n){
    return (fl_Widget)(static_cast<Fl_DerivedTable_Row*>(self))->child(n);
  }
  // FL_EXPORT_C(void,Fl_Table_Row_forms_end)(fl_Table_Row self){
  //   (static_cast<Fl_DerivedTable_Row*>(self))->forms_end();
  // }
  FL_EXPORT_C(void,Fl_Table_Row_set_table_box)(fl_Table_Row table_row,Fl_Boxtype val){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->table_box(val);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Table_Row_table_box)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->table_box();
  }
  FL_EXPORT_C(int,Fl_Table_Row_rows)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->rows();
  }
  FL_EXPORT_C(int,Fl_Table_Row_cols)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->cols();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_rows_super)(fl_Table_Row table_row,int val){
    (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::rows(val);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_rows)(fl_Table_Row table_row, int val){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->rows(val);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_cols_super)(fl_Table_Row table_row,int val){
    (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::cols(val);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_cols)(fl_Table_Row table_row, int val){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->cols(val);
  }
  FL_EXPORT_C(void, Fl_Table_Row_set_visible_cells)(fl_Table_Row table_row,int* r1, int* r2, int* c1, int* c2){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->visible_cells(*r1,*r2,*c1,*c2);
  };
  FL_EXPORT_C(int,Fl_Table_Row_is_interactive_resize)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->is_interactive_resize();
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_resize)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_resize();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_resize)(fl_Table_Row table_row,int flag){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_resize(flag);
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_resize)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_resize();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_resize)(fl_Table_Row table_row,int flag){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_resize(flag);
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_resize_min)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_resize_min();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_resize_min)(fl_Table_Row table_row,int val){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_resize_min(val);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_resize_min)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_resize_min();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_resize_min)(fl_Table_Row table_row,int val){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_resize_min(val);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_header)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_header)(fl_Table_Row table_row,int flag){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header(flag);
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_header)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_header)(fl_Table_Row table_row,int flag){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header(flag);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_header_height)(fl_Table_Row table_row,int height){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header_height(height);
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_header_height)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header_height();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_header_width)(fl_Table_Row table_row,int width){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header_width(width);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_header_width)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header_width();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_header_color)(fl_Table_Row table_row,Fl_Color val){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header_color(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Table_Row_row_header_color)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_header_color();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_header_color)(fl_Table_Row table_row,Fl_Color val){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header_color(val);
  }
  FL_EXPORT_C(Fl_Color,Fl_Table_Row_col_header_color)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_header_color();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_height)(fl_Table_Row table_row,int row,int height){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_height(row,height);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_height)(fl_Table_Row table_row,int row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_height(row);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_width)(fl_Table_Row table_row,int col,int width){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_width(col,width);
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_width)(fl_Table_Row table_row,int col){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_width(col);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_height_all)(fl_Table_Row table_row,int height){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_height_all(height);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_width_all)(fl_Table_Row table_row,int width){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_width_all(width);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_row_position)(fl_Table_Row table_row,int row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->row_position(row);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_col_position)(fl_Table_Row table_row,int col){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->col_position(col);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_position)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->row_position();
  }
  FL_EXPORT_C(int,Fl_Table_Row_col_position)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->col_position();
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_top_row)(fl_Table_Row table_row,int row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->top_row(row);
  }
  FL_EXPORT_C(int,Fl_Table_Row_top_row)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->top_row();
  }
  FL_EXPORT_C(int,Fl_Table_Row_is_selected)(fl_Table_Row table_row,int r,int c){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->is_selected(r,c);
  }
  FL_EXPORT_C(void,Fl_Table_Row_get_selection)(fl_Table_Row table_row,int *row_top,int *col_left,int *row_bot,int *col_right){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->get_selection(*row_top,*col_left,*row_bot,*col_right);
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_selection)(fl_Table_Row table_row,int row_top,int col_left,int row_bot,int col_right){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->set_selection(row_top,col_left,row_bot,col_right);
  }
  FL_EXPORT_C(int,Fl_Table_Row_move_cursor)(fl_Table_Row table_row,int R,int C){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->move_cursor(R,C);
  }
  FL_EXPORT_C(void,Fl_Table_Row_resize_super)(fl_Table_Row table_row,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->resize_super(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Table_Row_resize)(fl_Table_Row table_row,int X,int Y,int W,int H){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->resize(X,Y,W,H);
  }

  FL_EXPORT_C(void,Fl_Table_Row_draw_super)(fl_Table_Row table_row){
    (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::draw();
  }
  FL_EXPORT_C(void,Fl_Table_Row_draw)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->draw();
  }
  FL_EXPORT_C(void,Fl_Table_Row_init_sizes)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->init_sizes();
  }
  FL_EXPORT_C(void,Fl_Table_Row_add)(fl_Table_Row table_row,fl_Widget wgt){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->add((static_cast<Fl_Widget*>(wgt)));
  }
  FL_EXPORT_C(void,Fl_Table_Row_insert)(fl_Table_Row table_row,fl_Widget wgt,int n){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->insert(*(static_cast<Fl_Widget*>(wgt)),n);
  }
  FL_EXPORT_C(void, Fl_Table_Row_insert_with_widget)(fl_Table_Row table_row,fl_Widget wgt, fl_Widget w2){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->insert(*(static_cast<Fl_Widget*>(wgt)),(static_cast<Fl_Widget*>(w2)));
  };
  FL_EXPORT_C(void,Fl_Table_Row_remove_widget)(fl_Table_Row table_row,fl_Widget w){
    (static_cast<Fl_Table_Row*>(table_row))->remove(*(static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear_super)(fl_Table_Row table_row){
    (static_cast<Fl_Table_Row*>(table_row))->Fl_Table_Row::clear();
  }
  FL_EXPORT_C(void,Fl_Table_Row_clear)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->clear();
  }
  FL_EXPORT_C(void,Fl_Table_Row_begin)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->begin();
  }
  FL_EXPORT_C(void,Fl_Table_Row_end)(fl_Table_Row table_row){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->end();
  }
  FL_EXPORT_C(int,Fl_Table_Row_children)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->children();
  }
  FL_EXPORT_C(int,Fl_Table_Row_find)(fl_Table_Row table_row,fl_Widget wgt){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->find((static_cast<Fl_Widget*>(wgt)));
  }
  FL_EXPORT_C(int,Fl_Table_Row_callback_row)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->callback_row();
  }
  FL_EXPORT_C(int,Fl_Table_Row_callback_col)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->callback_col();
  }
  FL_EXPORT_C(TableContextC,Fl_Table_Row_callback_context)(fl_Table_Row table_row){
    Fl_DerivedTable_Row* t = (static_cast<Fl_DerivedTable_Row*>(table_row));
    Fl_Table_Row::TableContext context = t->callback_context();
    TableContextC ret = (TableContextC)-1;
    switch(context){
    case Fl_Table_Row::CONTEXT_NONE:      {ret = CONTEXT_NONEC;      break;}
    case Fl_Table_Row::CONTEXT_STARTPAGE: {ret = CONTEXT_STARTPAGEC; break;}
    case Fl_Table_Row::CONTEXT_ENDPAGE:   {ret = CONTEXT_ENDPAGEC;   break;}
    case Fl_Table_Row::CONTEXT_ROW_HEADER:{ret = CONTEXT_ROW_HEADERC;break;}
    case Fl_Table_Row::CONTEXT_COL_HEADER:{ret = CONTEXT_COL_HEADERC;break;}
    case Fl_Table_Row::CONTEXT_CELL:      {ret = CONTEXT_CELLC;      break;}
    case Fl_Table_Row::CONTEXT_TABLE:     {ret = CONTEXT_TABLEC;     break;}
    case Fl_Table_Row::CONTEXT_RC_RESIZE: {ret = CONTEXT_RC_RESIZEC; break;}
    default:                          {ret = TableContextC(-1);  break;}
    }
    return ret;
  }
  FL_EXPORT_C(void,Fl_Table_Row_do_callback)(fl_Table_Row table_row, TableContextC tableContext, int row, int col){
    Fl_Table_Row::TableContext c = (Fl_Table_Row::TableContext)-1;
    switch(tableContext){
    case CONTEXT_NONEC:      {c = Fl_Table_Row::CONTEXT_NONE;      break;}
    case CONTEXT_STARTPAGEC: {c = Fl_Table_Row::CONTEXT_STARTPAGE; break;}
    case CONTEXT_ENDPAGEC:   {c = Fl_Table_Row::CONTEXT_ENDPAGE;   break;}
    case CONTEXT_ROW_HEADERC:{c = Fl_Table_Row::CONTEXT_ROW_HEADER;break;}
    case CONTEXT_COL_HEADERC:{c = Fl_Table_Row::CONTEXT_COL_HEADER;break;}
    case CONTEXT_CELLC:      {c = Fl_Table_Row::CONTEXT_CELL;      break;}
    case CONTEXT_TABLEC:     {c = Fl_Table_Row::CONTEXT_TABLE;     break;}
    case CONTEXT_RC_RESIZEC: {c = Fl_Table_Row::CONTEXT_RC_RESIZE; break;}
    default:                 {c = (Fl_Table_Row::TableContext)-1;  break;}
    }
    (static_cast<Fl_DerivedTable_Row*>(table_row))->do_callback(c, row, col);
  }
#if FLTK_ABI_VERSION >= 10302
  FL_EXPORT_C(void, Fl_Table_Row_set_tab_cell_nav)(fl_Table_Row table_row, int val){
    (static_cast<Fl_DerivedTable_Row*>(table_row))->tab_cell_nav(val);
  }
  FL_EXPORT_C(int,  Fl_Table_Row_tab_cell_nav)(fl_Table_Row table_row){
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->tab_cell_nav();
  }
#endif
  FL_EXPORT_C(int,  Fl_Table_Row_find_cell)(fl_Table_Row table_row, TableContextC context, int R, int C, int *X, int *Y, int *W, int *H){
    Fl_Table::TableContext c = (Fl_Table::TableContext)-1;
    switch(context){
    case CONTEXT_NONEC:      {c = Fl_Table::CONTEXT_NONE;      break;}
    case CONTEXT_STARTPAGEC: {c = Fl_Table::CONTEXT_STARTPAGE; break;}
    case CONTEXT_ENDPAGEC:   {c = Fl_Table::CONTEXT_ENDPAGE;   break;}
    case CONTEXT_ROW_HEADERC:{c = Fl_Table::CONTEXT_ROW_HEADER;break;}
    case CONTEXT_COL_HEADERC:{c = Fl_Table::CONTEXT_COL_HEADER;break;}
    case CONTEXT_CELLC:      {c = Fl_Table::CONTEXT_CELL;      break;}
    case CONTEXT_TABLEC:     {c = Fl_Table::CONTEXT_TABLE;     break;}
    case CONTEXT_RC_RESIZEC: {c = Fl_Table::CONTEXT_RC_RESIZE; break;}
    default:                 {c = (Fl_Table::TableContext)-1;  break;}
    }
    return (static_cast<Fl_DerivedTable_Row*>(table_row))->find_cell(c,R,C,*X,*Y,*W,*H);
  }
  FL_EXPORT_C(fl_Table_Row, Fl_Table_Row_New_WithLabel)(int X, int Y, int W, int H, const char *l){
    fl_Table_Row_Virtual_Funcs* funcs = Fl_Table_Row_default_virtual_funcs();
    Fl_DerivedTable_Row* table = new Fl_DerivedTable_Row(X,Y,W,H,l,funcs);
    return (fl_Table_Row)table;
  }
  FL_EXPORT_C(fl_Table_Row, Fl_Table_Row_New)(int X, int Y, int W, int H){
    fl_Table_Row_Virtual_Funcs* funcs = Fl_Table_Row_default_virtual_funcs();
    Fl_DerivedTable_Row* table = new Fl_DerivedTable_Row(X,Y,W,H,funcs);
    return (fl_Table_Row)table;
  }
  FL_EXPORT_C(fl_Table_Row, Fl_OverriddenTable_Row_New_WithLabel)(int X, int Y, int W, int H, const char *l, fl_Table_Virtual_Funcs* funcs){
    Fl_DerivedTable_Row* table = new Fl_DerivedTable_Row(X,Y,W,H,l,funcs);
    return (fl_Table_Row)table;
  }
  FL_EXPORT_C(fl_Table_Row, Fl_OverriddenTable_Row_New)(int X, int Y, int W, int H, fl_Table_Virtual_Funcs* funcs){
    Fl_DerivedTable_Row* table = new Fl_DerivedTable_Row(X,Y,W,H,funcs);
    return (fl_Table_Row)table;
  }
  FL_EXPORT_C(void, Fl_Table_Row_Destroy)(fl_Table_Row table_row){
    delete (static_cast<Fl_DerivedTable_Row*>(table_row));
  }
  FL_EXPORT_C(TableRowSelectModeC,Fl_Table_Row_type)(fl_Table_Row table){
    Fl_Table_Row::TableRowSelectMode m = (static_cast<Fl_DerivedTable_Row*>(table))->type();
    TableRowSelectModeC mode = (TableRowSelectModeC)-1;
    switch(m){
    case Fl_Table_Row::SELECT_NONE:   {mode = SELECT_NONEC; break;}
    case Fl_Table_Row::SELECT_SINGLE: {mode = SELECT_SINGLEC; break;}
    case Fl_Table_Row::SELECT_MULTI:  {mode = SELECT_MULTIC; break;}
    default:                          {mode = (TableRowSelectModeC)-1;  break;}
    }
    return mode;
  }
  FL_EXPORT_C(void,Fl_Table_Row_set_type)(fl_Table_Row table,TableRowSelectModeC m){
    Fl_Table_Row::TableRowSelectMode mode = (Fl_Table_Row::TableRowSelectMode)-1;
    switch(m){
    case SELECT_NONEC:   {mode = Fl_Table_Row::SELECT_NONE; break;}
    case SELECT_SINGLEC: {mode = Fl_Table_Row::SELECT_SINGLE; break;}
    case SELECT_MULTIC:  {mode = Fl_Table_Row::SELECT_MULTI; break;}
    default:             {mode = (Fl_Table_Row::TableRowSelectMode)-1;  break;}
    }
    return (static_cast<Fl_DerivedTable_Row*>(table))->type(mode);
  }
  FL_EXPORT_C(int,Fl_Table_Row_row_selected)(fl_Table_Row row,int rowIndex){
    return (static_cast<Fl_DerivedTable_Row*>(row))->row_selected(rowIndex);
  }
  FL_EXPORT_C(int,Fl_Table_Row_select_row)(fl_Table_Row row,int rowIndex){
    return (static_cast<Fl_DerivedTable_Row*>(row))->select_row(rowIndex);
  }
  FL_EXPORT_C(int,Fl_Table_Row_select_row_with_flag)(fl_Table_Row row,int rowIndex,int flag){
    return (static_cast<Fl_DerivedTable_Row*>(row))->select_row(rowIndex,flag);
  }
  FL_EXPORT_C(void,Fl_Table_Row_select_all_rows)(fl_Table_Row row){
    (static_cast<Fl_DerivedTable_Row*>(row))->select_all_rows();
  }
  FL_EXPORT_C(void,Fl_Table_Row_select_all_rows_with_flag)(fl_Table_Row row,int flag){
    (static_cast<Fl_DerivedTable_Row*>(row))->select_all_rows(flag);
  }
#ifdef __cplusplus
}
#endif
