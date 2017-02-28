#include "Fl_Text_EditorC.h"
#ifdef __cplusplus
DerivedText_Editor::Key_Binding_With_Callback* convertKeyBindings(Key_BindingC* bindings){
  Key_BindingC*  curr = bindings;
  DerivedText_Editor::Key_Binding_With_Callback* start = new DerivedText_Editor::Key_Binding_With_Callback();
  DerivedText_Editor::Key_Binding_With_Callback* ret_curr = start;
  for (;curr;curr = curr->next, ret_curr = ret_curr->next){
    if (curr){
      ret_curr->key = curr->key;
      ret_curr->state = curr->state;
      C_to_Fl_Callback* callback_context = new C_to_Fl_Callback(bindings->function);
      ret_curr->callback_context = callback_context;
      if (curr->next){
        ret_curr->next = new DerivedText_Editor::Key_Binding_With_Callback();
      }
    }
  }
  return start;
}
Key_BindingC* convertKeyBindings(DerivedText_Editor::Key_Binding_With_Callback* bindings){
  DerivedText_Editor::Key_Binding_With_Callback* curr = bindings;
  Key_BindingC* start = (Key_BindingC*)malloc (sizeof(Key_BindingC));
  Key_BindingC* ret_curr = start;
  for(;curr;curr = curr->next, ret_curr = ret_curr->next){
    if (curr){
      ret_curr->key = curr->key;
      ret_curr->state = curr->state;
      ret_curr->function = C_to_Fl_Callback::intercept;
      if (curr->next) {
        ret_curr->next =  (Key_BindingC*)malloc (sizeof(Key_BindingC));
      }
    }
  }
  return start;
}
EXPORT {
#endif
  FL_EXPORT_C(fl_Group,Fl_Text_Editor_parent)(fl_Text_Editor win){
    return (fl_Group) (static_cast<DerivedText_Editor*>(win))->parent();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_parent)(fl_Text_Editor win,fl_Text_Editor grp){
    (static_cast<DerivedText_Editor*>(win))->parent((static_cast<DerivedText_Editor*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Text_Editor_type)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->type();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_type)(fl_Text_Editor win,uchar t){
    (static_cast<DerivedText_Editor*>(win))->type(t);
  }

  FL_EXPORT_C(int,Fl_Text_Editor_x)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->x();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_y)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->y();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_w)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->w();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_h)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->h();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_align)(fl_Text_Editor text_editor, Fl_Align alignment){
    (static_cast<DerivedText_Editor*>(text_editor))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Text_Editor_align)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Text_Editor_box)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->box();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_box)(fl_Text_Editor win,Fl_Boxtype new_box){
    (static_cast<DerivedText_Editor*>(win))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Editor_color)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->color();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_color)(fl_Text_Editor win,Fl_Color bg){
    (static_cast<DerivedText_Editor*>(win))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_color_with_bg_sel)(fl_Text_Editor win,Fl_Color bg,Fl_Color a){
    (static_cast<DerivedText_Editor*>(win))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Editor_selection_color)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_selection_color)(fl_Text_Editor win,Fl_Color a){
    (static_cast<DerivedText_Editor*>(win))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Text_Editor_label)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->label();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_copy_label)(fl_Text_Editor win,const char* new_label){
    (static_cast<DerivedText_Editor*>(win))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_label)(fl_Text_Editor win,const char* text){
    (static_cast<DerivedText_Editor*>(win))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Text_Editor_labeltype)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_labeltype)(fl_Text_Editor win,Fl_Labeltype a){
    (static_cast<DerivedText_Editor*>(win))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_labelcolor)(fl_Text_Editor win,Fl_Color c){
    (static_cast<DerivedText_Editor*>(win))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Text_Editor_labelcolor)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Text_Editor_labelfont)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_labelfont)(fl_Text_Editor win,Fl_Font c){
    (static_cast<DerivedText_Editor*>(win))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Text_Editor_labelsize)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_labelsize)(fl_Text_Editor win,Fl_Fontsize pix){
    (static_cast<DerivedText_Editor*>(win))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Editor_image)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->image();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_image)(fl_Text_Editor win,fl_Image pix){
    (static_cast<DerivedText_Editor*>(win))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Text_Editor_deimage)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->deimage();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_deimage)(fl_Text_Editor win,fl_Image pix){
    (static_cast<DerivedText_Editor*>(win))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Text_Editor_tooltip)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_copy_tooltip)(fl_Text_Editor win,const char* text){
    (static_cast<DerivedText_Editor*>(win))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_tooltip)(fl_Text_Editor win,const char* text){
    (static_cast<DerivedText_Editor*>(win))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_callback_with_user_data)(fl_Text_Editor win,fl_Callback* cb,void* p){
    Fl_Text_Editor* castedWindow = (static_cast<DerivedText_Editor*>(win));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_callback)(fl_Text_Editor win,fl_Callback* cb){
    Fl_Text_Editor* castedWindow = (static_cast<DerivedText_Editor*>(win));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Text_Editor_user_data)(fl_Text_Editor win){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Editor*>(win))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Text_Editor*>(win))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_user_data)(fl_Text_Editor win,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Text_Editor*>(win))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Text_Editor*>(win))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Text_Editor*>(win))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Text_Editor_argument)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->argument();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_argument)(fl_Text_Editor win,long v){
    (static_cast<DerivedText_Editor*>(win))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Text_Editor_when)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->when();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_when)(fl_Text_Editor win,uchar i){
    (static_cast<DerivedText_Editor*>(win))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_visible)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->visible();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_visible_r)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_visible)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->visible();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_visible)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_active)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->active();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_active_r)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->active_r();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_activate)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->activate();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_deactivate)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_output)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_output)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->output();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_output)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_takesevents)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_changed)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->changed();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_changed)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_take_focus)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_visible_focus)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_visible_focus)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_modify_visible_focus)(fl_Text_Editor win,int v){
    (static_cast<DerivedText_Editor*>(win))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_visible_focus)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_do_callback)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_do_callback_with_widget_and_user_data)(fl_Text_Editor win,fl_Widget w,long arg){
    (static_cast<DerivedText_Editor*>(win))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_do_callback_with_widget_and_default_user_data)(fl_Text_Editor win,fl_Widget w){
    (static_cast<DerivedText_Editor*>(win))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_contains)(fl_Text_Editor win,fl_Widget w){
    return (static_cast<DerivedText_Editor*>(win))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_inside)(fl_Text_Editor win,fl_Widget w){
    return (static_cast<DerivedText_Editor*>(win))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_redraw)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->redraw();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_redraw_label)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Text_Editor_damage)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->damage();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_damage_with_bitmask)(fl_Text_Editor win,uchar c){
    (static_cast<DerivedText_Editor*>(win))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear_damage)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_damage_with_text)(fl_Text_Editor win,uchar c){
    (static_cast<DerivedText_Editor*>(win))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_damage_inside_widget)(fl_Text_Editor win,uchar c,int x,int y,int w,int h){
    (static_cast<DerivedText_Editor*>(win))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_draw_label_with_xywh_alignment)(fl_Text_Editor win,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<DerivedText_Editor*>(win))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_measure_label)(fl_Text_Editor win,int* ww,int* hh){
    (static_cast<DerivedText_Editor*>(win))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Editor_window)(fl_Text_Editor text_editor){
    return (fl_Window) (static_cast<DerivedText_Editor*>(text_editor))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Text_Editor_top_window)(fl_Text_Editor text_editor){
    return (fl_Window) (static_cast<DerivedText_Editor*>(text_editor))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Text_Editor_top_window_offset)(fl_Text_Editor text_editor, int* xoff, int* yoff){
    return (fl_Window) (static_cast<DerivedText_Editor*>(text_editor))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Text_Editor_as_group)(fl_Text_Editor win){
    return (fl_Text_Editor) (static_cast<DerivedText_Editor*>(win))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Text_Editor_as_gl_window)(fl_Text_Editor win){
    return (fl_Gl_Window) (static_cast<DerivedText_Editor*>(win))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Text_Editor_begin)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->begin();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_end)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->end();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_find)(fl_Text_Editor win,fl_Widget w){
    return (static_cast<DerivedText_Editor*>(win))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_add)(fl_Text_Editor win,fl_Widget w){
    (static_cast<DerivedText_Editor*>(win))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_index)(fl_Text_Editor win,int index){
    (static_cast<DerivedText_Editor*>(win))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_widget)(fl_Text_Editor win,fl_Widget w){
    (static_cast<DerivedText_Editor*>(win))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_clear)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->clear();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_resizable_by_reference)(fl_Text_Editor win,fl_Widget o){
    (static_cast<DerivedText_Editor*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_resizable)(fl_Text_Editor win,fl_Widget o){
    (static_cast<DerivedText_Editor*>(win))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Editor_resizable)(fl_Text_Editor win){
    return (fl_Widget)(static_cast<DerivedText_Editor*>(win))->resizable();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_add_resizable)(fl_Text_Editor win,fl_Widget o){
    return (static_cast<DerivedText_Editor*>(win))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_init_sizes)(fl_Text_Editor win){
    (static_cast<DerivedText_Editor*>(win))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_children)(fl_Text_Editor self){
    return (static_cast<DerivedText_Editor*>(self))->children();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_clip_children)(fl_Text_Editor win,int c){
    return (static_cast<DerivedText_Editor*>(win))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Text_Editor_clip_children)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_focus)(fl_Text_Editor win, fl_Widget W){
    return (static_cast<DerivedText_Editor*>(win))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Text_Editor__ddfdesign_kludge)(fl_Text_Editor win){
    return (static_cast<DerivedText_Editor*>(win))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(fl_Widget*, Fl_Text_Editor_array)(fl_Text_Editor self){
    return (fl_Widget*)(static_cast<DerivedText_Editor*>(self))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Text_Editor_child)(fl_Text_Editor self, int n){
    return (fl_Widget)(static_cast<DerivedText_Editor*>(self))->child(n);
  }
  FL_EXPORT_C(void,     Fl_Text_Editor_Destroy)(fl_Text_Editor text_editor){
    delete (static_cast<DerivedText_Editor*>(text_editor));
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_buffer)(fl_Text_Editor text_editor,fl_Text_Buffer buf){
    return (static_cast<DerivedText_Editor*>(text_editor))->buffer((static_cast<Fl_Text_Buffer*>(buf)));
  }
  FL_EXPORT_C(fl_Text_Buffer,Fl_Text_Editor_buffer)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->buffer();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_redisplay_range)(fl_Text_Editor text_editor,int start,int end){
    (static_cast<DerivedText_Editor*>(text_editor))->redisplay_range(start,end);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_scroll)(fl_Text_Editor text_editor,int topLineNum,int horizOffset){
    return (static_cast<DerivedText_Editor*>(text_editor))->scroll(topLineNum,horizOffset);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_insert)(fl_Text_Editor text_editor,const char* text){
    return (static_cast<DerivedText_Editor*>(text_editor))->insert(text);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_overstrike)(fl_Text_Editor text_editor,const char* text){
    return (static_cast<DerivedText_Editor*>(text_editor))->overstrike(text);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_insert_position)(fl_Text_Editor text_editor,int newPos){
    return (static_cast<DerivedText_Editor*>(text_editor))->insert_position(newPos);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_insert_position)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->insert_position();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_position_to_xy)(fl_Text_Editor text_editor,int pos,int* x,int* y){
    return (static_cast<DerivedText_Editor*>(text_editor))->position_to_xy(pos,x,y);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_in_selection)(fl_Text_Editor text_editor,int x,int y){
    return (static_cast<DerivedText_Editor*>(text_editor))->in_selection(x,y);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_show_insert_position)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->show_insert_position();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_move_right)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->move_right();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_move_left)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->move_left();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_move_up)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->move_up();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_move_down)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->move_down();
  }
  FL_EXPORT_C(int,Fl_Text_Editor_count_lines)(fl_Text_Editor text_editor,int start,int end,int start_pos_is_line_start){
    return (static_cast<DerivedText_Editor*>(text_editor))->count_lines(start,end,start_pos_is_line_start >= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_line_start)(fl_Text_Editor text_editor,int pos){
    return (static_cast<DerivedText_Editor*>(text_editor))->line_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_line_end)(fl_Text_Editor text_editor,int startPos,int startPosIsLineStart){
    return (static_cast<DerivedText_Editor*>(text_editor))->line_end(startPos,startPosIsLineStart >= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_skip_lines)(fl_Text_Editor text_editor,int startPos,int nLines,int startPosIsLineStart){
    return (static_cast<DerivedText_Editor*>(text_editor))->skip_lines(startPos,nLines,startPosIsLineStart>= 1 ? true : false);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_rewind_lines)(fl_Text_Editor text_editor,int startPos,int nLines){
    return (static_cast<DerivedText_Editor*>(text_editor))->rewind_lines(startPos,nLines);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_next_word)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->next_word();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_previous_word)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->previous_word();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_show_cursor)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->show_cursor();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_show_cursor_with_b)(fl_Text_Editor text_editor,int b){
    return (static_cast<DerivedText_Editor*>(text_editor))->show_cursor(b);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_hide_cursor)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->hide_cursor();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_cursor_style)(fl_Text_Editor text_editor,int style){
    return (static_cast<DerivedText_Editor*>(text_editor))->cursor_style(style);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Editor_cursor_color)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->cursor_color();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_cursor_color)(fl_Text_Editor text_editor,Fl_Color n){
    return (static_cast<DerivedText_Editor*>(text_editor))->cursor_color(n);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_scrollbar_width)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->scrollbar_width();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_scrollbar_width)(fl_Text_Editor text_editor,int W){
    return (static_cast<DerivedText_Editor*>(text_editor))->scrollbar_width(W);
  }
  FL_EXPORT_C(Fl_Align,Fl_Text_Editor_scrollbar_align)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->scrollbar_align();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_scrollbar_align)(fl_Text_Editor text_editor,Fl_Align a){
    return (static_cast<DerivedText_Editor*>(text_editor))->scrollbar_align(a);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_word_start)(fl_Text_Editor text_editor,int pos){
    return (static_cast<DerivedText_Editor*>(text_editor))->word_start(pos);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_word_end)(fl_Text_Editor text_editor,int pos){
    return (static_cast<DerivedText_Editor*>(text_editor))->word_end(pos);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_highlight_data)(fl_Text_Editor text_editor,fl_Text_Buffer styleBuffer,Style_Table_Entry *styleTable,int nStyles,char unfinishedStyle,Unfinished_Style_Cb unfinishedHighlightCB,void *cbArg){
    Fl_Text_Editor::Style_Table_Entry* s = new Fl_Text_Editor::Style_Table_Entry[nStyles]();
    int i = 0;
    for (;i<nStyles;i++){
      Fl_Text_Editor::Style_Table_Entry x =  Fl_Text_Editor::Style_Table_Entry();
      x.color = styleTable[i].color;
      x.font = styleTable[i].font;
      x.size = styleTable[i].size;
      x.attr = styleTable[i].attr;
      s[i] = x;
    }
    (static_cast<DerivedText_Editor*>(text_editor))->highlight_data((static_cast<Fl_Text_Buffer*>(styleBuffer)),s,nStyles,unfinishedStyle,unfinishedHighlightCB,cbArg);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_position_style)(fl_Text_Editor text_editor,int lineStartPos,int lineLen,int lineIndex){
    return (static_cast<DerivedText_Editor*>(text_editor))->position_style(lineStartPos,lineLen,lineIndex);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_shortcut)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->shortcut();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_shortcut)(fl_Text_Editor text_editor,int s){
    return (static_cast<DerivedText_Editor*>(text_editor))->shortcut(s);
  }
  FL_EXPORT_C(Fl_Font,Fl_Text_Editor_textfont)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->textfont();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_textfont)(fl_Text_Editor text_editor,Fl_Font s){
    return (static_cast<DerivedText_Editor*>(text_editor))->textfont(s);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Text_Editor_textsize)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->textsize();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_textsize)(fl_Text_Editor text_editor,Fl_Fontsize s){
    return (static_cast<DerivedText_Editor*>(text_editor))->textsize(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Text_Editor_textcolor)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->textcolor();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_textcolor)(fl_Text_Editor text_editor,Fl_Color n){
    return (static_cast<DerivedText_Editor*>(text_editor))->textcolor(n);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_wrapped_column)(fl_Text_Editor text_editor,int row,int column){
    return (static_cast<DerivedText_Editor*>(text_editor))->wrapped_column(row,column);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_wrapped_row)(fl_Text_Editor text_editor,int row){
    return (static_cast<DerivedText_Editor*>(text_editor))->wrapped_row(row);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_wrap_mode)(fl_Text_Editor text_editor,int wrap,int wrap_margin){
    return (static_cast<DerivedText_Editor*>(text_editor))->wrap_mode(wrap,wrap_margin);
  }
  FL_EXPORT_C(double,Fl_Text_Editor_x_to_col)(fl_Text_Editor text_editor,double x){
    return (static_cast<DerivedText_Editor*>(text_editor))->x_to_col(x);
  }
  FL_EXPORT_C(double,Fl_Text_Editor_col_to_x)(fl_Text_Editor text_editor,double col){
    return (static_cast<DerivedText_Editor*>(text_editor))->col_to_x(col);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_set_insert_mode)(fl_Text_Editor text_editor,int b){
    (static_cast<DerivedText_Editor*>(text_editor))->insert_mode(b);
  }
  FL_EXPORT_C(int,Fl_Text_Editor_insert_mode)(fl_Text_Editor text_editor){
    return (static_cast<DerivedText_Editor*>(text_editor))->insert_mode();
  }
  FL_EXPORT_C(int, Fl_Text_Editor_num_key_bindings)(Key_BindingC* bindings){
    int count = 0;
    Key_BindingC* curr = bindings;
    for (;curr;curr = curr->next){
      if (curr) {
        count++;
      }
    }
    return count;
  }
  FL_EXPORT_C(void,Fl_Text_Editor_add_key_binding_with_list)(fl_Text_Editor text_editor,int key,int state,fl_Key_Func f,Key_BindingC* list){
    DerivedText_Editor::Key_Binding_With_Callback* bs = convertKeyBindings(list);
    DerivedText_Editor* e =  (static_cast<DerivedText_Editor*>(text_editor));
    C_to_Fl_Callback* context = new C_to_Fl_Callback(f);
    e->add_key_binding(key,state,context,&bs);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_add_key_binding)(fl_Text_Editor text_editor,int key,int state,fl_Key_Func f){
    C_to_Fl_Callback* context = new C_to_Fl_Callback(f);
    (static_cast<DerivedText_Editor*>(text_editor))->add_key_binding(key,state,context);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_key_binding_with_list)(fl_Text_Editor text_editor,int key,int state,Key_BindingC* list){
    DerivedText_Editor::Key_Binding_With_Callback* bs = convertKeyBindings(list);
    (static_cast<DerivedText_Editor*>(text_editor))->remove_key_binding(key,state,&bs);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_key_binding)(fl_Text_Editor text_editor,int key,int state){
    (static_cast<DerivedText_Editor*>(text_editor))->remove_key_binding(key,state);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_all_key_bindings_with_list)(fl_Text_Editor text_editor,Key_BindingC* list){
    DerivedText_Editor::Key_Binding_With_Callback* bs = convertKeyBindings(list);
    (static_cast<DerivedText_Editor*>(text_editor))->remove_all_key_bindings(&bs);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_remove_all_key_bindings)(fl_Text_Editor text_editor){
    (static_cast<DerivedText_Editor*>(text_editor))->remove_all_key_bindings();
  }
  FL_EXPORT_C(void,Fl_Text_Editor_replace_key_bindings)(fl_Text_Editor text_editor, Key_BindingC* list){
    DerivedText_Editor::Key_Binding_With_Callback* bs = convertKeyBindings(list);
    (static_cast<DerivedText_Editor*>(text_editor))->replace_key_bindings(&bs);
  }
  FL_EXPORT_C(void,Fl_Text_Editor_replace_key_bindings_with_list)(fl_Text_Editor text_editor, Key_BindingC* list1, Key_BindingC* list2){
    DerivedText_Editor::Key_Binding_With_Callback* bs1 = convertKeyBindings(list1);
    DerivedText_Editor::Key_Binding_With_Callback* bs2 = convertKeyBindings(list2);
    (static_cast<DerivedText_Editor*>(text_editor))->replace_key_bindings(&bs1,&bs2);
  }
  FL_EXPORT_C(Key_BindingC* ,Fl_Text_Editor_add_default_key_bindings)(fl_Text_Editor text_editor,Key_BindingC* list){
    DerivedText_Editor::Key_Binding_With_Callback* bs_ = new DerivedText_Editor::Key_Binding_With_Callback();
    (static_cast<DerivedText_Editor*>(text_editor))->add_default_key_bindings(&bs_);
    list = convertKeyBindings(bs_);
    return list;
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_undo)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_undo(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_ignore)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_ignore(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_backspace)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_backspace(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_enter)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_enter(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_shift_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_shift_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_ctrl_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_ctrl_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_c_s_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_c_s_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_meta_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_meta_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_m_s_move)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_m_s_move(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_home)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_home(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_end)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_end(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_left)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_left(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_up)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_up(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_right)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_right(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_down)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_down(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_page_up)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_page_up(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_page_down)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_page_down(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_insert)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_insert(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_delete)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_delete(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_copy)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_copy(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_cut)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_cut(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_paste)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_paste(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_select_all)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_select_all(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(int,Fl_Text_Editor_kf_default)(int c,fl_Text_Editor e){
    return Fl_Text_Editor::kf_default(c,(static_cast<DerivedText_Editor*>(e)));
  }
  FL_EXPORT_C(void, Fl_Text_Editor_draw)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Text_Editor_draw_super)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Text_Editor_handle)(fl_Text_Editor o, int event){
    return (static_cast<DerivedText_Editor*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Text_Editor_handle_super)(fl_Text_Editor o, int event){
    return (static_cast<DerivedText_Editor*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Text_Editor_resize)(fl_Text_Editor o, int x, int y, int w, int h){
    (static_cast<DerivedText_Editor*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Text_Editor_resize_super)(fl_Text_Editor o, int x, int y, int w, int h){
    (static_cast<DerivedText_Editor*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Text_Editor_show)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Text_Editor_show_super)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Text_Editor_hide)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Text_Editor_hide_super)(fl_Text_Editor o){
    (static_cast<DerivedText_Editor*>(o))->hide_super();
  }
  FL_EXPORT_C(fl_Text_Editor,    Fl_Text_Editor_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    DerivedText_Editor* w = new DerivedText_Editor(X,Y,W,H,fs);
    return (fl_Text_Editor)w;
  }
  FL_EXPORT_C(fl_Text_Editor,    Fl_Text_Editor_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    DerivedText_Editor* w = new DerivedText_Editor(X,Y,W,H,label,fs);
    return (fl_Text_Editor)w;
  }
  FL_EXPORT_C(fl_Text_Editor,    Fl_OverriddenText_Editor_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    DerivedText_Editor* w = new DerivedText_Editor(X,Y,W,H,fs);
    return (fl_Text_Editor)w;
  }
  FL_EXPORT_C(fl_Text_Editor,    Fl_OverriddenText_Editor_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    DerivedText_Editor* w = new DerivedText_Editor(X,Y,W,H,label,fs);
    return (fl_Text_Editor)w;
  }
#ifdef __cplusplus
}
#endif
