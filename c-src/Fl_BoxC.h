#ifndef __FL_BOX_C__
#define __FL_BOX_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Box is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Box.H"
#include "Fl_CallbackC.h"
EXPORT {
  class Fl_DerivedBox : public Fl_Box {
    fl_Box_Virtual_Funcs* overriddenFuncs;
    void* other_data;
  public:
    void* get_other_data();
    void set_other_data(void*);
    void destroy_data();
    void draw_super();
    void draw_box();
    void draw_box(Fl_Boxtype t, Fl_Color c);
    void draw_box(Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
    void draw_backdrop();
    void draw_focus();
    void draw_focus(Fl_Boxtype t, int x,int y,int w,int h);
    void draw_label();
    void draw_label(int x,int y,int w,int h,Fl_Align alignment);
    virtual void draw();
    virtual int handle(int event);
    void resize_super(int x, int y, int w, int h);
    virtual void resize(int x, int y, int w, int h);
    virtual void show();
    virtual void hide();
    virtual Fl_Window* as_window();
    virtual Fl_Gl_Window* as_gl_window();
    Fl_DerivedBox(int X, int Y, int W, int H, const char *l, fl_Box_Virtual_Funcs* funcs);
    Fl_DerivedBox(int X, int Y, int W, int H, fl_Box_Virtual_Funcs* funcs);
    Fl_DerivedBox(Fl_Boxtype b, int X, int Y, int W, int H, const char* l, fl_Box_Virtual_Funcs* funcs);
    ~Fl_DerivedBox();
  };
#endif
  FL_EXPORT_C(void, Fl_Box_draw_super)(fl_Box box);
  FL_EXPORT_C(int,Fl_Box_handle)(fl_Widget self, int event);
  FL_EXPORT_C(int,Fl_Box_handle_super)(fl_Widget self, int event);
  FL_EXPORT_C(fl_Group,     Fl_Box_parent)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_parent)(fl_Box box, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Box_type)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_type)(fl_Box box, uchar t);

FL_EXPORT_C(void, Fl_Box_draw_box)(fl_Box Box);
FL_EXPORT_C(void, Fl_Box_draw_box_with_tc)(fl_Box Box,Fl_Boxtype t, Fl_Color c);
FL_EXPORT_C(void, Fl_Box_draw_box_with_txywhc)(fl_Box Box,Fl_Boxtype t, int x,int y,int w,int h, Fl_Color c);
FL_EXPORT_C(void, Fl_Box_draw_backdrop)(fl_Box Box);
FL_EXPORT_C(void, Fl_Box_draw_focus)(fl_Box Box);
FL_EXPORT_C(void, Fl_Box_draw_focus_with_txywh)(fl_Box Box,Fl_Boxtype t, int x,int y,int w,int h);
FL_EXPORT_C(void, Fl_Box_draw_label)(fl_Box Box);
  FL_EXPORT_C(int,          Fl_Box_x)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_y)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_w)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_h)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_align)(fl_Box box, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Box_align)(fl_Box box);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Box_box)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_box)(fl_Box box, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Box_color)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_color)(fl_Box box, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Box_set_color_with_bg_sel)(fl_Box box,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Box_selection_color)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_selection_color)(fl_Box box, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Box_label)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_copy_label)(fl_Box box, const char* new_label);
  FL_EXPORT_C(void,         Fl_Box_set_label)(fl_Box box, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Box_labeltype)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_labeltype)(fl_Box box, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Box_labelcolor)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_labelcolor)(fl_Box box, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Box_labelfont)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_labelfont)(fl_Box box, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Box_labelsize)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_labelsize)(fl_Box box, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Box_image)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_image)(fl_Box box, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Box_deimage)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_deimage)(fl_Box box, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Box_tooltip)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_copy_tooltip)(fl_Box box, const char* text);
  FL_EXPORT_C(void,         Fl_Box_set_tooltip)(fl_Box box, const char* text);
  FL_EXPORT_C(void,         Fl_Box_set_callback_with_user_data)(fl_Box box, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Box_set_callback)(fl_Box box, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Box_other_data)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_other_data)(fl_Box box, void* v);
  FL_EXPORT_C(void*,        Fl_Box_user_data)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_user_data)(fl_Box box, void* v);
  FL_EXPORT_C(long,         Fl_Box_argument)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_argument)(fl_Box box, long v);
  FL_EXPORT_C(Fl_When,      Fl_Box_when)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_when)(fl_Box box, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Box_visible)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_visible_r)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_show_super)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_show)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_hide_super)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_hide)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_visible)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_clear_visible)(fl_Box box);
  FL_EXPORT_C(unsigned int, Fl_Box_active)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_active_r)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_activate)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_deactivate)(fl_Box box);
  FL_EXPORT_C(unsigned int, Fl_Box_output)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_output)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_clear_output)(fl_Box box);
  FL_EXPORT_C(unsigned int, Fl_Box_takesevents)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_changed)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_clear_changed)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_take_focus)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_set_visible_focus)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_clear_visible_focus)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_modify_visible_focus)(fl_Box box, int v);
  FL_EXPORT_C(unsigned int, Fl_Box_visible_focus)(fl_Box box);
  FL_EXPORT_C(int,          Fl_Box_contains)(fl_Box box, fl_Widget w);
  FL_EXPORT_C(int,          Fl_Box_inside)(fl_Box box, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Box_redraw)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_redraw_label)(fl_Box box);
  FL_EXPORT_C(uchar,        Fl_Box_damage)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_clear_damage_with_bitmask)(fl_Box box, uchar c);
  FL_EXPORT_C(void,         Fl_Box_clear_damage)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_damage_with_text)(fl_Box box, uchar c);
  FL_EXPORT_C(void,         Fl_Box_damage_inside_widget)(fl_Box box, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Box_draw_label_with_xywh_alignment)(fl_Box box, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Box_measure_label)(fl_Box box, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Box_window)(fl_Box box);
  FL_EXPORT_C(fl_Window,    Fl_Box_top_window)(fl_Box box);
  FL_EXPORT_C(fl_Window ,   Fl_Box_top_window_offset)(fl_Box box, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Gl_Window, Fl_Box_as_gl_window_super)(fl_Box box);
  FL_EXPORT_C(fl_Gl_Window, Fl_Box_as_gl_window)(fl_Box box);
  FL_EXPORT_C(void,         Fl_Box_resize_super)(fl_Table table,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Box_resize)(fl_Table table,int X, int Y, int W, int H);

  FL_EXPORT_C(fl_Box_Virtual_Funcs*, Fl_Box_default_virtual_funcs)();
  FL_EXPORT_C(fl_Box,    Fl_Box_New_WithLabel)(int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Box,    Fl_OverriddenBox_New_WithLabel)(int x, int y, int w, int h, const char* label, fl_Box_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Box   , Fl_Box_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Box   , Fl_OverriddenBox_New)(int x, int y, int w, int h, fl_Box_Virtual_Funcs* funcs);
  FL_EXPORT_C(fl_Box,    Fl_Box_New_WithBoxtype)(Fl_Boxtype b, int x, int y, int w, int h, const char* label);
  FL_EXPORT_C(fl_Box,    Fl_OverriddenBox_New_WithBoxtype)(Fl_Boxtype b, int x, int y, int w, int h, const char* label, fl_Box_Virtual_Funcs* funcs);
  FL_EXPORT_C(void,      Fl_Box_Destroy)(fl_Box box);
#ifdef __cplusplus
}
#endif
#endif /* __FL_BOX_C__ */
