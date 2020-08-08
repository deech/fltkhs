#include "Fl_Hold_BrowserC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Hold_Browser_handle)(fl_Hold_Browser self, int event){
    return (static_cast<Fl_Hold_Browser*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Hold_Browser_parent)(fl_Hold_Browser hold_browser){
    return (fl_Group) (static_cast<Fl_Hold_Browser*>(hold_browser))->parent();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_parent)(fl_Hold_Browser hold_browser,fl_Group grp){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Hold_Browser_type)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->type();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_type)(fl_Hold_Browser hold_browser,uchar t){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->type(t);
  }

  FL_EXPORT_C(int,Fl_Hold_Browser_x)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->x();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_y)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->y();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_w)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->w();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_h)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->h();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_align)(fl_Hold_Browser hold_browser, Fl_Align alignment){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Hold_Browser_align)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Hold_Browser_box)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->box();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_box)(fl_Hold_Browser hold_browser,Fl_Boxtype new_box){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Hold_Browser_color)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->color();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_color)(fl_Hold_Browser hold_browser,Fl_Color bg){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_color_with_bg_sel)(fl_Hold_Browser hold_browser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Hold_Browser_selection_color)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_selection_color)(fl_Hold_Browser hold_browser,Fl_Color a){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Hold_Browser_label)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->label();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_copy_label)(fl_Hold_Browser hold_browser,const char* new_label){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_label)(fl_Hold_Browser hold_browser,const char* text){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Hold_Browser_labeltype)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_labeltype)(fl_Hold_Browser hold_browser,Fl_Labeltype a){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_labelcolor)(fl_Hold_Browser hold_browser,Fl_Color c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Hold_Browser_labelcolor)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Hold_Browser_labelfont)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_labelfont)(fl_Hold_Browser hold_browser,Fl_Font c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Hold_Browser_labelsize)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_labelsize)(fl_Hold_Browser hold_browser,Fl_Fontsize pix){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hold_Browser_image)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->image();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_image)(fl_Hold_Browser hold_browser,fl_Image pix){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hold_Browser_deimage)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->deimage();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_deimage)(fl_Hold_Browser hold_browser,fl_Image pix){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Hold_Browser_tooltip)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_copy_tooltip)(fl_Hold_Browser hold_browser,const char* text){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_tooltip)(fl_Hold_Browser hold_browser,const char* text){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_callback_with_user_data)(fl_Hold_Browser hold_browser,fl_Callback* cb,void* p){
    Fl_Hold_Browser* castedWindow = (static_cast<Fl_Hold_Browser*>(hold_browser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_callback)(fl_Hold_Browser hold_browser,fl_Callback* cb){
    Fl_Hold_Browser* castedWindow = (static_cast<Fl_Hold_Browser*>(hold_browser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Hold_Browser_user_data)(fl_Hold_Browser hold_browser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hold_Browser*>(hold_browser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Hold_Browser*>(hold_browser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_user_data)(fl_Hold_Browser hold_browser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Hold_Browser*>(hold_browser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Hold_Browser*>(hold_browser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Hold_Browser*>(hold_browser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Hold_Browser_argument)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->argument();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_argument)(fl_Hold_Browser hold_browser,long v){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Hold_Browser_when)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->when();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_when)(fl_Hold_Browser hold_browser,uchar i){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->when(i);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_visible_r)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_show_super)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_hide_super)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->hide();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_visible)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Hold_Browser_active)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->active();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_active_r)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->active_r();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_activate)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->activate();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_deactivate)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Hold_Browser_output)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_output)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_output)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Hold_Browser_takesevents)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_changed)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->changed();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_changed)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_take_focus)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_visible_focus)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_visible_focus)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_modify_visible_focus)(fl_Hold_Browser hold_browser,int v){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Hold_Browser_visible_focus)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_contains)(fl_Hold_Browser hold_browser,fl_Widget w){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_inside)(fl_Hold_Browser hold_browser,fl_Widget w){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_redraw)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->redraw();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_redraw_label)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Hold_Browser_damage)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->damage();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_damage_with_bitmask)(fl_Hold_Browser hold_browser,uchar c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear_damage)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_damage_with_text)(fl_Hold_Browser hold_browser,uchar c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_damage_inside_widget)(fl_Hold_Browser hold_browser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_draw_label_with_xywh_alignment)(fl_Hold_Browser hold_browser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_measure_label)(fl_Hold_Browser hold_browser,int* ww,int* hh){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Hold_Browser_window)(fl_Hold_Browser hold_browser){
    return (fl_Window) (static_cast<Fl_Hold_Browser*>(hold_browser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Hold_Browser_top_window)(fl_Hold_Browser hold_browser){
    return (fl_Window) (static_cast<Fl_Hold_Browser*>(hold_browser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Hold_Browser_top_window_offset)(fl_Hold_Browser hold_browser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Hold_Browser*>(hold_browser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Hold_Browser_as_group_super)(fl_Hold_Browser hold_browser){
    return (fl_Group) (static_cast<Fl_Hold_Browser*>(hold_browser))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Hold_Browser_as_group)(fl_Hold_Browser hold_browser){
    return (fl_Group) (static_cast<Fl_Hold_Browser*>(hold_browser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hold_Browser_as_gl_window_super)(fl_Hold_Browser hold_browser){
    return (fl_Gl_Window) (static_cast<Fl_Hold_Browser*>(hold_browser))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Hold_Browser_as_gl_window)(fl_Hold_Browser hold_browser){
    return (fl_Gl_Window) (static_cast<Fl_Hold_Browser*>(hold_browser))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_resizable_by_reference)(fl_Hold_Browser hold_browser,fl_Widget o){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_resizable)(fl_Hold_Browser hold_browser,fl_Widget o){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Hold_Browser_resizable)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->resizable();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_add_resizable)(fl_Hold_Browser hold_browser,fl_Widget o){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_clip_children)(fl_Hold_Browser hold_browser,int c){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Hold_Browser_clip_children)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_focus)(fl_Hold_Browser hold_browser, fl_Widget W){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Hold_Browser__ddfdesign_kludge)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->_ddfdesign_kludge();
  }
  // FL_EXPORT_C(void,Fl_Hold_Browser_forms_end)(fl_Hold_Browser self){
  //   (static_cast<Fl_Hold_Browser*>(self))->forms_end();
  // }

  FL_EXPORT_C(fl_Hold_Browser, Fl_Hold_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Hold_Browser* hold_browser = new Fl_Hold_Browser(x,y,w,h,label);
    return (static_cast<fl_Hold_Browser>(hold_browser));
  }
  FL_EXPORT_C(fl_Hold_Browser, Fl_Hold_Browser_New)(int x, int y, int w, int h) {
    Fl_Hold_Browser* hold_browser = new Fl_Hold_Browser(x,y,w,h);
    return (static_cast<fl_Hold_Browser>(hold_browser));
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_Destroy)(fl_Hold_Browser hold_browser){
    delete (static_cast<Fl_Hold_Browser*>(hold_browser));
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_remove)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->remove(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_add)(fl_Hold_Browser hold_browser,const char* newtext){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->add(newtext);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_add_with_d)(fl_Hold_Browser hold_browser,const char* newtext,void* d){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->add(newtext,d);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_insert)(fl_Hold_Browser hold_browser,int line,const char* newtext){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->insert(line,newtext);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_insert_with_d)(fl_Hold_Browser hold_browser,int line,const char* newtext,void* d){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->insert(line,newtext,d);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_move)(fl_Hold_Browser hold_browser,int to,int from){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->move(to,from);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_load)(fl_Hold_Browser hold_browser,const char* filename){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->load(filename);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_clear)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->clear();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_size)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->size();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_size)(fl_Hold_Browser hold_browser,int W,int H){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_topline)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->topline();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_lineposition)(fl_Hold_Browser hold_browser,int line,Fl_Line_Position pos){
    Fl_Hold_Browser::Fl_Line_Position p = (Fl_Hold_Browser::Fl_Line_Position)-1;
    switch(p){
    case TOP :    {p = Fl_Hold_Browser::TOP; break;}
    case BOTTOM : {p = Fl_Hold_Browser::BOTTOM; break;}
    case MIDDLE : {p = Fl_Hold_Browser::MIDDLE; break;}
    default:      {p = (Fl_Hold_Browser::Fl_Line_Position)-1; break;}
    }
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->lineposition(line,p);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_topline)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->topline(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_bottomline)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->bottomline(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_middleline)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->middleline(line);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_select)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->select(line);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_select_with_val)(fl_Hold_Browser hold_browser,int line,int val){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->select(line,val);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_selected)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->selected(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_show_with_line)(fl_Hold_Browser hold_browser,int line){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->show(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_show)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_hide_with_line)(fl_Hold_Browser hold_browser,int line){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->hide(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_hide)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->hide();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_visible)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->visible(line);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_value)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->value();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_value)(fl_Hold_Browser hold_browser,int line){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->value(line);
  }
  FL_EXPORT_C(const char*,Fl_Hold_Browser_text)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->text(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_text)(fl_Hold_Browser hold_browser,int line,const char* newtext){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->text(line,newtext);
  }
  FL_EXPORT_C(void*,Fl_Hold_Browser_data)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->data(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_data)(fl_Hold_Browser hold_browser,int line,void* d){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->data(line,d);
  }
  FL_EXPORT_C(char,Fl_Hold_Browser_format_char)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->format_char();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_format_char)(fl_Hold_Browser hold_browser,char c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->format_char(c);
  }
  FL_EXPORT_C(char,Fl_Hold_Browser_column_char)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->column_char();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_column_char)(fl_Hold_Browser hold_browser,char c){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->column_char(c);
  }
  FL_EXPORT_C(const int*,Fl_Hold_Browser_column_widths)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->column_widths();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_column_widths)(fl_Hold_Browser hold_browser,const int* arr){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->column_widths(arr);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_displayed)(fl_Hold_Browser hold_browser,int line){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->displayed(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_make_visible)(fl_Hold_Browser hold_browser,int line){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->make_visible(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_icon)(fl_Hold_Browser hold_browser,int line,fl_Image icon){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->icon(line,(static_cast<Fl_Image*>(icon)));
  }
  FL_EXPORT_C(fl_Image,Fl_Hold_Browser_icon)(fl_Hold_Browser hold_browser,int line){
    return (fl_Image)(static_cast<Fl_Hold_Browser*>(hold_browser))->icon(line);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_remove_icon)(fl_Hold_Browser hold_browser,int line){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->remove_icon(line);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_select_only)(fl_Hold_Browser hold_browser,void *item){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->select_only(item);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_select_only_with_docallbacks)(fl_Hold_Browser hold_browser,void *item,int docallbacks){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->select_only(item,docallbacks);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_deselect)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->deselect();
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_deselect_with_docallbacks)(fl_Hold_Browser hold_browser,int docallbacks){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->deselect(docallbacks);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_position)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->position();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_position)(fl_Hold_Browser hold_browser,int pos){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->position(pos);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_hposition)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->hposition();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_hposition)(fl_Hold_Browser hold_browser,int ){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->hposition();
  }
  FL_EXPORT_C(uchar,Fl_Hold_Browser_has_scrollbar)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->has_scrollbar();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_has_scrollbar)(fl_Hold_Browser hold_browser,uchar mode){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->has_scrollbar(mode);
  }
  FL_EXPORT_C(Fl_Font,Fl_Hold_Browser_textfont)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->textfont();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_textfont)(fl_Hold_Browser hold_browser,Fl_Font font){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->textfont(font);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Hold_Browser_textsize)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->textsize();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_textsize)(fl_Hold_Browser hold_browser,Fl_Fontsize newSize){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->textsize(newSize);
  }
  FL_EXPORT_C(Fl_Color,Fl_Hold_Browser_textcolor)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_textcolor)(fl_Hold_Browser hold_browser,Fl_Color col){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->textcolor(col);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_scrollbar_size)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_scrollbar_size)(fl_Hold_Browser hold_browser,int newSize){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_size(newSize);
  }
  FL_EXPORT_C(int,Fl_Hold_Browser_scrollbar_width)(fl_Hold_Browser hold_browser){
    return (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_scrollbar_width)(fl_Hold_Browser hold_browser,int width){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_width(width);
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_scrollbar_right)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_right();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_set_scrollbar_left)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->scrollbar_left();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_sort)(fl_Hold_Browser hold_browser){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->sort();
  }
  FL_EXPORT_C(void,Fl_Hold_Browser_sort_with_flags)(fl_Hold_Browser hold_browser,int flags){
    (static_cast<Fl_Hold_Browser*>(hold_browser))->sort(flags);
  }
#ifdef __cplusplus
}
#endif
