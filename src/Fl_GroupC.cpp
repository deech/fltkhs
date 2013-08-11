#include "Fl_GroupC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Group_handle)(fl_Group self, int event){
    return (static_cast<Fl_Group*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Group_parent)(fl_Group win){
    return (fl_Group) (static_cast<Fl_Group*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Group_set_parent)(fl_Group win,fl_Group grp){
    (static_cast<Fl_Group*>(win))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Group_type)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Group_set_type)(fl_Group win,uchar t){
    (static_cast<Fl_Group*>(win))->type(t);
  }
  FL_EXPORT_C(int,Fl_Group_x)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Group_y)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Group_w)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Group_h)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Group_set_align)(fl_Group group, Fl_Align alignment){
    (static_cast<Fl_Group*>(group))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Group_align)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Group_box)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Group_set_box)(fl_Group win,Fl_Boxtype new_box){
    (static_cast<Fl_Group*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Group_color)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Group_set_color)(fl_Group win,Fl_Color bg){
    (static_cast<Fl_Group*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Group_set_color_with_bg_sel)(fl_Group win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Group*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Group_selection_color)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Group_set_selection_color)(fl_Group win,Fl_Color a){
    (static_cast<Fl_Group*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Group_label)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Group_copy_label)(fl_Group win,const char* new_label){
    (static_cast<Fl_Group*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Group_set_label)(fl_Group win,const char* text){
    (static_cast<Fl_Group*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Group_labeltype)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Group_set_labeltype)(fl_Group win,Fl_Labeltype a){
    (static_cast<Fl_Group*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Group_set_labelcolor)(fl_Group win,Fl_Color c){
    (static_cast<Fl_Group*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Group_labelfont)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Group_set_labelfont)(fl_Group win,Fl_Font c){
    (static_cast<Fl_Group*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Group_labelsize)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Group_set_labelsize)(fl_Group win,Fl_Fontsize pix){
    (static_cast<Fl_Group*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Group_image)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Group_set_image)(fl_Group win,fl_Image pix){
    (static_cast<Fl_Group*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Group_deimage)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Group_set_deimage)(fl_Group win,fl_Image pix){
    (static_cast<Fl_Group*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Group_tooltip)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Group_copy_tooltip)(fl_Group win,const char* text){
    (static_cast<Fl_Group*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Group_set_tooltip)(fl_Group win,const char* text){
    (static_cast<Fl_Group*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Group_set_callback_with_user_data)(fl_Group win,fl_Callback* cb,void* p){
    Fl_Group* castedWindow = (static_cast<Fl_Group*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Group_set_callback)(fl_Group win,fl_Callback* cb){
    Fl_Group* castedWindow = (static_cast<Fl_Group*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Group_user_data)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->user_data();
  }
  FL_EXPORT_C(void,Fl_Group_set_user_data)(fl_Group win,void* v){
    (static_cast<Fl_Group*>(win))->user_data(v);
  }
  FL_EXPORT_C(long,Fl_Group_argument)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Group_set_argument)(fl_Group win,long v){
    (static_cast<Fl_Group*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Group_when)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Group_set_when)(fl_Group win,uchar i){
    (static_cast<Fl_Group*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_visible)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Group_visible_r)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Group_set_visible)(fl_Group win){
    (static_cast<Fl_Group*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Group_clear_visible)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Group_active)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Group_active_r)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Group_activate)(fl_Group win){
    (static_cast<Fl_Group*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Group_deactivate)(fl_Group win){
    (static_cast<Fl_Group*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Group_output)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Group_set_output)(fl_Group win){
    (static_cast<Fl_Group*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Group_clear_output)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Group_takesevents)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Group_set_changed)(fl_Group win){
    (static_cast<Fl_Group*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Group_clear_changed)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Group_take_focus)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Group_set_visible_focus)(fl_Group win){
    (static_cast<Fl_Group*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_clear_visible_focus)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_modify_visible_focus)(fl_Group win,int v){
    (static_cast<Fl_Group*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_visible_focus)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Group_do_callback)(fl_Group win){
    (static_cast<Fl_Group*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Group_do_callback_with_widget_and_user_data)(fl_Group win,fl_Widget w,long arg){
    (static_cast<Fl_Group*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Group_do_callback_with_widget_and_default_user_data)(fl_Group win,fl_Widget w){
    (static_cast<Fl_Group*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Group_contains)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_Group*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Group_inside)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_Group*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_redraw)(fl_Group win){
    (static_cast<Fl_Group*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Group_redraw_label)(fl_Group win){
    (static_cast<Fl_Group*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Group_damage)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Group_clear_damage_with_bitmask)(fl_Group win,uchar c){
    (static_cast<Fl_Group*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Group_clear_damage)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Group_damage_with_text)(fl_Group win,uchar c){
    (static_cast<Fl_Group*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Group_damage_inside_widget)(fl_Group win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Group*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Group_draw_label)(fl_Group win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Group*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Group_measure_label)(fl_Group win,int* ww,int* hh){
    (static_cast<Fl_Group*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Group_window)(fl_Group group){
    return (fl_Window) (static_cast<Fl_Group*>(group))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Group_top_window)(fl_Group group){
    return (fl_Window) (static_cast<Fl_Group*>(group))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Group_top_window_offset)(fl_Group group, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Group*>(group))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Group_as_group)(fl_Group win){
    return (fl_Group) (static_cast<Fl_Group*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Group_as_gl_window)(fl_Group win){
    return (fl_Gl_Window) (static_cast<Fl_Group*>(win))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Group_begin)(fl_Group win){
    (static_cast<Fl_Group*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Group_end)(fl_Group win){
    (static_cast<Fl_Group*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Group_find)(fl_Group win,fl_Widget w){
    return (static_cast<Fl_Group*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Group_add)(fl_Group win,fl_Widget w){
    (static_cast<Fl_Group*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_insert)(fl_Group win,fl_Widget w,int i){
    (static_cast<Fl_Group*>(win))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Group_remove_index)(fl_Group win,int index){
    (static_cast<Fl_Group*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Group_remove_widget)(fl_Group win,fl_Widget w){
    (static_cast<Fl_Group*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Group_clear)(fl_Group win){
    (static_cast<Fl_Group*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Group_set_resizable_by_reference)(fl_Group win,fl_Widget o){
    (static_cast<Fl_Group*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Group_set_resizable)(fl_Group win,fl_Widget o){
    (static_cast<Fl_Group*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Group_resizable)(fl_Group win){
    return (fl_Widget)(static_cast<Fl_Group*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Group_add_resizable)(fl_Group win,fl_Widget o){
    return (static_cast<Fl_Group*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Group_init_sizes)(fl_Group win){
    (static_cast<Fl_Group*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Group_children)(fl_Group self){
    return (static_cast<Fl_Group*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Group_set_clip_children)(fl_Group win,int c){
    return (static_cast<Fl_Group*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Group_clip_children)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Group_focus)(fl_Group win, fl_Widget W){
    return (static_cast<Fl_Group*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Group__ddfdesign_kludge)(fl_Group win){
    return (static_cast<Fl_Group*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Group_insert_with_before)(fl_Group self, fl_Widget w, fl_Widget before){
    (static_cast<Fl_Group*>(self))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Group_array)(fl_Group self){
    return (fl_Widget*)(static_cast<Fl_Group*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Group_child)(fl_Group self, int n){
    return (fl_Widget)(static_cast<Fl_Group*>(self))->child(n);
  }
  FL_EXPORT_C(fl_Group,     Fl_Group_New)(int x, int y, int w, int h){
    Fl_Group* g = new Fl_Group(x,y,w,h);
    return (fl_Group)g;
  }
  FL_EXPORT_C(fl_Group,     Fl_Group_New_WithLabel)(int x, int y, int w, int h, const char* t){
    Fl_Group* g = new Fl_Group(x,y,w,h,t);
    return (fl_Group)g;
  }
#ifdef __cplusplus
}
#endif
