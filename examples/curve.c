#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_Hor_Value_SliderC.h>
#include <Fl_DrawC.h>
#include <Fl_Toggle_ButtonC.h>
#include <Fl_WidgetC.h>
#include <stdio.h>
#include <Fl_SliderC.h>

double args[9] = {
  20,20, 50,200, 100,20, 200,200, 0};
const char* name[9] = {
  "X0", "Y0", "X1", "Y1", "X2", "Y2", "X3", "Y3", "rotate"};

int points;

void draw(fl_Widget w){
  flc_push_clip(Fl_Widget_x(w),Fl_Widget_y(w),Fl_Widget_w(w),Fl_Widget_h(w));
  flc_set_color(FL_DARK3);
  flc_rectf(Fl_Widget_x(w),Fl_Widget_y(w),Fl_Widget_w(w),Fl_Widget_h(w));
  flc_push_matrix();
  if (args[8]) {
    flc_translate(Fl_Widget_x(w)+Fl_Widget_w(w)/2.0, Fl_Widget_y(w)+Fl_Widget_h(w)/2.0);
    flc_rotate(args[8]);
    flc_translate(-(Fl_Widget_x(w)+Fl_Widget_w(w)/2.0), -(Fl_Widget_y(w)+Fl_Widget_h(w)/2.0));
  }
  flc_translate(Fl_Widget_x(w),Fl_Widget_y(w));
  if (!points) {
    flc_set_color(FL_WHITE);
    flc_begin_complex_polygon();
    flc_curve(args[0],args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
    flc_end_complex_polygon();
  }
  flc_set_color(FL_BLACK);
  flc_begin_line();
  flc_vertex(args[0],args[1]);
  flc_vertex(args[2],args[3]);
  flc_vertex(args[4],args[5]);
  flc_vertex(args[6],args[7]);
  flc_end_line();
  flc_set_color(points ? FL_WHITE : FL_RED);
  points ? flc_begin_points() : flc_begin_line();
  flc_curve(args[0],args[1],args[2],args[3],args[4],args[5],args[6],args[7]);
  points ? flc_end_points() : flc_end_line();
  flc_pop_matrix();
  flc_pop_clip();
}

fl_Widget d;

void points_cb(fl_Widget o, void* user_data) {
  points = Fl_Toggle_Button_value((fl_Toggle_Button)o);
  Fl_Widget_redraw(d);
}

void slider_cb(fl_Widget o, void* v) {
  fl_Slider s = (fl_Slider)o;
  args[(fl_intptr_t)(v)] = Fl_Slider_value(s);
  Fl_Widget_redraw(d);
}

int main(int argc, char** argv) {
  fl_Widget_Virtual_Funcs* funcs = Fl_Widget_default_virtual_funcs();
  funcs->draw = &draw;
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New(300,555);
  fl_Widget drawing = (fl_Widget)Fl_Widget_New_WithOverriddenFuncs(10,10,280,280,funcs);
  d = drawing;
  int y = 300;
  int n = 0;
  for (; n<9; n++) {
    fl_Hor_Value_Slider s = (fl_Hor_Value_Slider)Fl_Hor_Value_Slider_New_WithLabel(50,y,240,25,name[n]);
    y += 25;
    Fl_Hor_Value_Slider_set_minimum(s,0); Fl_Hor_Value_Slider_set_maximum(s,280);
    if (n == 8) Fl_Hor_Value_Slider_set_maximum(s,360);
    Fl_Hor_Value_Slider_set_step(s,1);
    Fl_Hor_Value_Slider_set_value(s,args[n]);
    Fl_Hor_Value_Slider_set_align(s,FL_ALIGN_LEFT);
#ifdef __LP64__
    Fl_Hor_Value_Slider_set_callback_with_user_data(s,slider_cb, (void*) (long long)n);
#else
    Fl_Hor_Value_Slider_set_callback_with_user_data(s,slider_cb, (void*)n);
#endif
  }
  fl_Toggle_Button but = (fl_Toggle_Button)Fl_Toggle_Button_New_WithLabel(50,y,50,25,"points");
  Fl_Toggle_Button_set_callback(but,points_cb);

  Fl_Double_Window_end(window);
  Fl_Double_Window_show_with_args(window,argc,argv);
  return Fl_run();
}
