#include "glC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_gl_start)( ){
    gl_start();
  }
  FL_EXPORT_C(void,flc_gl_finish)( ){
    gl_finish();
  }
  FL_EXPORT_C(void,flc_gl_color)(Fl_Color i){
    gl_color(i);
  }
  FL_EXPORT_C(void,flc_gl_color_with_i)(int c){
    gl_color(c);
  }
  FL_EXPORT_C(void,flc_gl_rect)(int x,int y,int w,int h){
    gl_rect(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_gl_rectf)(int x,int y,int w,int h){
    gl_rectf(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_gl_font)(int fontid,int size){
    gl_font(fontid,size);
  }
  FL_EXPORT_C(int,flc_gl_height)( ){
    return gl_height();
  }
  FL_EXPORT_C(int,flc_gl_descent)( ){
    return gl_descent();
  }
  FL_EXPORT_C(double,flc_gl_width)(const char* str){
    return gl_width(str);
  }
  FL_EXPORT_C(double,flc_gl_width_with_n)(const char* str,int n){
    return gl_width(str,n);
  }
  FL_EXPORT_C(double,flc_gl_width_with_uchar_str)(uchar str){
    return gl_width(str);
  }
  FL_EXPORT_C(void,flc_gl_draw)(const char* str){
    gl_draw(str);
  }
  FL_EXPORT_C(void,flc_gl_draw_with_n)(const char* str,int n){
    gl_draw(str,n);
  }
  FL_EXPORT_C(void,flc_gl_draw_with_xy)(const char* str,float x,float y){
    gl_draw(str,x,y);
  }
  FL_EXPORT_C(void,flc_gl_draw_with_nxy)(const char* str,int n,float x,float y){
    gl_draw(str,n,x,y);
  }
  FL_EXPORT_C(void,flc_gl_draw_with_xywh_align)(const char* str,int x,int y,int w,int h,Fl_Align align){
    gl_draw(str,x,y,w,h,align);
  }
  FL_EXPORT_C(void,flc_gl_measure)(const char* str,int x,int y){
    gl_measure(str,x,y);
  }
#ifdef __APPLE__
  FL_EXPORT_C(void,flc_set_gl_texture_pile_height)(int max){
    gl_texture_pile_height(max);
  }
  FL_EXPORT_C(int,flc_gl_texture_pile_height)( ){
    return gl_texture_pile_height();
  }
#endif
  FL_EXPORT_C(void,flc_gl_draw_image)(const uchar* str,int x,int y,int w,int h){
    gl_draw_image(str,x,y,w,h);
  }
  FL_EXPORT_C(void,flc_gl_draw_image_with_d)(const uchar* str,int x,int y,int w,int h,int d){
    gl_draw_image(str,x,y,w,h,d);
  }
  FL_EXPORT_C(void,flc_gl_draw_image_with_ld)(const uchar* str,int x,int y,int w,int h,int ld){
    gl_draw_image(str,x,y,w,h,3,ld);
  }
  FL_EXPORT_C(void,flc_gl_draw_image_with_d_ld)(const uchar* str,int x,int y,int w,int h,int d,int ld){
    gl_draw_image(str,x,y,w,h,d,ld);
  }
#ifdef __cplusplus
}
#endif
