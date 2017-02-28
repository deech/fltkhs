#include "Fl_WizardC.h"
#ifdef __cplusplus
#include <FL/Fl_Wizard.H>
#include <FL/Fl_Window.H>
#include <FL/fl_draw.H>
EXPORT {
  Fl_DerivedWizard::Fl_DerivedWizard(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs) : Fl_Wizard(X,Y,W,H,l){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedWizard::Fl_DerivedWizard(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs):Fl_Wizard(X,Y,W,H){
    overriddenFuncs = funcs;
    other_data = (void*)0;
  }
  Fl_DerivedWizard::~Fl_DerivedWizard(){
    free(overriddenFuncs);
  }
  void Fl_DerivedWizard::draw(){
    if (this->overriddenFuncs->draw != NULL) {
      this->overriddenFuncs->draw((fl_Wizard) this);
    }
    else {
      draw_super();
    }
  }

  void Fl_DerivedWizard::draw_super(){
    Fl_Widget	*kid;	// Visible child


    kid = value();

    if (damage() & FL_DAMAGE_ALL)
      {
        // Redraw everything...
        if (kid)
          {
            draw_box(box(), x(), y(), w(), h(), kid->color());
            draw_child(*kid);
          }
        else
          draw_box(box(), x(), y(), w(), h(), color());

      }
    else if (kid)
      update_child(*kid);
  }

  int Fl_DerivedWizard::handle(int event){
    int i;
    if (this->overriddenFuncs->handle != NULL) {
      i = this->overriddenFuncs->handle((fl_Wizard) this,event);
    }
    else {
      i = Fl_Wizard::handle(event);
    }
    return i;
  }
  int Fl_DerivedWizard::handle_super(int event){
    return Fl_Wizard::handle(event);
  }

  void Fl_DerivedWizard::resize(int x, int y, int w, int h){
    if (this->overriddenFuncs->resize != NULL) {
      this->overriddenFuncs->resize((fl_Wizard) this,x,y,w,h);
    }
    else {
      Fl_Wizard::resize(x,y,w,h);
    }
  }

  void Fl_DerivedWizard::resize_super(int x, int y, int w, int h){
    Fl_Wizard::resize(x,y,w,h);
  }
  void Fl_DerivedWizard::show(){
    if (this->overriddenFuncs->show != NULL) {
      this->overriddenFuncs->show((fl_Wizard) this);
    }
    else {
      Fl_Wizard::show();
    }
  }
  void Fl_DerivedWizard::show_super(){
    Fl_Wizard::show();
  }

  void Fl_DerivedWizard::hide(){
    if (this->overriddenFuncs->hide != NULL) {
      this->overriddenFuncs->hide((fl_Wizard) this);
    }
    else {
      Fl_Wizard::hide();
    }
  }
  void Fl_DerivedWizard::hide_super(){
    Fl_Wizard::hide();
  }


#endif
  FL_EXPORT_C(fl_Group,Fl_Wizard_parent)(fl_Wizard wizard){
    return (fl_Group) (fl_Group)(static_cast<Fl_Wizard*>(wizard))->parent();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_parent)(fl_Wizard wizard,fl_Group grp){
    (static_cast<Fl_Wizard*>(wizard))->parent((static_cast<Fl_Wizard*>(grp)));
  }
  FL_EXPORT_C(uchar,Fl_Wizard_type)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->type();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_type)(fl_Wizard wizard,uchar t){
    (static_cast<Fl_Wizard*>(wizard))->type(t);
  }

  FL_EXPORT_C(int,Fl_Wizard_x)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->x();
  }
  FL_EXPORT_C(int,Fl_Wizard_y)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->y();
  }
  FL_EXPORT_C(int,Fl_Wizard_w)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->w();
  }
  FL_EXPORT_C(int,Fl_Wizard_h)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->h();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_align)(fl_Wizard wizard, Fl_Align alignment){
    (static_cast<Fl_Wizard*>(wizard))->align(alignment);
  }
  FL_EXPORT_C(Fl_Align,Fl_Wizard_align)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->align();
  }
  FL_EXPORT_C(Fl_Boxtype,Fl_Wizard_box)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->box();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_box)(fl_Wizard wizard,Fl_Boxtype new_box){
    (static_cast<Fl_Wizard*>(wizard))->box((static_cast<Fl_Boxtype>(new_box)));
  }
  FL_EXPORT_C(Fl_Color,Fl_Wizard_color)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->color();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_color)(fl_Wizard wizard,Fl_Color bg){
    (static_cast<Fl_Wizard*>(wizard))->color(bg);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_color_with_bg_sel)(fl_Wizard wizard,Fl_Color bg,Fl_Color a){
    (static_cast<Fl_Wizard*>(wizard))->color(bg,a);
  }
  FL_EXPORT_C(Fl_Color,Fl_Wizard_selection_color)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->selection_color();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_selection_color)(fl_Wizard wizard,Fl_Color a){
    (static_cast<Fl_Wizard*>(wizard))->selection_color(a);
  }
  FL_EXPORT_C(const char*,Fl_Wizard_label)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->label();
  }
  FL_EXPORT_C(void,Fl_Wizard_copy_label)(fl_Wizard wizard,const char* new_label){
    (static_cast<Fl_Wizard*>(wizard))->copy_label(new_label);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_label)(fl_Wizard wizard,const char* text){
    (static_cast<Fl_Wizard*>(wizard))->label(text);
  }
  FL_EXPORT_C(Fl_Labeltype,Fl_Wizard_labeltype)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->labeltype();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_labeltype)(fl_Wizard wizard,Fl_Labeltype a){
    (static_cast<Fl_Wizard*>(wizard))->labeltype(a);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_labelcolor)(fl_Wizard wizard,Fl_Color c){
    (static_cast<Fl_Wizard*>(wizard))->labelcolor(c);
  }
  FL_EXPORT_C(Fl_Color ,Fl_Wizard_labelcolor)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->labelcolor();
  }
  FL_EXPORT_C(Fl_Font,Fl_Wizard_labelfont)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->labelfont();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_labelfont)(fl_Wizard wizard,Fl_Font c){
    (static_cast<Fl_Wizard*>(wizard))->labelfont((static_cast<Fl_Font>(c)));
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Wizard_labelsize)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->labelsize();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_labelsize)(fl_Wizard wizard,Fl_Fontsize pix){
    (static_cast<Fl_Wizard*>(wizard))->labelsize((static_cast<Fl_Fontsize>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Wizard_image)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->image();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_image)(fl_Wizard wizard,fl_Image pix){
    (static_cast<Fl_Wizard*>(wizard))->image((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(fl_Image,Fl_Wizard_deimage)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->deimage();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_deimage)(fl_Wizard wizard,fl_Image pix){
    (static_cast<Fl_Wizard*>(wizard))->deimage((static_cast<Fl_Image*>(pix)));
  }
  FL_EXPORT_C(const char*,Fl_Wizard_tooltip)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->tooltip();
  }
  FL_EXPORT_C(void,Fl_Wizard_copy_tooltip)(fl_Wizard wizard,const char* text){
    (static_cast<Fl_Wizard*>(wizard))->copy_tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_tooltip)(fl_Wizard wizard,const char* text){
    (static_cast<Fl_Wizard*>(wizard))->tooltip(text);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_callback_with_user_data)(fl_Wizard wizard,fl_Callback* cb,void* p){
    Fl_Group* castedWindow = (static_cast<Fl_Wizard*>(wizard));
    new C_to_Fl_Callback(castedWindow, cb, p);
  }
  FL_EXPORT_C(void,Fl_Wizard_set_callback)(fl_Wizard wizard,fl_Callback* cb){
    Fl_Group* castedWindow = (static_cast<Fl_Wizard*>(wizard));
    new C_to_Fl_Callback(castedWindow, cb);
  }
  FL_EXPORT_C(void*,Fl_Wizard_user_data)(fl_Wizard wizard){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Wizard*>(wizard))->user_data()));
    if(stored_cb){
      return stored_cb->get_user_data();
    }
    else {
      return (static_cast<Fl_Wizard*>(wizard))->user_data();
    }
  }
  FL_EXPORT_C(void,Fl_Wizard_set_user_data)(fl_Wizard wizard,void* v){
    C_to_Fl_Callback* stored_cb = (static_cast<C_to_Fl_Callback*>((static_cast<Fl_Wizard*>(wizard))->user_data()));
    if (stored_cb) {
      stored_cb->set_user_data(v);
      (static_cast<Fl_Wizard*>(wizard))->user_data(stored_cb);
    }
    else {
      (static_cast<Fl_Wizard*>(wizard))->user_data(v);
    }
  }
  FL_EXPORT_C(long,Fl_Wizard_argument)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->argument();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_argument)(fl_Wizard wizard,long v){
    (static_cast<Fl_Wizard*>(wizard))->argument(v);
  }
  FL_EXPORT_C(Fl_When,Fl_Wizard_when)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->when();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_when)(fl_Wizard wizard,uchar i){
    (static_cast<Fl_Wizard*>(wizard))->when(i);
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_visible)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->visible();
  }
  FL_EXPORT_C(int,Fl_Wizard_visible_r)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->visible_r();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_visible)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->visible();
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_visible)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear_visible();
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_active)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->active();
  }
  FL_EXPORT_C(int,Fl_Wizard_active_r)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->active_r();
  }
  FL_EXPORT_C(void,Fl_Wizard_activate)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->activate();
  }
  FL_EXPORT_C(void,Fl_Wizard_deactivate)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->deactivate();
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_output)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->output();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_output)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->output();
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_output)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear_output();
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_takesevents)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->takesevents();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_changed)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->changed();
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_changed)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear_changed();
  }
  FL_EXPORT_C(int,Fl_Wizard_take_focus)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->take_focus();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_visible_focus)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->set_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_visible_focus)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear_visible_focus();
  }
  FL_EXPORT_C(void,Fl_Wizard_modify_visible_focus)(fl_Wizard wizard,int v){
    (static_cast<Fl_Wizard*>(wizard))->visible_focus(v);
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_visible_focus)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->visible_focus();
  }
  FL_EXPORT_C(void,Fl_Wizard_do_callback)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->do_callback();
  }
  FL_EXPORT_C(void,Fl_Wizard_do_callback_with_widget_and_user_data)(fl_Wizard wizard,fl_Widget w,long arg){
    (static_cast<Fl_Wizard*>(wizard))->do_callback((static_cast<Fl_Widget*>(w)),arg);
  }
  FL_EXPORT_C(void,Fl_Wizard_do_callback_with_widget_and_default_user_data)(fl_Wizard wizard,fl_Widget w){
    (static_cast<Fl_Wizard*>(wizard))->do_callback((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Wizard_contains)(fl_Wizard wizard,fl_Widget w){
    return (static_cast<Fl_Wizard*>(wizard))->contains((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(int,Fl_Wizard_inside)(fl_Wizard wizard,fl_Widget w){
    return (static_cast<Fl_Wizard*>(wizard))->inside((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Wizard_redraw)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->redraw();
  }
  FL_EXPORT_C(void,Fl_Wizard_redraw_label)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->redraw_label();
  }
  FL_EXPORT_C(uchar,Fl_Wizard_damage)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->damage();
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_damage_with_bitmask)(fl_Wizard wizard,uchar c){
    (static_cast<Fl_Wizard*>(wizard))->clear_damage(c);
  }
  FL_EXPORT_C(void,Fl_Wizard_clear_damage)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear_damage();
  }
  FL_EXPORT_C(void,Fl_Wizard_damage_with_text)(fl_Wizard wizard,uchar c){
    (static_cast<Fl_Wizard*>(wizard))->damage(c);
  }
  FL_EXPORT_C(void,Fl_Wizard_damage_inside_widget)(fl_Wizard wizard,uchar c,int x,int y,int w,int h){
    (static_cast<Fl_Wizard*>(wizard))->damage(c,x,y,w,h);
  }
  FL_EXPORT_C(void,Fl_Wizard_draw_label_with_xywh_alignment)(fl_Wizard wizard,int x,int y,int w,int h,Fl_Align alignment){
    (static_cast<Fl_Wizard*>(wizard))->draw_label(x,y,w,h,alignment);
  }
  FL_EXPORT_C(void,Fl_Wizard_measure_label)(fl_Wizard wizard,int* ww,int* hh){
    (static_cast<Fl_Wizard*>(wizard))->measure_label(*ww,*hh);
  }
  FL_EXPORT_C(fl_Window,    Fl_Wizard_window)(fl_Wizard wizard){
    return (fl_Window) (static_cast<Fl_Wizard*>(wizard))->window();
  }
  FL_EXPORT_C(fl_Window,    Fl_Wizard_top_window)(fl_Wizard wizard){
    return (fl_Window) (static_cast<Fl_Wizard*>(wizard))->top_window();
  }
  FL_EXPORT_C(fl_Window ,   Fl_Wizard_top_window_offset)(fl_Wizard wizard, int* xoff, int* yoff){
    return (fl_Window) (static_cast<Fl_Wizard*>(wizard))->top_window_offset(*xoff,*yoff);
  }
  FL_EXPORT_C(fl_Group,Fl_Wizard_as_group)(fl_Wizard wizard){
    return (fl_Group) (static_cast<Fl_Wizard*>(wizard))->as_group();
  }
  FL_EXPORT_C(fl_Gl_Window,Fl_Wizard_as_gl_window)(fl_Wizard wizard){
    return (fl_Gl_Window) (static_cast<Fl_Wizard*>(wizard))->as_gl_window();
  }

  FL_EXPORT_C(void,Fl_Wizard_begin)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->begin();
  }
  FL_EXPORT_C(void,Fl_Wizard_end)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->end();
  }
  FL_EXPORT_C(int,Fl_Wizard_find)(fl_Wizard wizard,fl_Widget w){
    return (static_cast<Fl_Wizard*>(wizard))->find(static_cast<Fl_Widget*>(w));
  }
  FL_EXPORT_C(void,Fl_Wizard_add)(fl_Wizard wizard,fl_Widget w){
    (static_cast<Fl_Wizard*>(wizard))->add((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Wizard_insert)(fl_Wizard wizard,fl_Widget w,int i){
    (static_cast<Fl_Wizard*>(wizard))->insert(*(static_cast<Fl_Widget*>(w)),i);
  }
  FL_EXPORT_C(void,Fl_Wizard_remove_index)(fl_Wizard wizard,int index){
    (static_cast<Fl_Wizard*>(wizard))->remove(index);
  }
  FL_EXPORT_C(void,Fl_Wizard_remove_widget)(fl_Wizard wizard,fl_Widget w){
    (static_cast<Fl_Wizard*>(wizard))->remove((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_Wizard_clear)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->clear();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_resizable_by_reference)(fl_Wizard wizard,fl_Widget o){
    (static_cast<Fl_Wizard*>(wizard))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Wizard_set_resizable)(fl_Wizard wizard,fl_Widget o){
    (static_cast<Fl_Wizard*>(wizard))->resizable((static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Wizard_resizable)(fl_Wizard wizard){
    return (fl_Widget)(static_cast<Fl_Wizard*>(wizard))->resizable();
  }
  FL_EXPORT_C(void,Fl_Wizard_add_resizable)(fl_Wizard wizard,fl_Widget o){
    return (static_cast<Fl_Wizard*>(wizard))->add_resizable(*(static_cast<Fl_Widget*>(o)));
  }
  FL_EXPORT_C(void,Fl_Wizard_init_sizes)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->init_sizes();
  }
  FL_EXPORT_C(int,Fl_Wizard_children)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->children();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_clip_children)(fl_Wizard wizard,int c){
    return (static_cast<Fl_Wizard*>(wizard))->clip_children(c);
  }
  FL_EXPORT_C(unsigned int,Fl_Wizard_clip_children)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->clip_children();
  }
  FL_EXPORT_C(void,Fl_Wizard_focus)(fl_Wizard wizard, fl_Widget W){
    return (static_cast<Fl_Wizard*>(wizard))->focus((static_cast<Fl_Widget*>(W)));
  }
  FL_EXPORT_C(fl_Widget,Fl_Wizard__ddfdesign_kludge)(fl_Wizard wizard){
    return (static_cast<Fl_Wizard*>(wizard))->_ddfdesign_kludge();
  }
  FL_EXPORT_C(void, Fl_Wizard_insert_with_before)(fl_Wizard wizard, fl_Widget w, fl_Widget before){
    (static_cast<Fl_Wizard*>(wizard))->insert(*(static_cast<Fl_Widget*>(w)),(static_cast<Fl_Widget*>(before)));
  }
  FL_EXPORT_C(fl_Widget*, Fl_Wizard_array)(fl_Wizard wizard){
    return (fl_Widget*)(static_cast<Fl_Wizard*>(wizard))->array();
  }
  FL_EXPORT_C(fl_Widget, Fl_Wizard_child)(fl_Wizard wizard, int n){
    return (fl_Widget)(static_cast<Fl_Wizard*>(wizard))->child(n);
  }
  FL_EXPORT_C(void, Fl_Wizard_Destroy)(fl_Wizard wizard){
    delete (static_cast<Fl_Wizard*>(wizard));
  }
  FL_EXPORT_C(void,Fl_Wizard_next)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->next();
  }
  FL_EXPORT_C(void,Fl_Wizard_prev)(fl_Wizard wizard){
    (static_cast<Fl_Wizard*>(wizard))->prev();
  }
  FL_EXPORT_C(fl_Widget,Fl_Wizard_value)(fl_Wizard wizard){
    return (fl_Widget) (static_cast<Fl_Wizard*>(wizard))->value();
  }
  FL_EXPORT_C(void,Fl_Wizard_set_value)(fl_Wizard wizard,fl_Widget w){
    (static_cast<Fl_Wizard*>(wizard))->value((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(fl_Wizard,    Fl_Wizard_New)(int X, int Y, int W, int H){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedWizard* w = new Fl_DerivedWizard(X,Y,W,H,fs);
    return (fl_Wizard)w;
  }
  FL_EXPORT_C(fl_Wizard,    Fl_Wizard_New_WithLabel)(int X, int Y, int W, int H, const char* label){
    fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
    Fl_DerivedWizard* w = new Fl_DerivedWizard(X,Y,W,H,label,fs);
    return (fl_Wizard)w;
  }
  FL_EXPORT_C(fl_Wizard,    Fl_OverriddenWizard_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedWizard* w = new Fl_DerivedWizard(X,Y,W,H,fs);
    return (fl_Wizard)w;
  }
  FL_EXPORT_C(fl_Wizard,    Fl_OverriddenWizard_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs){
    Fl_DerivedWizard* w = new Fl_DerivedWizard(X,Y,W,H,label,fs);
    return (fl_Wizard)w;
  }
  FL_EXPORT_C(void, Fl_Wizard_draw)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->draw();
  }
  FL_EXPORT_C(void, Fl_Wizard_draw_super)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->draw_super();
  }
  FL_EXPORT_C(int, Fl_Wizard_handle)(fl_Wizard o, int event){
    return (static_cast<Fl_DerivedWizard*>(o))->handle(event);
  }
  FL_EXPORT_C(int, Fl_Wizard_handle_super)(fl_Wizard o, int event){
    return (static_cast<Fl_DerivedWizard*>(o))->handle_super(event);
  }
  FL_EXPORT_C(void, Fl_Wizard_resize)(fl_Wizard o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedWizard*>(o))->resize(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Wizard_resize_super)(fl_Wizard o, int x, int y, int w, int h){
    (static_cast<Fl_DerivedWizard*>(o))->resize_super(x,y,w,h);
  }
  FL_EXPORT_C(void, Fl_Wizard_show)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->show();
  }
  FL_EXPORT_C(void, Fl_Wizard_show_super)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->show_super();
  }
  FL_EXPORT_C(void, Fl_Wizard_hide)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->hide();
  }
  FL_EXPORT_C(void, Fl_Wizard_hide_super)(fl_Wizard o){
    (static_cast<Fl_DerivedWizard*>(o))->hide_super();
  }

#ifdef __cplusplus
}
#endif
