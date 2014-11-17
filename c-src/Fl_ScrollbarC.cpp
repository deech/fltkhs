#include "Fl_ScrollbarC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Scrollbar_handle )(fl_Scrollbar slider, int event){
    return (static_cast<Fl_Scrollbar*>(slider))->handle(event);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_resize )(fl_Scrollbar slider,int x, int y, int w, int h){
    (static_cast<Fl_Scrollbar*>(slider))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_show )(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->show();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_hide )(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->hide();
  }
  FL_EXPORT_C(fl_Window,Fl_Scrollbar_as_window )(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->as_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Scrollbar_as_gl_window )(fl_Scrollbar slider){
    return (fl_Gl_Window) (static_cast<Fl_Scrollbar*>(slider))->as_gl_window();
  };
  FL_EXPORT_C(fl_Group,Fl_Scrollbar_parent)(fl_Scrollbar slider){
    return (fl_Group) (static_cast<Fl_Scrollbar*>(slider))->parent();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_parent)(fl_Scrollbar slider,fl_Group grp){
    (static_cast<Fl_Scrollbar*>(slider))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Scrollbar_type)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->type();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_type)(fl_Scrollbar slider,uchar t){
    (static_cast<Fl_Scrollbar*>(slider))->type(t);
  }

  FL_EXPORT_C(int,Fl_Scrollbar_x)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->x();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_y)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->y();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_w)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->w();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_h)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->h();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_align)(fl_Scrollbar slider, Fl_Align alignment){
    (static_cast<Fl_Scrollbar*>(slider))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Scrollbar_align)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Scrollbar_box)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->box();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_box)(fl_Scrollbar slider,Fl_Boxtype new_box){
    (static_cast<Fl_Scrollbar*>(slider))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Scrollbar_color)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->color();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_color)(fl_Scrollbar slider,Fl_Color bg){
    (static_cast<Fl_Scrollbar*>(slider))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_color_with_bg_sel)(fl_Scrollbar slider,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Scrollbar*>(slider))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Scrollbar_selection_color)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_selection_color)(fl_Scrollbar slider,Fl_Color a){
    (static_cast<Fl_Scrollbar*>(slider))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Scrollbar_label)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->label();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_copy_label)(fl_Scrollbar slider,const char* new_label){
    (static_cast<Fl_Scrollbar*>(slider))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_label)(fl_Scrollbar slider,const char* text){
    (static_cast<Fl_Scrollbar*>(slider))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Scrollbar_labeltype)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_labeltype)(fl_Scrollbar slider,Fl_Labeltype a){
    (static_cast<Fl_Scrollbar*>(slider))->labeltype(a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Scrollbar_labelcolor)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->labelcolor();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_labelcolor)(fl_Scrollbar slider,Fl_Color c){
    (static_cast<Fl_Scrollbar*>(slider))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Font,Fl_Scrollbar_labelfont)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_labelfont)(fl_Scrollbar slider,Fl_Font c){
    (static_cast<Fl_Scrollbar*>(slider))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Scrollbar_labelsize)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_labelsize)(fl_Scrollbar slider,Fl_Fontsize pix){
    (static_cast<Fl_Scrollbar*>(slider))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Scrollbar_image)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->image();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_image)(fl_Scrollbar slider,fl_Image pix){
    (static_cast<Fl_Scrollbar*>(slider))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Scrollbar_deimage)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->deimage();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_deimage)(fl_Scrollbar slider,fl_Image pix){
    (static_cast<Fl_Scrollbar*>(slider))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Scrollbar_tooltip)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_copy_tooltip)(fl_Scrollbar slider,const char* text){
    (static_cast<Fl_Scrollbar*>(slider))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_tooltip)(fl_Scrollbar slider,const char* text){
    (static_cast<Fl_Scrollbar*>(slider))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_callback_with_user_data)(fl_Scrollbar slider,fl_Callback cb,void* p){
    Fl_Scrollbar* castedBox = (static_cast<Fl_Scrollbar*>(slider));
    new C_to_Fl_Callback(castedBox, cb, p);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_callback)(fl_Scrollbar slider,fl_Callback cb){
    Fl_Scrollbar* castedBox = (static_cast<Fl_Scrollbar*>(slider));
    new C_to_Fl_Callback(castedBox, cb);
  }
  FL_EXPORT_C(void*,Fl_Scrollbar_user_data)(fl_Scrollbar slider){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Scrollbar*>(slider))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Scrollbar*>(slider))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_user_data)(fl_Scrollbar slider,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Scrollbar*>(slider))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Scrollbar*>(slider))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Scrollbar*>(slider))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Scrollbar_argument)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->argument();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_argument)(fl_Scrollbar slider,long v){
    (static_cast<Fl_Scrollbar*>(slider))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Scrollbar_when)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->when();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_when)(fl_Scrollbar slider,uchar i){
    (static_cast<Fl_Scrollbar*>(slider))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Scrollbar_visible)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->visible();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_visible_r)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_visible)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->visible();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_visible)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Scrollbar_active)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->active();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_active_r)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->active_r();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_activate)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->activate();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_deactivate)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Scrollbar_output)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_output)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->output();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_output)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Scrollbar_takesevents)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_changed)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->changed();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_changed)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_take_focus)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_visible_focus)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_visible_focus)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_modify_visible_focus)(fl_Scrollbar slider,int v){
    (static_cast<Fl_Scrollbar*>(slider))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Scrollbar_visible_focus)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_do_callback)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_do_callback_with_widget_and_user_data)(fl_Scrollbar slider,fl_Widget w,long arg){
    (static_cast<Fl_Scrollbar*>(slider))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_do_callback_with_widget_and_default_user_data)(fl_Scrollbar slider,fl_Widget w){
    (static_cast<Fl_Scrollbar*>(slider))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Scrollbar_contains)(fl_Scrollbar slider,fl_Widget w){
    return (static_cast<Fl_Scrollbar*>(slider))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Scrollbar_inside)(fl_Scrollbar slider,fl_Widget w){
    return (static_cast<Fl_Scrollbar*>(slider))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Scrollbar_redraw)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->redraw();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_redraw_label)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Scrollbar_damage)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->damage();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_damage_with_bitmask)(fl_Scrollbar slider,uchar c){
    (static_cast<Fl_Scrollbar*>(slider))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_clear_damage)(fl_Scrollbar slider){
    (static_cast<Fl_Scrollbar*>(slider))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_damage_with_text)(fl_Scrollbar slider,uchar c){
    (static_cast<Fl_Scrollbar*>(slider))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_damage_inside_widget)(fl_Scrollbar slider,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Scrollbar*>(slider))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_draw_label_with_xywh_alignment)(fl_Scrollbar slider,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Scrollbar*>(slider))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_measure_label)(fl_Scrollbar slider,int* ww,int* hh){
    (static_cast<Fl_Scrollbar*>(slider))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Scrollbar_window)(fl_Scrollbar slider){
    return (fl_Window) (static_cast<Fl_Scrollbar*>(slider))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Scrollbar_top_window)(fl_Scrollbar slider){
    return (fl_Window) (static_cast<Fl_Scrollbar*>(slider))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Scrollbar_top_window_offset)(fl_Scrollbar slider, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Scrollbar*>(slider))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Scrollbar_as_group)(fl_Scrollbar slider){
    return (fl_Group) (static_cast<Fl_Scrollbar*>(slider))->as_group();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_bounds)(fl_Scrollbar slider,double a,double b){
    (static_cast<Fl_Scrollbar*>(slider))->bounds(a,b);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_minimum)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->minimum();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_minimum)(fl_Scrollbar slider,double a){
    (static_cast<Fl_Scrollbar*>(slider))->minimum(a);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_maximum)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->maximum();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_maximum)(fl_Scrollbar slider,double a){
    (static_cast<Fl_Scrollbar*>(slider))->maximum(a);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_precision)(fl_Scrollbar slider,int precision){
    (static_cast<Fl_Scrollbar*>(slider))->precision(precision);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_range)(fl_Scrollbar slider,double a,double b){
    (static_cast<Fl_Scrollbar*>(slider))->range(a,b);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_step)(fl_Scrollbar slider,int a){
    (static_cast<Fl_Scrollbar*>(slider))->step(a);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_step_with_a_b)(fl_Scrollbar slider,double a,int b){
    (static_cast<Fl_Scrollbar*>(slider))->step(a,b);
  }
  FL_EXPORT_C(void,Fl_Scrollbar_step_with_s)(fl_Scrollbar slider,double s){
    (static_cast<Fl_Scrollbar*>(slider))->step(s);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_step)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->step();
  }
  FL_EXPORT_C(double,Fl_Scrollbar_value)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->value();
  }
  FL_EXPORT_C(int,Fl_Scrollbar_set_value)(fl_Scrollbar slider,double v){
    return (static_cast<Fl_Scrollbar*>(slider))->value(v);
  }
  FL_EXPORT_C(int,Fl_Scrollbar_format)(fl_Scrollbar slider,char* format){
    return (static_cast<Fl_Scrollbar*>(slider))->format(format);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_round)(fl_Scrollbar slider,double v){
    return (static_cast<Fl_Scrollbar*>(slider))->round(v);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_clamp)(fl_Scrollbar slider,double v){
    return (static_cast<Fl_Scrollbar*>(slider))->clamp(v);
  }
  FL_EXPORT_C(double,Fl_Scrollbar_increment)(fl_Scrollbar slider,double v,int n){
    return (static_cast<Fl_Scrollbar*>(slider))->increment(v,n);
  }
  FL_EXPORT_C(fl_Scrollbar, Fl_Scrollbar_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Scrollbar* slider = new Fl_Scrollbar(x,y,w,h,label);
    return (static_cast<fl_Scrollbar>(slider));
  }
  FL_EXPORT_C(fl_Scrollbar, Fl_Scrollbar_New)(int x, int y, int w, int h) {
    Fl_Scrollbar* slider = new Fl_Scrollbar(x,y,w,h,0);
    return (fl_Scrollbar)slider;
  }
  FL_EXPORT_C(void,      Fl_Scrollbar_Destroy)(fl_Scrollbar slider){
    delete (static_cast<Fl_Scrollbar*>(slider));
  }
  FL_EXPORT_C(int,Fl_Scrollbar_scrollvalue)(fl_Scrollbar slider,int pos,int size,int first,int total){
    return (static_cast<Fl_Scrollbar*>(slider))->scrollvalue(pos,size,first,total);
  }
  FL_EXPORT_C(float,Fl_Scrollbar_set_slider_size)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->slider_size();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_slider_size)(fl_Scrollbar slider,double v){
    (static_cast<Fl_Scrollbar*>(slider))->slider_size(v);
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Scrollbar_slider)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->slider();
  }
  FL_EXPORT_C(void,Fl_Scrollbar_set_slider)(fl_Scrollbar slider,Fl_Boxtype c){
    (static_cast<Fl_Scrollbar*>(slider))->slider(c);
  }
  FL_EXPORT_C(void, Fl_Scrollbar_set_linesize)(fl_Scrollbar slider, int i) {
    (static_cast<Fl_Scrollbar*>(slider))->linesize(i);
  }
  FL_EXPORT_C(int  , Fl_Scrollbar_linesize)(fl_Scrollbar slider){
    return (static_cast<Fl_Scrollbar*>(slider))->linesize();
  }
#ifdef __cplusplus
}
#endif
