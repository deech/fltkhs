#include "Fl_Sys_Menu_BarC.h"
#include "Utils.h"
#ifdef __cplusplus
EXPORT {
#endif
  // #if defined(__APPLE__)
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_handle )(fl_Sys_Menu_Bar sys_menu_bar, int event){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->handle(event);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->handle(event);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_resize )(fl_Sys_Menu_Bar sys_menu_bar,int x, int y, int w, int h){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->resize(x,y,w,h);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->resize(x,y,w,h);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_show )(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->show();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->show();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_hide )(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->hide();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->hide();
#endif
  }
  FL_EXPORT_C(fl_Window,Fl_Sys_Menu_Bar_as_window )(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->as_window();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->as_window();
#endif
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Sys_Menu_Bar_as_gl_window )(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (fl_Gl_Window) (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->as_gl_window();
#else
    return (fl_Gl_Window) (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->as_gl_window();
#endif
  }
  FL_EXPORT_C(fl_Group,Fl_Sys_Menu_Bar_parent)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (fl_Group) (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->parent();
#else
    return (fl_Group) (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->parent();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_parent)(fl_Sys_Menu_Bar sys_menu_bar,fl_Group grp){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->parent((static_cast<Fl_Group*>(grp)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->parent((static_cast<Fl_Group*>(grp)));
#endif
  }
  FL_EXPORT_C(uchar,Fl_Sys_Menu_Bar_type)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->type();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->type();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_type)(fl_Sys_Menu_Bar sys_menu_bar,uchar t){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->type(t);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->type(t);
#endif
  }

  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_x)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->x();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->x();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_y)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->y();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->y();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_w)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->w();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->w();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_h)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->h();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->h();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_align)(fl_Sys_Menu_Bar sys_menu_bar, Fl_Align alignment){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->align(alignment);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->align(alignment);
#endif
  }
  FL_EXPORT_C(Fl_Align,Fl_Sys_Menu_Bar_align)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->align();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->align();
#endif
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Sys_Menu_Bar_box)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->box();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->box();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_box)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Boxtype new_box){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->box((static_cast<Fl_Boxtype>(new_box)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->box((static_cast<Fl_Boxtype>(new_box)));
#endif
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_color)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->color();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_color)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color bg){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color(bg);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->color(bg);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_color_with_bg_sel)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color bg,Fl_Color a){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->color(bg,a);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->color(bg,a);
#endif
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_selection_color)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->selection_color();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->selection_color();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_selection_color)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color a){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->selection_color(a);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->selection_color(a);
#endif
  }
  FL_EXPORT_C(const char*,Fl_Sys_Menu_Bar_label)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->label();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->label();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_label)(fl_Sys_Menu_Bar sys_menu_bar,const char* new_label){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy_label(new_label);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->copy_label(new_label);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_label)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->label(text);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->label(text);
