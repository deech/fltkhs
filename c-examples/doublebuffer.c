#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_Single_WindowC.h>
#include <Fl_Double_WindowC.h>
#include <Fl_BoxC.h>
#include <Fl_DrawC.h>
#include <stdlib.h>
#include <FL/math.h>
#include <stdio.h>
#include <Fl_SliderC.h>
void star(int w, int h, int n) {
  flc_push_matrix();
  flc_translate(w/2, h/2);
  flc_scale_with_y(w/2, h/2);
  int i = 0;
  for (; i < n; i++) {
    int j = i + 1;
    for (; j < n; j++){
      flc_begin_line();
      flc_vertex(cos(2*M_PI*i/n+.1), sin(2*M_PI*i/n+.1));
      flc_vertex(cos(2*M_PI*j/n+.1), sin(2*M_PI*j/n+.1));
      flc_end_line();
    }
  }
  flc_pop_matrix();
}

int sides[2] = {20,20};

void slider_cb(fl_Widget o, void* v) {
  fl_Slider s = (fl_Slider)o;
  sides[(long)v] = (int)Fl_Slider_value(s);
  Fl_Slider_redraw(Fl_Slider_parent(s));
}
void bad_draw(int w,int h,int which) {
  flc_set_color(FL_BLACK); flc_rectf(0,0,w,h);
  flc_set_color(FL_WHITE); star(w,h,sides[which]);
}
void draw_single(fl_Widget w) {
  fl_Single_Window win =  (fl_Single_Window)w;
  bad_draw(Fl_Single_Window_w(win),Fl_Single_Window_h(win),0);
  Fl_Single_Window_draw_child(win, Fl_Single_Window_child(win,0));
}
void draw_double(fl_Widget w) {
  fl_Double_Window win =  (fl_Double_Window)w;
  bad_draw(Fl_Double_Window_w(win),Fl_Double_Window_h(win),0);
  Fl_Double_Window_draw_child(win, Fl_Double_Window_child(win,0));
}

int main (int argc ,char** argv){
  if (!Fl_visual(FL_DOUBLE))
    printf("Xdbe not supported, faking double buffer with pixmaps.\n");
  fl_Window w01 = Fl_Window_New_WithLabel(420,420,"Fl_Single_Window");
  Fl_Window_set_box(w01,FL_FLAT_BOX);
  fl_Single_Window_Virtual_Funcs* single_funcs = Fl_Single_Window_default_virtual_funcs();
  single_funcs->draw = &draw_single;
  fl_Single_Window w1 = Fl_OverriddenSingle_Window_NewXY_WithLabel(10,10,400,400,"Fl_Single_Window",single_funcs);
  Fl_Single_Window_set_box(w1,FL_FLAT_BOX);
  Fl_Single_Window_set_color(w1,FL_BLACK); //w1.position(100,200);
  fl_Hor_Slider slider0 = Fl_Hor_Slider_New(20,370,360,25);
  Fl_Slider_range(slider0,2,30);
  Fl_Slider_set_step(slider0,1);
  Fl_Slider_set_value(slider0,sides[0]);
  Fl_Slider_set_callback(slider0,slider_cb);
  Fl_Single_Window_end(w1);
  Fl_Window_end(w01);
  fl_Window w02 = Fl_Window_New_WithLabel(420,420,"Fl_Double_Window");
  Fl_Window_set_box(w02,FL_FLAT_BOX);
  fl_Double_Window_Virtual_Funcs* double_funcs = Fl_Double_Window_default_virtual_funcs();
  double_funcs->draw = &draw_double;
  fl_Double_Window w2 = Fl_OverriddenDouble_Window_NewXY_WithLabel(10,10,400,400,"Fl_Double_Window",double_funcs);
  Fl_Double_Window_set_box(w2,FL_FLAT_BOX);
  Fl_Double_Window_set_color(w2,FL_BLACK); //w2.position(100,200);
  fl_Hor_Slider slider1 = Fl_Hor_Slider_New(20,370,360,25);
  Fl_Slider_range(slider1,2,30);
  Fl_Slider_set_step(slider1,1);
  Fl_Slider_set_value(slider1,sides[0]);
  Fl_Slider_set_callback(slider1,slider_cb);
  Fl_Double_Window_end(w2);
  Fl_Window_end(w02);
  Fl_Window_show_with_args(w01,argc, argv);
  Fl_Single_Window_show(w1);
  Fl_Window_show(w02);
  Fl_Double_Window_show(w2);
  return Fl_run();
}
