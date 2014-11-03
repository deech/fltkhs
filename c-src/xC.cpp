#include "xC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_open_display)( ){
    fl_open_display();
  }
  FL_EXPORT_C(Fl_Bitmask,flc_create_bitmask)(int w,int h,const uchar* data){
    return fl_create_bitmask(w,h,data);
  }
  FL_EXPORT_C(Fl_Bitmask,flc_create_alphamask)(int w,int h,int d,int ld,const uchar* data){
    return fl_create_alphamask(w,h,d,ld,data);
  }
  FL_EXPORT_C(void,flc_delete_bitmask)(Fl_Bitmask bm){
    fl_delete_bitmask(bm);
  }
#if !defined(WIN32) && !defined(__APPLE__)
  FL_EXPORT_C(void,flc_close_display)( ){
    fl_close_display();
  }
  FL_EXPORT_C(void, flc_set_fl_screen)(int screen){
    fl_screen = screen;
  }
  FL_EXPORT_C(int, flc_fl_screen)(){
    return fl_screen;
  }
  FL_EXPORT_C(ulong,flc_xpixel_with_rgb)(uchar r,uchar g,uchar b){
    return fl_xpixel(r,g,b);
  }
  FL_EXPORT_C(ulong,flc_xpixel)(Fl_Color i){
    return fl_xpixel(i);
  }
  FL_EXPORT_C(void,flc_open_display_with_d)(Display* d){
    fl_open_display(d);
  }
  FL_EXPORT_C(void, flc_set_fl_display)(Display* d){
    fl_display = d;
  }
  FL_EXPORT_C(Display*, flc_fl_display)(){
    return fl_display;
  }
  FL_EXPORT_C(void, flc_set_fl_colormap)(Colormap c){
    fl_colormap = c;
  }
  FL_EXPORT_C(Colormap, flc_fl_colormap)(){
    return fl_colormap;
  }
  FL_EXPORT_C(void, flc_set_fl_visual)(XVisualInfo* i){
    fl_visual = i;
  }
  FL_EXPORT_C(XVisualInfo*, flc_fl_visual)(){
    return fl_visual;
  }
#endif
#ifdef __cplusplus
}
#endif
