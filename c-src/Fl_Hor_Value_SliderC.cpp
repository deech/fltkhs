#include "Fl_Hor_Value_SliderC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_handle_super)(fl_Hor_Value_Slider value_slider,int event){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::handle(event);
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_handle )(fl_Hor_Value_Slider value_slider, int event){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_resize_super )(fl_Hor_Value_Slider value_slider,int x, int y, int w, int h){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_resize )(fl_Hor_Value_Slider value_slider,int x, int y, int w, int h){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_show_super)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::show();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_show )(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->show();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_hide_super)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::hide();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_hide )(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Hor_Value_Slider_as_window_super)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::as_window();
  }
  FL_EXPORT_C(fl_Window,Fl_Hor_Value_Slider_as_window )(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hor_Value_Slider_as_gl_window_super)(fl_Hor_Value_Slider value_slider){
    return (fl_Gl_Window) (static_cast<Fl_Hor_Value_Slider*>(value_slider))->Fl_Hor_Value_Slider::as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hor_Value_Slider_as_gl_window )(fl_Hor_Value_Slider value_slider){
    return (fl_Gl_Window) (static_cast<Fl_Hor_Value_Slider*>(value_slider))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Hor_Value_Slider_parent)(fl_Hor_Value_Slider value_slider){
    return (fl_Group) (static_cast<Fl_Hor_Value_Slider*>(value_slider))->parent();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_parent)(fl_Hor_Value_Slider value_slider,fl_Group grp){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Hor_Value_Slider_type)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->type();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_type)(fl_Hor_Value_Slider value_slider,uchar t){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->type(t);
  }

  FL_EXPORT_C(int,Fl_Hor_Value_Slider_x)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->x();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_y)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->y();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_w)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->w();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_h)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->h();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_align)(fl_Hor_Value_Slider value_slider, Fl_Align alignment){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Hor_Value_Slider_align)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Hor_Value_Slider_box)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->box();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_box)(fl_Hor_Value_Slider value_slider,Fl_Boxtype new_box){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Hor_Value_Slider_color)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->color();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_color)(fl_Hor_Value_Slider value_slider,Fl_Color bg){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_color_with_bg_sel)(fl_Hor_Value_Slider value_slider,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Hor_Value_Slider_selection_color)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_selection_color)(fl_Hor_Value_Slider value_slider,Fl_Color a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Hor_Value_Slider_label)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->label();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_copy_label)(fl_Hor_Value_Slider value_slider,const char* new_label){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_label)(fl_Hor_Value_Slider value_slider,const char* text){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Hor_Value_Slider_labeltype)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_labeltype)(fl_Hor_Value_Slider value_slider,Fl_Labeltype a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_labelcolor)(fl_Hor_Value_Slider value_slider,Fl_Color c){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Hor_Value_Slider_labelcolor)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Hor_Value_Slider_labelfont)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_labelfont)(fl_Hor_Value_Slider value_slider,Fl_Font c){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Hor_Value_Slider_labelsize)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_labelsize)(fl_Hor_Value_Slider value_slider,Fl_Fontsize pix){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hor_Value_Slider_image)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->image();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_image)(fl_Hor_Value_Slider value_slider,fl_Image pix){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hor_Value_Slider_deimage)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->deimage();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_deimage)(fl_Hor_Value_Slider value_slider,fl_Image pix){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Hor_Value_Slider_tooltip)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_copy_tooltip)(fl_Hor_Value_Slider value_slider,const char* text){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_tooltip)(fl_Hor_Value_Slider value_slider,const char* text){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_callback_with_user_data)(fl_Hor_Value_Slider value_slider,fl_Callback cb,void* p){
    Fl_Hor_Value_Slider* castedBox = (static_cast<Fl_Hor_Value_Slider*>(value_slider));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_callback)(fl_Hor_Value_Slider value_slider,fl_Callback cb){
    Fl_Hor_Value_Slider* castedBox = (static_cast<Fl_Hor_Value_Slider*>(value_slider));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Hor_Value_Slider_user_data)(fl_Hor_Value_Slider value_slider){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hor_Value_Slider*>(value_slider))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_user_data)(fl_Hor_Value_Slider value_slider,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hor_Value_Slider*>(value_slider))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Hor_Value_Slider*>(value_slider))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Hor_Value_Slider*>(value_slider))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Hor_Value_Slider_argument)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->argument();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_argument)(fl_Hor_Value_Slider value_slider,long v){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Hor_Value_Slider_when)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->when();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_when)(fl_Hor_Value_Slider value_slider,uchar i){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Value_Slider_visible)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_visible_r)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_visible)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_visible)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Value_Slider_active)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->active();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_active_r)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->active_r();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_activate)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->activate();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_deactivate)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Value_Slider_output)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->output();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_output)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->output();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_output)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Value_Slider_takesevents)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_changed)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->changed();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_changed)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_take_focus)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_visible_focus)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_visible_focus)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_modify_visible_focus)(fl_Hor_Value_Slider value_slider,int v){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Hor_Value_Slider_visible_focus)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_do_callback)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_do_callback_with_widget_and_user_data)(fl_Hor_Value_Slider value_slider,fl_Widget w,long arg){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_do_callback_with_widget_and_default_user_data)(fl_Hor_Value_Slider value_slider,fl_Widget w){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_contains)(fl_Hor_Value_Slider value_slider,fl_Widget w){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_inside)(fl_Hor_Value_Slider value_slider,fl_Widget w){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_redraw)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->redraw();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_redraw_label)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Hor_Value_Slider_damage)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->damage();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_damage_with_bitmask)(fl_Hor_Value_Slider value_slider,uchar c){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_clear_damage)(fl_Hor_Value_Slider value_slider){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_damage_with_text)(fl_Hor_Value_Slider value_slider,uchar c){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_damage_inside_widget)(fl_Hor_Value_Slider value_slider,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_draw_label_with_xywh_alignment)(fl_Hor_Value_Slider value_slider,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_measure_label)(fl_Hor_Value_Slider value_slider,int* ww,int* hh){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_bounds)(fl_Hor_Value_Slider value_slider,double a,double b){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_minimum)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->minimum();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_minimum)(fl_Hor_Value_Slider value_slider,double a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_maximum)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->maximum();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_maximum)(fl_Hor_Value_Slider value_slider,double a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_precision)(fl_Hor_Value_Slider value_slider,int precision){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->precision(precision);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_range)(fl_Hor_Value_Slider value_slider,double a,double b){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_step)(fl_Hor_Value_Slider value_slider,int a){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->step(a);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_step_with_a_b)(fl_Hor_Value_Slider value_slider,double a,int b){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_step_with_s)(fl_Hor_Value_Slider value_slider,double s){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->step(s);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_step)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->step();
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_value)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->value();
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_set_value)(fl_Hor_Value_Slider value_slider,double v){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->value(v);
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_format)(fl_Hor_Value_Slider value_slider,char* format){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->format(format);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_round)(fl_Hor_Value_Slider value_slider,double v){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->round(v);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_clamp)(fl_Hor_Value_Slider value_slider,double v){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Hor_Value_Slider_increment)(fl_Hor_Value_Slider value_slider,double v,int n){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->increment(v,n);
  }
  FL_EXPORT_C(int,Fl_Hor_Value_Slider_scrollvalue)(fl_Hor_Value_Slider value_slider,int pos,int size,int first,int total){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->scrollvalue(pos,size,first,total);
  }
  FL_EXPORT_C(float,Fl_Hor_Value_Slider_set_value_slider_size)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->slider_size();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_value_slider_size)(fl_Hor_Value_Slider value_slider,double v){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->slider_size(v);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Hor_Value_Slider_value_slider)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->slider();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_value_slider)(fl_Hor_Value_Slider value_slider,Fl_Boxtype c){
    (static_cast<Fl_Hor_Value_Slider*>(value_slider))->slider(c);
  }
  FL_EXPORT_C(fl_Value_Slider, Fl_Hor_Value_Slider_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hor_Value_Slider* value_slider = new Fl_Hor_Value_Slider(x,y,w,h,label);
    return (static_cast<fl_Value_Slider>(value_slider));
  }
  FL_EXPORT_C(fl_Value_Slider, Fl_Hor_Value_Slider_New)(int x, int y, int w, int h) {
    Fl_Hor_Value_Slider* value_slider = new Fl_Hor_Value_Slider(x,y,w,h,0);
    return (fl_Value_Slider)value_slider;
  }
  FL_EXPORT_C(void,      Fl_Hor_Value_Slider_Destroy)(fl_Hor_Value_Slider value_slider){
    delete (static_cast<Fl_Hor_Value_Slider*>(value_slider));
  }
  FL_EXPORT_C(Fl_Font,Fl_Hor_Value_Slider_textfont)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textfont();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_textfont)(fl_Hor_Value_Slider value_slider,Fl_Font s){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Hor_Value_Slider_textsize)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textsize();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_textsize)(fl_Hor_Value_Slider value_slider,Fl_Fontsize s){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Hor_Value_Slider_textcolor)(fl_Hor_Value_Slider value_slider){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Hor_Value_Slider_set_textcolor)(fl_Hor_Value_Slider value_slider,Fl_Color s){
    return (static_cast<Fl_Hor_Value_Slider*>(value_slider))->textcolor(s);
  }
#ifdef __cplusplus
}
#endif
