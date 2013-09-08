#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <Fl_C.h>
#include <Fl_Overlay_WindowC.h>
#include <Fl_WindowC.h>
#include <Fl_GroupC.h>

#include <Fl_Light_ButtonC.h>
#include <Fl_ButtonC.h>
#include <Fl_DrawC.h>
#include <Fl_ClockC.h>
#include "pixmaps/porsche.xpm"
#include <Fl_PixmapC.h>
#include <Fl_BitmapC.h>
#include <Fl_RGB_ImageC.h>
#include <Fl_Round_ButtonC.h>
#include <Fl_Return_ButtonC.h>
#include <Fl_Check_ButtonC.h>
#include <Fl_ButtonC.h>
#include <Fl_BoxC.h>
#include <Fl_PrinterC.h>
#include <Fl_WidgetC.h>

#define sorceress_width 75
#define sorceress_height 75
uchar sorceress_bits[] = {
  0xfc, 0x7e, 0x40, 0x20, 0x90, 0x00, 0x07, 0x80, 0x23, 0x00, 0x00, 0xc6,
  0xc1, 0x41, 0x98, 0xb8, 0x01, 0x07, 0x66, 0x00, 0x15, 0x9f, 0x03, 0x47,
  0x8c, 0xc6, 0xdc, 0x7b, 0xcc, 0x00, 0xb0, 0x71, 0x0e, 0x4d, 0x06, 0x66,
  0x73, 0x8e, 0x8f, 0x01, 0x18, 0xc4, 0x39, 0x4b, 0x02, 0x23, 0x0c, 0x04,
  0x1e, 0x03, 0x0c, 0x08, 0xc7, 0xef, 0x08, 0x30, 0x06, 0x07, 0x1c, 0x02,
  0x06, 0x30, 0x18, 0xae, 0xc8, 0x98, 0x3f, 0x78, 0x20, 0x06, 0x02, 0x20,
  0x60, 0xa0, 0xc4, 0x1d, 0xc0, 0xff, 0x41, 0x04, 0xfa, 0x63, 0x80, 0xa1,
  0xa4, 0x3d, 0x00, 0x84, 0xbf, 0x04, 0x0f, 0x06, 0xfc, 0xa1, 0x34, 0x6b,
  0x01, 0x1c, 0xc9, 0x05, 0x06, 0xc7, 0x06, 0xbe, 0x11, 0x1e, 0x43, 0x30,
  0x91, 0x05, 0xc3, 0x61, 0x02, 0x30, 0x1b, 0x30, 0xcc, 0x20, 0x11, 0x00,
  0xc1, 0x3c, 0x03, 0x20, 0x0a, 0x00, 0xe8, 0x60, 0x21, 0x00, 0x61, 0x1b,
  0xc1, 0x63, 0x08, 0xf0, 0xc6, 0xc7, 0x21, 0x03, 0xf8, 0x08, 0xe1, 0xcf,
  0x0a, 0xfc, 0x4d, 0x99, 0x43, 0x07, 0x3c, 0x0c, 0xf1, 0x9f, 0x0b, 0xfc,
  0x5b, 0x81, 0x47, 0x02, 0x16, 0x04, 0x31, 0x1c, 0x0b, 0x1f, 0x17, 0x89,
  0x4d, 0x06, 0x1a, 0x04, 0x31, 0x38, 0x02, 0x07, 0x56, 0x89, 0x49, 0x04,
  0x0b, 0x04, 0xb1, 0x72, 0x82, 0xa1, 0x54, 0x9a, 0x49, 0x04, 0x1d, 0x66,
  0x50, 0xe7, 0xc2, 0xf0, 0x54, 0x9a, 0x58, 0x04, 0x0d, 0x62, 0xc1, 0x1f,
  0x44, 0xfc, 0x51, 0x90, 0x90, 0x04, 0x86, 0x63, 0xe0, 0x74, 0x04, 0xef,
  0x31, 0x1a, 0x91, 0x00, 0x02, 0xe2, 0xc1, 0xfd, 0x84, 0xf9, 0x30, 0x0a,
  0x91, 0x00, 0x82, 0xa9, 0xc0, 0xb9, 0x84, 0xf9, 0x31, 0x16, 0x81, 0x00,
  0x42, 0xa9, 0xdb, 0x7f, 0x0c, 0xff, 0x1c, 0x16, 0x11, 0x00, 0x02, 0x28,
  0x0b, 0x07, 0x08, 0x60, 0x1c, 0x02, 0x91, 0x00, 0x46, 0x29, 0x0e, 0x00,
  0x00, 0x00, 0x10, 0x16, 0x11, 0x02, 0x06, 0x29, 0x04, 0x00, 0x00, 0x00,
  0x10, 0x16, 0x91, 0x06, 0xa6, 0x2a, 0x04, 0x00, 0x00, 0x00, 0x18, 0x24,
  0x91, 0x04, 0x86, 0x2a, 0x04, 0x00, 0x00, 0x00, 0x18, 0x27, 0x93, 0x04,
  0x96, 0x4a, 0x04, 0x00, 0x00, 0x00, 0x04, 0x02, 0x91, 0x04, 0x86, 0x4a,
  0x0c, 0x00, 0x00, 0x00, 0x1e, 0x23, 0x93, 0x04, 0x56, 0x88, 0x08, 0x00,
  0x00, 0x00, 0x90, 0x21, 0x93, 0x04, 0x52, 0x0a, 0x09, 0x80, 0x01, 0x00,
  0xd0, 0x21, 0x95, 0x04, 0x57, 0x0a, 0x0f, 0x80, 0x27, 0x00, 0xd8, 0x20,
  0x9d, 0x04, 0x5d, 0x08, 0x1c, 0x80, 0x67, 0x00, 0xe4, 0x01, 0x85, 0x04,
  0x79, 0x8a, 0x3f, 0x00, 0x00, 0x00, 0xf4, 0x11, 0x85, 0x06, 0x39, 0x08,
  0x7d, 0x00, 0x00, 0x18, 0xb7, 0x10, 0x81, 0x03, 0x29, 0x12, 0xcb, 0x00,
  0x7e, 0x30, 0x28, 0x00, 0x85, 0x03, 0x29, 0x10, 0xbe, 0x81, 0xff, 0x27,
  0x0c, 0x10, 0x85, 0x03, 0x29, 0x32, 0xfa, 0xc1, 0xff, 0x27, 0x94, 0x11,
  0x85, 0x03, 0x28, 0x20, 0x6c, 0xe1, 0xff, 0x07, 0x0c, 0x01, 0x85, 0x01,
  0x28, 0x62, 0x5c, 0xe3, 0x8f, 0x03, 0x4e, 0x91, 0x80, 0x05, 0x39, 0x40,
  0xf4, 0xc2, 0xff, 0x00, 0x9f, 0x91, 0x84, 0x05, 0x31, 0xc6, 0xe8, 0x07,
  0x7f, 0x80, 0xcd, 0x00, 0xc4, 0x04, 0x31, 0x06, 0xc9, 0x0e, 0x00, 0xc0,
  0x48, 0x88, 0xe0, 0x04, 0x79, 0x04, 0xdb, 0x12, 0x00, 0x30, 0x0c, 0xc8,
  0xe4, 0x04, 0x6d, 0x06, 0xb6, 0x23, 0x00, 0x18, 0x1c, 0xc0, 0x84, 0x04,
  0x25, 0x0c, 0xff, 0xc2, 0x00, 0x4e, 0x06, 0xb0, 0x80, 0x04, 0x3f, 0x8a,
  0xb3, 0x83, 0xff, 0xc3, 0x03, 0x91, 0x84, 0x04, 0x2e, 0xd8, 0x0f, 0x3f,
  0x00, 0x00, 0x5f, 0x83, 0x84, 0x04, 0x2a, 0x70, 0xfd, 0x7f, 0x00, 0x00,
  0xc8, 0xc0, 0x84, 0x04, 0x4b, 0xe2, 0x2f, 0x01, 0x00, 0x08, 0x58, 0x60,
  0x80, 0x04, 0x5b, 0x82, 0xff, 0x01, 0x00, 0x08, 0xd0, 0xa0, 0x84, 0x04,
  0x72, 0x80, 0xe5, 0x00, 0x00, 0x08, 0xd2, 0x20, 0x44, 0x04, 0xca, 0x02,
  0xff, 0x00, 0x00, 0x08, 0xde, 0xa0, 0x44, 0x04, 0x82, 0x02, 0x6d, 0x00,
  0x00, 0x08, 0xf6, 0xb0, 0x40, 0x02, 0x82, 0x07, 0x3f, 0x00, 0x00, 0x08,
  0x44, 0x58, 0x44, 0x02, 0x93, 0x3f, 0x1f, 0x00, 0x00, 0x30, 0x88, 0x4f,
  0x44, 0x03, 0x83, 0x23, 0x3e, 0x00, 0x00, 0x00, 0x18, 0x60, 0xe0, 0x07,
  0xe3, 0x0f, 0xfe, 0x00, 0x00, 0x00, 0x70, 0x70, 0xe4, 0x07, 0xc7, 0x1b,
  0xfe, 0x01, 0x00, 0x00, 0xe0, 0x3c, 0xe4, 0x07, 0xc7, 0xe3, 0xfe, 0x1f,
  0x00, 0x00, 0xff, 0x1f, 0xfc, 0x07, 0xc7, 0x03, 0xf8, 0x33, 0x00, 0xc0,
  0xf0, 0x07, 0xff, 0x07, 0x87, 0x02, 0xfc, 0x43, 0x00, 0x60, 0xf0, 0xff,
  0xff, 0x07, 0x8f, 0x06, 0xbe, 0x87, 0x00, 0x30, 0xf8, 0xff, 0xff, 0x07,
  0x8f, 0x14, 0x9c, 0x8f, 0x00, 0x00, 0xfc, 0xff, 0xff, 0x07, 0x9f, 0x8d,
  0x8a, 0x0f, 0x00, 0x00, 0xfe, 0xff, 0xff, 0x07, 0xbf, 0x0b, 0x80, 0x1f,
  0x00, 0x00, 0xff, 0xff, 0xff, 0x07, 0x7f, 0x3a, 0x80, 0x3f, 0x00, 0x80,
  0xff, 0xff, 0xff, 0x07, 0xff, 0x20, 0xc0, 0x3f, 0x00, 0x80, 0xff, 0xff,
  0xff, 0x07, 0xff, 0x01, 0xe0, 0x7f, 0x00, 0xc0, 0xff, 0xff, 0xff, 0x07,
  0xff, 0x0f, 0xf8, 0xff, 0x40, 0xe0, 0xff, 0xff, 0xff, 0x07, 0xff, 0xff,
  0xff, 0xff, 0x40, 0xf0, 0xff, 0xff, 0xff, 0x07, 0xff, 0xff, 0xff, 0xff,
  0x41, 0xf0, 0xff, 0xff, 0xff, 0x07};
