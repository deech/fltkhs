#ifndef __FL_WIZARD_C__
#define __FL_WIZARD_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Wizard.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedWizard : public Fl_Wizard {
    fl_Widget_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    virtual void draw();
    void draw_super();
    virtual int handle(int event);
    int handle_super(int event);
    virtual void resize(int x, int y, int w, int h);
    void resize_super(int x, int y, int w, int h);
    virtual void show();
    void show_super();
    virtual void hide();
    void hide_super();
    Fl_DerivedWizard(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedWizard(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedWizard();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Wizard_handle)(fl_Wizard wizard, int event);
  FL_EXPORT_C(fl_Group,     Fl_Wizard_parent)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_parent)(fl_Wizard wizard, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Wizard_type)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_type)(fl_Wizard wizard, uchar t);

  FL_EXPORT_C(int,          Fl_Wizard_x)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_y)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_w)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_h)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_align)(fl_Wizard wizard, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Wizard_align)(fl_Wizard wizard);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Wizard_box)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_box)(fl_Wizard wizard, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Wizard_color)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_color)(fl_Wizard wizard, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Wizard_set_color_with_bg_sel)(fl_Wizard wizard,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Wizard_selection_color)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_selection_color)(fl_Wizard wizard, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Wizard_label)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_copy_label)(fl_Wizard wizard, const char* new_label);
  FL_EXPORT_C(void,         Fl_Wizard_set_label)(fl_Wizard wizard, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Wizard_labeltype)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_labeltype)(fl_Wizard wizard, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Wizard_labelcolor)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_labelcolor)(fl_Wizard wizard, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Wizard_item_labelfont)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_item_labelfont)(fl_Wizard wizard, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Wizard_item_labelsize)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_item_labelsize)(fl_Wizard wizard, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Wizard_image)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_image)(fl_Wizard wizard, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Wizard_deimage)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_deimage)(fl_Wizard wizard, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Wizard_tooltip)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_copy_tooltip)(fl_Wizard wizard, const char* text);
  FL_EXPORT_C(void,         Fl_Wizard_set_tooltip)(fl_Wizard wizard, const char* text);
  FL_EXPORT_C(void,         Fl_Wizard_set_callback_with_user_data)(fl_Wizard wizard, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Wizard_set_callback)(fl_Wizard wizard, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Wizard_other_data)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_other_data)(fl_Wizard wizard, void* v);
  FL_EXPORT_C(void*,        Fl_Wizard_user_data)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_user_data)(fl_Wizard wizard, void* v);
  FL_EXPORT_C(long,         Fl_Wizard_argument)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_argument)(fl_Wizard wizard, long v);
  FL_EXPORT_C(Fl_When,      Fl_Wizard_when)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_when)(fl_Wizard wizard, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Wizard_visible)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_visible_r)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_show_super)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_show)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_hide_super)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_hide)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_visible)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_clear_visible)(fl_Wizard wizard);
  FL_EXPORT_C(unsigned int, Fl_Wizard_active)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_active_r)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_activate)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_deactivate)(fl_Wizard wizard);
  FL_EXPORT_C(unsigned int, Fl_Wizard_output)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_output)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_clear_output)(fl_Wizard wizard);
  FL_EXPORT_C(unsigned int, Fl_Wizard_takesevents)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_changed)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_clear_changed)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_take_focus)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_visible_focus)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_clear_visible_focus)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_modify_visible_focus)(fl_Wizard wizard, int v);
  FL_EXPORT_C(unsigned int, Fl_Wizard_visible_focus)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_contains)(fl_Wizard wizard, fl_Group w);
  FL_EXPORT_C(int,          Fl_Wizard_inside)(fl_Wizard wizard, fl_Group w);
  FL_EXPORT_C(void,         Fl_Wizard_redraw)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_redraw_label)(fl_Wizard wizard);
  FL_EXPORT_C(uchar,        Fl_Wizard_damage)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_clear_damage_with_bitmask)(fl_Wizard wizard, uchar c);
  FL_EXPORT_C(void,         Fl_Wizard_clear_damage)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_damage_with_text)(fl_Wizard wizard, uchar c);
  FL_EXPORT_C(void,         Fl_Wizard_damage_inside_group)(fl_Wizard wizard, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Wizard_draw_label_with_xywh_alignment)(fl_Wizard wizard, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Wizard_measure_label)(fl_Wizard wizard, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Wizard_window)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Window,    Fl_Wizard_top_window)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Window ,   Fl_Wizard_top_window_offset)(fl_Wizard wizard, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Wizard_as_group_super)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Group,     Fl_Wizard_as_group)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Gl_Window, Fl_Wizard_as_gl_window_super)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Gl_Window, Fl_Wizard_as_gl_window)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_resize_super)(fl_Wizard wizard,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Wizard_resize)(fl_Wizard wizard,int X, int Y, int W, int H);

  /* Inherited from Fl_Group*/
  FL_EXPORT_C(void,         Fl_Wizard_begin)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_end)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_find)(fl_Wizard wizard, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Wizard_add)(fl_Wizard wizard, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Wizard_insert)(fl_Wizard wizard, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Wizard_remove_index)(fl_Wizard wizard, int index);
  FL_EXPORT_C(void,         Fl_Wizard_remove_widget)(fl_Wizard wizard, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Wizard_clear)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_resizable_by_reference)(fl_Wizard wizard,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Wizard_set_resizable)(fl_Wizard wizard,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Wizard_resizable)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_add_resizable)(fl_Wizard wizard,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Wizard_init_sizes)(fl_Wizard wizard);
  FL_EXPORT_C(int,          Fl_Wizard_children)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_set_clip_children)(fl_Wizard wizard,int c);
  FL_EXPORT_C(unsigned int, Fl_Wizard_clip_children)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_focus)(fl_Wizard wizard,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Wizard__ddfdesign_kludge)(fl_Wizard wizard);
  FL_EXPORT_C(void,         Fl_Wizard_insert_with_before)(fl_Wizard self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Wizard_array)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Widget,    Fl_Wizard_child)(fl_Wizard wizard, int n);


  /* Fl_Wizard Specific */
  FL_EXPORT_C(void, Fl_Wizard_next)(fl_Wizard wizard);
  FL_EXPORT_C(void, Fl_Wizard_prev)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Widget,Fl_Wizard_value)(fl_Wizard wizard);
  FL_EXPORT_C(void, Fl_Wizard_set_value)(fl_Wizard wizard, fl_Widget w);
  FL_EXPORT_C(fl_Wizard,     Fl_Wizard_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Wizard,     Fl_Wizard_New_WithLabel)(int x, int y, int w, int h, const char* t);
  FL_EXPORT_C(void,          Fl_Wizard_Destroy)(fl_Wizard wizard);
  FL_EXPORT_C(fl_Wizard,    Fl_OverriddenWizard_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Wizard,    Fl_OverriddenWizard_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Wizard_draw)(fl_Wizard o);
  FL_EXPORT_C(void, Fl_Wizard_draw_super)(fl_Wizard o);
  FL_EXPORT_C(int, Fl_Wizard_handle)(fl_Wizard o, int event);
  FL_EXPORT_C(int, Fl_Wizard_handle_super)(fl_Wizard o, int event);
  FL_EXPORT_C(void, Fl_Wizard_resize)(fl_Wizard o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Wizard_resize_super)(fl_Wizard o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Wizard_show)(fl_Wizard o);
  FL_EXPORT_C(void, Fl_Wizard_show_super)(fl_Wizard o);
  FL_EXPORT_C(void, Fl_Wizard_hide)(fl_Wizard o);
  FL_EXPORT_C(void, Fl_Wizard_hide_super)(fl_Wizard o);

#ifdef __cplusplus
}
#endif
#endif /* __FL_WIZARD_C__ */
