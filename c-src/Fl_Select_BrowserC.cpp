#include "Fl_Select_BrowserC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Select_Browser_handle)(fl_Select_Browser self, int event){
    return (static_cast<Fl_Select_Browser*>(self))->handle(event);
  }
  FL_EXPORT_C(fl_Group,Fl_Select_Browser_parent)(fl_Select_Browser select_browser){
    return (fl_Group) (static_cast<Fl_Select_Browser*>(select_browser))->parent();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_parent)(fl_Select_Browser select_browser,fl_Group grp){
    (static_cast<Fl_Select_Browser*>(select_browser))->parent((static_cast<Fl_Group*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Select_Browser_type)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->type();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_type)(fl_Select_Browser select_browser,uchar t){
    (static_cast<Fl_Select_Browser*>(select_browser))->type(t);
  }

  FL_EXPORT_C(int,Fl_Select_Browser_x)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->x();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_y)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->y();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_w)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->w();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_h)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->h();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_align)(fl_Select_Browser select_browser, Fl_Align alignment){
    (static_cast<Fl_Select_Browser*>(select_browser))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Select_Browser_align)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Select_Browser_box)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->box();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_box)(fl_Select_Browser select_browser,Fl_Boxtype new_box){
    (static_cast<Fl_Select_Browser*>(select_browser))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Select_Browser_color)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->color();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_color)(fl_Select_Browser select_browser,Fl_Color bg){
    (static_cast<Fl_Select_Browser*>(select_browser))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_color_with_bg_sel)(fl_Select_Browser select_browser,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Select_Browser*>(select_browser))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Select_Browser_selection_color)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_selection_color)(fl_Select_Browser select_browser,Fl_Color a){
    (static_cast<Fl_Select_Browser*>(select_browser))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Select_Browser_label)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->label();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_copy_label)(fl_Select_Browser select_browser,const char* new_label){
    (static_cast<Fl_Select_Browser*>(select_browser))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_label)(fl_Select_Browser select_browser,const char* text){
    (static_cast<Fl_Select_Browser*>(select_browser))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Select_Browser_labeltype)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_labeltype)(fl_Select_Browser select_browser,Fl_Labeltype a){
    (static_cast<Fl_Select_Browser*>(select_browser))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_labelcolor)(fl_Select_Browser select_browser,Fl_Color c){
    (static_cast<Fl_Select_Browser*>(select_browser))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Select_Browser_labelcolor)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Select_Browser_labelfont)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_labelfont)(fl_Select_Browser select_browser,Fl_Font c){
    (static_cast<Fl_Select_Browser*>(select_browser))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Select_Browser_labelsize)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_labelsize)(fl_Select_Browser select_browser,Fl_Fontsize pix){
    (static_cast<Fl_Select_Browser*>(select_browser))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Select_Browser_image)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->image();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_image)(fl_Select_Browser select_browser,fl_Image pix){
    (static_cast<Fl_Select_Browser*>(select_browser))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Select_Browser_deimage)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->deimage();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_deimage)(fl_Select_Browser select_browser,fl_Image pix){
    (static_cast<Fl_Select_Browser*>(select_browser))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Select_Browser_tooltip)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_copy_tooltip)(fl_Select_Browser select_browser,const char* text){
    (static_cast<Fl_Select_Browser*>(select_browser))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_tooltip)(fl_Select_Browser select_browser,const char* text){
    (static_cast<Fl_Select_Browser*>(select_browser))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_callback_with_user_data)(fl_Select_Browser select_browser,fl_Callback* cb,void* p){
    Fl_Select_Browser* castedWindow = (static_cast<Fl_Select_Browser*>(select_browser));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_callback)(fl_Select_Browser select_browser,fl_Callback* cb){
    Fl_Select_Browser* castedWindow = (static_cast<Fl_Select_Browser*>(select_browser));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Select_Browser_user_data)(fl_Select_Browser select_browser){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Select_Browser*>(select_browser))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Select_Browser*>(select_browser))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_user_data)(fl_Select_Browser select_browser,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Select_Browser*>(select_browser))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Select_Browser*>(select_browser))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Select_Browser*>(select_browser))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Select_Browser_argument)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->argument();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_argument)(fl_Select_Browser select_browser,long v){
    (static_cast<Fl_Select_Browser*>(select_browser))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Select_Browser_when)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->when();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_when)(fl_Select_Browser select_browser,uchar i){
    (static_cast<Fl_Select_Browser*>(select_browser))->when(i);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_visible_r)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_show_super)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_hide_super)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->hide();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_visible)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Select_Browser_active)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->active();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_active_r)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->active_r();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_activate)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->activate();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_deactivate)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Select_Browser_output)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_output)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->output();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_output)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Select_Browser_takesevents)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_changed)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->changed();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_changed)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_take_focus)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_visible_focus)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_visible_focus)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_modify_visible_focus)(fl_Select_Browser select_browser,int v){
    (static_cast<Fl_Select_Browser*>(select_browser))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Select_Browser_visible_focus)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->visible_focus();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_contains)(fl_Select_Browser select_browser,fl_Widget w){
    return (static_cast<Fl_Select_Browser*>(select_browser))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Select_Browser_inside)(fl_Select_Browser select_browser,fl_Widget w){
    return (static_cast<Fl_Select_Browser*>(select_browser))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Select_Browser_redraw)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->redraw();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_redraw_label)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Select_Browser_damage)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->damage();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_damage_with_bitmask)(fl_Select_Browser select_browser,uchar c){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear_damage)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_damage_with_text)(fl_Select_Browser select_browser,uchar c){
    (static_cast<Fl_Select_Browser*>(select_browser))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_damage_inside_widget)(fl_Select_Browser select_browser,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Select_Browser*>(select_browser))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_draw_label_with_xywh_alignment)(fl_Select_Browser select_browser,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Select_Browser*>(select_browser))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_measure_label)(fl_Select_Browser select_browser,int* ww,int* hh){
    (static_cast<Fl_Select_Browser*>(select_browser))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_window)(fl_Select_Browser select_browser){
    return (fl_Window) (static_cast<Fl_Select_Browser*>(select_browser))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Select_Browser_top_window)(fl_Select_Browser select_browser){
    return (fl_Window) (static_cast<Fl_Select_Browser*>(select_browser))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Select_Browser_top_window_offset)(fl_Select_Browser select_browser, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Select_Browser*>(select_browser))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Select_Browser_as_group_super)(fl_Select_Browser select_browser){
    return (fl_Group) (static_cast<Fl_Select_Browser*>(select_browser))->as_group();
  }
  FL_EXPORT_C(fl_Group,Fl_Select_Browser_as_group)(fl_Select_Browser select_browser){
    return (fl_Group) (static_cast<Fl_Select_Browser*>(select_browser))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Select_Browser_as_gl_window_super)(fl_Select_Browser select_browser){
    return (fl_Gl_Window) (static_cast<Fl_Select_Browser*>(select_browser))->as_gl_window();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Select_Browser_as_gl_window)(fl_Select_Browser select_browser){
    return (fl_Gl_Window) (static_cast<Fl_Select_Browser*>(select_browser))->as_gl_window();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_resizable_by_reference)(fl_Select_Browser select_browser,fl_Widget o){
    (static_cast<Fl_Select_Browser*>(select_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_resizable)(fl_Select_Browser select_browser,fl_Widget o){
    (static_cast<Fl_Select_Browser*>(select_browser))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Select_Browser_resizable)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->resizable();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_add_resizable)(fl_Select_Browser select_browser,fl_Widget o){
    (static_cast<Fl_Select_Browser*>(select_browser))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_clip_children)(fl_Select_Browser select_browser,int c){
    (static_cast<Fl_Select_Browser*>(select_browser))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Select_Browser_clip_children)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_focus)(fl_Select_Browser select_browser, fl_Widget W){
    (static_cast<Fl_Select_Browser*>(select_browser))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Select_Browser__ddfdesign_kludge)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->_ddfdesign_kludge();
  }
  // FL_EXPORT_C(void,Fl_Select_Browser_forms_end)(fl_Select_Browser self){
  //   (static_cast<Fl_Select_Browser*>(self))->forms_end();
  // }

  FL_EXPORT_C(fl_Select_Browser, Fl_Select_Browser_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Select_Browser* select_browser = new Fl_Select_Browser(x,y,w,h,label);
    return (static_cast<fl_Select_Browser>(select_browser));
  }
  FL_EXPORT_C(fl_Select_Browser, Fl_Select_Browser_New)(int x, int y, int w, int h) {
    Fl_Select_Browser* select_browser = new Fl_Select_Browser(x,y,w,h,0);
    return (fl_Select_Browser)select_browser;
  }
  FL_EXPORT_C(void,Fl_Select_Browser_Destroy)(fl_Select_Browser select_browser){
    delete (static_cast<Fl_Select_Browser*>(select_browser));
  }
  FL_EXPORT_C(void,Fl_Select_Browser_remove)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->remove(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_add)(fl_Select_Browser select_browser,const char* newtext){
    (static_cast<Fl_Select_Browser*>(select_browser))->add(newtext);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_add_with_d)(fl_Select_Browser select_browser,const char* newtext,void* d){
    (static_cast<Fl_Select_Browser*>(select_browser))->add(newtext,d);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_insert)(fl_Select_Browser select_browser,int line,const char* newtext){
    (static_cast<Fl_Select_Browser*>(select_browser))->insert(line,newtext);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_insert_with_d)(fl_Select_Browser select_browser,int line,const char* newtext,void* d){
    (static_cast<Fl_Select_Browser*>(select_browser))->insert(line,newtext,d);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_move)(fl_Select_Browser select_browser,int to,int from){
    (static_cast<Fl_Select_Browser*>(select_browser))->move(to,from);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_load)(fl_Select_Browser select_browser,const char* filename){
    return (static_cast<Fl_Select_Browser*>(select_browser))->load(filename);
  }
  FL_EXPORT_C(void, Fl_Select_Browser_swap)(fl_Select_Browser select_browser, int a, int b){
    (static_cast<Fl_Select_Browser*>(select_browser))->swap(a,b);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_clear)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->clear();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_size)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->size();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_size)(fl_Select_Browser select_browser,int W,int H){
    (static_cast<Fl_Select_Browser*>(select_browser))->size(W,H);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_topline)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->topline();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_lineposition)(fl_Select_Browser select_browser,int line,Fl_Line_Position pos){
    Fl_Select_Browser::Fl_Line_Position p = (Fl_Select_Browser::Fl_Line_Position)-1;
    switch(p){
    case TOP :    {p = Fl_Select_Browser::TOP; break;}
    case BOTTOM : {p = Fl_Select_Browser::BOTTOM; break;}
    case MIDDLE : {p = Fl_Select_Browser::MIDDLE; break;}
    default:      {p = (Fl_Select_Browser::Fl_Line_Position)-1; break;}
    }
    return (static_cast<Fl_Select_Browser*>(select_browser))->lineposition(line,p);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_topline)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->topline(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_bottomline)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->bottomline(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_middleline)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->middleline(line);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_select)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->select(line);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_select_with_val)(fl_Select_Browser select_browser,int line,int val){
    return (static_cast<Fl_Select_Browser*>(select_browser))->select(line,val);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_selected)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->selected(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_show_with_line)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->show(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_show)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->show();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_hide_with_line)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->hide(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_hide)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->hide();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_visible)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->visible(line);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_value)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->value();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_value)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->value(line);
  }
  FL_EXPORT_C(const char*,Fl_Select_Browser_text)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->text(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_text)(fl_Select_Browser select_browser,int line,const char* newtext){
    (static_cast<Fl_Select_Browser*>(select_browser))->text(line,newtext);
  }
  FL_EXPORT_C(void*,Fl_Select_Browser_data)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->data(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_data)(fl_Select_Browser select_browser,int line,void* d){
    (static_cast<Fl_Select_Browser*>(select_browser))->data(line,d);
  }
  FL_EXPORT_C(char,Fl_Select_Browser_format_char)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->format_char();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_format_char)(fl_Select_Browser select_browser,char c){
    (static_cast<Fl_Select_Browser*>(select_browser))->format_char(c);
  }
  FL_EXPORT_C(char,Fl_Select_Browser_column_char)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->column_char();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_column_char)(fl_Select_Browser select_browser,char c){
    (static_cast<Fl_Select_Browser*>(select_browser))->column_char(c);
  }
  FL_EXPORT_C(const int*,Fl_Select_Browser_column_widths)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->column_widths();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_column_widths)(fl_Select_Browser select_browser,const int* arr){
    (static_cast<Fl_Select_Browser*>(select_browser))->column_widths(arr);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_displayed)(fl_Select_Browser select_browser,int line){
    return (static_cast<Fl_Select_Browser*>(select_browser))->displayed(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_make_visible)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->make_visible(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_icon)(fl_Select_Browser select_browser,int line,fl_Image icon){
    (static_cast<Fl_Select_Browser*>(select_browser))->icon(line,(static_cast<Fl_Image*>(icon)));
  }
  FL_EXPORT_C(fl_Image,Fl_Select_Browser_icon)(fl_Select_Browser select_browser,int line){
    return (fl_Image)(static_cast<Fl_Select_Browser*>(select_browser))->icon(line);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_remove_icon)(fl_Select_Browser select_browser,int line){
    (static_cast<Fl_Select_Browser*>(select_browser))->remove_icon(line);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_select_only)(fl_Select_Browser select_browser,void *item){
    return (static_cast<Fl_Select_Browser*>(select_browser))->select_only(item);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_select_only_with_docallbacks)(fl_Select_Browser select_browser,void *item,int docallbacks){
    return (static_cast<Fl_Select_Browser*>(select_browser))->select_only(item,docallbacks);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_deselect)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->deselect();
  }
  FL_EXPORT_C(int,Fl_Select_Browser_deselect_with_docallbacks)(fl_Select_Browser select_browser,int docallbacks){
    return (static_cast<Fl_Select_Browser*>(select_browser))->deselect(docallbacks);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_position)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->position();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_position)(fl_Select_Browser select_browser,int pos){
    (static_cast<Fl_Select_Browser*>(select_browser))->position(pos);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_hposition)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->hposition();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_hposition)(fl_Select_Browser select_browser,int ){
    (static_cast<Fl_Select_Browser*>(select_browser))->hposition();
  }
  FL_EXPORT_C(uchar,Fl_Select_Browser_has_scrollbar)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->has_scrollbar();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_has_scrollbar)(fl_Select_Browser select_browser,uchar mode){
    (static_cast<Fl_Select_Browser*>(select_browser))->has_scrollbar(mode);
  }
  FL_EXPORT_C(Fl_Font,Fl_Select_Browser_textfont)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->textfont();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_textfont)(fl_Select_Browser select_browser,Fl_Font font){
    (static_cast<Fl_Select_Browser*>(select_browser))->textfont(font);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Select_Browser_textsize)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->textsize();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_textsize)(fl_Select_Browser select_browser,Fl_Fontsize newSize){
    (static_cast<Fl_Select_Browser*>(select_browser))->textsize(newSize);
  }
  FL_EXPORT_C(Fl_Color,Fl_Select_Browser_textcolor)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_textcolor)(fl_Select_Browser select_browser,Fl_Color col){
    (static_cast<Fl_Select_Browser*>(select_browser))->textcolor(col);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_scrollbar_size)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_size();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_scrollbar_size)(fl_Select_Browser select_browser,int newSize){
    (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_size(newSize);
  }
  FL_EXPORT_C(int,Fl_Select_Browser_scrollbar_width)(fl_Select_Browser select_browser){
    return (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_scrollbar_width)(fl_Select_Browser select_browser,int width){
    (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_width(width);
  }
  FL_EXPORT_C(void,Fl_Select_Browser_scrollbar_right)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_right();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_set_scrollbar_left)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->scrollbar_left();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_sort)(fl_Select_Browser select_browser){
    (static_cast<Fl_Select_Browser*>(select_browser))->sort();
  }
  FL_EXPORT_C(void,Fl_Select_Browser_sort_with_flags)(fl_Select_Browser select_browser,int flags){
    (static_cast<Fl_Select_Browser*>(select_browser))->sort(flags);
  }
#ifdef __cplusplus
}
#endif
