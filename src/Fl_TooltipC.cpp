#include "Fl_TooltipC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(float,Fl_Tooltip_delay)( ){
    return Fl_Tooltip::delay();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_delay)(float f){
    Fl_Tooltip::delay(f);
  }
  FL_EXPORT_C(float,Fl_Tooltip_hoverdelay)( ){
    return Fl_Tooltip::hoverdelay();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_hoverdelay)(float f){
    Fl_Tooltip::hoverdelay(f);
  }
  FL_EXPORT_C(void,Fl_Tooltip_enable)( ){
    Fl_Tooltip::enable();
  }
  FL_EXPORT_C(void,Fl_Tooltip_enable_with_b)(int b){
    Fl_Tooltip::enable(b);
  }
  FL_EXPORT_C(void,Fl_Tooltip_disable)( ){
    Fl_Tooltip::disable();
  }
  FL_EXPORT_C(void,Fl_Tooltip_enter_area)(fl_Widget w,int X,int Y,int W,int H,const char* tip){
    Fl_Tooltip::enter_area((static_cast<Fl_Widget*>(w)),X,Y,W,H,tip);
  }
  FL_EXPORT_C(fl_Widget,Fl_Tooltip_current)( ){
    return (fl_Widget)Fl_Tooltip::current();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_current)(fl_Widget w){
    Fl_Tooltip::current((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(Fl_Font,Fl_Tooltip_font)( ){
    return Fl_Tooltip::font();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_font)(Fl_Font i){
    Fl_Tooltip::font(i);
  }
  FL_EXPORT_C(Fl_Fontsize,Fl_Tooltip_size)( ){
    return Fl_Tooltip::size();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_size)(Fl_Fontsize s){
    Fl_Tooltip::size(s);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tooltip_color)( ){
    return Fl_Tooltip::color();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_color)(Fl_Color c){
    Fl_Tooltip::color(c);
  }
  FL_EXPORT_C(Fl_Color,Fl_Tooltip_textcolor)( ){
    return Fl_Tooltip::textcolor();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_textcolor)(Fl_Color c){
    Fl_Tooltip::textcolor(c);
  }
#if FLTK_ABI_VERSION >= 10301
  FL_EXPORT_C(int,Fl_Tooltip_margin_width)( ){
    return Fl_Tooltip::margin_width();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_margin_width)(int v){
    Fl_Tooltip::margin_width(v);
  }
  FL_EXPORT_C(int,Fl_Tooltip_margin_height)( ){
    return Fl_Tooltip::margin_height();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_margin_height)(int v){
    Fl_Tooltip::margin_height(v);
  }
  FL_EXPORT_C(int,Fl_Tooltip_wrap_width)( ){
    return Fl_Tooltip::wrap_width();
  }
  FL_EXPORT_C(void,Fl_Tooltip_set_wrap_width)(int v){
    Fl_Tooltip::wrap_width(v);
  }
#else
  FL_EXPORT_C(int,Fl_Tooltip_margin_width)( ){
    return Fl_Tooltip::margin_width();
  }
  FL_EXPORT_C(int,Fl_Tooltip_margin_height)( ){
    return Fl_Tooltip::margin_height();
  }
  FL_EXPORT_C(int,Fl_Tooltip_wrap_width)( ){
    return Fl_Tooltip::wrap_width();
  }
#endif
#ifdef __APPLE__
  FL_EXPORT_C(fl_Window,Fl_Tooltip_current_window)(void ){
    return (fl_Window)Fl_Tooltip::current_window();
  }
#endif  
#ifdef __cplusplus
}
#endif
