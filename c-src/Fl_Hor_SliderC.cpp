#include "Fl_Hor_SliderC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Hor_Slider_handle_super)(fl_Hor_Slider slider,int event){
    return (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::handle(event);
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_handle )(fl_Hor_Slider slider, int event){
    return (static_cast<Fl_Hor_Slider*>(slider))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_resize_super )(fl_Hor_Slider slider,int x, int y, int w, int h){
    (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_resize )(fl_Hor_Slider slider,int x, int y, int w, int h){
    (static_cast<Fl_Hor_Slider*>(slider))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_show_super)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::show();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_show )(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->show();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_hide_super)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::hide();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_hide )(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Hor_Slider_as_window_super)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Hor_Slider_as_window )(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hor_Slider_as_gl_window_super)(fl_Hor_Slider slider){
    return (fl_Gl_Window) (static_cast<Fl_Hor_Slider*>(slider))->Fl_Hor_Slider::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hor_Slider_as_gl_window )(fl_Hor_Slider slider){
    return (fl_Gl_Window) (static_cast<Fl_Hor_Slider*>(slider))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Hor_Slider_parent)(fl_Hor_Slider slider){
    return (fl_Group) (static_cast<Fl_Hor_Slider*>(slider))->parent();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_parent)(fl_Hor_Slider slider,fl_Group grp){
    (static_cast<Fl_Hor_Slider*>(slider))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Hor_Slider_type)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->type();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_type)(fl_Hor_Slider slider,uchar t){
    (static_cast<Fl_Hor_Slider*>(slider))->type(t);
  }

  FL_EXPORT_C(int,Fl_Hor_Slider_x)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->x();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_y)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->y();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_w)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->w();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_h)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->h();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_align)(fl_Hor_Slider slider, Fl_Align alignment){
    (static_cast<Fl_Hor_Slider*>(slider))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Hor_Slider_align)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Hor_Slider_box)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->box();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_box)(fl_Hor_Slider slider,Fl_Boxtype new_box){
    (static_cast<Fl_Hor_Slider*>(slider))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Hor_Slider_color)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->color();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_color)(fl_Hor_Slider slider,Fl_Color bg){
    (static_cast<Fl_Hor_Slider*>(slider))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_color_with_bg_sel)(fl_Hor_Slider slider,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Hor_Slider*>(slider))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Hor_Slider_selection_color)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_selection_color)(fl_Hor_Slider slider,Fl_Color a){
    (static_cast<Fl_Hor_Slider*>(slider))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Hor_Slider_label)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->label();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_copy_label)(fl_Hor_Slider slider,const char* new_label){
    (static_cast<Fl_Hor_Slider*>(slider))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_label)(fl_Hor_Slider slider,const char* text){
    (static_cast<Fl_Hor_Slider*>(slider))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Hor_Slider_labeltype)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_labeltype)(fl_Hor_Slider slider,Fl_Labeltype a){
    (static_cast<Fl_Hor_Slider*>(slider))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_labelcolor)(fl_Hor_Slider slider,Fl_Color c){
    (static_cast<Fl_Hor_Slider*>(slider))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Hor_Slider_labelcolor)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Hor_Slider_labelfont)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_labelfont)(fl_Hor_Slider slider,Fl_Font c){
    (static_cast<Fl_Hor_Slider*>(slider))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Hor_Slider_labelsize)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_labelsize)(fl_Hor_Slider slider,Fl_Fontsize pix){
    (static_cast<Fl_Hor_Slider*>(slider))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hor_Slider_image)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->image();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_image)(fl_Hor_Slider slider,fl_Image pix){
    (static_cast<Fl_Hor_Slider*>(slider))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hor_Slider_deimage)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->deimage();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_deimage)(fl_Hor_Slider slider,fl_Image pix){
    (static_cast<Fl_Hor_Slider*>(slider))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Hor_Slider_tooltip)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_copy_tooltip)(fl_Hor_Slider slider,const char* text){
    (static_cast<Fl_Hor_Slider*>(slider))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_tooltip)(fl_Hor_Slider slider,const char* text){
    (static_cast<Fl_Hor_Slider*>(slider))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_callback_with_user_data)(fl_Hor_Slider slider,fl_Callback cb,void* p){
    Fl_Hor_Slider* castedBox = (static_cast<Fl_Hor_Slider*>(slider));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_callback)(fl_Hor_Slider slider,fl_Callback cb){
    Fl_Hor_Slider* castedBox = (static_cast<Fl_Hor_Slider*>(slider));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Hor_Slider_user_data)(fl_Hor_Slider slider){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hor_Slider*>(slider))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Hor_Slider*>(slider))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_user_data)(fl_Hor_Slider slider,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hor_Slider*>(slider))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Hor_Slider*>(slider))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Hor_Slider*>(slider))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Hor_Slider_argument)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->argument();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_argument)(fl_Hor_Slider slider,long v){
    (static_cast<Fl_Hor_Slider*>(slider))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Hor_Slider_when)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->when();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_when)(fl_Hor_Slider slider,uchar i){
    (static_cast<Fl_Hor_Slider*>(slider))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Slider_visible)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->visible();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_visible_r)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_visible)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->visible();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_visible)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Slider_active)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->active();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_active_r)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->active_r();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_activate)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->activate();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_deactivate)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Slider_output)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_output)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_output)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Slider_takesevents)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_changed)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->changed();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_changed)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_take_focus)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_visible_focus)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_visible_focus)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_modify_visible_focus)(fl_Hor_Slider slider,int v){
    (static_cast<Fl_Hor_Slider*>(slider))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Slider_visible_focus)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_do_callback)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_do_callback_with_widget_and_user_data)(fl_Hor_Slider slider,fl_Widget w,long arg){
    (static_cast<Fl_Hor_Slider*>(slider))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_do_callback_with_widget_and_default_user_data)(fl_Hor_Slider slider,fl_Widget w){
    (static_cast<Fl_Hor_Slider*>(slider))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_contains)(fl_Hor_Slider slider,fl_Widget w){
    return (static_cast<Fl_Hor_Slider*>(slider))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_inside)(fl_Hor_Slider slider,fl_Widget w){
    return (static_cast<Fl_Hor_Slider*>(slider))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_redraw)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->redraw();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_redraw_label)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Hor_Slider_damage)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->damage();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_damage_with_bitmask)(fl_Hor_Slider slider,uchar c){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_clear_damage)(fl_Hor_Slider slider){
    (static_cast<Fl_Hor_Slider*>(slider))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_damage_with_text)(fl_Hor_Slider slider,uchar c){
    (static_cast<Fl_Hor_Slider*>(slider))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_damage_inside_widget)(fl_Hor_Slider slider,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Hor_Slider*>(slider))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_draw_label_with_xywh_alignment)(fl_Hor_Slider slider,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Hor_Slider*>(slider))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_measure_label)(fl_Hor_Slider slider,int* ww,int* hh){
    (static_cast<Fl_Hor_Slider*>(slider))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Hor_Slider_window)(fl_Hor_Slider slider){
    return (fl_Window) (static_cast<Fl_Hor_Slider*>(slider))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Hor_Slider_top_window)(fl_Hor_Slider slider){
    return (fl_Window) (static_cast<Fl_Hor_Slider*>(slider))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Hor_Slider_top_window_offset)(fl_Hor_Slider slider, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Hor_Slider*>(slider))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Hor_Slider_as_group)(fl_Hor_Slider slider){
    return (fl_Group) (static_cast<Fl_Hor_Slider*>(slider))->as_group();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_bounds)(fl_Hor_Slider slider,double a,double b){
    (static_cast<Fl_Hor_Slider*>(slider))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_minimum)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->minimum();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_minimum)(fl_Hor_Slider slider,double a){
    (static_cast<Fl_Hor_Slider*>(slider))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_maximum)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->maximum();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_maximum)(fl_Hor_Slider slider,double a){
    (static_cast<Fl_Hor_Slider*>(slider))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_precision)(fl_Hor_Slider slider,int precision){
    (static_cast<Fl_Hor_Slider*>(slider))->precision(precision);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_range)(fl_Hor_Slider slider,double a,double b){
    (static_cast<Fl_Hor_Slider*>(slider))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_step)(fl_Hor_Slider slider,int a){
    (static_cast<Fl_Hor_Slider*>(slider))->step(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_step_with_a_b)(fl_Hor_Slider slider,double a,int b){
    (static_cast<Fl_Hor_Slider*>(slider))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_step_with_s)(fl_Hor_Slider slider,double s){
    (static_cast<Fl_Hor_Slider*>(slider))->step(s);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_step)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->step();
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_value)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->value();
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_set_value)(fl_Hor_Slider slider,double v){
    return (static_cast<Fl_Hor_Slider*>(slider))->value(v);
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_format)(fl_Hor_Slider slider,char* format){
    return (static_cast<Fl_Hor_Slider*>(slider))->format(format);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_round)(fl_Hor_Slider slider,double v){
    return (static_cast<Fl_Hor_Slider*>(slider))->round(v);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_clamp)(fl_Hor_Slider slider,double v){
    return (static_cast<Fl_Hor_Slider*>(slider))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Hor_Slider_increment)(fl_Hor_Slider slider,double v,int n){
    return (static_cast<Fl_Hor_Slider*>(slider))->increment(v,n);
  }
  FL_EXPORT_C(fl_Hor_Slider, Fl_Hor_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hor_Slider* slider = new Fl_Hor_Slider(x,y,w,h,label);
    return (static_cast<fl_Hor_Slider>(slider));
  }
  FL_EXPORT_C(fl_Hor_Slider, Fl_Hor_Slider_New)(int x, int y, int w, int h) {
    Fl_Hor_Slider* slider = new Fl_Hor_Slider(x,y,w,h,0);
    return (fl_Hor_Slider)slider;
  }
  FL_EXPORT_C(void,      Fl_Hor_Slider_Destroy)(fl_Hor_Slider slider){
    delete (static_cast<Fl_Hor_Slider*>(slider));
  }
  FL_EXPORT_C(int,Fl_Hor_Slider_scrollvalue)(fl_Hor_Slider slider,int pos,int size,int first,int total){
    return (static_cast<Fl_Hor_Slider*>(slider))->scrollvalue(pos,size,first,total);
  }
  FL_EXPORT_C(float,Fl_Hor_Slider_set_slider_size)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->slider_size();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_slider_size)(fl_Hor_Slider slider,double v){
    (static_cast<Fl_Hor_Slider*>(slider))->slider_size(v);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Hor_Slider_slider)(fl_Hor_Slider slider){
    return (static_cast<Fl_Hor_Slider*>(slider))->slider();
  }
  FL_EXPORT_C(void,Fl_Hor_Slider_set_slider)(fl_Hor_Slider slider,Fl_Boxtype c){
    (static_cast<Fl_Hor_Slider*>(slider))->slider(c);
  }
#ifdef __cplusplus
}
#endif
