#include "Fl_Value_InputC.h"

#ifdef __cplusplus
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(fl_Group,Fl_Value_Input_parent)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->parent();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_parent)(fl_Value_Input value_input,fl_Group grp){
    (static_cast<Fl_Value_Input*>(value_input))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Value_Input_type)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->type();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_type)(fl_Value_Input value_input,uchar t){
    (static_cast<Fl_Value_Input*>(value_input))->type(t);
  }
  FL_EXPORT_C(int,Fl_Value_Input_x)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->x();
  }
  FL_EXPORT_C(int,Fl_Value_Input_y)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->y();
  }
  FL_EXPORT_C(int,Fl_Value_Input_w)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->w();
  }
  FL_EXPORT_C(int,Fl_Value_Input_h)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->h();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_align)(fl_Value_Input value_input, Fl_Align alignment){
    (static_cast<Fl_Value_Input*>(value_input))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Value_Input_align)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Value_Input_box)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->box();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_box)(fl_Value_Input value_input,Fl_Boxtype new_box){
    (static_cast<Fl_Value_Input*>(value_input))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Input_color)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->color();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_color)(fl_Value_Input value_input,Fl_Color bg){
    (static_cast<Fl_Value_Input*>(value_input))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_background_and_selection_color)(fl_Value_Input value_input,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Value_Input*>(value_input))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Value_Input_selection_color)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_selection_color)(fl_Value_Input value_input,Fl_Color a){
    (static_cast<Fl_Value_Input*>(value_input))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Value_Input_label)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->label();
  }
  FL_EXPORT_C(void,Fl_Value_Input_copy_label)(fl_Value_Input value_input,const char* new_label){
    (static_cast<Fl_Value_Input*>(value_input))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_label)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Value_Input_labeltype)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labeltype)(fl_Value_Input value_input,Fl_Labeltype a){
    (static_cast<Fl_Value_Input*>(value_input))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelcolor)(fl_Value_Input value_input,Fl_Color c){
    (static_cast<Fl_Value_Input*>(value_input))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Value_Input_labelfont)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelfont)(fl_Value_Input value_input,Fl_Font c){
    (static_cast<Fl_Value_Input*>(value_input))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Value_Input_labelsize)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_labelsize)(fl_Value_Input value_input,Fl_Fontsize pix){
    (static_cast<Fl_Value_Input*>(value_input))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Input_image)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->image();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_image)(fl_Value_Input value_input,fl_Image pix){
    (static_cast<Fl_Value_Input*>(value_input))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Value_Input_deimage)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->deimage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_deimage)(fl_Value_Input value_input,fl_Image pix){
    (static_cast<Fl_Value_Input*>(value_input))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Value_Input_tooltip)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Value_Input_copy_tooltip)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_tooltip)(fl_Value_Input value_input,const char* text){
    (static_cast<Fl_Value_Input*>(value_input))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_callback_and_user_data)(fl_Value_Input value_input,fl_Callback* cb,void* p){
    Fl_Value_Input* castedButton = (static_cast<Fl_Value_Input*>(value_input));
    new C_to_Fl_Callback(castedButton, cb, p);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_callback)(fl_Value_Input value_input,fl_Callback* cb){
    Fl_Value_Input* castedButton = (static_cast<Fl_Value_Input*>(value_input));
    new C_to_Fl_Callback(castedButton, cb);
  }
  FL_EXPORT_C(void*,Fl_Value_Input_user_data)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->user_data();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_user_data)(fl_Value_Input value_input,void* v){
    (static_cast<Fl_Value_Input*>(value_input))->user_data(v);
  }
  FL_EXPORT_C(long,Fl_Value_Input_argument)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->argument();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_argument)(fl_Value_Input value_input,long v){
    (static_cast<Fl_Value_Input*>(value_input))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Value_Input_when)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->when();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_when)(fl_Value_Input value_input,uchar i){
    (static_cast<Fl_Value_Input*>(value_input))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_visible)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible();
  }
  FL_EXPORT_C(int,Fl_Value_Input_visible_r)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_visible)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->visible();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_visible)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_active)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->active();
  }
  FL_EXPORT_C(int,Fl_Value_Input_active_r)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->active_r();
  }
  FL_EXPORT_C(void,Fl_Value_Input_activate)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->activate();
  }
  FL_EXPORT_C(void,Fl_Value_Input_deactivate)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_output)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_output)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->output();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_output)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_takesevents)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_changed)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->changed();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_changed)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Value_Input_take_focus)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_visible_focus)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_visible_focus)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_modify_visible_focus)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Value_Input_visible_focus)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback_with_widget_and_user_data)(fl_Value_Input value_input,fl_Widget w,long arg){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Value_Input_do_callback_with_widget_and_default_user_data)(fl_Value_Input value_input,fl_Widget w){
    (static_cast<Fl_Value_Input*>(value_input))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Input_contains)(fl_Value_Input value_input,fl_Widget w){
    return (static_cast<Fl_Value_Input*>(value_input))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Value_Input_inside)(fl_Value_Input value_input,fl_Widget w){
    return (static_cast<Fl_Value_Input*>(value_input))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Value_Input_redraw)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->redraw();
  }
  FL_EXPORT_C(void,Fl_Value_Input_redraw_label)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Value_Input_damage)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->damage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_damage_with_bitmask)(fl_Value_Input value_input,uchar c){
    (static_cast<Fl_Value_Input*>(value_input))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Input_clear_damage)(fl_Value_Input value_input){
    (static_cast<Fl_Value_Input*>(value_input))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Value_Input_damage_with_text)(fl_Value_Input value_input,uchar c){
    (static_cast<Fl_Value_Input*>(value_input))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Value_Input_damage_inside_widget)(fl_Value_Input value_input,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Value_Input*>(value_input))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Value_Input_draw_label)(fl_Value_Input value_input,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Value_Input*>(value_input))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Value_Input_measure_label)(fl_Value_Input value_input,int* ww,int* hh){
    (static_cast<Fl_Value_Input*>(value_input))->measure_label(*ww,*hh);
  }

  /* Inherited from Fl_Valuator */

  FL_EXPORT_C(void,Fl_Value_Input_bounds)(fl_Value_Input value_input,double a,double b){
    (static_cast<Fl_Value_Input*>(value_input))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Value_Input_minimum)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->minimum();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_minimum)(fl_Value_Input value_input,double a){
    (static_cast<Fl_Value_Input*>(value_input))->minimum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_maximum)(fl_Value_Input value_input,double a){
    (static_cast<Fl_Value_Input*>(value_input))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_range)(fl_Value_Input value_input,double a,double b){
    (static_cast<Fl_Value_Input*>(value_input))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_a)(fl_Value_Input value_input,int a){
    (static_cast<Fl_Value_Input*>(value_input))->step(a);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_a_b)(fl_Value_Input value_input,double a,int b){
    (static_cast<Fl_Value_Input*>(value_input))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_step_with_s)(fl_Value_Input value_input,double s){
    (static_cast<Fl_Value_Input*>(value_input))->step(s);
  }
  FL_EXPORT_C(double,Fl_Value_Input_step)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->step();
  }
  FL_EXPORT_C(void,Fl_Value_Input_precision)(fl_Value_Input value_input, int p){
    (static_cast<Fl_Value_Input*>(value_input))->precision(p);
  }
  FL_EXPORT_C(double,Fl_Value_Input_value)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->value();
  }
  FL_EXPORT_C(int,Fl_Value_Input_set_value)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->value(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_round)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->round(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_clamp)(fl_Value_Input value_input,double v){
    return (static_cast<Fl_Value_Input*>(value_input))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Value_Input_increment)(fl_Value_Input value_input,double v,int n){
    return (static_cast<Fl_Value_Input*>(value_input))->increment(v,n);
  }
  FL_EXPORT_C(fl_Value_Input,  Fl_Value_Input_New_WithLabel)(int x, int y, int w, int h, const char* label){
    Fl_Value_Input* value_input = new Fl_Value_Input(x,y,w,h,label);
    return (static_cast<fl_Value_Input>(value_input));
  }
  FL_EXPORT_C(fl_Value_Input, Fl_Value_Input_New)(int x, int y, int w, int h){
    Fl_Value_Input* value_input = new Fl_Value_Input(x,y,w,h,0);
    return (static_cast<fl_Value_Input>(value_input));
  }
  FL_EXPORT_C(void,Fl_Value_Input_Destroy)(fl_Value_Input value_input){
    delete (static_cast<Fl_Value_Input*>(value_input));
  }
  FL_EXPORT_C(char,Fl_Value_Input_soft)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->soft();
  }
  FL_EXPORT_C(void,Fl_Value_Input_resize)(fl_Value_Input value_input,int X,int Y,int W,int H){
    (static_cast<Fl_Value_Input*>(value_input))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_soft)(fl_Value_Input value_input,char s){
    (static_cast<Fl_Value_Input*>(value_input))->soft(s);
  }
  FL_EXPORT_C(int,Fl_Value_Input_shortcut)(fl_Value_Input value_input){
    return (static_cast<Fl_Value_Input*>(value_input))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Value_Input_set_shortcut)(fl_Value_Input value_input,int v){
    (static_cast<Fl_Value_Input*>(value_input))->shortcut(v);
  }
#ifdef __cplusplus
}
#endif