#endif
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Sys_Menu_Bar_labeltype)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labeltype();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labeltype();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labeltype)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Labeltype a){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labeltype(a);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labeltype(a);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelcolor(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelcolor(c);
#endif
  }
  FL_EXPORT_C(Fl_Color ,Fl_Sys_Menu_Bar_labelcolor)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelcolor();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelcolor();
#endif
  }
  FL_EXPORT_C(Fl_Font,Fl_Sys_Menu_Bar_labelfont)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelfont();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelfont();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelfont)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Font c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelfont((static_cast<Fl_Font>(c)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelfont((static_cast<Fl_Font>(c)));
#endif
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Sys_Menu_Bar_labelsize)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelsize();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelsize();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_labelsize)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Fontsize pix){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->labelsize((static_cast<Fl_Fontsize>(pix)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->labelsize((static_cast<Fl_Fontsize>(pix)));
#endif
  }
  FL_EXPORT_C(fl_Image,Fl_Sys_Menu_Bar_image)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->image();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->image();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_image)(fl_Sys_Menu_Bar sys_menu_bar,fl_Image pix){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->image((static_cast<Fl_Image*>(pix)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->image((static_cast<Fl_Image*>(pix)));
#endif
  }
  FL_EXPORT_C(fl_Image,Fl_Sys_Menu_Bar_deimage)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deimage();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->deimage();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_deimage)(fl_Sys_Menu_Bar sys_menu_bar,fl_Image pix){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deimage((static_cast<Fl_Image*>(pix)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->deimage((static_cast<Fl_Image*>(pix)));
#endif
  }
  FL_EXPORT_C(const char*,Fl_Sys_Menu_Bar_tooltip)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->tooltip();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->tooltip();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_tooltip)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy_tooltip(text);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->copy_tooltip(text);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_tooltip)(fl_Sys_Menu_Bar sys_menu_bar,const char* text){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->tooltip(text);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->tooltip(text);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_callback_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Callback cb,void* p){
#if defined(__APPLE__)
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
#else
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Menu_Bar*>(sys_menu_bar));
#endif
    new C_to_Fl_Callback(castedMenu_, cb, p);
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_callback)(fl_Sys_Menu_Bar sys_menu_bar,fl_Callback cb){
#if defined(__APPLE__)
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
#else
    Fl_Menu_* castedMenu_ = (static_cast<Fl_Menu_Bar*>(sys_menu_bar));
#endif
    new C_to_Fl_Callback(castedMenu_, cb);
  }
  FL_EXPORT_C(void*,Fl_Sys_Menu_Bar_user_data)(fl_Sys_Menu_Bar sys_menu_bar){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
#if defined(__APPLE__)
	return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data();
#else
	return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->user_data();
#endif
    }
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_user_data)(fl_Sys_Menu_Bar sys_menu_bar,void* v){
      C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Menu_Item*>(sys_menu_bar))->user_data()));
      if (stored_cb) {
	stored_cb->set_user_data(v);
#if defined(__APPLE__)
	(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data(stored_cb);
#else
	(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->user_data(stored_cb);
#endif
      }
      else {
#if defined(__APPLE__)
	(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->user_data(v);
#else
	(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->user_data(v);
#endif
      }
    }
  FL_EXPORT_C(long,Fl_Sys_Menu_Bar_argument)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->argument();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->argument();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_argument)(fl_Sys_Menu_Bar sys_menu_bar,long v){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->argument(v);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->argument(v);
#endif
  }
  FL_EXPORT_C(Fl_When,Fl_Sys_Menu_Bar_when)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->when();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->when();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_when)(fl_Sys_Menu_Bar sys_menu_bar,uchar i){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->when(i);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->when(i);
#endif
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_visible)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_visible_r)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_r();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible_r();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_visible)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_visible)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_visible();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_visible();
#endif
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_active)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->active();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->active();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_active_r)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->active_r();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->active_r();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_activate)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->activate();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->activate();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_deactivate)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->deactivate();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->deactivate();
#endif
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_output)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->output();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->output();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_output)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->output();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->output();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_output)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_output();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_output();
#endif
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_takesevents)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->takesevents();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->takesevents();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_changed)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->changed();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->changed();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_changed)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_changed();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_changed();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_take_focus)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->take_focus();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->take_focus();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible_focus();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_visible_focus();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_visible_focus();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_modify_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar,int v){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus(v);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible_focus(v);
#endif
  }
  FL_EXPORT_C(unsigned int,Fl_Sys_Menu_Bar_visible_focus)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->visible_focus();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->visible_focus();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->do_callback();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback_with_widget_and_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w,long arg){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)),arg);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)),arg);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_do_callback_with_widget_and_default_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)));
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->do_callback((static_cast<Fl_Widget*>(w)));
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_contains)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->contains((static_cast<Fl_Widget*>(w)));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->contains((static_cast<Fl_Widget*>(w)));
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_inside)(fl_Sys_Menu_Bar sys_menu_bar,fl_Widget w){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->inside((static_cast<Fl_Widget*>(w)));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->inside((static_cast<Fl_Widget*>(w)));
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_redraw)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->redraw();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->redraw();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_redraw_label)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->redraw_label();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->redraw_label();
#endif
  }
  FL_EXPORT_C(uchar,Fl_Sys_Menu_Bar_damage)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->damage();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_damage_with_bitmask)(fl_Sys_Menu_Bar sys_menu_bar,uchar c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_damage(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_damage(c);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear_damage)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_damage();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_damage();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_damage_with_text)(fl_Sys_Menu_Bar sys_menu_bar,uchar c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->damage(c);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_damage_inside_widget)(fl_Sys_Menu_Bar sys_menu_bar,uchar c,int x,int y,int w,int h){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->damage(c,x,y,w,h);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->damage(c,x,y,w,h);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_draw_label_with_xywh_alignment)(fl_Sys_Menu_Bar sys_menu_bar,int x,int y,int w,int h,Fl_Align alignment){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->draw_label(x,y,w,h,alignment);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->draw_label(x,y,w,h,alignment);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_measure_label)(fl_Sys_Menu_Bar sys_menu_bar,int* ww,int* hh){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->measure_label(*ww,*hh);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->measure_label(*ww,*hh);
#endif
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar, Fl_Sys_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label) {
#if defined(__APPLE__)
    Fl_Sys_Menu_Bar* sys_menu_bar = new Fl_Sys_Menu_Bar(x,y,w,h,label);
#else
    Fl_Menu_Bar* sys_menu_bar = new Fl_Sys_Menu_Bar(x,y,w,h,label);
#endif
    return (static_cast<fl_Sys_Menu_Bar>(sys_menu_bar));
  }
  FL_EXPORT_C(fl_Sys_Menu_Bar, Fl_Sys_Menu_Bar_New)(int x, int y, int w, int h) {
#if defined(__APPLE__)
    Fl_Sys_Menu_Bar* sys_menu_bar = new Fl_Sys_Menu_Bar(x,y,w,h,0);
#else
    Fl_Menu_Bar* sys_menu_bar = new Fl_Sys_Menu_Bar(x,y,w,h,0);
#endif
    return (fl_Sys_Menu_Bar)sys_menu_bar;
  }
  FL_EXPORT_C(void   , Fl_Sys_Menu_Bar_Destroy)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    delete (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar));
