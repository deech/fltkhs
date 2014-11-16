#include "Fl_Fill_DialC.h"
#ifdef __cplusplus
EXPORT {
#endif  
  FL_EXPORT_C(fl_Group,Fl_Fill_Dial_parent)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->parent();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_parent)(fl_Fill_Dial fill_dial,fl_Group grp){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Fill_Dial_type)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->type();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_type)(fl_Fill_Dial fill_dial,uchar t){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->type(t);
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_x)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->x();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_y)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->y();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_w)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->w();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_h)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->h();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_align)(fl_Fill_Dial fill_dial,Fl_Align alignment){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Fill_Dial_align)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Fill_Dial_box)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->box();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_box)(fl_Fill_Dial fill_dial,Fl_Boxtype new_box){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Fill_Dial_color)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->color();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_color)(fl_Fill_Dial fill_dial,Fl_Color bg){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_color_with_bg_sel)(fl_Fill_Dial fill_dial,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Fill_Dial_selection_color)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_selection_color)(fl_Fill_Dial fill_dial,Fl_Color a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Fill_Dial_label)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->label();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_copy_label)(fl_Fill_Dial fill_dial,const char* new_label){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_label)(fl_Fill_Dial fill_dial,const char* text){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Fill_Dial_labeltype)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_labeltype)(fl_Fill_Dial fill_dial,Fl_Labeltype a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Fill_Dial_labelcolor)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_labelcolor)(fl_Fill_Dial fill_dial,Fl_Color c){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Fill_Dial_labelfont)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_labelfont)(fl_Fill_Dial fill_dial,Fl_Font c){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Fill_Dial_labelsize)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_labelsize)(fl_Fill_Dial fill_dial,Fl_Fontsize pix){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Fill_Dial_image)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->image();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_image)(fl_Fill_Dial fill_dial,fl_Image pix){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Fill_Dial_deimage)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->deimage();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_deimage)(fl_Fill_Dial fill_dial,fl_Image pix){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Fill_Dial_tooltip)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_copy_tooltip)(fl_Fill_Dial fill_dial,const char* text){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_tooltip)(fl_Fill_Dial fill_dial,const char* text){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_callback_with_user_data)(fl_Fill_Dial fill_dial,fl_Callback* cb,void* p){
    Fl_Fill_Dial* castedFill_Dial = (static_cast<Fl_Fill_Dial*>(fill_dial));
    new C_to_Fl_Callback(castedFill_Dial, cb, p);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_callback)(fl_Fill_Dial fill_dial,fl_Callback* cb){
    Fl_Fill_Dial* castedFill_Dial = (static_cast<Fl_Fill_Dial*>(fill_dial));
    new C_to_Fl_Callback(castedFill_Dial, cb);
  }
  FL_EXPORT_C(void*,Fl_Fill_Dial_user_data)(fl_Fill_Dial fill_dial){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Fill_Dial*>(fill_dial))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Fill_Dial*>(fill_dial))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_user_data)(fl_Fill_Dial fill_dial,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Fill_Dial*>(fill_dial))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Fill_Dial*>(fill_dial))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Fill_Dial*>(fill_dial))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Fill_Dial_argument)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->argument();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_argument)(fl_Fill_Dial fill_dial,long v){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Fill_Dial_when)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->when();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_when)(fl_Fill_Dial fill_dial,uchar i){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Fill_Dial_visible)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->visible();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_visible_r)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_show)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->show();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_hide)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->hide();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_visible)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->visible();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_visible)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Fill_Dial_active)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->active();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_active_r)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->active_r();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_activate)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->activate();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_deactivate)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Fill_Dial_output)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->output();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_output)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->output();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_output)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Fill_Dial_takesevents)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_changed)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->changed();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_changed)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_take_focus)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_visible_focus)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_visible_focus)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_modify_visible_focus)(fl_Fill_Dial fill_dial,int v){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Fill_Dial_visible_focus)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_contains)(fl_Fill_Dial fill_dial,fl_Widget w){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_inside)(fl_Fill_Dial fill_dial,fl_Widget w){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_redraw)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->redraw();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_redraw_label)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Fill_Dial_damage)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->damage();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_damage_with_bitmask)(fl_Fill_Dial fill_dial,uchar c){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_clear_damage)(fl_Fill_Dial fill_dial){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_damage_with_text)(fl_Fill_Dial fill_dial,uchar c){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_damage_inside_widget)(fl_Fill_Dial fill_dial,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_draw_label_with_xywh_alignment)(fl_Fill_Dial fill_dial,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_measure_label)(fl_Fill_Dial fill_dial,int* ww,int* hh){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Fill_Dial_window)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Fill_Dial_top_window)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Fill_Dial_top_window_offset)(fl_Fill_Dial fill_dial,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Fill_Dial*>(fill_dial))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Fill_Dial_as_gl_window)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_resize)(fl_Fill_Dial fill_dial,int X,int Y,int W,int H){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_bounds)(fl_Fill_Dial fill_dial,double a,double b){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_minimum)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->minimum();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_minimum)(fl_Fill_Dial fill_dial,double a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_maximum)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->maximum();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_maximum)(fl_Fill_Dial fill_dial,double a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_range)(fl_Fill_Dial fill_dial,double a,double b){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_step)(fl_Fill_Dial fill_dial,int a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->step(a);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_step_with_a_b)(fl_Fill_Dial fill_dial,double a,int b){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_step_with_s)(fl_Fill_Dial fill_dial,double s){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->step(s);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_step)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->step();
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_precision)(fl_Fill_Dial fill_dial,int precision){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_value)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->value();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_set_value)(fl_Fill_Dial fill_dial,double v){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->value(v);
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_format)(fl_Fill_Dial fill_dial,char* format){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->format(format);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_round)(fl_Fill_Dial fill_dial,double v){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->round(v);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_clamp)(fl_Fill_Dial fill_dial,double v){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Fill_Dial_increment)(fl_Fill_Dial fill_dial,double v,int n){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->increment(v,n);
  }
  FL_EXPORT_C(fl_Fill_Dial,Fl_Fill_Dial_New)(int x,int y,int w,int h,const char* label){
    Fl_Fill_Dial* fill_dial = new Fl_Fill_Dial(x,y,w,h,label);
    return (fl_Fill_Dial) fill_dial;
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_Destroy)(fl_Fill_Dial fill_dial){
    delete (static_cast<Fl_Fill_Dial*>(fill_dial));
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_angle1)(fl_Fill_Dial fill_dial,short a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->angle1(a);
  }
  FL_EXPORT_C(void,Fl_Fill_Dial_set_angle2)(fl_Fill_Dial fill_dial,short a){
    (static_cast<Fl_Fill_Dial*>(fill_dial))->angle2(a);
  }
  FL_EXPORT_C(short,Fl_Fill_Dial_angle1)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->angle1();
  }
  FL_EXPORT_C(short,Fl_Fill_Dial_angle2)(fl_Fill_Dial fill_dial){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->angle2();
  }
  FL_EXPORT_C(int,Fl_Fill_Dial_handle)(fl_Fill_Dial fill_dial,int event){
    return (static_cast<Fl_Fill_Dial*>(fill_dial))->handle(event);
  }
#ifdef __cplusplus
}
#endif 
