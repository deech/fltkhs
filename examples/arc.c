#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Hor_Value_SliderC.h"
#include "Fl_DrawC.h"
#include "Fl_WidgetC.h"
#include "Fl_SliderC.h"


double my_args[6] = {140, 140, 50, 0, 360, 0};
const char* name[6] = {"X", "Y", "R", "start", "end", "rotate"};
fl_Widget d;

void draw(fl_Widget widget){
  flc_push_clip(Fl_Widget_x(widget),Fl_Widget_y(widget),Fl_Widget_w(widget),Fl_Widget_h(widget));
  flc_set_color(FL_DARK3);
  flc_rectf(Fl_Widget_x(widget),Fl_Widget_y(widget),Fl_Widget_w(widget),Fl_Widget_h(widget));
  flc_push_matrix();
  if (my_args[5]) {
    flc_translate(Fl_Widget_x(widget)+Fl_Widget_w(widget)/2.0, Fl_Widget_y(widget)+Fl_Widget_h(widget)/2.0);
    flc_rotate(my_args[5]);
    flc_translate(-(Fl_Widget_x(widget)+Fl_Widget_w(widget)/2.0), -(Fl_Widget_y(widget)+Fl_Widget_h(widget)/2.0));
  }
  flc_set_color(FL_WHITE);
  flc_translate(Fl_Widget_x(widget),Fl_Widget_y(widget));
  flc_begin_complex_polygon();
  flc_arc_by_radius(my_args[0],my_args[1],my_args[2],my_args[3],my_args[4]);
  flc_gap();
  flc_arc_by_radius(140,140,20,0,-360);
  flc_end_complex_polygon();
  flc_set_color(FL_RED);
  flc_begin_line();
  flc_arc_by_radius(my_args[0],my_args[1],my_args[2],my_args[3],my_args[4]);
  flc_end_line();
  flc_pop_matrix();
  flc_pop_clip();
}


void slider_cb(fl_Widget o, void* v) {
  fl_Slider s = (fl_Slider)o;
  int idx = (fl_intptr_t)v;
  my_args[idx] = Fl_Slider_value(s);
  Fl_Widget_redraw(d);
}

int main(int argc, char** argv) {
  fl_Widget_Virtual_Funcs* fs = Fl_Widget_default_virtual_funcs();
  fs->draw = &draw;
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New(300,500);
  Fl_Double_Window_begin(window);
  fl_Widget widget = (fl_Widget)Fl_Widget_New_WithOverriddenFuncs(10,10,280,280,fs);
  d = widget;
  int y = 300;
  int n = 0;
  for (; n<6; n++) {
    fl_Hor_Value_Slider s= (fl_Hor_Value_Slider)Fl_Hor_Value_Slider_New_WithLabel(50,y,240,25,name[n]);
    y += 25;
    if (n<3) {Fl_Hor_Value_Slider_set_minimum(s,0); Fl_Hor_Value_Slider_set_maximum(s,300);}
    else if (n==5) {Fl_Hor_Value_Slider_set_minimum(s,0); Fl_Hor_Value_Slider_set_maximum(s,360);}
    else {Fl_Hor_Value_Slider_set_minimum(s,-360); Fl_Hor_Value_Slider_set_maximum(s,360);}
    Fl_Hor_Value_Slider_set_step(s,1);
    Fl_Hor_Value_Slider_set_value(s,my_args[n]);
    Fl_Hor_Value_Slider_set_align(s,FL_ALIGN_LEFT);
#ifdef __LP64__
    Fl_Hor_Value_Slider_set_callback_with_user_data(s,slider_cb, (void*)(long long) n);
#else
    Fl_Hor_Value_Slider_set_callback_with_user_data(s,slider_cb, (void*) n);
#endif
  }
  Fl_Double_Window_end(window);
  Fl_Double_Window_show_with_args(window, argc, argv);
  return (Fl_run());
}