#else
    delete (static_cast<Fl_Menu_Bar*>(sys_menu_bar));
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_item_pathname_with_finditem)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int namelen,fl_Menu_Item finditem){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen,(static_cast<Fl_Menu_Item*>(finditem)));
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_item_pathname)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int namelen){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->item_pathname(name,namelen);
#endif
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_picked)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
#if defined(__APPLE__)
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->picked((static_cast<Fl_Menu_Item*>(item)));
#else
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->picked((static_cast<Fl_Menu_Item*>(item)));
#endif
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_find_item_with_name)(fl_Sys_Menu_Bar sys_menu_bar,char* name){
#if defined(__APPLE__)
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_item(name);
#else
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->find_item(name);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_find_index_with_name)(fl_Sys_Menu_Bar sys_menu_bar,char* name){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_index(name);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->find_index(name);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_find_index_with_item)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->find_index((static_cast<Fl_Menu_Item*>(item)));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->find_index((static_cast<Fl_Menu_Item*>(item)));
#endif
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_test_shortcut)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->test_shortcut();
#else
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->test_shortcut();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_global)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->global();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->global();
#endif
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_menu)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->menu();
#else
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->menu();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_menu_with_m)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item* item, int size){
    Fl_Menu_Item* converted = convert(item,size);
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->menu(converted);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->menu(converted);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item m){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)));
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_copy_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item m,void* user_data){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->copy((static_cast<Fl_Menu_Item*>(m)),user_data);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,0);
#else
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,0);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert_with_flags)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut, flags);
#else
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),index,name,shortcut, flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_insert_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,int index,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
#if defined(__APPLE__)
    return callback_interceptor->menu_insert((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,flags);
#else
    return callback_interceptor->menu_insert((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),index,name,shortcut,flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_user_data)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,int shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_user_data)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,0);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_add_with_shortcutname_user_data_flags)(fl_Sys_Menu_Bar sys_menu_bar,char* name,char* shortcut,fl_Callback* cb,void* user_data,int flags){
    C_to_Fl_Callback* callback_interceptor = new C_to_Fl_Callback(cb, user_data);
#if defined(__APPLE__)
    return callback_interceptor->menu_add((static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#else
    return callback_interceptor->menu_add((static_cast<Fl_Menu_Bar*>(sys_menu_bar)),name,shortcut,flags);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_size)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->size();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->size();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_size)(fl_Sys_Menu_Bar sys_menu_bar,int W,int H){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->size(W,H);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->size(W,H);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_clear)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear();
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_clear_submenu)(fl_Sys_Menu_Bar sys_menu_bar,int index){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->clear_submenu(index);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->clear_submenu(index);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_replace)(fl_Sys_Menu_Bar sys_menu_bar,int i,char* name){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->replace(i,name);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->replace(i,name);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_remove)(fl_Sys_Menu_Bar sys_menu_bar,int i ){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->remove(i);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->remove(i);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_shortcut)(fl_Sys_Menu_Bar sys_menu_bar,int i,int s){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->shortcut(i,s);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->shortcut(i,s);
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_mode)(fl_Sys_Menu_Bar sys_menu_bar,int i,int fl){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mode(i,fl);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->mode(i,fl);
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_mode)(fl_Sys_Menu_Bar sys_menu_bar,int i){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mode(i);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->mode(i);
#endif
  }
  FL_EXPORT_C(fl_Menu_Item,Fl_Sys_Menu_Bar_mvalue)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (fl_Menu_Item)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->mvalue();
