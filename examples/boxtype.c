#include <stdlib.h>
#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_BoxC.h"

int N = 0;
#define W 200
#define H 50
#define ROWS 14

fl_Double_Window window;

void bt(const char *name, Fl_Boxtype type, int square) {
  int x = N%4;
  int y = N/4;
  N++;
  x = x*W+10;
  y = y*H+10;
  fl_Box b = (fl_Box)Fl_Box_New_WithBoxtype(type,x,y,square ? H-20 : W-20,H-20,name);
  Fl_Box_set_labelsize(b,11);
  if (square) Fl_Box_set_align(b,FL_ALIGN_RIGHT);
}

int main (int argc, char** argv){
  window = (fl_Double_Window)Fl_Double_Window_New(4*W,ROWS*H);
  Fl_Double_Window_set_box(window,FL_FLAT_BOX);
#if 0
  Fl_args(argc,argv);
  Fl_get_system_colors();
#elif 0
  Fl_args(argc,argv);
  Fl_get_system_colors();
  Fl_background(113,113,198);
#else
  Fl_args(argc,argv);
  Fl_get_system_colors();
  Fl_Double_Window_set_color(window,12);
#endif
  bt("FL_NO_BOX",FL_NO_BOX,0);
  bt("FL_FLAT_BOX",FL_FLAT_BOX,0);
  N += 2; // go to start of next row to line up boxes & frames
  bt("FL_UP_BOX",FL_UP_BOX,0);
  bt("FL_DOWN_BOX",FL_DOWN_BOX,0);
  bt("FL_UP_FRAME",FL_UP_FRAME,0);
  bt("FL_DOWN_FRAME",FL_DOWN_FRAME,0);
  bt("FL_THIN_UP_BOX",FL_THIN_UP_BOX,0);
  bt("FL_THIN_DOWN_BOX",FL_THIN_DOWN_BOX,0);
  bt("FL_THIN_UP_FRAME",FL_THIN_UP_FRAME,0);
  bt("FL_THIN_DOWN_FRAME",FL_THIN_DOWN_FRAME,0);
  bt("FL_ENGRAVED_BOX",FL_ENGRAVED_BOX,0);
  bt("FL_EMBOSSED_BOX",FL_EMBOSSED_BOX,0);
  bt("FL_ENGRAVED_FRAME",FL_ENGRAVED_FRAME,0);
  bt("FL_EMBOSSED_FRAME",FL_EMBOSSED_FRAME,0);
  bt("FL_BORDER_BOX",FL_BORDER_BOX,0);
  bt("FL_SHADOW_BOX",FL_SHADOW_BOX,0);
  bt("FL_BORDER_FRAME",FL_BORDER_FRAME,0);
  bt("FL_SHADOW_FRAME",FL_SHADOW_FRAME,0);
  bt("FL_ROUNDED_BOX",FL_ROUNDED_BOX,0);
  bt("FL_RSHADOW_BOX",FL_RSHADOW_BOX,0);
  bt("FL_ROUNDED_FRAME",FL_ROUNDED_FRAME,0);
  bt("FL_RFLAT_BOX",FL_RFLAT_BOX,0);
  bt("FL_OVAL_BOX",FL_OVAL_BOX,0);
  bt("FL_OSHADOW_BOX",FL_OSHADOW_BOX,0);
  bt("FL_OVAL_FRAME",FL_OVAL_FRAME,0);
  bt("FL_OFLAT_BOX",FL_OFLAT_BOX,0);
  bt("FL_ROUND_UP_BOX",FL_ROUND_UP_BOX,0);
  bt("FL_ROUND_DOWN_BOX",FL_ROUND_DOWN_BOX,0);
  bt("FL_DIAMOND_UP_BOX",FL_DIAMOND_UP_BOX,0);
  bt("FL_DIAMOND_DOWN_BOX",FL_DIAMOND_DOWN_BOX,0);

  bt("FL_PLASTIC_UP_BOX",FL_PLASTIC_UP_BOX,0);
  bt("FL_PLASTIC_DOWN_BOX",FL_PLASTIC_DOWN_BOX,0);
  bt("FL_PLASTIC_UP_FRAME",FL_PLASTIC_UP_FRAME,0);
  bt("FL_PLASTIC_DOWN_FRAME",FL_PLASTIC_DOWN_FRAME,0);
  bt("FL_PLASTIC_THIN_UP_BOX",FL_PLASTIC_THIN_UP_BOX,0);
  bt("FL_PLASTIC_THIN_DOWN_BOX",FL_PLASTIC_THIN_DOWN_BOX,0);
  N += 2;
  bt("FL_PLASTIC_ROUND_UP_BOX",FL_PLASTIC_ROUND_UP_BOX,0);
  bt("FL_PLASTIC_ROUND_DOWN_BOX",FL_PLASTIC_ROUND_DOWN_BOX,0);
  N += 2;

  bt("FL_GTK_UP_BOX",FL_GTK_UP_BOX,0);
  bt("FL_GTK_DOWN_BOX",FL_GTK_DOWN_BOX,0);
  bt("FL_GTK_UP_FRAME",FL_GTK_UP_FRAME,0);
  bt("FL_GTK_DOWN_FRAME",FL_GTK_DOWN_FRAME,0);
  bt("FL_GTK_THIN_UP_BOX",FL_GTK_THIN_UP_BOX,0);
  bt("FL_GTK_THIN_DOWN_BOX",FL_GTK_THIN_DOWN_BOX,0);
  bt("FL_GTK_THIN_UP_FRAME",FL_GTK_THIN_UP_FRAME,0);
  bt("FL_GTK_THIN_DOWN_FRAME",FL_GTK_THIN_DOWN_FRAME,0);
  bt("FL_GTK_ROUND_UP_BOX",FL_GTK_ROUND_UP_BOX,0);
  bt("FL_GTK_ROUND_DOWN_BOX",FL_GTK_ROUND_DOWN_BOX,0);
  Fl_Double_Window_set_resizable(window,window);
  Fl_Double_Window_end(window);
  Fl_Double_Window_show(window);
  return (Fl_run());
}
