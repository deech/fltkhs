#include "Fl_WindowC.h"

#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Group,Fl_Window_parent)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Window_set_parent)(fl_Window win,fl_Group grp){
    (static_cast<Fl_Window*>(win))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Window_type)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Window_set_type)(fl_Window win,uchar t){
    (static_cast<Fl_Window*>(win))->type(t);
  }
  FL_EXPORT_C(int,Fl_Window_x)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Window_y)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Window_w)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Window_h)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Window_set_align)(fl_Window window, Fl_Align alignment){
    (static_cast<Fl_Window*>(window))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Window_align)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Window_box)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Window_set_box)(fl_Window win,Fl_Boxtype new_box){
    (static_cast<Fl_Window*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Window_color)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Window_set_color)(fl_Window win,Fl_Color bg){
    (static_cast<Fl_Window*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_background_and_selection_color)(fl_Window win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Window*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Window_selection_color)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Window_set_selection_color)(fl_Window win,Fl_Color a){
    (static_cast<Fl_Window*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Window_label)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Window_copy_label)(fl_Window win,const char* new_label){
    (static_cast<Fl_Window*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Window_set_label)(fl_Window win,const char* text){
    (static_cast<Fl_Window*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Window_labeltype)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Window_set_labeltype)(fl_Window win,Fl_Labeltype a){
    (static_cast<Fl_Window*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Window_set_labelcolor)(fl_Window win,Fl_Color c){
    (static_cast<Fl_Window*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Window_labelfont)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Window_set_labelfont)(fl_Window win,Fl_Font c){
    (static_cast<Fl_Window*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Window_labelsize)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Window_set_labelsize)(fl_Window win,Fl_Fontsize pix){
    (static_cast<Fl_Window*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Window_image)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Window_set_image)(fl_Window win,fl_Image pix){
    (static_cast<Fl_Window*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Window_deimage)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Window_set_deimage)(fl_Window win,fl_Image pix){
    (static_cast<Fl_Window*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Window_tooltip)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Window_copy_tooltip)(fl_Window win,const char* text){
    (static_cast<Fl_Window*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Window_set_tooltip)(fl_Window win,const char* text){
    (static_cast<Fl_Window*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Window_set_callback_and_user_data)(fl_Window win,fl_Callback* cb,void* p){
    Fl_Window* castedWindow = (static_cast<Fl_Window*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Window_set_callback)(fl_Window win,fl_Callback* cb){
    Fl_Window* castedWindow = (static_cast<Fl_Window*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Window_user_data)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->user_data();
  }
  FL_EXPORT_C(void,Fl_Window_set_user_data)(fl_Window win,void* v){
    (static_cast<Fl_Window*>(win))->user_data(v);
  }
  FL_EXPORT_C(long,Fl_Window_argument)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Window_set_argument)(fl_Window win,long v){
    (static_cast<Fl_Window*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Window_when)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Window_set_when)(fl_Window win,uchar i){
    (static_cast<Fl_Window*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_visible)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Window_visible_r)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Window_set_visible)(fl_Window win){
    (static_cast<Fl_Window*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Window_clear_visible)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_active)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Window_active_r)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Window_activate)(fl_Window win){
    (static_cast<Fl_Window*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Window_deactivate)(fl_Window win){
    (static_cast<Fl_Window*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_output)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Window_set_output)(fl_Window win){
    (static_cast<Fl_Window*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Window_clear_output)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_takesevents)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Window_set_changed)(fl_Window win){
    (static_cast<Fl_Window*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Window_clear_changed)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Window_take_focus)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Window_set_visible_focus)(fl_Window win){
    (static_cast<Fl_Window*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_clear_visible_focus)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_modify_visible_focus)(fl_Window win,int v){
    (static_cast<Fl_Window*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_visible_focus)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Window_do_callback)(fl_Window win){
    (static_cast<Fl_Window*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Window_do_callback_with_widget_and_user_data)(fl_Window win,fl_Widget w,long arg){
    (static_cast<Fl_Window*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Window_do_callback_with_widget_and_default_user_data)(fl_Window win,fl_Widget w){
    (static_cast<Fl_Window*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Window_contains)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_Window*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Window_inside)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_Window*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_redraw)(fl_Window win){
    (static_cast<Fl_Window*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Window_redraw_label)(fl_Window win){
    (static_cast<Fl_Window*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Window_damage)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Window_clear_damage_with_bitmask)(fl_Window win,uchar c){
    (static_cast<Fl_Window*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Window_clear_damage)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Window_damage_with_text)(fl_Window win,uchar c){
    (static_cast<Fl_Window*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Window_damage_inside_widget)(fl_Window win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Window*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Window_draw_label)(fl_Window win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Window*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Window_measure_label)(fl_Window win,int* ww,int* hh){
    (static_cast<Fl_Window*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Group,Fl_Window_as_group)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Window_as_gl_window)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Window_begin)(fl_Window win){
    (static_cast<Fl_Window*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Window_end)(fl_Window win){
    (static_cast<Fl_Window*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Window_find)(fl_Window win,fl_Widget w){
    return (static_cast<Fl_Window*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Window_add)(fl_Window win,fl_Widget w){
    (static_cast<Fl_Window*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_insert)(fl_Window win,fl_Widget w,int i){
    (static_cast<Fl_Window*>(win))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Window_remove_index)(fl_Window win,int index){
    (static_cast<Fl_Window*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Window_remove_widget)(fl_Window win,fl_Widget w){
    (static_cast<Fl_Window*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Window_clear)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Window_set_resizable_by_reference)(fl_Window win,fl_Widget o){
    (static_cast<Fl_Window*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Window_set_resizable)(fl_Window win,fl_Widget o){
    (static_cast<Fl_Window*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Window_resizable)(fl_Window win){
    (static_cast<Fl_Window*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Window_add_resizable)(fl_Window win,fl_Widget o){
    return (static_cast<Fl_Window*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Window_init_sizes)(fl_Window win){
    (static_cast<Fl_Window*>(win))->init_sizes();
  }
  FL_EXPORT_C(void,Fl_Window_set_clip_children)(fl_Window win,int c){
    return (static_cast<Fl_Window*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Window_clip_children)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Window_focus)(fl_Window win, fl_Widget W){
    return (static_cast<Fl_Window*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Window__ddfdesign_kludge)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->_ddfdesign_kludge();
  }
  // FL_EXPORT_C(void,Fl_Window_forms_end)(fl_Window win){
  //   return (static_cast<Fl_Window*>(win))->forms_end();
  // }
  FL_EXPORT_C(fl_Window, Fl_Window_New_WithLabel)(int x, int y, const char* title) {
    Fl_Window* window = new Fl_Window(x,y,title);
    return (static_cast<fl_Window>(window));
  }
  FL_EXPORT_C(fl_Window, Fl_Window_New)(int x, int y) {
    Fl_Window* window = new Fl_Window(x,y,0);
    return (fl_Window)window;
  }
  FL_EXPORT_C(fl_Window, Fl_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title) {
    Fl_Window* window = new Fl_Window(x,y,w,h,title);
    return (fl_Window)window;
  }
  FL_EXPORT_C(fl_Window, Fl_Window_NewWH)(int x, int y, int w, int h) {
    Fl_Window* window = new Fl_Window(x,y,w,h,0);
    return (fl_Window)window;
  }
  FL_EXPORT_C(unsigned int,Fl_Window_changed)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen)(fl_Window win){
    (static_cast<Fl_Window*>(win))->fullscreen();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen_off)(fl_Window win){
    (static_cast<Fl_Window*>(win))->fullscreen_off();
  }
  FL_EXPORT_C(void,Fl_Window_fullscreen_off_with_resize)(fl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_Window*>(win))->fullscreen_off(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Window_hide)(fl_Window win){
    (static_cast<Fl_Window*>(win))->hide();
  }
  FL_EXPORT_C(void,Fl_Window_show)(fl_Window win){
    (static_cast<Fl_Window*>(win))->show();
  }
  FL_EXPORT_C(void,Fl_Window_show_with_args)(fl_Window win,int argc,char** argv){
    (static_cast<Fl_Window*>(win))->show(argc,argv);
  }
  FL_EXPORT_C(void,Fl_Window_destroy)(fl_Window win){
    delete (static_cast<Fl_Window*>(win));
  }
  FL_EXPORT_C(void,Fl_Window_resize)(fl_Window win,int X,int Y,int W,int H){
    (static_cast<Fl_Window*>(win))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Window_iconize)(fl_Window win){
    (static_cast<Fl_Window*>(win))->iconize();
  }
  FL_EXPORT_C(int,Fl_Window_handle)(fl_Window win,int event){
    return (static_cast<Fl_Window*>(win))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Window_set_border)(fl_Window win,int b){
    (static_cast<Fl_Window*>(win))->border(b);
  }
  FL_EXPORT_C(void,Fl_Window_clear_border)(fl_Window win){
    (static_cast<Fl_Window*>(win))->clear_border();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_border)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->border();
  }
  FL_EXPORT_C(void,Fl_Window_set_override)(fl_Window win){
    (static_cast<Fl_Window*>(win))->set_override();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_override)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->override();
  }
  FL_EXPORT_C(void,Fl_Window_set_modal)(fl_Window win){
    (static_cast<Fl_Window*>(win))->set_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_modal)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->modal();
  }
  FL_EXPORT_C(void,Fl_Window_set_non_modal)(fl_Window win){
    (static_cast<Fl_Window*>(win))->set_non_modal();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_non_modal)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->non_modal();
  }
  FL_EXPORT_C(void,Fl_Window_set_menu_window)(fl_Window win){
    (static_cast<Fl_Window*>(win))->set_menu_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_menu_window)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->menu_window();
  }
  FL_EXPORT_C(void,Fl_Window_set_tooltip_window)(fl_Window win){
    (static_cast<Fl_Window*>(win))->set_tooltip_window();
  }
  FL_EXPORT_C(unsigned int,Fl_Window_tooltip_window)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->tooltip_window();
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_x_y)(fl_Window win,int x,int y){
    (static_cast<Fl_Window*>(win))->hotspot(x,y,0);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_x_y_with_offscreen)(fl_Window win,int x,int y,int offscreen){
    (static_cast<Fl_Window*>(win))->hotspot(x,y,offscreen);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_widget)(fl_Window win,fl_Widget w){
    (static_cast<Fl_Window*>(win))->hotspot((static_cast<Fl_Widget*>(w)),0);
  }
  FL_EXPORT_C(void,Fl_Window_hotspot_with_widget_with_offscreen)(fl_Window win,fl_Widget w,int offscreen){
    (static_cast<Fl_Window*>(win))->hotspot((static_cast<Fl_Widget*>(w)),offscreen);
  }
  FL_EXPORT_C(void,Fl_Window_free_position)(fl_Window win){
    (static_cast<Fl_Window*>(win))->free_position();
  }
  FL_EXPORT_C(fl_Window_size_range_args*,Fl_Window_size_range_default_args)(){
    fl_Window_size_range_args* ptr = (fl_Window_size_range_args*)malloc(sizeof(fl_Window_size_range_args));
    ptr->maxw = 0;
    ptr->maxh = 0;
    ptr->dw = 0;
    ptr->dh = 0;
    ptr->aspect = 0;
    return ptr;
  }
  FL_EXPORT_C(void,Fl_Window_size_range)(fl_Window win,int minw,int minh){
    fl_Window_size_range_args* ptr = Fl_Window_size_range_default_args();
    (static_cast<Fl_Window*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(void,Fl_Window_size_range_with_args)(fl_Window win,int minw,int minh,fl_Window_size_range_args* ptr){
    (static_cast<Fl_Window*>(win))->size_range(minw,minh,ptr->maxw, ptr->maxh, ptr->dw,ptr->dh,ptr->aspect);
  }
  FL_EXPORT_C(const char*,Fl_Window_iconlabel)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->iconlabel();
  }
  FL_EXPORT_C(void,Fl_Window_set_iconlabel)(fl_Window win,const char* label){
    (static_cast<Fl_Window*>(win))->iconlabel(label);
  }
  FL_EXPORT_C(void,Fl_Window_set_label_with_iconlabel)(fl_Window win,const char* label,const char* iconlabel){
    (static_cast<Fl_Window*>(win))->label(label,iconlabel);
  }
  FL_EXPORT_C(const char*,Fl_Window_xclass)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->xclass();
  }
  FL_EXPORT_C(void,Fl_Window_set_xclass)(fl_Window win,const char* c){
    (static_cast<Fl_Window*>(win))->xclass(c);
  }
  FL_EXPORT_C(const void*,Fl_Window_icon)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->icon();
  }
  FL_EXPORT_C(void,Fl_Window_set_icon)(fl_Window win,const void * ic){
    (static_cast<Fl_Window*>(win))->icon(ic);
  }
  FL_EXPORT_C(int,Fl_Window_shown)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->shown();
  }
  FL_EXPORT_C(int,Fl_Window_x_root)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->x_root();
  }
  FL_EXPORT_C(int,Fl_Window_y_root)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->y_root();
  }
  FL_EXPORT_C(void,Fl_Window_make_current)(fl_Window win){
    (static_cast<Fl_Window*>(win))->make_current();
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_Window*>(win))->cursor(cursor,FL_BLACK, bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_fg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_Window*>(win))->cursor(cursor,fg,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor_with_fg_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_Window*>(win))->cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_cursor)(fl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_Window*>(win))->cursor(cursor,FL_BLACK,FL_WHITE);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color bg){
    (static_cast<Fl_Window*>(win))->default_cursor(cursor,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_fg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg){
    (static_cast<Fl_Window*>(win))->default_cursor(cursor,fg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor_with_fg_bg)(fl_Window win,Fl_Cursor cursor,Fl_Color fg,Fl_Color bg){
    (static_cast<Fl_Window*>(win))->default_cursor(cursor,fg,bg);
  }
  FL_EXPORT_C(void,Fl_Window_set_default_cursor)(fl_Window win,Fl_Cursor cursor){
    (static_cast<Fl_Window*>(win))->default_cursor(cursor);
  }
  FL_EXPORT_C(int,Fl_Window_decorated_w)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->decorated_w();
  }
  FL_EXPORT_C(int,Fl_Window_decorated_h)(fl_Window win){
    return (static_cast<Fl_Window*>(win))->decorated_h();
  }
  FL_EXPORT_C(void, Fl_Window_set_default_xclass)(const char* label){
    Fl_Window::default_xclass(label);
  }
  FL_EXPORT_C(const char*, Fl_Window_default_xclass)(){
    return Fl_Window::default_xclass();
  }
  FL_EXPORT_C(fl_Window, Fl_Window_current)(){
    return (fl_Window)Fl_Window::current();
  }
  FL_EXPORT_C(void, Fl_Window_default_callback)(fl_Window win, void* v){
    Fl_Window::default_callback((static_cast<Fl_Window*>(win)), v);
  }
#ifdef __cplusplus
}
#endif
