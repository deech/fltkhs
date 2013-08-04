#include "Fl_DrawC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_set_color)(Fl_Color c){
    fl_color(c);
  }
  FL_EXPORT_C(void,flc_set_color_with_c)(int c){
    fl_color(c);
  }
  FL_EXPORT_C(void,flc_set_color_with_rgb)(uchar r,uchar g,uchar b){
    fl_color(r,g,b);
  }
  FL_EXPORT_C(Fl_Color,flc_color)(void){
    return fl_color();
  }
  FL_EXPORT_C(void,flc_push_clip)(int x,int y,int w,int h){
    fl_push_clip(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_push_no_clip)( ){
    fl_push_no_clip();
  }
  FL_EXPORT_C(void,flc_pop_clip)( ){
    fl_pop_clip();
  }
  FL_EXPORT_C(int,flc_not_clipped)(int x,int y,int w,int h){
    return fl_not_clipped(x,y,w,h);
  }
  FL_EXPORT_C(int,flc_clip_box)(int x,int y,int w,int h,int* X,int* Y,int* W,int* H){
    return fl_clip_box(x,y,w,h,*X,*Y,*W,*H);
  }
  FL_EXPORT_C(void,flc_restore_clip)( ){
    fl_restore_clip();
  }
  FL_EXPORT_C(void,flc_set_clip_region)(fl_Region r){
    fl_clip_region((static_cast<Fl_Region>(r)));
  }
  FL_EXPORT_C(fl_Region,flc_clip_region)( ){
    return (fl_Region)fl_clip_region();
  }
  FL_EXPORT_C(void,flc_point)(int x,int y){
    fl_point(x,y);
  }
  FL_EXPORT_C(void,flc_line_style_with_width_dashes)(int style,int width,char* dashes){
    fl_line_style(style,width,dashes);
  }
  FL_EXPORT_C(void,flc_line_style_with_dashes)(int style,char* dashes){
    fl_line_style(style,0,dashes);
  }
  FL_EXPORT_C(void,flc_line_style_with_width)(int style,int width){
    fl_line_style(style,width,0);
  }
  FL_EXPORT_C(void,flc_line_style)(int style){
    fl_line_style(style,0,0);
  }
  FL_EXPORT_C(void,flc_rect)(int x,int y,int w,int h){
    fl_rect(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_rect_with_color)(int x,int y,int w,int h,Fl_Color c){
    fl_rect(x,y,w,h,c);
  }
  FL_EXPORT_C(void,flc_rectf)(int x,int y,int w,int h){
    fl_rectf(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_rectf_with_color)(int x,int y,int w,int h,Fl_Color c){
    fl_rectf(x,y,w,h,c);
  }
  FL_EXPORT_C(void,flc_rectf_with_rgb)(int x,int y,int w,int h,uchar r,uchar g,uchar b){
    fl_rectf(x,y,w,h,r,g,b);
  }
  FL_EXPORT_C(void,flc_line)(int x,int y,int x1,int y1){
    fl_line(x,y,x1,y1);
  }
  FL_EXPORT_C(void,flc_line_with_x2_y2)(int x,int y,int x1,int y1,int x2,int y2){
    fl_line(x,y,x1,y1,x2,y2);
  }
  FL_EXPORT_C(void,flc_loop)(int x,int y,int x1,int y1,int x2,int y2){
    fl_loop(x,y,x1,y1,x2,y2);
  }
  FL_EXPORT_C(void,flc_loop_with_x3_y3)(int x,int y,int x1,int y1,int x2,int y2,int x3,int y3){
    fl_loop(x,y,x1,y1,x2,y2,x3,y3);
  }
  FL_EXPORT_C(void,flc_polygon)(int x,int y,int x1,int y1,int x2,int y2){
    fl_polygon(x,y,x1,y1,x2,y2);
  }
  FL_EXPORT_C(void,flc_polygon_with_x3_y3)(int x,int y,int x1,int y1,int x2,int y2,int x3,int y3){
    fl_polygon(x,y,x1,y1,x2,y2,x3,y3);
  }
  FL_EXPORT_C(void,flc_xyline)(int x,int y,int x1){
    fl_xyline(x,y,x1);
  }
  FL_EXPORT_C(void,flc_xyline_with_x2)(int x,int y,int x1,int y2){
    fl_xyline(x,y,x1,y2);
  }
  FL_EXPORT_C(void,flc_xyline_with_y2_x3)(int x,int y,int x1,int y2,int x3){
    fl_xyline(x,y,x1,y2,x3);
  }
  FL_EXPORT_C(void,flc_yxline_with_y1)(int x,int y,int y1){
    fl_yxline(x,y,y1);
  }
  FL_EXPORT_C(void,flc_yxline_with_y2_x2)(int x,int y,int y1,int x2){
    fl_yxline(x,y,y1,x2);
  }
  FL_EXPORT_C(void,flc_yxline_with_y2_x3)(int x,int y,int y1,int x2,int y3){
    fl_yxline(x,y,y1,x2,y3);
  }
  FL_EXPORT_C(void,flc_arc_by_width_height)(int x,int y,int w,int h,double a1,double a2){
    fl_arc(x,y,w,h,a1,a2);
  }
  FL_EXPORT_C(void,flc_pie)(int x,int y,int w,int h,double a1,double a2){
    fl_pie(x,y,w,h,a1,a2);
  }
  FL_EXPORT_C(void,flc_push_matrix)( ){
    fl_push_matrix();
  }
  FL_EXPORT_C(void,flc_pop_matrix)( ){
    fl_pop_matrix();
  }
  FL_EXPORT_C(void,flc_scale_with_y)(double x,double y){
    fl_scale(x,y);
  }
  FL_EXPORT_C(void,flc_scale)(double x){
    fl_scale(x);
  }
  FL_EXPORT_C(void,flc_translate)(double x,double y){
    fl_translate(x,y);
  }
  FL_EXPORT_C(void,flc_rotate)(double d){
    fl_rotate(d);
  }
  FL_EXPORT_C(void,flc_mult_matrix)(double a,double b,double c,double d,double x,double y){
    fl_mult_matrix(a,b,c,d,x,y);
  }
  FL_EXPORT_C(void,flc_begin_points)( ){
    fl_begin_points();
  }
  FL_EXPORT_C(void,flc_begin_line)( ){
    fl_begin_line();
  }
  FL_EXPORT_C(void,flc_begin_loop)( ){
    fl_begin_loop();
  }
  FL_EXPORT_C(void,flc_begin_polygon)( ){
    fl_begin_polygon();
  }
  FL_EXPORT_C(void,flc_vertex)(double x,double y){
    fl_vertex(x,y);
  }
  FL_EXPORT_C(void,flc_curve)(double X0,double Y0,double X1,double Y1,double X2,double Y2,double X3,double Y3){
    fl_curve(X0,Y0,X1,Y1,X2,Y2,X3,Y3);
  }
  FL_EXPORT_C(void,flc_arc_by_radius)(double x,double y,double r,double start,double end){
    fl_arc(x,y,r,start,end);
  }
  FL_EXPORT_C(void,flc_circle)(double x,double y,double r){
    fl_circle(x,y,r);
  }
  FL_EXPORT_C(void,flc_end_points)( ){
    fl_end_points();
  }
  FL_EXPORT_C(void,flc_end_line)( ){
    fl_end_line();
  }
  FL_EXPORT_C(void,flc_end_loop)( ){
    fl_end_loop();
  }
  FL_EXPORT_C(void,flc_end_polygon)( ){
    fl_end_polygon();
  }
  FL_EXPORT_C(void,flc_begin_complex_polygon)( ){
    fl_begin_complex_polygon();
  }
  FL_EXPORT_C(void,flc_gap)( ){
    fl_gap();
  }
  FL_EXPORT_C(void,flc_end_complex_polygon)( ){
    fl_end_complex_polygon();
  }
  FL_EXPORT_C(double,flc_transform_x)(double x,double y){
    return fl_transform_x(x,y);
  }
  FL_EXPORT_C(double,flc_transform_y)(double x,double y){
    return fl_transform_y(x,y);
  }
  FL_EXPORT_C(double,flc_transform_dx)(double x,double y){
    return fl_transform_dx(x,y);
  }
  FL_EXPORT_C(double,flc_transform_dy)(double x,double y){
    return fl_transform_dy(x,y);
  }
  FL_EXPORT_C(void,flc_transformed_vertex)(double xf,double yf){
    fl_transformed_vertex(xf,yf);
  }
  FL_EXPORT_C(void,flc_set_font)(Fl_Font face,Fl_Fontsize fsize){
    fl_font(face,fsize);
  }
  FL_EXPORT_C(Fl_Font,flc_font)( ){
    return fl_font();
  }
  FL_EXPORT_C(Fl_Fontsize,flc_size)( ){
    return fl_size();
  }
  FL_EXPORT_C(int,flc_height)( ){
    return fl_height();
  }
  FL_EXPORT_C(int,flc_set_height)(int font,int size){
    return fl_height(font,size);
  }
  FL_EXPORT_C(int,flc_descent)( ){
    return fl_descent();
  }
  FL_EXPORT_C(double,flc_width)(const char* txt){
    return fl_width(txt);
  }
  FL_EXPORT_C(double,flc_width_with_n)(const char* txt,int n){
    return fl_width(txt,n);
  }
  FL_EXPORT_C(double,flc_width_with_c)(unsigned int c){
    return fl_width(c);
  }
  FL_EXPORT_C(void,flc_text_extents)(const char* t,int* dx,int* dy,int* w,int* h){
    fl_text_extents(t,*dx,*dy,*w,*h);
  }
  FL_EXPORT_C(void,flc_text_extents_with_n)(const char *t,int n,int* dx,int* dy,int* w,int* h){
    fl_text_extents(t,n,*dx,*dy,*w,*h);
  }
  FL_EXPORT_C(const char*,flc_latin1_to_local)(const char *t){
    return fl_latin1_to_local(t);
  }
  FL_EXPORT_C(const char*,flc_latin1_to_local_with_n)(const char *t,int n){
    return fl_latin1_to_local(t,n);
  }
  FL_EXPORT_C(const char*,flc_local_to_latin1)(const char *t){
    return fl_local_to_latin1(t);
  }
  FL_EXPORT_C(const char*,flc_local_to_latin1_with_n)(const char *t,int n){
    return fl_local_to_latin1(t,n);
  }
  FL_EXPORT_C(const char*,flc_mac_roman_to_local)(const char *t){
    return fl_mac_roman_to_local(t);
  }
  FL_EXPORT_C(const char*,flc_mac_roman_to_local_with_n)(const char *t,int n){
    return fl_mac_roman_to_local(t,n);
  }
  FL_EXPORT_C(const char*,flc_local_to_mac_roman)(const char *t){
    return fl_local_to_mac_roman(t);
  }
  FL_EXPORT_C(const char*,flc_local_to_mac_roman_with_n)(const char *t,int n){
    return fl_local_to_mac_roman(t,n);
  }
  FL_EXPORT_C(void,flc_draw)(const char* str,int x,int y){
    fl_draw(str,x,y);
  }
  FL_EXPORT_C(void,flc_draw_with_angle)(int angle,const char* str,int x,int y){
    fl_draw(angle,str,x,y);
  }
  FL_EXPORT_C(void,flc_draw_with_n)(const char* str,int n,int x,int y){
    fl_draw(str,n,x,y);
  }
  FL_EXPORT_C(void,flc_draw_with_n_angle)(int angle,const char* str,int n,int x,int y){
    fl_draw(angle,str,n,x,y);
  }
  FL_EXPORT_C(void,flc_rtl_draw)(const char* str,int n,int x,int y){
    fl_rtl_draw(str,n,x,y);
  }
  FL_EXPORT_C(void,flc_measure)(const char* str,int* x,int* y){
    fl_measure(str,*x,*y);
  }
  FL_EXPORT_C(void,flc_measure_with_draw_symbols)(const char* str,int* x,int* y,int draw_symbols){
    fl_measure(str,*x,*y,draw_symbols);
  }
  FL_EXPORT_C(void,flc_draw_with_img_draw_symbols)(const char* str,int x,int y,int w,int h,Fl_Align align,fl_Image img,int draw_symbols){
    fl_draw(str,x,y,w,h,align,(static_cast<Fl_Image*>(img)),draw_symbols);
  }
  FL_EXPORT_C(void,flc_draw_with_img)(const char* str,int x,int y,int w,int h,Fl_Align align,fl_Image img){
    fl_draw(str,x,y,w,h,align,(static_cast<Fl_Image*>(img)),0);
  }
  FL_EXPORT_C(void,flc_draw_with_draw_symbols)(const char* str,int x,int y,int w,int h,Fl_Align align,int draw_symbols){
    fl_draw(str,x,y,w,h,align,0,draw_symbols);
  }
  FL_EXPORT_C(void,flc_draw_with_align)(const char* str,int x,int y,int w,int h,Fl_Align align){
    fl_draw(str,x,y,w,h,align);
  }
  FL_EXPORT_C(void,flc_draw_with_callthis_img_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char *,int,int,int), fl_Image img,int draw_symbols){
    fl_draw(str,x,y,w,h,align,callthis,(static_cast<Fl_Image*>(img)),draw_symbols);
  }
  FL_EXPORT_C(void,flc_draw_with_callthis_img)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char *,int,int,int), fl_Image img){
    fl_draw(str,x,y,w,h,align,callthis,(static_cast<Fl_Image*>(img)),1);
  }
  FL_EXPORT_C(void,flc_draw_with_callthis_draw_symbols)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char *,int,int,int), int draw_symbols){
    fl_draw(str,x,y,w,h,align,callthis,0,draw_symbols);
  }
  FL_EXPORT_C(void,flc_draw_with_callthis)(const char* str, int x, int y, int w, int h, Fl_Align align,void (*callthis)(const char *,int,int,int)){
    fl_draw(str,x,y,w,h,align,callthis,0,1);
  }
  FL_EXPORT_C(void,flc_frame)(const char* s,int x,int y,int w,int h){
    fl_frame(s,x,y,w,h);
  }
  FL_EXPORT_C(void,flc_frame2)(const char* s,int x,int y,int w,int h){
    fl_frame2(s,x,y,w,h);
  }
  FL_EXPORT_C(void,flc_draw_box)(Fl_Boxtype boxtype,int x,int y,int w,int h,Fl_Color color){
    fl_draw_box(boxtype,x,y,w,h,color);
  }
  FL_EXPORT_C(void,flc_draw_image_buf_with_d_l)(const uchar* buf,int X,int Y,int W,int H,int D,int L){
    fl_draw_image(buf,X,Y,W,H,D,L);
  }
  FL_EXPORT_C(void,flc_draw_image_buf_with_d)(const uchar* buf,int X,int Y,int W,int H,int D){
    fl_draw_image(buf,X,Y,W,H,D,0);
  }
  FL_EXPORT_C(void,flc_draw_image_buf_with_l)(const uchar* buf,int X,int Y,int W,int H,int L){
    fl_draw_image(buf,X,Y,W,H,3,L);
  }
  FL_EXPORT_C(void,flc_draw_image_buf)(const uchar* buf,int X,int Y,int W,int H){
    fl_draw_image(buf,X,Y,W,H,3,0);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_buf_with_d_l)(const uchar* buf,int X,int Y,int W,int H,int D,int L){
    fl_draw_image_mono(buf,X,Y,W,H,D,L);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_buf_with_d)(const uchar* buf,int X,int Y,int W,int H,int D){
    fl_draw_image_mono(buf,X,Y,W,H,D,0);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_buf_with_l)(const uchar* buf,int X,int Y,int W,int H,int L){
    fl_draw_image_mono(buf,X,Y,W,H,1,L);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_buf)(const uchar* buf,int X,int Y,int W,int H){
    fl_draw_image_mono(buf,X,Y,W,H,1,0);
  }
  FL_EXPORT_C(void,flc_draw_image_cb)(Fl_Draw_Image_Cb cb,void* data,int X,int Y,int W,int H){
    fl_draw_image(cb,data,X,Y,W,H,3);
  }
  FL_EXPORT_C(void,flc_draw_image_cb_with_d)(Fl_Draw_Image_Cb cb,void* data,int X,int Y,int W,int H,int D){
    fl_draw_image(cb,data,X,Y,W,H,D);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_cb_with_d)(Fl_Draw_Image_Cb cb,void* data,int X,int Y,int W,int H,int D){
    fl_draw_image_mono(cb,data,X,Y,W,H,D);
  }
  FL_EXPORT_C(void,flc_draw_image_mono_cb)(Fl_Draw_Image_Cb cb,void* data,int X,int Y,int W,int H){
    fl_draw_image_mono(cb,data,X,Y,W,H);
  }
  FL_EXPORT_C(char,flc_can_do_alpha_blending)( ){
    return fl_can_do_alpha_blending();
  }
  FL_EXPORT_C(uchar*,flc_read_image_with_alpha)(uchar *p,int X,int Y,int W,int H,int alpha){
    return fl_read_image(p,X,Y,W,H,alpha);
  }
  FL_EXPORT_C(uchar*,flc_read_image)(uchar* p,int X,int Y,int W,int H){
    return fl_read_image(p,X,Y,W,H);
  }
  FL_EXPORT_C(int,flc_draw_pixmap_with_color)(char* const* data,int x,int y,Fl_Color color){
    return fl_draw_pixmap(data,x,y,color);
  }
  FL_EXPORT_C(int,flc_draw_pixmap)(char* const* data,int x,int y){
    return fl_draw_pixmap(data,x,y,FL_GRAY);
  }
  FL_EXPORT_C(int,flc_draw_pixmap_with_cdata_color)(char* const* cdata,int x,int y,Fl_Color color){
    return fl_draw_pixmap(cdata,x,y,color);
  }
  FL_EXPORT_C(int,flc_draw_pixmap_with_cdata)(char* const* cdata,int x,int y){
    return fl_draw_pixmap(cdata,x,y);
  }
  FL_EXPORT_C(int,flc_measure_pixmap)(char* const* data,int *w,int *h){
    return fl_measure_pixmap(data,*w,*h);
  }

  FL_EXPORT_C(int,flc_measure_pixmap_with_cdata)(const char* const* cdata,int *w,int *h){
    return fl_measure_pixmap(cdata,*w,*h);
  }
  FL_EXPORT_C(void,flc_scroll)(int X, int Y, int W, int H, int dx, int dy, void (*draw_area)(void*, int,int,int,int), void* data){
    fl_scroll(X,Y,W,H,dx,dy,draw_area,data);
  }
  FL_EXPORT_C(const char*,flc_shortcut_label)(unsigned int shortcut){
    return fl_shortcut_label(shortcut);
  }
  FL_EXPORT_C(const char*,flc_shortcut_label_with_eom)(unsigned int shortcut,const char **eom){
    return fl_shortcut_label(shortcut,eom);
  }
  FL_EXPORT_C(unsigned int,flc_old_shortcut)(const char* s){
    return fl_old_shortcut(s);
  }
  FL_EXPORT_C(void,flc_overlay_rect)(int x,int y,int w,int h){
    fl_overlay_rect(x,y,w,h);
  }
  FL_EXPORT_C(void,flc_overlay_clear)( ){
    fl_overlay_clear();
  }
  FL_EXPORT_C(void,flc_cursor_with_fg_bg)(Fl_Cursor cursore,Fl_Color fg,Fl_Color bg){
    fl_cursor(cursore,fg,bg);
  }
  FL_EXPORT_C(void,flc_cursor_with_fg)(Fl_Cursor cursor,Fl_Color fg){
    fl_cursor(cursor,fg);
  }
  FL_EXPORT_C(void,flc_cursor_with_bg)(Fl_Cursor cursor,Fl_Color bg){
    fl_cursor(cursor,bg);
  }
  FL_EXPORT_C(void,flc_cursor)(Fl_Cursor cursor){
    fl_cursor(cursor);
  }
  FL_EXPORT_C(const char*,flc_expand_text_with_draw_symbols)(const char* from,char* buf,int maxbuf,double maxw,int* n,double *width,int wrap,int draw_symbols){
    return fl_expand_text(from,buf,maxbuf,maxw,*n,*width,wrap,draw_symbols);
  }
  FL_EXPORT_C(const char*,flc_expand_text)(const char* from,char* buf,int maxbuf,double maxw,int* n,double *width,int wrap){
    return fl_expand_text(from,buf,maxbuf,maxw,*n,*width,wrap);
  }
  FL_EXPORT_C(void,flc_set_status)(int X,int Y,int W,int H){
    fl_set_status(X,Y,W,H);
  }
  FL_EXPORT_C(void,flc_set_spot_with_win)(int font,int size,int X,int Y,int W,int H,fl_Window win){
    fl_set_spot(font,size,X,Y,W,H,(static_cast<Fl_Window*>(win)));
  }
  FL_EXPORT_C(void,flc_set_spot)(int font,int size,int X,int Y,int W,int H){
    fl_set_spot(font,size,X,Y,W,H);
  }
  FL_EXPORT_C(void,flc_reset_spot)( ){
    fl_reset_spot();
  }
  FL_EXPORT_C(int,flc_draw_symbol)(const char* label,int x,int y,int w,int h,Fl_Color color){
    return fl_draw_symbol(label,x,y,w,h,color);
  }
  FL_EXPORT_C(int,flc_add_symbol)(const char* name, void (*drawit)(Fl_Color), int scalable){
    return fl_add_symbol(name, drawit, scalable);
  }
#ifdef __cplusplus
}
#endif