void draw_widget(fl_Widget self){
  Fl_Box_draw_super(self);
  flc_set_color(FL_RED);
  flc_rectf(Fl_Box_x(self)+5,Fl_Box_y(self)+5,Fl_Box_w(self)-10,Fl_Box_h(self)-10);
  flc_push_clip(Fl_Box_x(self)+6,Fl_Box_y(self)+6,Fl_Box_w(self)-12,Fl_Box_h(self)-12);
  flc_set_color(FL_DARK_GREEN);
  flc_rectf(Fl_Box_x(self)+5,Fl_Box_y(self)+5,Fl_Box_w(self)-10,Fl_Box_h(self)-10);
  flc_pop_clip();
  flc_set_color(FL_YELLOW);
  flc_rectf(Fl_Box_x(self)+7,Fl_Box_y(self)+7,Fl_Box_w(self)-14,Fl_Box_h(self)-14);
  flc_set_color(FL_BLUE);

  flc_rect(Fl_Box_x(self)+8,Fl_Box_y(self)+8,Fl_Box_w(self)-16,Fl_Box_h(self)-16);
  flc_push_clip(Fl_Box_x(self)+25,Fl_Box_y(self)+25,Fl_Box_w(self)-50, Fl_Box_h(self)-50);
  flc_set_color(FL_BLACK);
  flc_rect(Fl_Box_x(self)+24,Fl_Box_y(self)+24,Fl_Box_w(self)-48,Fl_Box_h(self)-48);
  flc_line(Fl_Box_x(self)+27,Fl_Box_y(self)+27,Fl_Box_x(self)+Fl_Box_w(self)-27,Fl_Box_y(self)+Fl_Box_h(self)-27);
  flc_line(Fl_Box_x(self)+27,Fl_Box_y(self)+Fl_Box_h(self)-27,Fl_Box_x(self)+Fl_Box_w(self)-27,Fl_Box_y(self)+27);
  flc_pop_clip();
}
void draw_widget2(fl_Widget self){
  Fl_Box_draw_super(self);
  int d;
  for(d=Fl_Box_y(self)+5;d<48+Fl_Box_y(self);d+=2){
    flc_xyline(Fl_Box_x(self)+5,d,Fl_Box_x(self)+48);
  }

  flc_push_clip(Fl_Box_x(self)+52,Fl_Box_y(self)+5,45,43);
  for(d=Fl_Box_y(self)+5;d<150+Fl_Box_y(self);d+=3){
    flc_line(Fl_Box_x(self)+52,d,Fl_Box_x(self)+92,d-40);
  }
  flc_pop_clip();

  flc_line_style(FL_DASH);
  flc_xyline(Fl_Box_x(self)+5,Fl_Box_y(self)+55,Fl_Box_x(self)+48);
  flc_line_style(FL_DOT);
  flc_xyline(Fl_Box_x(self)+5,Fl_Box_y(self)+58,Fl_Box_x(self)+48);
  flc_line_style(FL_DASHDOT);
  flc_xyline(Fl_Box_x(self)+5,Fl_Box_y(self)+61,Fl_Box_x(self)+48);
  flc_line_style(FL_DASHDOTDOT);
  flc_xyline(Fl_Box_x(self)+5,Fl_Box_y(self)+64,Fl_Box_x(self)+48);
  flc_line_style_with_width_dashes(0,0,(char*)"\7\3\7\2");
  flc_xyline(Fl_Box_x(self)+5,Fl_Box_y(self)+67,Fl_Box_x(self)+48);

  flc_line_style(0);

  flc_line(Fl_Box_x(self)+5,Fl_Box_y(self)+72,Fl_Box_x(self)+25,Fl_Box_y(self)+95);
  flc_line_with_x2_y2(Fl_Box_x(self)+8,Fl_Box_y(self)+72,Fl_Box_x(self)+28,Fl_Box_y(self)+95,Fl_Box_x(self)+31,Fl_Box_y(self)+72);

  flc_set_color(FL_YELLOW);
  flc_polygon(Fl_Box_x(self)+11, Fl_Box_y(self)+72,Fl_Box_x(self)+27,Fl_Box_y(self)+91,Fl_Box_x(self)+29,Fl_Box_y(self)+72);
  flc_set_color(FL_RED);
  flc_loop(Fl_Box_x(self)+11, Fl_Box_y(self)+72,Fl_Box_x(self)+27,Fl_Box_y(self)+91,Fl_Box_x(self)+29,Fl_Box_y(self)+72);

  flc_set_color(FL_BLUE); ////
  flc_line_style_with_width(FL_SOLID, 6);
  flc_loop(Fl_Box_x(self)+31, Fl_Box_y(self)+12,Fl_Box_x(self)+47,Fl_Box_y(self)+31,Fl_Box_x(self)+49,Fl_Box_y(self)+12);
  flc_line_style(0);

  flc_set_color_with_rgb(200,0,200);
  flc_polygon_with_x3_y3(Fl_Box_x(self)+35,Fl_Box_y(self)+72,Fl_Box_x(self)+33,Fl_Box_y(self)+95,Fl_Box_x(self)+48,Fl_Box_y(self)+95,Fl_Box_x(self)+43,Fl_Box_y(self)+72);
  flc_set_color(FL_GREEN);
  flc_loop_with_x3_y3(Fl_Box_x(self)+35,Fl_Box_y(self)+72,Fl_Box_x(self)+33,Fl_Box_y(self)+95,Fl_Box_x(self)+48,Fl_Box_y(self)+95,Fl_Box_x(self)+43,Fl_Box_y(self)+72);

  flc_set_color(FL_BLUE);
  flc_yxline_with_y1(Fl_Box_x(self)+65,Fl_Box_y(self)+63,Fl_Box_y(self)+66);
  flc_set_color(FL_GREEN);
  flc_yxline_with_y1(Fl_Box_x(self)+66,Fl_Box_y(self)+66,Fl_Box_y(self)+63);

  flc_set_color(FL_BLUE);
  flc_rect(Fl_Box_x(self)+80,Fl_Box_y(self)+55,5,5);
  flc_set_color(FL_YELLOW);
  flc_rectf(Fl_Box_x(self)+81,Fl_Box_y(self)+56,3,3);
  flc_set_color(FL_BLACK);
  flc_point(Fl_Box_x(self)+82,Fl_Box_y(self)+57);

  flc_set_color(FL_BLUE);
  flc_rect(Fl_Box_x(self)+56, Fl_Box_y(self)+79, 24, 17);
  flc_set_color(FL_CYAN);
  flc_rectf(Fl_Box_x(self)+57, Fl_Box_y(self)+80, 22 , 15 );
  flc_set_color(FL_RED);
  flc_arc_by_width_height(Fl_Box_x(self)+57, Fl_Box_y(self)+80, 22 ,15 ,40, 270);
  flc_set_color(FL_YELLOW);
  flc_pie(Fl_Box_x(self)+58, Fl_Box_y(self)+81, 20 ,13 ,40, 270);

  flc_line_style(0);

  flc_set_color(FL_BLACK);
  flc_point(Fl_Box_x(self)+58,Fl_Box_y(self)+58);
  flc_set_color(FL_RED);
  flc_yxline_with_y1(Fl_Box_x(self)+59,Fl_Box_y(self)+58,Fl_Box_y(self)+59);
  flc_set_color(FL_GREEN);
  flc_yxline_with_y1(Fl_Box_x(self)+60,Fl_Box_y(self)+59,Fl_Box_y(self)+58);
  flc_set_color(FL_BLACK);
  flc_xyline(Fl_Box_x(self)+61,Fl_Box_y(self)+58,Fl_Box_x(self)+62);
  flc_set_color(FL_RED);
  flc_xyline(Fl_Box_x(self)+62,Fl_Box_y(self)+59,Fl_Box_x(self)+61);

  flc_set_color(FL_GREEN);
  flc_yxline_with_y2_x2(Fl_Box_x(self)+57,Fl_Box_y(self)+58,Fl_Box_y(self)+59,Fl_Box_x(self)+58);
  flc_set_color(FL_BLUE);
  flc_xyline_with_x2(Fl_Box_x(self)+58,Fl_Box_y(self)+60,Fl_Box_x(self)+56,Fl_Box_y(self)+58);
  flc_set_color(FL_RED);
  flc_xyline_with_x2(Fl_Box_x(self)+58,Fl_Box_y(self)+61,Fl_Box_x(self)+56,Fl_Box_y(self)+63);
  flc_set_color(FL_GREEN);
  flc_yxline_with_y2_x2(Fl_Box_x(self)+57,Fl_Box_y(self)+63,Fl_Box_y(self)+62,Fl_Box_x(self)+58);

  flc_set_color(FL_BLUE);
  flc_line(Fl_Box_x(self)+58,Fl_Box_y(self)+63, Fl_Box_x(self)+60, Fl_Box_y(self)+65);
  flc_set_color(FL_BLACK);
  flc_line(Fl_Box_x(self)+61,Fl_Box_y(self)+65, Fl_Box_x(self)+59, Fl_Box_y(self)+63);

  flc_set_color(FL_BLACK);
};
void draw_widget3(fl_Widget self){
  Fl_Box_draw_super(self);
  double d;
  flc_push_clip(Fl_Box_x(self)+5,Fl_Box_y(self)+5,45,43);
  for(d=Fl_Box_y(self)+5;d<95+Fl_Box_y(self);d+=1.63){
    flc_begin_line();
    flc_vertex(Fl_Box_x(self)+5,d);
    flc_vertex(Fl_Box_x(self)+48,d);
    flc_end_line();
  }
  flc_pop_clip();

  flc_push_clip(Fl_Box_x(self)+52,Fl_Box_y(self)+5,45,43);
  for(d=Fl_Box_y(self)+5;d<150+Fl_Box_y(self);d+=2.3052){
    flc_begin_line();
    flc_vertex(Fl_Box_x(self)+52,d);
    flc_vertex(Fl_Box_x(self)+92,d-43);
    flc_end_line();
  }
  flc_pop_clip();
};
void draw_widget4(fl_Widget self){
  Fl_Box_draw_super(self);
  flc_push_matrix();
  flc_translate(Fl_Box_x(self),Fl_Box_y(self));
  flc_scale_with_y(.75,.75);

  flc_line_style_with_width(FL_SOLID , 5);
  flc_begin_line();
  flc_vertex(10, 160);
  flc_vertex(40, 160);
  flc_vertex(40, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_RED);
  flc_line_style_with_width(FL_SOLID | FL_CAP_FLAT |FL_JOIN_MITER , 5);
  flc_begin_line();
  flc_vertex(10, 150);
  flc_vertex(50, 150);
  flc_vertex(50, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_GREEN);
  flc_line_style_with_width(FL_SOLID | FL_CAP_ROUND |FL_JOIN_ROUND , 5);
  flc_begin_line();
  flc_vertex(10, 140);
  flc_vertex(60, 140);
  flc_vertex(60, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLUE);
  flc_line_style_with_width(FL_SOLID | FL_CAP_SQUARE |FL_JOIN_BEVEL , 5);
  flc_begin_line();
  flc_vertex(10, 130);
  flc_vertex(70, 130);
  flc_vertex(70, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLACK);
  flc_line_style_with_width(FL_DASH , 5);
  flc_begin_line();
  flc_vertex(10, 120);
  flc_vertex(80, 120);
  flc_vertex(80, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_RED);
  flc_line_style_with_width(FL_DASH |FL_CAP_FLAT , 5);
  flc_begin_line();
  flc_vertex(10, 110);
  flc_vertex(90, 110);
  flc_vertex(90, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_GREEN);
  flc_line_style_with_width(FL_DASH |FL_CAP_ROUND , 5);
  flc_begin_line();
  flc_vertex(10, 100);
  flc_vertex(100, 100);
  flc_vertex(100, 190);
  flc_end_line();
  flc_line_style(0);


  flc_set_color(FL_BLUE);
  flc_line_style_with_width(FL_DASH |FL_CAP_SQUARE , 5);
  flc_begin_line();
  flc_vertex(10, 90);
  flc_vertex(110, 90);
  flc_vertex(110, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLACK);
  flc_line_style_with_width(FL_DOT, 5);
  flc_begin_line();
  flc_vertex(10, 80);
  flc_vertex(120, 80);
  flc_vertex(120, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_RED);
  flc_line_style_with_width(FL_DOT | FL_CAP_FLAT, 5);
  flc_begin_line();
  flc_vertex(10, 70);
  flc_vertex(130, 70);
  flc_vertex(130, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_GREEN);
  flc_line_style_with_width(FL_DOT | FL_CAP_ROUND, 5);
  flc_begin_line();
  flc_vertex(10, 60);
  flc_vertex(140, 60);
  flc_vertex(140, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLUE);
  flc_line_style_with_width(FL_DOT | FL_CAP_SQUARE, 5);
  flc_begin_line();
  flc_vertex(10, 50);
  flc_vertex(150, 50);
  flc_vertex(150, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLACK);
  flc_line_style_with_width(FL_DASHDOT |FL_CAP_ROUND |FL_JOIN_ROUND , 5);
  flc_begin_line();
  flc_vertex(10, 40);
  flc_vertex(160, 40);
  flc_vertex(160, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_RED);
  flc_line_style_with_width(FL_DASHDOTDOT |FL_CAP_SQUARE |FL_JOIN_BEVEL , 5);
  flc_begin_line();
  flc_vertex(10, 30);
  flc_vertex(170, 30);
  flc_vertex(170, 190);
  flc_end_line();
  flc_line_style(0);


  flc_set_color(FL_GREEN);
  flc_line_style_with_width(FL_DASHDOTDOT |FL_CAP_ROUND |FL_JOIN_ROUND , 5);
  flc_begin_line();
  flc_vertex(10, 20);
  flc_vertex(180, 20);
  flc_vertex(180, 190);
  flc_end_line();
  flc_line_style(0);

  flc_set_color(FL_BLUE);
  flc_line_style_with_width_dashes(0, 5, (char*)"\12\3\4\2\2\1");
  flc_begin_line();
  flc_vertex(10, 10);
  flc_vertex(190, 10);
  flc_vertex(190, 190);

  flc_end_line();
  flc_line_style(0);
  flc_pop_matrix();
  flc_set_color(FL_BLACK);
}
void draw_widget5(fl_Widget self){
  Fl_Box_draw_super(self);
  //fl_push_clip(x(),y(),w(),h());
  flc_push_matrix();

  flc_translate(Fl_Box_x(self),Fl_Box_y(self));
  flc_push_matrix();
  flc_mult_matrix(1,3,0,1,0,-20);
  flc_set_color(FL_GREEN);
  flc_begin_polygon();
  flc_vertex(10,10);
  flc_vertex(100,-80);
  flc_vertex(100,-190);
  flc_end_polygon();

  flc_set_color(FL_RED);
  flc_line_style_with_width(FL_DASHDOT, 7);
  flc_begin_loop();

  flc_vertex(10,10);
  flc_vertex(100,-80);
  flc_vertex(100,-190);
  flc_end_loop();
  flc_line_style(0);

  flc_set_color(FL_BLUE);
  flc_line_style_with_width(FL_SOLID, 3);
  flc_begin_loop();
  flc_circle(60,-50,30);
  flc_end_loop();
  flc_line_style(0);

  flc_pop_matrix();
  flc_scale_with_y(1.8,1);

  flc_set_color(FL_YELLOW);
  flc_begin_polygon();
  flc_arc_by_radius(30,90,20,-45,200);
  flc_end_polygon();

  flc_set_color(FL_BLACK);
  flc_line_style_with_width(FL_DASH, 3);
  flc_begin_line();
  flc_arc_by_radius(30,90,20,-45,200);
  flc_end_line();
  flc_line_style(0);

  flc_translate(15,0);
  flc_scale_with_y(1.5,3);
  flc_begin_complex_polygon();
  flc_vertex(30,70);
  flc_arc_by_radius(45,55,10,200,90);
  flc_arc_by_radius(55,45,8,-170,20);
  flc_vertex(60,40);
  flc_vertex(30,20);
  flc_vertex(40,5);
  flc_vertex(60,25);
  //fl_vertex(50,50);
  flc_curve(35,30,30,53,0,35,65,65);
  flc_gap();
  flc_vertex(50,25);
  flc_vertex(40,10);
  flc_vertex(35,20);
  flc_end_complex_polygon();
  flc_pop_matrix();
}
fl_Box make_widget(int x, int y, fl_Box_Virtual_Funcs* funcs){
  fl_Box b = Fl_OverriddenBox_New_WithLabel(x,y,100,100, "Clipping and rect(f):\nYellow rect.framed\nby B-Y-G-R rect. 1 p.\nthick. Your printer may \nrender very thin lines\nsurrounding \"X\"",funcs);
  Fl_Box_set_align(b, FL_ALIGN_TOP);
  Fl_Box_set_labelsize(b, 10);
  return b;
}
fl_Box make_widget2(int x, int y, fl_Box_Virtual_Funcs* funcs){
  fl_Box b = Fl_OverriddenBox_New_WithLabel(x,y,100,100, "Integer primitives",funcs);
  Fl_Box_set_labelsize(b,10);
  Fl_Box_set_align(b,FL_ALIGN_TOP);
  return b;
}
fl_Box make_widget3(int x, int y, fl_Box_Virtual_Funcs* funcs){
  fl_Box b = Fl_OverriddenBox_New_WithLabel(x,y,100,100, "Sub-pixel drawing of\nlines 1.63 points apart\nOn the screen you\ncan see aliasing, the\nprinter should render\nthem properly",funcs);
  Fl_Box_set_labelsize(b,10);
  Fl_Box_set_align(b,FL_ALIGN_TOP);
  return b;
}
fl_Box make_widget4(int x, int y, fl_Box_Virtual_Funcs* funcs){
  fl_Box b = Fl_OverriddenBox_New_WithLabel(x,y,150,150, "Line styles",funcs);
  Fl_Box_set_labelsize(b,10);
  Fl_Box_set_align(b,FL_ALIGN_TOP);
  return b;
}
fl_Box make_widget5(int x, int y, fl_Box_Virtual_Funcs* funcs){
  fl_Box b = Fl_OverriddenBox_New_WithLabel(x,y,230,250, "Complex (double) drawings:\nBlue ellipse may not be\ncorrectly transformed\ndue to non-orthogonal\ntransformation",funcs);
  Fl_Box_set_labelsize(b,10);
  Fl_Box_set_align(b,FL_ALIGN_TOP);
  return b;
}
uchar* image;
int width;
int height;
void make_image() {
  image = malloc(sizeof(uchar)*4*width*height);
  uchar *p = image;
  int y = 0;
  for (;y < height; y++) {
    double Y = (double)(y)/(height-1);
    int x = 0;
    for (; x < width; x++) {
      double X = (double)(x)/(width-1);
      *p++ = (uchar)(255*((1-X)*(1-Y))); // red in upper-left
      *p++ = (uchar)(255*((1-X)*Y));	// green in lower-left
      *p++ = (uchar)(255*(X*Y));	// blue in lower-right
      X -= 0.5;
      Y -= 0.5;
      int alpha = (int)(350 * sqrt(X * X + Y * Y));
      if (alpha < 255) *p++ = (uchar)(alpha);	// alpha transparency
      else *p++ = 255;
      Y += 0.5;
    }
  }
}
void print(fl_Widget w, void *v) {
  fl_Widget g = w;
  fl_Printer p = Fl_Printer_New();
  if (!Fl_Printer_start_job(p,1)) {
    Fl_Printer_start_page(p);
    fl_Window w = Fl_Widget_window(g);
    Fl_Printer_print_window(p,w);
    Fl_Printer_end_page(p);
    Fl_Printer_end_job(p);
  }
  Fl_Printer_Destroy(p);
}
void draw_button(fl_Widget w){
  fl_Button b = (fl_Button)w;
  Fl_Button_draw_super(b);
  if (Fl_Button_type(b) == FL_HIDDEN_BUTTON) return;
  Fl_Color col = Fl_Button_value(b) ? Fl_Button_selection_color(b) : Fl_Button_color(b);
  Fl_Button_draw_box_with_tc(b,Fl_Button_value(b) ? (Fl_Button_down_box(b)?Fl_Button_down_box(b):fl_downC(Fl_Button_box(b))) : Fl_Button_box(b), col);
  flc_set_color(FL_WHITE);
  flc_line_style_with_width(FL_SOLID,5);
  flc_line(Fl_Button_x(b)+15,Fl_Button_y(b)+10,Fl_Button_x(b)+Fl_Button_w(b)-15,Fl_Button_y(b)+Fl_Button_h(b)-23);
  flc_line(Fl_Button_x(b)+Fl_Button_w(b)-15,Fl_Button_y(b)+10,Fl_Button_x(b)+15,Fl_Button_y(b)+Fl_Button_h(b)-23);
  flc_line_style(0);
  Fl_Button_draw_label(b);
};
int main (int argc, char** argv){
  width = 80;
  height = 80;
  fl_Window w2 = Fl_Window_New_WithLabel(500,560,"Graphics test");
  fl_Group c2 = Fl_Group_New(3, 43, 494, 514 );
  fl_Box_Virtual_Funcs* widget_funcs = Fl_Box_default_virtual_funcs();
  widget_funcs->draw = &draw_widget;
  make_widget(10,140,widget_funcs);
  fl_Box_Virtual_Funcs* widget2_funcs = Fl_Box_default_virtual_funcs();
  widget2_funcs->draw = &draw_widget2;
  make_widget2(110,80,widget2_funcs);
  fl_Box_Virtual_Funcs* widget3_funcs = Fl_Box_default_virtual_funcs();
  widget3_funcs->draw = &draw_widget3;
  make_widget3(220,140,widget3_funcs);
  fl_Box_Virtual_Funcs* widget4_funcs = Fl_Box_default_virtual_funcs();
  widget4_funcs->draw = &draw_widget4;
  make_widget4(330,70,widget4_funcs);
  fl_Box_Virtual_Funcs* widget5_funcs = Fl_Box_default_virtual_funcs();
  widget5_funcs->draw = &draw_widget5;
  make_widget5(140,270,widget5_funcs);

  make_image();
  fl_RGB_Image rgb = Fl_RGB_Image_New_With_D(image, width, height, 4);
  fl_Button_Virtual_Funcs* b_rgb_funcs = Fl_Button_default_virtual_funcs();
  b_rgb_funcs->draw = &draw_button;
  fl_Button b_rgb = Fl_OverriddenButton_New_WithLabel(10,245,100,100,"RGB with alpha",b_rgb_funcs);
  Fl_Button_set_image(b_rgb,rgb);


  fl_Button_Virtual_Funcs* b_pixmap_funcs = Fl_Button_default_virtual_funcs();
  b_pixmap_funcs->draw = &draw_button;
  fl_Button b_pixmap = Fl_OverriddenButton_New_WithLabel(10,345,100,100,"Pixmap",b_pixmap_funcs);
  fl_Pixmap pixmap = Fl_Pixmap_New((char**)porsche_xpm);
  Fl_Button_set_image(b_pixmap, pixmap);

  fl_Button_Virtual_Funcs* b_bitmap_funcs = Fl_Button_default_virtual_funcs();
  b_bitmap_funcs->draw = &draw_button;
  fl_Button b_bitmap = Fl_OverriddenButton_New_WithLabel(10,445,100,100,"Bitmap",b_bitmap_funcs);
  fl_Bitmap sorceress = Fl_Bitmap_New_WithUchar(sorceress_bits, sorceress_width, sorceress_height);
  Fl_Button_set_labelcolor(b_bitmap,FL_GREEN);
  Fl_Button_set_image(b_bitmap, sorceress);
  Fl_Clock_New(360,230,120,120);
  fl_Return_Button ret = Fl_Return_Button_New_WithLabel(360, 360, 120,30, "Return");
  Fl_Return_Button_deactivate(ret);
  fl_Button but1 = Fl_Button_New_WithLabel(360, 390, 30, 30, "@->|");
  Fl_Button_set_labelcolor(but1,FL_DARK3);
  fl_Button but2 = Fl_Button_New_WithLabel(390, 390, 30, 30, "@UpArrow");
  Fl_Button_set_labelcolor(but2,FL_DARK3);
  fl_Button but3 = Fl_Button_New_WithLabel(420, 390, 30, 30, "@DnArrow");
  Fl_Button_set_labelcolor(but3,FL_DARK3);
  fl_Button but4 = Fl_Button_New_WithLabel(450, 390, 30, 30, "@+");
  Fl_Button_set_labelcolor(but4,FL_DARK3);
  fl_Button but5 = Fl_Button_New_WithLabel(360, 425, 120, 30, "Hello, World");
  Fl_Button_set_labelfont(but5,FL_BOLD|FL_ITALIC);
  Fl_Button_set_labeltype(but5,FL_SHADOW_LABEL);
  Fl_Button_set_box(but5,FL_ROUND_UP_BOX);
  fl_Button but6 = Fl_Button_New_WithLabel(360, 460, 120, 30, "Plastic");
  Fl_Button_set_box(but6,FL_PLASTIC_UP_BOX);
  {
    fl_Group o = Fl_Group_New(360, 495, 120, 40);
    Fl_Group_set_box(o,FL_UP_BOX);
    {
      fl_Group o = Fl_Group_New(365, 500, 110, 30);
      Fl_Group_set_box(o,FL_THIN_UP_FRAME);
      {
	fl_Round_Button o = Fl_Round_Button_New_WithLabel(365, 500, 40, 30, "rad");
	Fl_Round_Button_set_value(o,1);
      }
      {
	fl_Check_Button o = Fl_Check_Button_New_WithLabel(410, 500, 60, 30, "check");
	Fl_Check_Button_set_value(o,1);
      }

      Fl_Group_end(o);
    }
    Fl_Group_end(o);
    Fl_Group_deactivate(o);
  }
  fl_Box tx = Fl_Box_New_WithLabel(120,492,230,50,"Background is not printed because\nencapsulating group, which we are\n printing, has not set the box type");
  Fl_Box_set_box(tx,FL_SHADOW_BOX);
  Fl_Box_set_labelsize(tx,12);

  Fl_Box_hide(tx);

  Fl_Group_end(c2);
  fl_Button b4 = Fl_Button_New_WithLabel(10,5, 150, 25, "Print");
  Fl_Button_set_callback_with_user_data(b4,print,c2);

  Fl_Window_end(w2);
  Fl_Window_show_with_args(w2,argc, argv);
  return Fl_run();
}
