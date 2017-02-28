#ifndef __FL_TILE_C__
#define __FL_TILE_C__
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Fl_Tile.H"
#include "Fl_CallbackC.h"
#include "Fl_WidgetC.h"
EXPORT {
  class Fl_DerivedTile : public Fl_Tile {
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
    Fl_DerivedTile(int X, int Y, int W, int H, const char *l, fl_Widget_Virtual_Funcs* funcs);
    Fl_DerivedTile(int X, int Y, int W, int H, fl_Widget_Virtual_Funcs* funcs);
    ~Fl_DerivedTile();
  };

#endif
  /* Inherited from Fl_Widget */
  FL_EXPORT_C(int,          Fl_Tile_handle)(fl_Tile tile, int event);
  FL_EXPORT_C(fl_Group,     Fl_Tile_parent)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_parent)(fl_Tile tile, fl_Group group);
  FL_EXPORT_C(uchar,        Fl_Tile_type)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_type)(fl_Tile tile, uchar t);

  FL_EXPORT_C(int,          Fl_Tile_x)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_y)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_w)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_h)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_align)(fl_Tile tile, Fl_Align alignment);
  FL_EXPORT_C(Fl_Align,     Fl_Tile_align)(fl_Tile tile);
  FL_EXPORT_C(Fl_Boxtype,   Fl_Tile_box)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_box)(fl_Tile tile, Fl_Boxtype new_box);
  FL_EXPORT_C(Fl_Color,     Fl_Tile_color)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_color)(fl_Tile tile, Fl_Color bg);
  FL_EXPORT_C(void,         Fl_Tile_set_color_with_bg_sel)(fl_Tile tile,Fl_Color bg, Fl_Color a);
  FL_EXPORT_C(Fl_Color,     Fl_Tile_selection_color)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_selection_color)(fl_Tile tile, Fl_Color a);
  FL_EXPORT_C(const char*,  Fl_Tile_label)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_copy_label)(fl_Tile tile, const char* new_label);
  FL_EXPORT_C(void,         Fl_Tile_set_label)(fl_Tile tile, const char* text);
  FL_EXPORT_C(Fl_Labeltype, Fl_Tile_labeltype)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_labeltype)(fl_Tile tile, Fl_Labeltype a);
  FL_EXPORT_C(Fl_Color,     Fl_Tile_labelcolor)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_labelcolor)(fl_Tile tile, Fl_Color c);
  FL_EXPORT_C(Fl_Font,      Fl_Tile_item_labelfont)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_item_labelfont)(fl_Tile tile, Fl_Font c);
  FL_EXPORT_C(Fl_Fontsize,  Fl_Tile_item_labelsize)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_item_labelsize)(fl_Tile tile, Fl_Fontsize pix);
  FL_EXPORT_C(fl_Image,     Fl_Tile_image)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_image)(fl_Tile tile, fl_Image pix);
  FL_EXPORT_C(fl_Image,     Fl_Tile_deimage)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_deimage)(fl_Tile tile, fl_Image pix);
  FL_EXPORT_C(const char*,  Fl_Tile_tooltip)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_copy_tooltip)(fl_Tile tile, const char* text);
  FL_EXPORT_C(void,         Fl_Tile_set_tooltip)(fl_Tile tile, const char* text);
  FL_EXPORT_C(void,         Fl_Tile_set_callback_with_user_data)(fl_Tile tile, fl_Callback* cb, void* p);
  FL_EXPORT_C(void,         Fl_Tile_set_callback)(fl_Tile tile, fl_Callback* cb);
  FL_EXPORT_C(void*,        Fl_Tile_other_data)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_other_data)(fl_Tile tile, void* v);
  FL_EXPORT_C(void*,        Fl_Tile_user_data)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_user_data)(fl_Tile tile, void* v);
  FL_EXPORT_C(long,         Fl_Tile_argument)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_argument)(fl_Tile tile, long v);
  FL_EXPORT_C(Fl_When,      Fl_Tile_when)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_when)(fl_Tile tile, uchar i);
  FL_EXPORT_C(unsigned int, Fl_Tile_visible)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_visible_r)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_show_super)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_show)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_hide_super)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_hide)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_visible)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_clear_visible)(fl_Tile tile);
  FL_EXPORT_C(unsigned int, Fl_Tile_active)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_active_r)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_activate)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_deactivate)(fl_Tile tile);
  FL_EXPORT_C(unsigned int, Fl_Tile_output)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_output)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_clear_output)(fl_Tile tile);
  FL_EXPORT_C(unsigned int, Fl_Tile_takesevents)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_changed)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_clear_changed)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_take_focus)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_visible_focus)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_clear_visible_focus)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_modify_visible_focus)(fl_Tile tile, int v);
  FL_EXPORT_C(unsigned int, Fl_Tile_visible_focus)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_contains)(fl_Tile tile, fl_Group w);
  FL_EXPORT_C(int,          Fl_Tile_inside)(fl_Tile tile, fl_Group w);
  FL_EXPORT_C(void,         Fl_Tile_redraw)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_redraw_label)(fl_Tile tile);
  FL_EXPORT_C(uchar,        Fl_Tile_damage)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_clear_damage_with_bitmask)(fl_Tile tile, uchar c);
  FL_EXPORT_C(void,         Fl_Tile_clear_damage)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_damage_with_text)(fl_Tile tile, uchar c);
  FL_EXPORT_C(void,         Fl_Tile_damage_inside_group)(fl_Tile tile, uchar c, int x , int y , int w, int h);
  FL_EXPORT_C(void,         Fl_Tile_draw_label_with_xywh_alignment)(fl_Tile tile, int x , int y , int w, int h, Fl_Align alignment);
  FL_EXPORT_C(void,         Fl_Tile_measure_label)(fl_Tile tile, int* ww , int* hh);
  FL_EXPORT_C(fl_Window,    Fl_Tile_window)(fl_Tile tile);
  FL_EXPORT_C(fl_Window,    Fl_Tile_top_window)(fl_Tile tile);
  FL_EXPORT_C(fl_Window ,   Fl_Tile_top_window_offset)(fl_Tile tile, int* xoff, int* yoff);
  FL_EXPORT_C(fl_Group,     Fl_Tile_as_group_super)(fl_Tile tile);
  FL_EXPORT_C(fl_Group,     Fl_Tile_as_group)(fl_Tile tile);
  FL_EXPORT_C(fl_Gl_Window, Fl_Tile_as_gl_window_super)(fl_Tile tile);
  FL_EXPORT_C(fl_Gl_Window, Fl_Tile_as_gl_window)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_resize_super)(fl_Tile tile,int X, int Y, int W, int H);
  FL_EXPORT_C(void,         Fl_Tile_resize)(fl_Tile tile,int X, int Y, int W, int H);

  /* Fl_Tile specific */
  FL_EXPORT_C(void,         Fl_Tile_begin)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_end)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_find)(fl_Tile tile, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tile_add)(fl_Tile tile, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tile_insert)(fl_Tile tile, fl_Widget w, int i);
  FL_EXPORT_C(void,         Fl_Tile_remove_index)(fl_Tile tile, int index);
  FL_EXPORT_C(void,         Fl_Tile_remove_widget)(fl_Tile tile, fl_Widget w);
  FL_EXPORT_C(void,         Fl_Tile_clear)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_resizable_by_reference)(fl_Tile tile,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tile_set_resizable)(fl_Tile tile,fl_Widget o);
  FL_EXPORT_C(fl_Widget,         Fl_Tile_resizable)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_add_resizable)(fl_Tile tile,fl_Widget o);
  FL_EXPORT_C(void,         Fl_Tile_init_sizes)(fl_Tile tile);
  FL_EXPORT_C(int,          Fl_Tile_children)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_set_clip_children)(fl_Tile tile,int c);
  FL_EXPORT_C(unsigned int, Fl_Tile_clip_children)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_focus)(fl_Tile tile,fl_Widget W);
  FL_EXPORT_C(fl_Widget,    Fl_Tile__ddfdesign_kludge)(fl_Tile tile);
  FL_EXPORT_C(void,         Fl_Tile_insert_with_before)(fl_Tile tile, fl_Widget w, fl_Widget before);
  FL_EXPORT_C(fl_Widget*,   Fl_Tile_array)(fl_Tile tile);
  FL_EXPORT_C(fl_Widget,    Fl_Tile_child)(fl_Tile tile, int n);
  FL_EXPORT_C(fl_Group,     Fl_Tile_New)(int x, int y, int w, int h);
  FL_EXPORT_C(fl_Group,     Fl_Tile_New_WithLabel)(int x, int y, int w, int h, const char* t);
  FL_EXPORT_C(void,         Fl_Tile_position)(fl_Tile tile, int x, int y, int w, int h);
  FL_EXPORT_C(fl_Tile,    Fl_OverriddenTile_New)(int X, int Y, int W, int H,fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(fl_Tile,    Fl_OverriddenTile_New_WithLabel)(int X, int Y, int W, int H, const char* label, fl_Widget_Virtual_Funcs* fs);
  FL_EXPORT_C(void, Fl_Tile_draw)(fl_Tile o);
  FL_EXPORT_C(void, Fl_Tile_draw_super)(fl_Tile o);
  FL_EXPORT_C(int, Fl_Tile_handle)(fl_Tile o, int event);
  FL_EXPORT_C(int, Fl_Tile_handle_super)(fl_Tile o, int event);
  FL_EXPORT_C(void, Fl_Tile_resize)(fl_Tile o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tile_resize_super)(fl_Tile o, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Tile_show)(fl_Tile o);
  FL_EXPORT_C(void, Fl_Tile_show_super)(fl_Tile o);
  FL_EXPORT_C(void, Fl_Tile_hide)(fl_Tile o);
  FL_EXPORT_C(void, Fl_Tile_hide_super)(fl_Tile o);
#ifdef __cplusplus
}
#endif
#endif /* __FL_TILE_C__ */
