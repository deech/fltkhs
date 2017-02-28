#ifndef __FL_COLOR_CHOOSER_C__
#define __FL_COLOR_CHOOSER_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Color_Chooser.H"
#include "Fl_CallbackC.h"
#include "Fl_GroupC.h"
EXPORT {
  class Fl_DerivedColor_Chooser : public Fl_Color_Chooser {
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
    Fl_DerivedColor_Chooser(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedColor_Chooser(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedColor_Chooser();
  };
#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Color_Chooser_handle)(fl_Color_Chooser color_chooser, int event);
  FL_EXPORT_C(fl_Group,     Fl_Color_Chooser_parent)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_parent)(fl_Color_Chooser color_chooser, fl_Group grp);
  FL_EXPORT_C(uchar,        Fl_Color_Chooser_type)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_type)(fl_Color_Chooser color_chooser, uchar t);

  FL_EXPORT_C(int,          Fl_Color_Chooser_x)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_y)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_w)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_h)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_align)(fl_Color_Chooser color_chooser, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Color_Chooser_align)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Color_Chooser_box)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_box)(fl_Color_Chooser color_chooser, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Color_Chooser_color)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_color)(fl_Color_Chooser color_chooser, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_color_with_bg_sel)(fl_Color_Chooser color_chooser,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Color_Chooser_selection_color)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_selection_color)(fl_Color_Chooser color_chooser, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Color_Chooser_label)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_copy_label)(fl_Color_Chooser color_chooser, const char* new_label);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_label)(fl_Color_Chooser color_chooser, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Color_Chooser_labeltype)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_labeltype)(fl_Color_Chooser color_chooser, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Color_Chooser_labelcolor)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_labelcolor)(fl_Color_Chooser color_chooser, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Color_Chooser_item_labelfont)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_item_labelfont)(fl_Color_Chooser color_chooser, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Color_Chooser_item_labelsize)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_item_labelsize)(fl_Color_Chooser color_chooser, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Color_Chooser_image)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_image)(fl_Color_Chooser color_chooser, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Color_Chooser_deimage)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_deimage)(fl_Color_Chooser color_chooser, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Color_Chooser_tooltip)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_copy_tooltip)(fl_Color_Chooser color_chooser, const char* text);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_tooltip)(fl_Color_Chooser color_chooser, const char* text);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_callback_with_user_data)(fl_Color_Chooser color_chooser, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_callback)(fl_Color_Chooser color_chooser, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Color_Chooser_other_data)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_other_data)(fl_Color_Chooser color_chooser, void* v);
  FL_EXPORT_C(void*,        Fl_Color_Chooser_user_data)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_user_data)(fl_Color_Chooser color_chooser, void* v);
  FL_EXPORT_C(long,         Fl_Color_Chooser_argument)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_argument)(fl_Color_Chooser color_chooser, long v);
  FL_EXPORT_C(Fl_When,      Fl_Color_Chooser_when)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_when)(fl_Color_Chooser color_chooser, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_visible)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_visible_r)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_show_super)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_show)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_hide_super)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_hide)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_visible)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_visible)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_active)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_active_r)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_activate)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_deactivate)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_output)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_output)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_output)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_takesevents)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_changed)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_changed)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_take_focus)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_visible_focus)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_visible_focus)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_modify_visible_focus)(fl_Color_Chooser color_chooser, int v);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_visible_focus)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_contains)(fl_Color_Chooser color_chooser, fl_Group w);
  FL_EXPORT_C(int,          Fl_Color_Chooser_inside)(fl_Color_Chooser color_chooser, fl_Group w);
  FL_EXPORT_C(void,         Fl_Color_Chooser_redraw)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_redraw_label)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(uchar,        Fl_Color_Chooser_damage)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_damage_with_bitmask)(fl_Color_Chooser color_chooser, uchar c);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear_damage)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_damage_with_text)(fl_Color_Chooser color_chooser, uchar c);
  FL_EXPORT_C(void,         Fl_Color_Chooser_damage_inside_group)(fl_Color_Chooser color_chooser, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Color_Chooser_draw_label_with_xywh_alignment)(fl_Color_Chooser color_chooser, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Color_Chooser_measure_label)(fl_Color_Chooser color_chooser, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Color_Chooser_window)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Window,    Fl_Color_Chooser_top_window)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Window ,   Fl_Color_Chooser_top_window_offset)(fl_Color_Chooser color_chooser, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Color_Chooser_as_group_super)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Group,     Fl_Color_Chooser_as_group)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Color_Chooser_as_gl_window_super)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Gl_Window, Fl_Color_Chooser_as_gl_window)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_resize_super)(fl_Color_Chooser color_chooser,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Color_Chooser_resize)(fl_Color_Chooser color_chooser,int X, int Y, int W, int H);

  /* Fl_Color_Chooser specific */
  FL_EXPORT_C(void,         Fl_Color_Chooser_begin)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_end)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_find)(fl_Color_Chooser color_chooser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Color_Chooser_add)(fl_Color_Chooser color_chooser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Color_Chooser_insert)(fl_Color_Chooser color_chooser, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Color_Chooser_remove_index)(fl_Color_Chooser color_chooser, int index);
  FL_EXPORT_C(void,         Fl_Color_Chooser_remove_widget)(fl_Color_Chooser color_chooser, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Color_Chooser_clear)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_resizable_by_reference)(fl_Color_Chooser color_chooser,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_resizable)(fl_Color_Chooser color_chooser,fl_Widget o);
  FL_EXPORT_C(fl_Widget,    Fl_Color_Chooser_resizable)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_add_resizable)(fl_Color_Chooser color_chooser,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Color_Chooser_init_sizes)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,          Fl_Color_Chooser_children)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_set_clip_children)(fl_Color_Chooser color_chooser,int c);
  FL_EXPORT_C(unsigned int, Fl_Color_Chooser_clip_children)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_focus)(fl_Color_Chooser color_chooser,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Color_Chooser__ddfdesign_kludge)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,         Fl_Color_Chooser_insert_with_before)(fl_Color_Chooser color_chooser, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Color_Chooser_array)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(fl_Widget,    Fl_Color_Chooser_child)(fl_Color_Chooser color_chooser, int n);

  FL_EXPORT_C(int,Fl_Color_Chooser_mode)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(void,Fl_Color_Chooser_set_mode)(fl_Color_Chooser color_chooser,int newMode);
  FL_EXPORT_C(double,Fl_Color_Chooser_hue)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(double,Fl_Color_Chooser_saturation)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(double,Fl_Color_Chooser_value)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(double,Fl_Color_Chooser_r)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(double,Fl_Color_Chooser_g)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(double,Fl_Color_Chooser_b)(fl_Color_Chooser color_chooser);
  FL_EXPORT_C(int,Fl_Color_Chooser_hsv)(fl_Color_Chooser color_chooser,double H, double S, double V);
  FL_EXPORT_C(int,Fl_Color_Chooser_rgb)(fl_Color_Chooser color_chooser,double R, double G, double B);
  FL_EXPORT_C(void,Fl_Color_Chooser_hsv2rgb)(double H, double S, double V, double* R, double* G, double* B);
  FL_EXPORT_C(void,Fl_Color_Chooser_rgb2hsv)(double R, double G, double B, double* H, double* S, double* V);
  FL_EXPORT_C(fl_Color_Chooser,Fl_Color_Chooser_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Color_Chooser,Fl_Color_Chooser_New_WithLabel)(int x, int y, int w, int h, const char* t);
  FL_EXPORT_C(int, flc_color_chooser)(const char* name, double* r, double* g, double* b);
  FL_EXPORT_C(fl_Color_Chooser,    Fl_Color_Chooser_New)(int X, int Y, int W, int H);
  FL_EXPORT_C(fl_Color_Chooser,    Fl_Color_Chooser_New_WithLabel)(int X, int Y, int W, int H, const char* label);
  FL_EXPORT_C(fl_Color_Chooser,    Fl_OverriddenColor_Chooser_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Color_Chooser,    Fl_OverriddenColor_Chooser_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);

  FL_EXPORT_C(int, flc_color_chooser_with_m)(const char* name, double* r, double* g, double* b, int m);
  FL_EXPORT_C(int, flc_color_chooser_with_uchar)(const char* name, uchar* r, uchar* g, uchar* b);
  FL_EXPORT_C(int, flc_color_chooser_with_uchar_m)(const char* name, uchar* r, uchar* g, uchar* b, int m);
  FL_EXPORT_C(void, Fl_Color_Chooser_draw)(fl_Color_Chooser o);
  FL_EXPORT_C(void, Fl_Color_Chooser_draw_super)(fl_Color_Chooser o);
  FL_EXPORT_C(int, Fl_Color_Chooser_handle)(fl_Color_Chooser o, int event);
  FL_EXPORT_C(int, Fl_Color_Chooser_handle_super)(fl_Color_Chooser o, int event);
  FL_EXPORT_C(void, Fl_Color_Chooser_resize)(fl_Color_Chooser o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Color_Chooser_resize_super)(fl_Color_Chooser o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Color_Chooser_show)(fl_Color_Chooser o);
  FL_EXPORT_C(void, Fl_Color_Chooser_show_super)(fl_Color_Chooser o);
  FL_EXPORT_C(void, Fl_Color_Chooser_hide)(fl_Color_Chooser o);
  FL_EXPORT_C(void, Fl_Color_Chooser_hide_super)(fl_Color_Chooser o);


#ifdef __cplusplus
}
#endif
#endif /* __FL_COLOR_CHOOSER_C__ */
