#include "Fl_CounterC.h"
#ifdef __cplusplus
EXPORT {
#endif  
  FL_EXPORT_C(fl_Group,Fl_Counter_parent)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->parent();
  }
  FL_EXPORT_C(void,Fl_Counter_set_parent)(fl_Counter counter,fl_Group grp){
    (static_cast<Fl_Counter*>(counter))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Counter_type)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->type();
  }
  FL_EXPORT_C(void,Fl_Counter_set_type)(fl_Counter counter,uchar t){
    (static_cast<Fl_Counter*>(counter))->type(t);
  }
  FL_EXPORT_C(int,Fl_Counter_x)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->x();
  }
  FL_EXPORT_C(int,Fl_Counter_y)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->y();
  }
  FL_EXPORT_C(int,Fl_Counter_w)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->w();
  }
  FL_EXPORT_C(int,Fl_Counter_h)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->h();
  }
  FL_EXPORT_C(void,Fl_Counter_set_align)(fl_Counter counter,Fl_Align alignment){
    (static_cast<Fl_Counter*>(counter))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Counter_align)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Counter_box)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->box();
  }
  FL_EXPORT_C(void,Fl_Counter_set_box)(fl_Counter counter,Fl_Boxtype new_box){
    (static_cast<Fl_Counter*>(counter))->box(new_box);
  }
  FL_EXPORT_C(Fl_Color,Fl_Counter_color)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->color();
  }
  FL_EXPORT_C(void,Fl_Counter_set_color)(fl_Counter counter,Fl_Color bg){
    (static_cast<Fl_Counter*>(counter))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Counter_set_color_with_bg_sel)(fl_Counter counter,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Counter*>(counter))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Counter_selection_color)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Counter_set_selection_color)(fl_Counter counter,Fl_Color a){
    (static_cast<Fl_Counter*>(counter))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Counter_label)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->label();
  }
  FL_EXPORT_C(void,Fl_Counter_copy_label)(fl_Counter counter,const char* new_label){
    (static_cast<Fl_Counter*>(counter))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Counter_set_label)(fl_Counter counter,const char* text){
    (static_cast<Fl_Counter*>(counter))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Counter_labeltype)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Counter_set_labeltype)(fl_Counter counter,Fl_Labeltype a){
    (static_cast<Fl_Counter*>(counter))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Counter_labelcolor)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Counter_set_labelcolor)(fl_Counter counter,Fl_Color c){
    (static_cast<Fl_Counter*>(counter))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Counter_labelfont)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Counter_set_labelfont)(fl_Counter counter,Fl_Font c){
    (static_cast<Fl_Counter*>(counter))->labelfont(c);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Counter_labelsize)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Counter_set_labelsize)(fl_Counter counter,Fl_Fontsize pix){
    (static_cast<Fl_Counter*>(counter))->labelsize(pix);
  }
  FL_EXPORT_C(fl_Image,Fl_Counter_image)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->image();
  }
  FL_EXPORT_C(void,Fl_Counter_set_image)(fl_Counter counter,fl_Image pix){
    (static_cast<Fl_Counter*>(counter))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Counter_deimage)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->deimage();
  }
  FL_EXPORT_C(void,Fl_Counter_set_deimage)(fl_Counter counter,fl_Image pix){
    (static_cast<Fl_Counter*>(counter))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Counter_tooltip)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Counter_copy_tooltip)(fl_Counter counter,const char* text){
    (static_cast<Fl_Counter*>(counter))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Counter_set_tooltip)(fl_Counter counter,const char* text){
    (static_cast<Fl_Counter*>(counter))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Counter_set_callback_with_user_data)(fl_Counter counter,fl_Callback* cb,void* p){
    Fl_Counter* castedCounter = (static_cast<Fl_Counter*>(counter));
    new C_to_Fl_Callback(castedCounter, cb, p);
  }
  FL_EXPORT_C(void,Fl_Counter_set_callback)(fl_Counter counter,fl_Callback* cb){
    Fl_Counter* castedCounter = (static_cast<Fl_Counter*>(counter));
    new C_to_Fl_Callback(castedCounter, cb);
  }
  FL_EXPORT_C(void*,Fl_Counter_user_data)(fl_Counter counter){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Counter*>(counter))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Counter*>(counter))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Counter_set_user_data)(fl_Counter counter,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Counter*>(counter))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Counter*>(counter))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Counter*>(counter))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Counter_argument)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->argument();
  }
  FL_EXPORT_C(void,Fl_Counter_set_argument)(fl_Counter counter,long v){
    (static_cast<Fl_Counter*>(counter))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Counter_when)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->when();
  }
  FL_EXPORT_C(void,Fl_Counter_set_when)(fl_Counter counter,uchar i){
    (static_cast<Fl_Counter*>(counter))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Counter_visible)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->visible();
  }
  FL_EXPORT_C(int,Fl_Counter_visible_r)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Counter_show)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->show();
  }
  FL_EXPORT_C(void,Fl_Counter_hide)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->hide();
  }
  FL_EXPORT_C(void,Fl_Counter_set_visible)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->visible();
  }
  FL_EXPORT_C(void,Fl_Counter_clear_visible)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Counter_active)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->active();
  }
  FL_EXPORT_C(int,Fl_Counter_active_r)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->active_r();
  }
  FL_EXPORT_C(void,Fl_Counter_activate)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->activate();
  }
  FL_EXPORT_C(void,Fl_Counter_deactivate)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Counter_output)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->output();
  }
  FL_EXPORT_C(void,Fl_Counter_set_output)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->output();
  }
  FL_EXPORT_C(void,Fl_Counter_clear_output)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Counter_takesevents)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Counter_set_changed)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->changed();
  }
  FL_EXPORT_C(void,Fl_Counter_clear_changed)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Counter_take_focus)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Counter_set_visible_focus)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Counter_clear_visible_focus)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Counter_modify_visible_focus)(fl_Counter counter,int v){
    (static_cast<Fl_Counter*>(counter))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Counter_visible_focus)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Counter_contains)(fl_Counter counter,fl_Widget w){
    return (static_cast<Fl_Counter*>(counter))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Counter_inside)(fl_Counter counter,fl_Widget w){
    return (static_cast<Fl_Counter*>(counter))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Counter_redraw)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->redraw();
  }
  FL_EXPORT_C(void,Fl_Counter_redraw_label)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Counter_damage)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->damage();
  }
  FL_EXPORT_C(void,Fl_Counter_clear_damage_with_bitmask)(fl_Counter counter,uchar c){
    (static_cast<Fl_Counter*>(counter))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Counter_clear_damage)(fl_Counter counter){
    (static_cast<Fl_Counter*>(counter))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Counter_damage_with_text)(fl_Counter counter,uchar c){
    (static_cast<Fl_Counter*>(counter))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Counter_damage_inside_widget)(fl_Counter counter,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Counter*>(counter))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Counter_draw_label_with_xywh_alignment)(fl_Counter counter,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Counter*>(counter))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Counter_measure_label)(fl_Counter counter,int* ww,int* hh){
    (static_cast<Fl_Counter*>(counter))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,Fl_Counter_window)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->window();
  }
  FL_EXPORT_C(fl_Window,Fl_Counter_top_window)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->top_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Counter_top_window_offset)(fl_Counter counter,int* xoff,int* yoff){
    return (fl_Window)(static_cast<Fl_Counter*>(counter))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Counter_as_gl_window)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Counter_resize)(fl_Counter counter,int X,int Y,int W,int H){
    (static_cast<Fl_Counter*>(counter))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(void,Fl_Counter_bounds)(fl_Counter counter,double a,double b){
    (static_cast<Fl_Counter*>(counter))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Counter_minimum)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->minimum();
  }
  FL_EXPORT_C(void,Fl_Counter_set_minimum)(fl_Counter counter,double a){
    (static_cast<Fl_Counter*>(counter))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Counter_maximum)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->maximum();
  }
  FL_EXPORT_C(void,Fl_Counter_set_maximum)(fl_Counter counter,double a){
    (static_cast<Fl_Counter*>(counter))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Counter_range)(fl_Counter counter,double a,double b){
    (static_cast<Fl_Counter*>(counter))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Counter_set_step)(fl_Counter counter,int a){
    (static_cast<Fl_Counter*>(counter))->step(a);
  }
  FL_EXPORT_C(void,Fl_Counter_set_step_with_a_b)(fl_Counter counter,double a,int b){
    (static_cast<Fl_Counter*>(counter))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Counter_step_with_s)(fl_Counter counter,double s){
    (static_cast<Fl_Counter*>(counter))->step(s);
  }
  FL_EXPORT_C(double,Fl_Counter_step)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->step();
  }
  FL_EXPORT_C(void,Fl_Counter_precision)(fl_Counter counter,int precision){
    (static_cast<Fl_Counter*>(counter))->precision(precision);
  }
  FL_EXPORT_C(double,Fl_Counter_value)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->value();
  }
  FL_EXPORT_C(int,Fl_Counter_set_value)(fl_Counter counter,double v){
    return (static_cast<Fl_Counter*>(counter))->value(v);
  }
  FL_EXPORT_C(int,Fl_Counter_format)(fl_Counter counter,char* format){
    return (static_cast<Fl_Counter*>(counter))->format(format);
  }
  FL_EXPORT_C(double,Fl_Counter_round)(fl_Counter counter,double v){
    return (static_cast<Fl_Counter*>(counter))->round(v);
  }
  FL_EXPORT_C(double,Fl_Counter_clamp)(fl_Counter counter,double v){
    return (static_cast<Fl_Counter*>(counter))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Counter_increment)(fl_Counter counter,double v,int n){
    return (static_cast<Fl_Counter*>(counter))->increment(v,n);
  }
  FL_EXPORT_C(fl_Counter,Fl_Counter_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Counter* counter = new Fl_Counter(x,y,w,h,label);
    return (fl_Counter) counter;
  }
  FL_EXPORT_C(fl_Counter,Fl_Counter_New)(int x,int y,int w,int h){
    Fl_Counter* counter = new Fl_Counter(x,y,w,h);
    return (fl_Counter) counter;
  }
  FL_EXPORT_C(fl_Simple_Counter,Fl_Simple_Counter_New_WithLabel)(int x,int y,int w,int h,const char* label){
    Fl_Simple_Counter* simple_counter = new Fl_Simple_Counter(x,y,w,h,label);
    return (fl_Simple_Counter) simple_counter;
  }
  FL_EXPORT_C(fl_Simple_Counter,Fl_Simple_Counter_New)(int x,int y,int w,int h){
    Fl_Simple_Counter* simple_counter = new Fl_Simple_Counter(x,y,w,h);
    return (fl_Simple_Counter) simple_counter;
  }
  FL_EXPORT_C(void,Fl_Counter_Destroy)(fl_Counter counter){
    delete (static_cast<Fl_Counter*>(counter));
  }
  FL_EXPORT_C(void,Fl_Counter_set_textfont)(fl_Counter counter,Fl_Font text){
    (static_cast<Fl_Counter*>(counter))->textfont(text);
  }
  FL_EXPORT_C(Fl_Font,Fl_Counter_textfont)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->textfont();
  }
  FL_EXPORT_C(void,Fl_Counter_set_textsize)(fl_Counter counter,Fl_Fontsize text){
    (static_cast<Fl_Counter*>(counter))->textsize(text);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Counter_textsize)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->textsize();
  }
  FL_EXPORT_C(void,Fl_Counter_set_textcolor)(fl_Counter counter,Fl_Color text){
    (static_cast<Fl_Counter*>(counter))->textcolor(text);
  }
  FL_EXPORT_C(Fl_Color,Fl_Counter_textcolor)(fl_Counter counter){
    return (static_cast<Fl_Counter*>(counter))->textcolor();
  }
  FL_EXPORT_C(int,Fl_Counter_handle)(fl_Counter counter,int event){
    return (static_cast<Fl_Counter*>(counter))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Counter_lstep)(fl_Counter counter,double lstep){
    (static_cast<Fl_Counter*>(counter))->lstep(lstep);
  }
#ifdef __cplusplus
}
#endif 
