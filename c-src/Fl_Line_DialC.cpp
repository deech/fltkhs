#include "Fl_Line_DialC.h"
#ifdef __cplusplus
EXPORT {
#endif  
  FL_EXPORT_C(fl_Group,Fl_Line_Dial_parent)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->parent();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_parent)(fl_Line_Dial line_dial,fl_Group grp){
    (static_cast<Fl_Line_Dial*>(line_dial))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Line_Dial_type)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->type();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_type)(fl_Line_Dial line_dial,uchar t){
    (static_cast<Fl_Line_Dial*>(line_dial))->type(t);
  }
  FL_EXPORT_C(int,Fl_Line_Dial_x)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->x();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_y)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->y();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_w)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->w();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_h)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->h();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_align)(fl_Line_Dial line_dial,Fl_Align alignment){
    (static_cast<Fl_Line_Dial*>(line_dial))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Line_Dial_align)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Line_Dial_box)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->box();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_box)(fl_Line_Dial line_dial,Fl_Boxtype new_box){
    (static_cast<Fl_Line_Dial*>(line_dial))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Line_Dial_color)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->color();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_color)(fl_Line_Dial line_dial,Fl_Color bg){
    (static_cast<Fl_Line_Dial*>(line_dial))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_color_with_bg_sel)(fl_Line_Dial line_dial,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Line_Dial*>(line_dial))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Line_Dial_selection_color)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_selection_color)(fl_Line_Dial line_dial,Fl_Color a){
    (static_cast<Fl_Line_Dial*>(line_dial))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Line_Dial_label)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->label();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_copy_label)(fl_Line_Dial line_dial,const char* new_label){
    (static_cast<Fl_Line_Dial*>(line_dial))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_label)(fl_Line_Dial line_dial,const char* text){
    (static_cast<Fl_Line_Dial*>(line_dial))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Line_Dial_labeltype)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_labeltype)(fl_Line_Dial line_dial,Fl_Labeltype a){
    (static_cast<Fl_Line_Dial*>(line_dial))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Line_Dial_labelcolor)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_labelcolor)(fl_Line_Dial line_dial,Fl_Color c){
    (static_cast<Fl_Line_Dial*>(line_dial))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Line_Dial_labelfont)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_labelfont)(fl_Line_Dial line_dial,Fl_Font c){
    (static_cast<Fl_Line_Dial*>(line_dial))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Line_Dial_labelsize)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_labelsize)(fl_Line_Dial line_dial,Fl_Fontsize pix){
    (static_cast<Fl_Line_Dial*>(line_dial))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Line_Dial_image)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->image();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_image)(fl_Line_Dial line_dial,fl_Image pix){
    (static_cast<Fl_Line_Dial*>(line_dial))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Line_Dial_deimage)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->deimage();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_deimage)(fl_Line_Dial line_dial,fl_Image pix){
    (static_cast<Fl_Line_Dial*>(line_dial))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Line_Dial_tooltip)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_copy_tooltip)(fl_Line_Dial line_dial,const char* text){
    (static_cast<Fl_Line_Dial*>(line_dial))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_tooltip)(fl_Line_Dial line_dial,const char* text){
    (static_cast<Fl_Line_Dial*>(line_dial))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_callback_with_user_data)(fl_Line_Dial line_dial,fl_Callback* cb,void* p){
    Fl_Line_Dial* castedLine_Dial = (static_cast<Fl_Line_Dial*>(line_dial));
    new C_to_Fl_Callback(castedLine_Dial, cb, p);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_callback)(fl_Line_Dial line_dial,fl_Callback* cb){
    Fl_Line_Dial* castedLine_Dial = (static_cast<Fl_Line_Dial*>(line_dial));
    new C_to_Fl_Callback(castedLine_Dial, cb);
  }
  FL_EXPORT_C(void*,Fl_Line_Dial_user_data)(fl_Line_Dial line_dial){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Line_Dial*>(line_dial))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Line_Dial*>(line_dial))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_user_data)(fl_Line_Dial line_dial,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Line_Dial*>(line_dial))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Line_Dial*>(line_dial))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Line_Dial*>(line_dial))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Line_Dial_argument)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->argument();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_argument)(fl_Line_Dial line_dial,long v){
    (static_cast<Fl_Line_Dial*>(line_dial))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Line_Dial_when)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->when();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_when)(fl_Line_Dial line_dial,uchar i){
    (static_cast<Fl_Line_Dial*>(line_dial))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Line_Dial_visible)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->visible();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_visible_r)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_show)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->show();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_hide)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->hide();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_visible)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->visible();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_visible)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Line_Dial_active)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->active();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_active_r)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->active_r();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_activate)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->activate();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_deactivate)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Line_Dial_output)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->output();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_output)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->output();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_output)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Line_Dial_takesevents)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_changed)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->changed();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_changed)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_take_focus)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_visible_focus)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_visible_focus)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_modify_visible_focus)(fl_Line_Dial line_dial,int v){
    (static_cast<Fl_Line_Dial*>(line_dial))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Line_Dial_visible_focus)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_contains)(fl_Line_Dial line_dial,fl_Widget w){
    return (static_cast<Fl_Line_Dial*>(line_dial))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Line_Dial_inside)(fl_Line_Dial line_dial,fl_Widget w){
    return (static_cast<Fl_Line_Dial*>(line_dial))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Line_Dial_redraw)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->redraw();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_redraw_label)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Line_Dial_damage)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->damage();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_damage_with_bitmask)(fl_Line_Dial line_dial,uchar c){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_clear_damage)(fl_Line_Dial line_dial){
    (static_cast<Fl_Line_Dial*>(line_dial))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_damage_with_text)(fl_Line_Dial line_dial,uchar c){
    (static_cast<Fl_Line_Dial*>(line_dial))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_damage_inside_widget)(fl_Line_Dial line_dial,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Line_Dial*>(line_dial))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_draw_label_with_xywh_alignment)(fl_Line_Dial line_dial,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Line_Dial*>(line_dial))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_measure_label)(fl_Line_Dial line_dial,int* ww,int* hh){
    (static_cast<Fl_Line_Dial*>(line_dial))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Line_Dial_window)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Line_Dial_top_window)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Line_Dial_top_window_offset)(fl_Line_Dial line_dial,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Line_Dial*>(line_dial))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Line_Dial_as_gl_window)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_resize)(fl_Line_Dial line_dial,int X,int Y,int W,int H){
    (static_cast<Fl_Line_Dial*>(line_dial))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_bounds)(fl_Line_Dial line_dial,double a,double b){
    (static_cast<Fl_Line_Dial*>(line_dial))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_minimum)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->minimum();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_minimum)(fl_Line_Dial line_dial,double a){
    (static_cast<Fl_Line_Dial*>(line_dial))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_maximum)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->maximum();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_maximum)(fl_Line_Dial line_dial,double a){
    (static_cast<Fl_Line_Dial*>(line_dial))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_range)(fl_Line_Dial line_dial,double a,double b){
    (static_cast<Fl_Line_Dial*>(line_dial))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_step)(fl_Line_Dial line_dial,int a){
    (static_cast<Fl_Line_Dial*>(line_dial))->step(a);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_step_with_a_b)(fl_Line_Dial line_dial,double a,int b){
    (static_cast<Fl_Line_Dial*>(line_dial))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_step_with_s)(fl_Line_Dial line_dial,double s){
    (static_cast<Fl_Line_Dial*>(line_dial))->step(s);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_step)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->step();
  }
  FL_EXPORT_C(void,Fl_Line_Dial_precision)(fl_Line_Dial line_dial,int precision){
    (static_cast<Fl_Line_Dial*>(line_dial))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_value)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->value();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_set_value)(fl_Line_Dial line_dial,double v){
    return (static_cast<Fl_Line_Dial*>(line_dial))->value(v);
  }
  FL_EXPORT_C(int,Fl_Line_Dial_format)(fl_Line_Dial line_dial,char* format){
    return (static_cast<Fl_Line_Dial*>(line_dial))->format(format);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_round)(fl_Line_Dial line_dial,double v){
    return (static_cast<Fl_Line_Dial*>(line_dial))->round(v);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_clamp)(fl_Line_Dial line_dial,double v){
    return (static_cast<Fl_Line_Dial*>(line_dial))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Line_Dial_increment)(fl_Line_Dial line_dial,double v,int n){
    return (static_cast<Fl_Line_Dial*>(line_dial))->increment(v,n);
  }
  FL_EXPORT_C(fl_Line_Dial,Fl_Line_Dial_New)(int x,int y,int w,int h){
    Fl_Line_Dial* line_dial = new Fl_Line_Dial(x,y,w,h);
    return (fl_Line_Dial) line_dial;
  }
  FL_EXPORT_C(fl_Line_Dial,Fl_Line_Dial_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Line_Dial* line_dial = new Fl_Line_Dial(x,y,w,h,label);
    return (fl_Line_Dial) line_dial;
  }
  FL_EXPORT_C(void,Fl_Line_Dial_Destroy)(fl_Line_Dial line_dial){
    delete (static_cast<Fl_Line_Dial*>(line_dial));
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_angle1)(fl_Line_Dial line_dial,short a){
    (static_cast<Fl_Line_Dial*>(line_dial))->angle1(a);
  }
  FL_EXPORT_C(void,Fl_Line_Dial_set_angle2)(fl_Line_Dial line_dial,short a){
    (static_cast<Fl_Line_Dial*>(line_dial))->angle2(a);
  }
  FL_EXPORT_C(short,Fl_Line_Dial_angle1)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->angle1();
  }
  FL_EXPORT_C(short,Fl_Line_Dial_angle2)(fl_Line_Dial line_dial){
    return (static_cast<Fl_Line_Dial*>(line_dial))->angle2();
  }
  FL_EXPORT_C(int,Fl_Line_Dial_handle)(fl_Line_Dial line_dial,int event){
    return (static_cast<Fl_Line_Dial*>(line_dial))->handle(event);
  }
#ifdef __cplusplus
}
#endif 
