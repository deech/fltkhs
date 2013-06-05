#include "Fl_Int_InputC.h"

#ifdef __cplusplus
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Int_Input_parent)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->parent();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_parent)(fl_Int_Input int_input,fl_Group grp){
    (static_cast<Fl_Int_Input*>(int_input))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Int_Input_type)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->type();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_type)(fl_Int_Input int_input,uchar t){
    (static_cast<Fl_Int_Input*>(int_input))->type(t);
  }
  FL_EXPORT_C(int,Fl_Int_Input_x)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->x();
  }
  FL_EXPORT_C(int,Fl_Int_Input_y)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->y();
  }
  FL_EXPORT_C(int,Fl_Int_Input_w)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->w();
  }
  FL_EXPORT_C(int,Fl_Int_Input_h)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->h();
  }
  FL_EXPORT_C(Fl_Align,Fl_Int_Input_align)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Int_Input_box)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->box();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_box)(fl_Int_Input int_input,Fl_Boxtype new_box){
    (static_cast<Fl_Int_Input*>(int_input))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Int_Input_color)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->color();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_color)(fl_Int_Input int_input,Fl_Color bg){
    (static_cast<Fl_Int_Input*>(int_input))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_background_and_selection_color)(fl_Int_Input int_input,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Int_Input*>(int_input))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Int_Input_selection_color)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_selection_color)(fl_Int_Input int_input,Fl_Color a){
    (static_cast<Fl_Int_Input*>(int_input))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Int_Input_label)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->label();
  }
  FL_EXPORT_C(void,Fl_Int_Input_copy_label)(fl_Int_Input int_input,const char* new_label){
    (static_cast<Fl_Int_Input*>(int_input))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_label)(fl_Int_Input int_input,const char* text){
    (static_cast<Fl_Int_Input*>(int_input))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Int_Input_labeltype)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_labeltype)(fl_Int_Input int_input,Fl_Labeltype a){
    (static_cast<Fl_Int_Input*>(int_input))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_labelcolor)(fl_Int_Input int_input,Fl_Color c){
    (static_cast<Fl_Int_Input*>(int_input))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Int_Input_labelfont)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_labelfont)(fl_Int_Input int_input,Fl_Font c){
    (static_cast<Fl_Int_Input*>(int_input))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Int_Input_labelsize)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_labelsize)(fl_Int_Input int_input,Fl_Fontsize pix){
    (static_cast<Fl_Int_Input*>(int_input))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Int_Input_image)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->image();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_image)(fl_Int_Input int_input,fl_Image pix){
    (static_cast<Fl_Int_Input*>(int_input))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Int_Input_deimage)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->deimage();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_deimage)(fl_Int_Input int_input,fl_Image pix){
    (static_cast<Fl_Int_Input*>(int_input))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Int_Input_tooltip)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Int_Input_copy_tooltip)(fl_Int_Input int_input,const char* text){
    (static_cast<Fl_Int_Input*>(int_input))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_tooltip)(fl_Int_Input int_input,const char* text){
    (static_cast<Fl_Int_Input*>(int_input))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_callback_and_user_data)(fl_Int_Input int_input,fl_Callback* cb,void* p){
    Fl_Int_Input* castedInput_dow = (static_cast<Fl_Int_Input*>(int_input));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_callback)(fl_Int_Input int_input,fl_Callback* cb){
    Fl_Int_Input* castedInput_dow = (static_cast<Fl_Int_Input*>(int_input));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_Int_Input_user_data)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->user_data();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_user_data)(fl_Int_Input int_input,void* v){
    (static_cast<Fl_Int_Input*>(int_input))->user_data(v);
  }
  FL_EXPORT_C(long,Fl_Int_Input_argument)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->argument();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_argument)(fl_Int_Input int_input,long v){
    (static_cast<Fl_Int_Input*>(int_input))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Int_Input_when)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->when();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_when)(fl_Int_Input int_input,uchar i){
    (static_cast<Fl_Int_Input*>(int_input))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Int_Input_visible)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->visible();
  }
  FL_EXPORT_C(int,Fl_Int_Input_visible_r)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_visible)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->visible();
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_visible)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Int_Input_active)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->active();
  }
  FL_EXPORT_C(int,Fl_Int_Input_active_r)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->active_r();
  }
  FL_EXPORT_C(void,Fl_Int_Input_activate)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->activate();
  }
  FL_EXPORT_C(void,Fl_Int_Input_deactivate)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Int_Input_output)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->output();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_output)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->output();
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_output)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Int_Input_takesevents)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_changed)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->changed();
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_changed)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Int_Input_take_focus)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_visible_focus)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_visible_focus)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Int_Input_modify_visible_focus)(fl_Int_Input int_input,int v){
    (static_cast<Fl_Int_Input*>(int_input))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Int_Input_visible_focus)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Int_Input_do_callback)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Int_Input_do_callback_with_widget_and_user_data)(fl_Int_Input int_input,fl_Widget w,long arg){
    (static_cast<Fl_Int_Input*>(int_input))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Int_Input_do_callback_with_widget_and_default_user_data)(fl_Int_Input int_input,fl_Widget w){
    (static_cast<Fl_Int_Input*>(int_input))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Int_Input_contains)(fl_Int_Input int_input,fl_Widget w){
    return (static_cast<Fl_Int_Input*>(int_input))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Int_Input_inside)(fl_Int_Input int_input,fl_Widget w){
    return (static_cast<Fl_Int_Input*>(int_input))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Int_Input_redraw)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->redraw();
  }
  FL_EXPORT_C(void,Fl_Int_Input_redraw_label)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Int_Input_damage)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->damage();
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_damage_with_bitmask)(fl_Int_Input int_input,uchar c){
    (static_cast<Fl_Int_Input*>(int_input))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Int_Input_clear_damage)(fl_Int_Input int_input){
    (static_cast<Fl_Int_Input*>(int_input))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Int_Input_damage_with_text)(fl_Int_Input int_input,uchar c){
    (static_cast<Fl_Int_Input*>(int_input))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Int_Input_damage_inside_widget)(fl_Int_Input int_input,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Int_Input*>(int_input))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Int_Input_draw_label)(fl_Int_Input int_input,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Int_Input*>(int_input))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Int_Input_measure_label)(fl_Int_Input int_input,int& ww,int& hh){
    (static_cast<Fl_Int_Input*>(int_input))->measure_label(ww,hh);
  }

  /* Fl_Int_Input specific functions */
  FL_EXPORT_C(int,Fl_Int_Input_handle)(fl_Int_Input int_input,int event){
    return (static_cast<Fl_Int_Input*>(int_input))->handle(event);
  }
  FL_EXPORT_C(fl_Int_Input, Fl_Int_Input_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Int_Input* int_input = new Fl_Int_Input(x,y,w,h,label);
    return (static_cast<fl_Int_Input>(int_input));
  }
  FL_EXPORT_C(fl_Int_Input, Fl_Int_Input_New)(int x, int y, int w, int h) {
    Fl_Int_Input* int_input = new Fl_Int_Input(x,y,w,h,0);
    return (static_cast<fl_Int_Input>(int_input));
  }
  FL_EXPORT_C(void,Fl_Int_Input_Destroy)(fl_Int_Input int_input){
    delete (static_cast<Fl_Int_Input*>(int_input));
  }
  FL_EXPORT_C(void,Fl_Int_Input_resize)(fl_Int_Input int_input,int X,int Y,int W,int H){
    (static_cast<Fl_Int_Input*>(int_input))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_value)(fl_Int_Input int_input,const char* text){
    return (static_cast<Fl_Int_Input*>(int_input))->value(text);
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_value_with_length)(fl_Int_Input int_input,const char* text,int length){
    return (static_cast<Fl_Int_Input*>(int_input))->value(text,length);
  }
  FL_EXPORT_C(int,Fl_Int_Input_static_value)(fl_Int_Input int_input,const char* text){
    return (static_cast<Fl_Int_Input*>(int_input))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_Int_Input_static_value_with_length)(fl_Int_Input int_input,const char* text,int length){
    return (static_cast<Fl_Int_Input*>(int_input))->static_value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_Int_Input_value)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->value();
  }
  FL_EXPORT_C(Fl_Char,Fl_Int_Input_index)(fl_Int_Input int_input,int i){
    return (static_cast<Fl_Int_Input*>(int_input))->index(i);
  }
  FL_EXPORT_C(int,Fl_Int_Input_size)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->size();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_size)(fl_Int_Input int_input,int W,int H){
    (static_cast<Fl_Int_Input*>(int_input))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Int_Input_maximum_size)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_maximum_size)(fl_Int_Input int_input,int m){
    (static_cast<Fl_Int_Input*>(int_input))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_Int_Input_position)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->position();
  }
  FL_EXPORT_C(int,Fl_Int_Input_mark)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->mark();
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_position_with_cursor_mark)(fl_Int_Input int_input,int p,int m){
    return (static_cast<Fl_Int_Input*>(int_input))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_position_n_n)(fl_Int_Input int_input,int p){
    return (static_cast<Fl_Int_Input*>(int_input))->position(p);
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_mark)(fl_Int_Input int_input,int m){
    return (static_cast<Fl_Int_Input*>(int_input))->mark(m);
  }
  FL_EXPORT_C(int,Fl_Int_Input_replace)(fl_Int_Input int_input,int b,int e,const char* text){
    return (static_cast<Fl_Int_Input*>(int_input))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_Int_Input_replace_with_ilen)(fl_Int_Input int_input,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_Int_Input*>(int_input))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_Int_Input_cut)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->cut();
  }
  FL_EXPORT_C(int,Fl_Int_Input_cut_bytes)(fl_Int_Input int_input,int n){
    return (static_cast<Fl_Int_Input*>(int_input))->cut(n);
  }
  FL_EXPORT_C(int,Fl_Int_Input_cut_range)(fl_Int_Input int_input,int a,int b){
    return (static_cast<Fl_Int_Input*>(int_input))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_Int_Input_insert)(fl_Int_Input int_input,const char* t){
    return (static_cast<Fl_Int_Input*>(int_input))->insert(t);
  }
  FL_EXPORT_C(int,Fl_Int_Input_insert_with_length)(fl_Int_Input int_input,const char* t,int l){
    return (static_cast<Fl_Int_Input*>(int_input))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_Int_Input_copy)(fl_Int_Input int_input,int clipboard){
    return (static_cast<Fl_Int_Input*>(int_input))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_Int_Input_undo)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->undo();
  }
  FL_EXPORT_C(int,Fl_Int_Input_copy_cuts)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_Int_Input_shortcut)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_shortcut)(fl_Int_Input int_input,int s){
    (static_cast<Fl_Int_Input*>(int_input))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Int_Input_textfont)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->textfont();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_textfont)(fl_Int_Input int_input,Fl_Font s){
    (static_cast<Fl_Int_Input*>(int_input))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Int_Input_textsize)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->textsize();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_textsize)(fl_Int_Input int_input,Fl_Fontsize s){
    (static_cast<Fl_Int_Input*>(int_input))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Int_Input_textcolor)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_textcolor)(fl_Int_Input int_input,Fl_Color n){
    (static_cast<Fl_Int_Input*>(int_input))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_Int_Input_cursor_color)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_cursor_color)(fl_Int_Input int_input,Fl_Color n){
    (static_cast<Fl_Int_Input*>(int_input))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Int_Input_input_type)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->input_type();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_input_type)(fl_Int_Input int_input,int t){
    (static_cast<Fl_Int_Input*>(int_input))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_Int_Input_readonly)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->readonly();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_readonly)(fl_Int_Input int_input,int b){
    (static_cast<Fl_Int_Input*>(int_input))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_Int_Input_wrap)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->wrap();
  }
  FL_EXPORT_C(void,Fl_Int_Input_set_wrap)(fl_Int_Input int_input,int b){
    (static_cast<Fl_Int_Input*>(int_input))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_Int_Input_tab_nav)(fl_Int_Input int_input,int val){
    (static_cast<Fl_Int_Input*>(int_input))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_Int_Input_set_tab_nav)(fl_Int_Input int_input){
    return (static_cast<Fl_Int_Input*>(int_input))->tab_nav();
  }
#ifdef __cplusplus
}
#endif
