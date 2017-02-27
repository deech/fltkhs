#ifndef __FL_GROUP_C__
#define __FL_GROUP_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Group.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedGroup : public Fl_Group {
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
    void draw_child(Fl_Widget* widget);
    void draw_children();
    void draw_outside_label(Fl_Widget* widget);
    void update_child(Fl_Widget* widget);
    Fl_DerivedGroup(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedGroup(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedGroup();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Group_handle)(fl_Group self, int event);
  FL_EXPORT_C(int,          Fl_Group_handle_super)(fl_Group self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Group_parent)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_parent)(fl_Group group, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Group_type)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_type)(fl_Group group, uchar t);

  FL_EXPORT_C(int,          Fl_Group_x)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_y)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_w)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_h)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_align)(fl_Group group, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Group_align)(fl_Group group);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Group_box)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_box)(fl_Group group, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Group_color)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_color)(fl_Group group, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Group_set_color_with_bg_sel)(fl_Group group,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Group_selection_color)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_selection_color)(fl_Group group, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Group_label)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_copy_label)(fl_Group group, const char* new_label);
  FL_EXPORT_C(void,         Fl_Group_set_label)(fl_Group group, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Group_labeltype)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_labeltype)(fl_Group group, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Group_labelcolor)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_labelcolor)(fl_Group group, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Group_item_labelfont)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_item_labelfont)(fl_Group group, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Group_item_labelsize)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_item_labelsize)(fl_Group group, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Group_image)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_image)(fl_Group group, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Group_deimage)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_deimage)(fl_Group group, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Group_tooltip)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_copy_tooltip)(fl_Group group, const char* text);
  FL_EXPORT_C(void,         Fl_Group_set_tooltip)(fl_Group group, const char* text);
  FL_EXPORT_C(void,         Fl_Group_set_callback_with_user_data)(fl_Group group, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Group_set_callback)(fl_Group group, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Group_other_data)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_other_data)(fl_Group group, void* v);
  FL_EXPORT_C(void*,        Fl_Group_user_data)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_user_data)(fl_Group group, void* v);
  FL_EXPORT_C(long,         Fl_Group_argument)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_argument)(fl_Group group, long v);
  FL_EXPORT_C(Fl_When,      Fl_Group_when)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_when)(fl_Group group, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Group_visible)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_visible_r)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_show_super)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_show)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_hide_super)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_hide)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_visible)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_clear_visible)(fl_Group group);
  FL_EXPORT_C(unsigned int, Fl_Group_active)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_active_r)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_activate)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_deactivate)(fl_Group group);
  FL_EXPORT_C(unsigned int, Fl_Group_output)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_output)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_clear_output)(fl_Group group);
  FL_EXPORT_C(unsigned int, Fl_Group_takesevents)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_changed)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_clear_changed)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_take_focus)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_visible_focus)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_clear_visible_focus)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_modify_visible_focus)(fl_Group group, int v);
  FL_EXPORT_C(unsigned int, Fl_Group_visible_focus)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_contains)(fl_Group group, fl_Group w);
  FL_EXPORT_C(int,          Fl_Group_inside)(fl_Group group, fl_Group w);
  FL_EXPORT_C(void,         Fl_Group_redraw)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_redraw_label)(fl_Group group);
  FL_EXPORT_C(uchar,        Fl_Group_damage)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_clear_damage_with_bitmask)(fl_Group group, uchar c);
  FL_EXPORT_C(void,         Fl_Group_clear_damage)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_damage_with_text)(fl_Group group, uchar c);
  FL_EXPORT_C(void,         Fl_Group_damage_inside_group)(fl_Group group, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Group_draw_label_with_xywh_alignment)(fl_Group group, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Group_measure_label)(fl_Group group, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Group_window)(fl_Group group);
  FL_EXPORT_C(fl_Window,    Fl_Group_top_window)(fl_Group group);
  FL_EXPORT_C(fl_Window ,   Fl_Group_top_window_offset)(fl_Group group, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Group_as_group_super)(fl_Group group);
  FL_EXPORT_C(fl_Group,     Fl_Group_as_group)(fl_Group group);
  FL_EXPORT_C(fl_Gl_Window, Fl_Group_as_gl_window_super)(fl_Group group);
  FL_EXPORT_C(fl_Gl_Window, Fl_Group_as_gl_window)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_resize_super)(fl_Group group,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Group_resize)(fl_Group group,int X, int Y, int W, int H);
  FL_EXPORT_C(void ,Fl_Group_resize_super)(fl_Group self, int x, int y, int w, int h);

  /* Fl_Group static members */
  FL_EXPORT_C(fl_Group,Fl_Group_current)();
  FL_EXPORT_C(void ,   Fl_Group_set_current)(fl_Group g);

  /* Fl_Group specific */
  FL_EXPORT_C(void,         Fl_Group_draw_child)(fl_Group group, fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Group_draw_children)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_draw_outside_label)(fl_Group group, fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Group_update_child)(fl_Group group, fl_Widget widget);
  FL_EXPORT_C(void,         Fl_Group_begin)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_draw)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_draw_super)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_end)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_find)(fl_Group group, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Group_add)(fl_Group group, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Group_insert)(fl_Group group, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Group_remove_index)(fl_Group group, int index);
  FL_EXPORT_C(void,         Fl_Group_remove_widget)(fl_Group group, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Group_clear)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_resizable_by_reference)(fl_Group group,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Group_set_resizable)(fl_Group group,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Group_resizable)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_add_resizable)(fl_Group group,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Group_init_sizes)(fl_Group group);
  FL_EXPORT_C(int,          Fl_Group_children)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_set_clip_children)(fl_Group group,int c);
  FL_EXPORT_C(unsigned int, Fl_Group_clip_children)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_focus)(fl_Group group,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Group__ddfdesign_kludge)(fl_Group group);
  FL_EXPORT_C(void,         Fl_Group_insert_with_before)(fl_Group self, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Group_array)(fl_Group self);
  FL_EXPORT_C(fl_Widget,    Fl_Group_child)(fl_Group self, int n);
  FL_EXPORT_C(fl_Group,     Fl_Group_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Group,     Fl_Group_New_WithLabel)(int x, int y, int w, int h, const char* t);
  FL_EXPORT_C(fl_Group,    Fl_OverriddenGroup_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Group,    Fl_OverriddenGroup_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void,         Fl_Group_Destroy)(fl_Group group);
#ifdef __cplusplus
}
#endif
#endif /* __FL_GROUP_C__ */
