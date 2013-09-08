#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_BoxC.h>
#include <Fl_ButtonC.h>
#include <fl_show_colormapC.h>
#include <Fl_Color_ChooserC.h>
#include <Fl_ImageC.h>
#include <Fl_DrawC.h>
#include <Fl_GroupC.h>
#include <Fl_AskC.h>
#include <xC.h>
#include <FL/Xutf8.h>

#include <stdlib.h>
#include <stdio.h>
#if !defined(WIN32) && !defined(__APPLE__)
#include "list_visuals.h"
#endif

int width = 75;
int height = 75;
uchar *image;
void make_image() {
  uchar *image;
  image = malloc(3*width*height*sizeof(uchar));
  uchar *p = image;
  int y = 0;
  for (; y < height; y++) {
    double Y = (double)(y)/(height-1);
    int x = 0;
    for (; x < width; x++) {
      double X = (double)(x)/(width-1);
      *p++ = (uchar)(255*((1-X)*(1-Y))); // red in upper-left
      *p++ = (uchar)(255*((1-X)*Y));	// green in lower-left
      *p++ = (uchar)(255*(X*Y));	// blue in lower-right
    }
  }
}
void draw(fl_Widget w) {
  fl_Box b = (fl_Box)w;
  // use every color in the gray ramp:
  int i = 0;
  for (; i < 3*8; i++) {
    flc_set_color((Fl_Color)(FL_GRAY_RAMP+i));
    flc_line(Fl_Box_x(b)+i, Fl_Box_y(b), Fl_Box_x(b)+i, Fl_Box_y(b)+Fl_Box_h(b));
  }
}
Fl_Color c;
#define fullcolor_cell (FL_FREE_COLOR)

void cb1(fl_Widget w, void* user_data) {
  c = flc_show_colormap(c);
  fl_Box b = (fl_Box)user_data;
  Fl_Box_set_color(b,c);
  Fl_Group_redraw(Fl_Box_parent(b));
}
void cb2(fl_Widget w, void* user_data) {
  uchar r,g,b;
  Fl_get_color_rgb(c,&r,&g,&b);
  if (!flc_color_chooser_with_m("New color:",r,g,b,3)) return;
  c = fullcolor_cell;
  Fl_set_color_rgb(fullcolor_cell,r,g,b);
  fl_Box bx = (fl_Box)user_data;
  Fl_Box_set_color(bx,fullcolor_cell);
  Fl_Group_redraw(Fl_Box_parent(bx));
}


int main(int argc, char ** argv) {
  Fl_set_color_rgb(fullcolor_cell,145,159,170);
  fl_Window window = (fl_Window)Fl_Window_New(400,400);
  fl_Box box = (fl_Box)Fl_Box_New(50,50,300,300);
  Fl_Box_set_box(box,FL_THIN_DOWN_BOX);
  c = fullcolor_cell;
  Fl_Box_set_color(box,c);
  fl_Button b1 = (fl_Button)Fl_Button_New_WithLabel(140,120,120,30,"fl_show_colormap");
  Fl_Button_set_callback_with_user_data(b1,cb1,&box);
  fl_Button b2 = (fl_Button)Fl_Button_New_WithLabel(140,160,120,30,"fl_choose_color");
  Fl_Button_set_callback_with_user_data(b2,cb2,&box);
  (fl_Box) Fl_Box_New_WithLabel(140,200,120,120,0);
  make_image();
  (fl_Box) Fl_Box_New_WithLabel(140,320,120,0,"Example of fl_draw_image()");
  fl_Box_Virtual_Funcs* funcs = Fl_Box_default_virtual_funcs();
  funcs->draw = &draw;
  fl_Box p = (fl_Box) Fl_OverriddenBox_New_WithLabel(80,200,3*8,120,"lines",funcs);
  Fl_Box_set_align(p,FL_ALIGN_TOP);
  int i = 1;
  if (!Fl_args_with_i(argc,argv,i) || i < argc-1) {
    printf("usage: %s <switches> visual-number\n"
           " - : default visual\n"
           " r : call Fl::visual(FL_RGB)\n"
           " c : call Fl::own_colormap()\n",argv[0]);
#if !defined(WIN32) && !defined(__APPLE__)
    printf(" # : use this visual with an empty colormap:\n");
    list_visuals();
#endif
    exit(1);
  }
  printf("%d %d\n" ,argc, i);
  if (i!=argc) {
    if (argv[i][0] == 'r') {
      if (!Fl_visual(FL_RGB)) {
	printf("Fl::visual(FL_RGB) returned false.\n");
      }
    } else if (argv[i][0] == 'c') {
      Fl_own_colormap();
    } else if (argv[i][0] != '-') {
#if !defined(WIN32) && !defined(__APPLE__)
      int visid = atoi(argv[i]);
      if (!visid) puts("visid NULL");
      flc_open_display();
      XVisualInfo templt; int num;
      templt.visualid = visid;
      flc_set_fl_visual(XGetVisualInfo(fl_display, VisualIDMask, &templt, &num));
      char visid_str[10];
      sprintf(visid_str,"%d",visid);
      if (!(flc_fl_visual())) {
	flc_message_with_args("No visual with id %s",visid_str,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
      }
      Colormap m = XCreateColormap(flc_fl_display(), RootWindow(flc_fl_display(),flc_fl_screen()),
				   (flc_fl_visual())->visual, AllocNone);
      puts("here");
      flc_set_fl_colormap(m);
      flc_xpixel(FL_BLACK); // make sure black is allocated
#else
      flc_message("Visual id's not supported on MSWindows or MacOS.");
#endif
    }
  }
  Fl_Window_show_with_args(window,argc,argv);
  return Fl_run();
}