#else
    return (fl_Menu_Item)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->mvalue();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->value();
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value_with_item)(fl_Sys_Menu_Bar sys_menu_bar,fl_Menu_Item item){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value(static_cast<Fl_Menu_Item*>(item));
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->value(static_cast<Fl_Menu_Item*>(item));
#endif
  }
  FL_EXPORT_C(int,Fl_Sys_Menu_Bar_value_with_index)(fl_Sys_Menu_Bar sys_menu_bar,int index){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->value(index);
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->value(index);
#endif
  }
  FL_EXPORT_C(char*,Fl_Sys_Menu_Bar_text)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (char*)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->text();
#else
    return (char*)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->text();
#endif
  }
  FL_EXPORT_C(char*,Fl_Sys_Menu_Bar_text_with_index)(fl_Sys_Menu_Bar sys_menu_bar,int i){
#if defined(__APPLE__)
    return (char*)(static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->text(i);
#else
    return (char*)(static_cast<Fl_Menu_Bar*>(sys_menu_bar))->text(i);
#endif
  }
  FL_EXPORT_C(Fl_Font,Fl_Sys_Menu_Bar_textfont)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textfont();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textfont();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textfont)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Font c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textfont(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textfont(c);
#endif
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Sys_Menu_Bar_textsize)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textsize();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textsize();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textsize)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Fontsize c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textsize(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textsize(c);
#endif
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_textcolor)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textcolor();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textcolor();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_textcolor)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Color c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->textcolor(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->textcolor(c);
#endif
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Sys_Menu_Bar_down_box)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_box();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->down_box();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_down_box)(fl_Sys_Menu_Bar sys_menu_bar,Fl_Boxtype b){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_box(b);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->down_box(b);
#endif
  }
  FL_EXPORT_C(Fl_Color,Fl_Sys_Menu_Bar_down_color)(fl_Sys_Menu_Bar sys_menu_bar){
#if defined(__APPLE__)
    return (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_color();
#else
    return (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->down_color();
#endif
  }
  FL_EXPORT_C(void,Fl_Sys_Menu_Bar_set_down_color)(fl_Sys_Menu_Bar sys_menu_bar,unsigned c){
#if defined(__APPLE__)
    (static_cast<Fl_Sys_Menu_Bar*>(sys_menu_bar))->down_color(c);
#else
    (static_cast<Fl_Menu_Bar*>(sys_menu_bar))->down_color(c);
#endif
  }
#ifdef __cplusplus
}
#endif
