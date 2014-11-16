#include "Fl_Text_DisplayC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Text_Display_handle)(fl_Text_Display self, int event){
    return (static_cast<Fl_Text_Display*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Text_Display_parent)(fl_Text_Display win){
    return (fl_Group) (static_cast<Fl_Text_Display*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_parent)(fl_Text_Display win,fl_Text_Display grp){
    (static_cast<Fl_Text_Display*>(win))->parent((static_cast<Fl_Text_Display*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Text_Display_type)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_type)(fl_Text_Display win,uchar t){
    (static_cast<Fl_Text_Display*>(win))->type(t);
  }

  FL_EXPORT_C(int,Fl_Text_Display_x)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Text_Display_y)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Text_Display_w)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Text_Display_h)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_align)(fl_Text_Display text_display, Fl_Align alignment){
    (static_cast<Fl_Text_Display*>(text_display))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Text_Display_align)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Text_Display_box)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_box)(fl_Text_Display win,Fl_Boxtype new_box){
    (static_cast<Fl_Text_Display*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_color)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_color)(fl_Text_Display win,Fl_Color bg){
    (static_cast<Fl_Text_Display*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_color_with_bg_sel)(fl_Text_Display win,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Text_Display*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Display_selection_color)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_selection_color)(fl_Text_Display win,Fl_Color a){
    (static_cast<Fl_Text_Display*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Text_Display_label)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Text_Display_copy_label)(fl_Text_Display win,const char* new_label){
    (static_cast<Fl_Text_Display*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_label)(fl_Text_Display win,const char* text){
    (static_cast<Fl_Text_Display*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Text_Display_labeltype)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labeltype)(fl_Text_Display win,Fl_Labeltype a){
    (static_cast<Fl_Text_Display*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelcolor)(fl_Text_Display win,Fl_Color c){
    (static_cast<Fl_Text_Display*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Text_Display_labelcolor)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Text_Display_labelfont)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelfont)(fl_Text_Display win,Fl_Font c){
    (static_cast<Fl_Text_Display*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Text_Display_labelsize)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_labelsize)(fl_Text_Display win,Fl_Fontsize pix){
    (static_cast<Fl_Text_Display*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Display_image)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_image)(fl_Text_Display win,fl_Image pix){
    (static_cast<Fl_Text_Display*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Display_deimage)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_deimage)(fl_Text_Display win,fl_Image pix){
    (static_cast<Fl_Text_Display*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Text_Display_tooltip)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Text_Display_copy_tooltip)(fl_Text_Display win,const char* text){
    (static_cast<Fl_Text_Display*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_tooltip)(fl_Text_Display win,const char* text){
    (static_cast<Fl_Text_Display*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_callback_with_user_data)(fl_Text_Display win,fl_Callback* cb,void* p){
    Fl_Text_Display* castedWindow = (static_cast<Fl_Text_Display*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_callback)(fl_Text_Display win,fl_Callback* cb){
    Fl_Text_Display* castedWindow = (static_cast<Fl_Text_Display*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Text_Display_user_data)(fl_Text_Display win){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Display*>(win))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Text_Display*>(win))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_user_data)(fl_Text_Display win,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Display*>(win))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Text_Display*>(win))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Text_Display*>(win))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Text_Display_argument)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_argument)(fl_Text_Display win,long v){
    (static_cast<Fl_Text_Display*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Text_Display_when)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_when)(fl_Text_Display win,uchar i){
    (static_cast<Fl_Text_Display*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_visible)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Text_Display_visible_r)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_visible)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_visible)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_active)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Text_Display_active_r)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Text_Display_activate)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Text_Display_deactivate)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_output)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_output)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_output)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_takesevents)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_changed)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_changed)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Text_Display_take_focus)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_visible_focus)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_visible_focus)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_modify_visible_focus)(fl_Text_Display win,int v){
    (static_cast<Fl_Text_Display*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_visible_focus)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback_with_widget_and_user_data)(fl_Text_Display win,fl_Widget w,long arg){
    (static_cast<Fl_Text_Display*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Text_Display_do_callback_with_widget_and_default_user_data)(fl_Text_Display win,fl_Widget w){
    (static_cast<Fl_Text_Display*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Display_contains)(fl_Text_Display win,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Display_inside)(fl_Text_Display win,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_redraw)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Text_Display_redraw_label)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Text_Display_damage)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_damage_with_bitmask)(fl_Text_Display win,uchar c){
    (static_cast<Fl_Text_Display*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear_damage)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Text_Display_damage_with_text)(fl_Text_Display win,uchar c){
    (static_cast<Fl_Text_Display*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Display_damage_inside_widget)(fl_Text_Display win,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Text_Display*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Text_Display_draw_label_with_xywh_alignment)(fl_Text_Display win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Text_Display*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Text_Display_measure_label)(fl_Text_Display win,int* ww,int* hh){
    (static_cast<Fl_Text_Display*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_window)(fl_Text_Display text_display){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Display_top_window)(fl_Text_Display text_display){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Text_Display_top_window_offset)(fl_Text_Display text_display, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Text_Display*>(text_display))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Text_Display_as_group)(fl_Text_Display win){
    return (fl_Text_Display) (static_cast<Fl_Text_Display*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Text_Display_as_gl_window)(fl_Text_Display win){
    return (fl_Gl_Window) (static_cast<Fl_Text_Display*>(win))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Text_Display_begin)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Text_Display_end)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Text_Display_find)(fl_Text_Display win,fl_Widget w){
    return (static_cast<Fl_Text_Display*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Text_Display_add)(fl_Text_Display win,fl_Widget w){
    (static_cast<Fl_Text_Display*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_remove_index)(fl_Text_Display win,int index){
    (static_cast<Fl_Text_Display*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Text_Display_remove_widget)(fl_Text_Display win,fl_Widget w){
    (static_cast<Fl_Text_Display*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_clear)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_resizable_by_reference)(fl_Text_Display win,fl_Widget o){
    (static_cast<Fl_Text_Display*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_resizable)(fl_Text_Display win,fl_Widget o){
    (static_cast<Fl_Text_Display*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Display_resizable)(fl_Text_Display win){
    return (fl_Widget)(static_cast<Fl_Text_Display*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Text_Display_add_resizable)(fl_Text_Display win,fl_Widget o){
    return (static_cast<Fl_Text_Display*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Display_init_sizes)(fl_Text_Display win){
    (static_cast<Fl_Text_Display*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Text_Display_children)(fl_Text_Display self){
    return (static_cast<Fl_Text_Display*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_clip_children)(fl_Text_Display win,int c){
    return (static_cast<Fl_Text_Display*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Display_clip_children)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Text_Display_focus)(fl_Text_Display win, fl_Widget W){
    return (static_cast<Fl_Text_Display*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Display__ddfdesign_kludge)(fl_Text_Display win){
    return (static_cast<Fl_Text_Display*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(fl_Widget*, Fl_Text_Display_array)(fl_Text_Display self){
    return (fl_Widget*)(static_cast<Fl_Text_Display*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Text_Display_child)(fl_Text_Display self, int n){
    return (fl_Widget)(static_cast<Fl_Text_Display*>(self))->child(n);
  }
  FL_EXPORT_C(fl_Text_Display,     Fl_Text_Display_New)(int x, int y, int w, int h){
    Fl_Text_Display* g = new Fl_Text_Display(x,y,w,h);
    return (fl_Text_Display)g;
  }
  FL_EXPORT_C(fl_Text_Display,     Fl_Text_Display_New_WithLabel)(int x, int y, int w, int h, const char* t){
    Fl_Text_Display* g = new Fl_Text_Display(x,y,w,h,t);
    return (fl_Text_Display)g;
  }
  FL_EXPORT_C(void,Fl_Text_Display_set_buffer)(fl_Text_Display text_display,fl_Text_Buffer buf){
 return (static_cast<Fl_Text_Display*>(text_display))->buffer((static_cast<Fl_Text_Buffer*>(buf)));
}
FL_EXPORT_C(fl_Text_Buffer,Fl_Text_Display_buffer)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->buffer();
}
FL_EXPORT_C(void,Fl_Text_Display_redisplay_range)(fl_Text_Display text_display,int start,int end){
 return (static_cast<Fl_Text_Display*>(text_display))->redisplay_range(start,end);
}
FL_EXPORT_C(void,Fl_Text_Display_scroll)(fl_Text_Display text_display,int topLineNum,int horizOffset){
 return (static_cast<Fl_Text_Display*>(text_display))->scroll(topLineNum,horizOffset);
}
FL_EXPORT_C(void,Fl_Text_Display_insert)(fl_Text_Display text_display,const char* text){
 return (static_cast<Fl_Text_Display*>(text_display))->insert(text);
}
FL_EXPORT_C(void,Fl_Text_Display_overstrike)(fl_Text_Display text_display,const char* text){
 return (static_cast<Fl_Text_Display*>(text_display))->overstrike(text);
}
FL_EXPORT_C(void,Fl_Text_Display_set_insert_position)(fl_Text_Display text_display,int newPos){
 return (static_cast<Fl_Text_Display*>(text_display))->insert_position(newPos);
}
FL_EXPORT_C(int,Fl_Text_Display_insert_position)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->insert_position();
}
FL_EXPORT_C(int,Fl_Text_Display_position_to_xy)(fl_Text_Display text_display,int pos,int* x,int* y){
 return (static_cast<Fl_Text_Display*>(text_display))->position_to_xy(pos,x,y);
}
FL_EXPORT_C(int,Fl_Text_Display_in_selection)(fl_Text_Display text_display,int x,int y){
 return (static_cast<Fl_Text_Display*>(text_display))->in_selection(x,y);
}
FL_EXPORT_C(void,Fl_Text_Display_show_insert_position)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->show_insert_position();
}
FL_EXPORT_C(int,Fl_Text_Display_move_right)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->move_right();
}
FL_EXPORT_C(int,Fl_Text_Display_move_left)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->move_left();
}
FL_EXPORT_C(int,Fl_Text_Display_move_up)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->move_up();
}
FL_EXPORT_C(int,Fl_Text_Display_move_down)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->move_down();
}
FL_EXPORT_C(int,Fl_Text_Display_count_lines)(fl_Text_Display text_display,int start,int end,int start_pos_is_line_start){
  return (static_cast<Fl_Text_Display*>(text_display))->count_lines(start,end,start_pos_is_line_start >= 1 ? true : false);
}
FL_EXPORT_C(int,Fl_Text_Display_line_start)(fl_Text_Display text_display,int pos){
 return (static_cast<Fl_Text_Display*>(text_display))->line_start(pos);
}
FL_EXPORT_C(int,Fl_Text_Display_line_end)(fl_Text_Display text_display,int startPos,int startPosIsLineStart){
 return (static_cast<Fl_Text_Display*>(text_display))->line_end(startPos,startPosIsLineStart >= 1 ? true : false);
}
FL_EXPORT_C(int,Fl_Text_Display_skip_lines)(fl_Text_Display text_display,int startPos,int nLines,int startPosIsLineStart){
 return (static_cast<Fl_Text_Display*>(text_display))->skip_lines(startPos,nLines,startPosIsLineStart>= 1 ? true : false);
}
FL_EXPORT_C(int,Fl_Text_Display_rewind_lines)(fl_Text_Display text_display,int startPos,int nLines){
 return (static_cast<Fl_Text_Display*>(text_display))->rewind_lines(startPos,nLines);
}
FL_EXPORT_C(void,Fl_Text_Display_next_word)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->next_word();
}
 FL_EXPORT_C(void,Fl_Text_Display_previous_word)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->previous_word();
}
FL_EXPORT_C(void,Fl_Text_Display_show_cursor)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->show_cursor();
}
FL_EXPORT_C(void,Fl_Text_Display_show_cursor_with_b)(fl_Text_Display text_display,int b){
 return (static_cast<Fl_Text_Display*>(text_display))->show_cursor(b);
}
FL_EXPORT_C(void,Fl_Text_Display_hide_cursor)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->hide_cursor();
}
FL_EXPORT_C(void,Fl_Text_Display_cursor_style)(fl_Text_Display text_display,int style){
 return (static_cast<Fl_Text_Display*>(text_display))->cursor_style(style);
}
FL_EXPORT_C(Fl_Color,Fl_Text_Display_cursor_color)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->cursor_color();
}
FL_EXPORT_C(void,Fl_Text_Display_set_cursor_color)(fl_Text_Display text_display,Fl_Color n){
 return (static_cast<Fl_Text_Display*>(text_display))->cursor_color(n);
}
FL_EXPORT_C(int,Fl_Text_Display_scrollbar_width)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_width();
}
FL_EXPORT_C(void,Fl_Text_Display_set_scrollbar_width)(fl_Text_Display text_display,int W){
 return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_width(W);
}
FL_EXPORT_C(Fl_Align,Fl_Text_Display_scrollbar_align)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_align();
}
FL_EXPORT_C(void,Fl_Text_Display_set_scrollbar_align)(fl_Text_Display text_display,Fl_Align a){
 return (static_cast<Fl_Text_Display*>(text_display))->scrollbar_align(a);
}
FL_EXPORT_C(int,Fl_Text_Display_word_start)(fl_Text_Display text_display,int pos){
 return (static_cast<Fl_Text_Display*>(text_display))->word_start(pos);
}
FL_EXPORT_C(int,Fl_Text_Display_word_end)(fl_Text_Display text_display,int pos){
 return (static_cast<Fl_Text_Display*>(text_display))->word_end(pos);
}
FL_EXPORT_C(void,Fl_Text_Display_highlight_data)(fl_Text_Display text_display,fl_Text_Buffer styleBuffer,Style_Table_Entry *styleTable,int nStyles,char unfinishedStyle,Unfinished_Style_Cb unfinishedHighlightCB,void *cbArg){
  Fl_Text_Display::Style_Table_Entry* s = new Fl_Text_Display::Style_Table_Entry[nStyles]();
  int i = 0;
  for (;i<nStyles;i++){
    Fl_Text_Display::Style_Table_Entry x =  Fl_Text_Display::Style_Table_Entry();
    x.color = styleTable[i].color;
    x.font = styleTable[i].font;
    x.size = styleTable[i].size;
    x.attr = styleTable[i].attr;
    s[i] = x;
  }
 (static_cast<Fl_Text_Display*>(text_display))->highlight_data((static_cast<Fl_Text_Buffer*>(styleBuffer)),s,nStyles,unfinishedStyle,unfinishedHighlightCB,cbArg);
}
FL_EXPORT_C(int,Fl_Text_Display_position_style)(fl_Text_Display text_display,int lineStartPos,int lineLen,int lineIndex){
 return (static_cast<Fl_Text_Display*>(text_display))->position_style(lineStartPos,lineLen,lineIndex);
}
FL_EXPORT_C(int,Fl_Text_Display_shortcut)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->shortcut();
}
FL_EXPORT_C(void,Fl_Text_Display_set_shortcut)(fl_Text_Display text_display,int s){
 return (static_cast<Fl_Text_Display*>(text_display))->shortcut(s);
}
FL_EXPORT_C(Fl_Font,Fl_Text_Display_textfont)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->textfont();
}
FL_EXPORT_C(void,Fl_Text_Display_set_textfont)(fl_Text_Display text_display,Fl_Font s){
 return (static_cast<Fl_Text_Display*>(text_display))->textfont(s);
}
FL_EXPORT_C(Fl_Fontsize,Fl_Text_Display_textsize)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->textsize();
}
FL_EXPORT_C(void,Fl_Text_Display_set_textsize)(fl_Text_Display text_display,Fl_Fontsize s){
 return (static_cast<Fl_Text_Display*>(text_display))->textsize(s);
}
FL_EXPORT_C(Fl_Color,Fl_Text_Display_textcolor)(fl_Text_Display text_display){
 return (static_cast<Fl_Text_Display*>(text_display))->textcolor();
}
FL_EXPORT_C(void,Fl_Text_Display_set_textcolor)(fl_Text_Display text_display,Fl_Color n){
 return (static_cast<Fl_Text_Display*>(text_display))->textcolor(n);
}
FL_EXPORT_C(int,Fl_Text_Display_wrapped_column)(fl_Text_Display text_display,int row,int column){
 return (static_cast<Fl_Text_Display*>(text_display))->wrapped_column(row,column);
}
FL_EXPORT_C(int,Fl_Text_Display_wrapped_row)(fl_Text_Display text_display,int row){
 return (static_cast<Fl_Text_Display*>(text_display))->wrapped_row(row);
}
FL_EXPORT_C(void,Fl_Text_Display_wrap_mode)(fl_Text_Display text_display,int wrap,int wrap_margin){
 return (static_cast<Fl_Text_Display*>(text_display))->wrap_mode(wrap,wrap_margin);
}
FL_EXPORT_C(double,Fl_Text_Display_x_to_col)(fl_Text_Display text_display,double x){
 return (static_cast<Fl_Text_Display*>(text_display))->x_to_col(x);
}
FL_EXPORT_C(double,Fl_Text_Display_col_to_x)(fl_Text_Display text_display,double col){
 return (static_cast<Fl_Text_Display*>(text_display))->col_to_x(col);
}
#ifdef __cplusplus
}
#endif
