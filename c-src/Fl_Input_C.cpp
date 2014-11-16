#include "Fl_Input_C.h"

#ifdef __cplusplus
EXPORT {
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,Fl_Input__handle)(fl_Input_ self, int event){
    return (static_cast<Fl_Input_*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Input__parent)(fl_Input_ input_){
    return (fl_Group) (static_cast<Fl_Input_*>(input_))->parent();
  }
  FL_EXPORT_C(void,Fl_Input__set_parent)(fl_Input_ input_,fl_Group grp){
    (static_cast<Fl_Input_*>(input_))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Input__type)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->type();
  }
  FL_EXPORT_C(void,Fl_Input__set_type)(fl_Input_ input_,uchar t){
    (static_cast<Fl_Input_*>(input_))->type(t);
  }

  FL_EXPORT_C(int,Fl_Input__x)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->x();
  }
  FL_EXPORT_C(int,Fl_Input__y)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->y();
  }
  FL_EXPORT_C(int,Fl_Input__w)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->w();
  }
  FL_EXPORT_C(int,Fl_Input__h)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->h();
  }
  FL_EXPORT_C(void,Fl_Input__set_align)(fl_Input_ input_, Fl_Align alignment){
    (static_cast<Fl_Input_*>(input_))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Input__align)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Input__box)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->box();
  }
  FL_EXPORT_C(void,Fl_Input__set_box)(fl_Input_ input_,Fl_Boxtype new_box){
    (static_cast<Fl_Input_*>(input_))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Input__color)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->color();
  }
  FL_EXPORT_C(void,Fl_Input__set_color)(fl_Input_ input_,Fl_Color bg){
    (static_cast<Fl_Input_*>(input_))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Input__set_color_with_bg_sel)(fl_Input_ input_,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Input_*>(input_))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input__selection_color)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Input__set_selection_color)(fl_Input_ input_,Fl_Color a){
    (static_cast<Fl_Input_*>(input_))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Input__label)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->label();
  }
  FL_EXPORT_C(void,Fl_Input__copy_label)(fl_Input_ input_,const char* new_label){
    (static_cast<Fl_Input_*>(input_))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Input__set_label)(fl_Input_ input_,const char* text){
    (static_cast<Fl_Input_*>(input_))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Input__labeltype)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Input__set_labeltype)(fl_Input_ input_,Fl_Labeltype a){
    (static_cast<Fl_Input_*>(input_))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Input__set_labelcolor)(fl_Input_ input_,Fl_Color c){
    (static_cast<Fl_Input_*>(input_))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Input__labelcolor)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Input__labelfont)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Input__set_labelfont)(fl_Input_ input_,Fl_Font c){
    (static_cast<Fl_Input_*>(input_))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Input__labelsize)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Input__set_labelsize)(fl_Input_ input_,Fl_Fontsize pix){
    (static_cast<Fl_Input_*>(input_))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Input__image)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->image();
  }
  FL_EXPORT_C(void,Fl_Input__set_image)(fl_Input_ input_,fl_Image pix){
    (static_cast<Fl_Input_*>(input_))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Input__deimage)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->deimage();
  }
  FL_EXPORT_C(void,Fl_Input__set_deimage)(fl_Input_ input_,fl_Image pix){
    (static_cast<Fl_Input_*>(input_))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Input__tooltip)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Input__copy_tooltip)(fl_Input_ input_,const char* text){
    (static_cast<Fl_Input_*>(input_))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Input__set_tooltip)(fl_Input_ input_,const char* text){
    (static_cast<Fl_Input_*>(input_))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Input__set_callback_with_user_data)(fl_Input_ input_,fl_Callback* cb,void* p){
    Fl_Input_* castedInput_dow = (static_cast<Fl_Input_*>(input_));
    new C_to_Fl_Callback(castedInput_dow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Input__set_callback)(fl_Input_ input_,fl_Callback* cb){
    Fl_Input_* castedInput_dow = (static_cast<Fl_Input_*>(input_));
    new C_to_Fl_Callback(castedInput_dow, cb);
  }
  FL_EXPORT_C(void*,Fl_Input__user_data)(fl_Input_ input_){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Input_*>(input_))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Input_*>(input_))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Input__set_user_data)(fl_Input_ input_,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Input_*>(input_))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Input_*>(input_))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Input_*>(input_))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Input__argument)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->argument();
  }
  FL_EXPORT_C(void,Fl_Input__set_argument)(fl_Input_ input_,long v){
    (static_cast<Fl_Input_*>(input_))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Input__when)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->when();
  }
  FL_EXPORT_C(void,Fl_Input__set_when)(fl_Input_ input_,uchar i){
    (static_cast<Fl_Input_*>(input_))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Input__visible)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->visible();
  }
  FL_EXPORT_C(int,Fl_Input__visible_r)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Input__set_visible)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->visible();
  }
  FL_EXPORT_C(void,Fl_Input__clear_visible)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Input__active)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->active();
  }
  FL_EXPORT_C(int,Fl_Input__active_r)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->active_r();
  }
  FL_EXPORT_C(void,Fl_Input__activate)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->activate();
  }
  FL_EXPORT_C(void,Fl_Input__deactivate)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Input__output)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->output();
  }
  FL_EXPORT_C(void,Fl_Input__set_output)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->output();
  }
  FL_EXPORT_C(void,Fl_Input__clear_output)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Input__takesevents)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Input__set_changed)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->changed();
  }
  FL_EXPORT_C(void,Fl_Input__clear_changed)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Input__take_focus)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Input__set_visible_focus)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input__clear_visible_focus)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input__modify_visible_focus)(fl_Input_ input_,int v){
    (static_cast<Fl_Input_*>(input_))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Input__visible_focus)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Input__do_callback)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Input__do_callback_with_widget_and_user_data)(fl_Input_ input_,fl_Widget w,long arg){
    (static_cast<Fl_Input_*>(input_))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Input__do_callback_with_widget_and_default_user_data)(fl_Input_ input_,fl_Widget w){
    (static_cast<Fl_Input_*>(input_))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Input__contains)(fl_Input_ input_,fl_Widget w){
    return (static_cast<Fl_Input_*>(input_))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Input__inside)(fl_Input_ input_,fl_Widget w){
    return (static_cast<Fl_Input_*>(input_))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Input__redraw)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->redraw();
  }
  FL_EXPORT_C(void,Fl_Input__redraw_label)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Input__damage)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->damage();
  }
  FL_EXPORT_C(void,Fl_Input__clear_damage_with_bitmask)(fl_Input_ input_,uchar c){
    (static_cast<Fl_Input_*>(input_))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Input__clear_damage)(fl_Input_ input_){
    (static_cast<Fl_Input_*>(input_))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Input__damage_with_text)(fl_Input_ input_,uchar c){
    (static_cast<Fl_Input_*>(input_))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Input__damage_inside_widget)(fl_Input_ input_,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Input_*>(input_))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Input__draw_label_with_xywh_alignment)(fl_Input_ input_,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Input_*>(input_))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Input__measure_label)(fl_Input_ input_,int* ww,int* hh){
    (static_cast<Fl_Input_*>(input_))->measure_label(*ww,*hh);
  }

  FL_EXPORT_C(fl_Window,    Fl_Input__window)(fl_Input_ input_){
    return (fl_Window) (static_cast<Fl_Input_*>(input_))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Input__top_window)(fl_Input_ input_){
    return (fl_Window) (static_cast<Fl_Input_*>(input_))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Input__top_window_offset)(fl_Input_ input_, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Input_*>(input_))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Input__as_group)(fl_Input_ input_){
    return (fl_Group) (static_cast<Fl_Input_*>(input_))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Input__as_gl_window)(fl_Input_ input_){
    return (fl_Gl_Window) (static_cast<Fl_Input_*>(input_))->as_gl_window();
  }
  /* Fl_Input_ specific functions */
  FL_EXPORT_C(void,Fl_Input__resize)(fl_Input_ input_,int X,int Y,int W,int H){
    (static_cast<Fl_Input_*>(input_))->resize(X,Y,W,H);
  }
  FL_EXPORT_C(int,Fl_Input__set_value)(fl_Input_ input_,const char* text){
    return (static_cast<Fl_Input_*>(input_))->value(text);
  }
  FL_EXPORT_C(int,Fl_Input__set_value_with_length)(fl_Input_ input_,const char* text,int length){
    return (static_cast<Fl_Input_*>(input_))->value(text,length);
  }
  FL_EXPORT_C(int,Fl_Input__static_value)(fl_Input_ input_,const char* text){
    return (static_cast<Fl_Input_*>(input_))->static_value(text);
  }
  FL_EXPORT_C(int,Fl_Input__static_value_with_length)(fl_Input_ input_,const char* text,int length){
    return (static_cast<Fl_Input_*>(input_))->static_value(text,length);
  }
  FL_EXPORT_C(const char*,Fl_Input__value)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->value();
  }
  FL_EXPORT_C(Fl_Char,Fl_Input__index)(fl_Input_ input_,int i){
    return (static_cast<Fl_Input_*>(input_))->index(i);
  }
  FL_EXPORT_C(int,Fl_Input__size)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->size();
  }
  FL_EXPORT_C(void,Fl_Input__set_size)(fl_Input_ input_,int W,int H){
    (static_cast<Fl_Input_*>(input_))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Input__maximum_size)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->maximum_size();
  }
  FL_EXPORT_C(void,Fl_Input__set_maximum_size)(fl_Input_ input_,int m){
    (static_cast<Fl_Input_*>(input_))->maximum_size(m);
  }
  FL_EXPORT_C(int,Fl_Input__position)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->position();
  }
  FL_EXPORT_C(int,Fl_Input__mark)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->mark();
  }
  FL_EXPORT_C(int,Fl_Input__set_position_with_cursor_mark)(fl_Input_ input_,int p,int m){
    return (static_cast<Fl_Input_*>(input_))->position(p,m);
  }
  FL_EXPORT_C(int,Fl_Input__set_position_n_n)(fl_Input_ input_,int p){
    return (static_cast<Fl_Input_*>(input_))->position(p);
  }
  FL_EXPORT_C(int,Fl_Input__set_mark)(fl_Input_ input_,int m){
    return (static_cast<Fl_Input_*>(input_))->mark(m);
  }
  FL_EXPORT_C(int,Fl_Input__replace)(fl_Input_ input_,int b,int e,const char* text){
    return (static_cast<Fl_Input_*>(input_))->replace(b,e,text);
  }
  FL_EXPORT_C(int,Fl_Input__replace_with_ilen)(fl_Input_ input_,int b,int e,const char* text,int ilen){
    return (static_cast<Fl_Input_*>(input_))->replace(b,e,text,ilen);
  }
  FL_EXPORT_C(int,Fl_Input__cut)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->cut();
  }
  FL_EXPORT_C(int,Fl_Input__cut_bytes)(fl_Input_ input_,int n){
    return (static_cast<Fl_Input_*>(input_))->cut(n);
  }
  FL_EXPORT_C(int,Fl_Input__cut_range)(fl_Input_ input_,int a,int b){
    return (static_cast<Fl_Input_*>(input_))->cut(a,b);
  }
  FL_EXPORT_C(int,Fl_Input__insert)(fl_Input_ input_,const char* t){
    return (static_cast<Fl_Input_*>(input_))->insert(t);
  }
  FL_EXPORT_C(int,Fl_Input__insert_with_length)(fl_Input_ input_,const char* t,int l){
    return (static_cast<Fl_Input_*>(input_))->insert(t,l);
  }
  FL_EXPORT_C(int,Fl_Input__copy)(fl_Input_ input_,int clipboard){
    return (static_cast<Fl_Input_*>(input_))->copy(clipboard);
  }
  FL_EXPORT_C(int,Fl_Input__undo)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->undo();
  }
  FL_EXPORT_C(int,Fl_Input__copy_cuts)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->copy_cuts();
  }
  FL_EXPORT_C(int,Fl_Input__shortcut)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Input__set_shortcut)(fl_Input_ input_,int s){
    (static_cast<Fl_Input_*>(input_))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Input__textfont)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->textfont();
  }
  FL_EXPORT_C(void,Fl_Input__set_textfont)(fl_Input_ input_,Fl_Font s){
    (static_cast<Fl_Input_*>(input_))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Input__textsize)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->textsize();
  }
  FL_EXPORT_C(void,Fl_Input__set_textsize)(fl_Input_ input_,Fl_Fontsize s){
    (static_cast<Fl_Input_*>(input_))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input__textcolor)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Input__set_textcolor)(fl_Input_ input_,Fl_Color n){
    (static_cast<Fl_Input_*>(input_))->textcolor(n);
  }
  FL_EXPORT_C(Fl_Color,Fl_Input__cursor_color)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Input__set_cursor_color)(fl_Input_ input_,Fl_Color n){
    (static_cast<Fl_Input_*>(input_))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Input__input_type)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->input_type();
  }
  FL_EXPORT_C(void,Fl_Input__set_input_type)(fl_Input_ input_,int t){
    (static_cast<Fl_Input_*>(input_))->input_type(t);
  }
  FL_EXPORT_C(int,Fl_Input__readonly)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->readonly();
  }
  FL_EXPORT_C(void,Fl_Input__set_readonly)(fl_Input_ input_,int b){
    (static_cast<Fl_Input_*>(input_))->readonly(b);
  }
  FL_EXPORT_C(int,Fl_Input__wrap)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->wrap();
  }
  FL_EXPORT_C(void,Fl_Input__set_wrap)(fl_Input_ input_,int b){
    (static_cast<Fl_Input_*>(input_))->wrap(b);
  }
  FL_EXPORT_C(void,Fl_Input__tab_nav)(fl_Input_ input_,int val){
    (static_cast<Fl_Input_*>(input_))->tab_nav(val);
  }
  FL_EXPORT_C(int,Fl_Input__set_tab_nav)(fl_Input_ input_){
    return (static_cast<Fl_Input_*>(input_))->tab_nav();
  }
#ifdef __cplusplus
}
#endif
