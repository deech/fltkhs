#include "Fl_Multiline_OutputC.h"

#ifdef __cplusplus
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Multiline_Output_handle)(fl_Multiline_Output self, int event){
    return (static_cast<Fl_Multiline_Output*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Multiline_Output_parent)(fl_Multiline_Output multiline_output){
    return (fl_Group) (static_cast<Fl_Multiline_Output*>(multiline_output))->parent();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_parent)(fl_Multiline_Output multiline_output,fl_Group grp){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Multiline_Output_type)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->type();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_type)(fl_Multiline_Output multiline_output,uchar t){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->type(t);
  }

  FL_EXPORT_C(int,Fl_Multiline_Output_x)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->x();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_y)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->y();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_w)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->w();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_h)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->h();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_align)(fl_Multiline_Output multiline_output, Fl_Align alignment){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Multiline_Output_align)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Multiline_Output_box)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->box();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_box)(fl_Multiline_Output multiline_output,Fl_Boxtype new_box){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Multiline_Output_color)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->color();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_color)(fl_Multiline_Output multiline_output,Fl_Color bg){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_color_with_bg_sel)(fl_Multiline_Output multiline_output,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Multiline_Output_selection_color)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_selection_color)(fl_Multiline_Output multiline_output,Fl_Color a){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Multiline_Output_label)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->label();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_copy_label)(fl_Multiline_Output multiline_output,const char* new_label){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_label)(fl_Multiline_Output multiline_output,const char* text){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Multiline_Output_labeltype)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_labeltype)(fl_Multiline_Output multiline_output,Fl_Labeltype a){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_labelcolor)(fl_Multiline_Output multiline_output,Fl_Color c){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Multiline_Output_labelcolor)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Multiline_Output_labelfont)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_labelfont)(fl_Multiline_Output multiline_output,Fl_Font c){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Multiline_Output_labelsize)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_labelsize)(fl_Multiline_Output multiline_output,Fl_Fontsize pix){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Multiline_Output_image)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->image();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_image)(fl_Multiline_Output multiline_output,fl_Image pix){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Multiline_Output_deimage)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->deimage();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_deimage)(fl_Multiline_Output multiline_output,fl_Image pix){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Multiline_Output_tooltip)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_copy_tooltip)(fl_Multiline_Output multiline_output,const char* text){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_tooltip)(fl_Multiline_Output multiline_output,const char* text){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_callback_with_user_data)(fl_Multiline_Output multiline_output,fl_Callback* cb,void* p){
    Fl_Multiline_Output* castedInput_dow = (static_cast<Fl_Multiline_Output*>(multiline_output));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_callback)(fl_Multiline_Output multiline_output,fl_Callback* cb){
    Fl_Multiline_Output* castedInput_dow = (static_cast<Fl_Multiline_Output*>(multiline_output));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_Multiline_Output_user_data)(fl_Multiline_Output multiline_output){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Multiline_Output*>(multiline_output))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Multiline_Output*>(multiline_output))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_user_data)(fl_Multiline_Output multiline_output,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Multiline_Output*>(multiline_output))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Multiline_Output*>(multiline_output))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Multiline_Output*>(multiline_output))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Multiline_Output_argument)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->argument();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_argument)(fl_Multiline_Output multiline_output,long v){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Multiline_Output_when)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->when();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_when)(fl_Multiline_Output multiline_output,uchar i){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Multiline_Output_visible)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->visible();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_visible_r)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_visible)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->visible();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_visible)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Multiline_Output_active)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->active();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_active_r)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->active_r();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_activate)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->activate();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_deactivate)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Multiline_Output_multiline_output)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->output();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_multiline_output)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->output();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_multiline_output)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Multiline_Output_takesevents)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_changed)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->changed();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_changed)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_take_focus)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_visible_focus)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_visible_focus)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_modify_visible_focus)(fl_Multiline_Output multiline_output,int v){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Multiline_Output_visible_focus)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_do_callback)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_do_callback_with_widget_and_user_data)(fl_Multiline_Output multiline_output,fl_Widget w,long arg){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_do_callback_with_widget_and_default_user_data)(fl_Multiline_Output multiline_output,fl_Widget w){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_contains)(fl_Multiline_Output multiline_output,fl_Widget w){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_inside)(fl_Multiline_Output multiline_output,fl_Widget w){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_redraw)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->redraw();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_redraw_label)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Multiline_Output_damage)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->damage();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_damage_with_bitmask)(fl_Multiline_Output multiline_output,uchar c){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_clear_damage)(fl_Multiline_Output multiline_output){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_damage_with_text)(fl_Multiline_Output multiline_output,uchar c){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_damage_inside_widget)(fl_Multiline_Output multiline_output,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_draw_label_with_xywh_alignment)(fl_Multiline_Output multiline_output,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_measure_label)(fl_Multiline_Output multiline_output,int* ww,int* hh){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Multiline_Output_window)(fl_Multiline_Output multiline_output){
    return (fl_Window) (static_cast<Fl_Multiline_Output*>(multiline_output))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Multiline_Output_top_window)(fl_Multiline_Output multiline_output){
    return (fl_Window) (static_cast<Fl_Multiline_Output*>(multiline_output))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Multiline_Output_top_window_offset)(fl_Multiline_Output multiline_output, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Multiline_Output*>(multiline_output))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Multiline_Output_as_group)(fl_Multiline_Output multiline_output){
    return (fl_Group) (static_cast<Fl_Multiline_Output*>(multiline_output))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Multiline_Output_as_gl_window)(fl_Multiline_Output multiline_output){
    return (fl_Gl_Window) (static_cast<Fl_Multiline_Output*>(multiline_output))->as_gl_window();
  }
  /* Fl_Multiline_Output specific functions */
  FL_EXPORT_C(fl_Multiline_Output, Fl_Multiline_Output_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Multiline_Output* multiline_output = new Fl_Multiline_Output(x,y,w,h,label);
    return (static_cast<fl_Multiline_Output>(multiline_output));
  }
  FL_EXPORT_C(fl_Multiline_Output, Fl_Multiline_Output_New)(int x, int y, int w, int h) {
    Fl_Multiline_Output* multiline_output = new Fl_Multiline_Output(x,y,w,h,0);
    return (fl_Multiline_Output)multiline_output;
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_Destroy)(fl_Multiline_Output multiline_output){
    delete (static_cast<Fl_Multiline_Output*>(multiline_output));
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_resize)(fl_Multiline_Output multiline_output,int X,int Y,int W,int H){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_value)(fl_Multiline_Output multiline_output,const char* text){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->value(text);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_value_with_length)(fl_Multiline_Output multiline_output,const char* text,int length){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->value(text,length);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_static_value)(fl_Multiline_Output multiline_output,const char* text){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_static_value_with_length)(fl_Multiline_Output multiline_output,const char* text,int length){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->static_value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_Multiline_Output_value)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->value();
  }
  FL_EXPORT_C(Fl_Char,Fl_Multiline_Output_index)(fl_Multiline_Output multiline_output,int i){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->index(i);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_size)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->size();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_size)(fl_Multiline_Output multiline_output,int W,int H){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_maximum_size)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_maximum_size)(fl_Multiline_Output multiline_output,int m){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_position)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->position();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_mark)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->mark();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_position_with_cursor_mark)(fl_Multiline_Output multiline_output,int p,int m){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_position_n_n)(fl_Multiline_Output multiline_output,int p){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->position(p);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_mark)(fl_Multiline_Output multiline_output,int m){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->mark(m);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_replace)(fl_Multiline_Output multiline_output,int b,int e,const char* text){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_replace_with_ilen)(fl_Multiline_Output multiline_output,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_cut)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->cut();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_cut_bytes)(fl_Multiline_Output multiline_output,int n){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->cut(n);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_cut_range)(fl_Multiline_Output multiline_output,int a,int b){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_insert)(fl_Multiline_Output multiline_output,const char* t){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->insert(t);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_insert_with_length)(fl_Multiline_Output multiline_output,const char* t,int l){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_copy)(fl_Multiline_Output multiline_output,int clipboard){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_undo)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->undo();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_copy_cuts)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_shortcut)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_shortcut)(fl_Multiline_Output multiline_output,int s){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Multiline_Output_textfont)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->textfont();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_textfont)(fl_Multiline_Output multiline_output,Fl_Font s){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Multiline_Output_textsize)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->textsize();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_textsize)(fl_Multiline_Output multiline_output,Fl_Fontsize s){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Multiline_Output_textcolor)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_textcolor)(fl_Multiline_Output multiline_output,Fl_Color n){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_Multiline_Output_cursor_color)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_cursor_color)(fl_Multiline_Output multiline_output,Fl_Color n){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_input_type)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->input_type();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_input_type)(fl_Multiline_Output multiline_output,int t){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_readonly)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->readonly();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_readonly)(fl_Multiline_Output multiline_output,int b){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_wrap)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->wrap();
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_set_wrap)(fl_Multiline_Output multiline_output,int b){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_Multiline_Output_tab_nav)(fl_Multiline_Output multiline_output,int val){
    (static_cast<Fl_Multiline_Output*>(multiline_output))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_Multiline_Output_set_tab_nav)(fl_Multiline_Output multiline_output){
    return (static_cast<Fl_Multiline_Output*>(multiline_output))->tab_nav();
  }
#ifdef __cplusplus
}
#endif
