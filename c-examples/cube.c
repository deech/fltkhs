#include <config.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_BoxC.h>
#include <Fl_ButtonC.h>
#include <Fl_Radio_Light_ButtonC.h>
#include <Fl_SliderC.h>
#include <Fl_Menu_ItemC.h>
#include <Fl_Gl_WindowC.h>
#include <stdlib.h>
#include <stdio.h>

#include <glC.h>
typedef struct instance_data {
  double lasttime;
  int wire;
  double size;
  double speed;
} instance_data;
/* The cube definition */
float v0[3] = {0.0, 0.0, 0.0};
float v1[3] = {1.0, 0.0, 0.0};
float v2[3] = {1.0, 1.0, 0.0};
float v3[3] = {0.0, 1.0, 0.0};
float v4[3] = {0.0, 0.0, 1.0};
float v5[3] = {1.0, 0.0, 1.0};
float v6[3] = {1.0, 1.0, 1.0};
float v7[3] = {0.0, 1.0, 1.0};

#define v3f(x) glVertex3fv(x)

void drawcube(int wire) {
/* Draw a colored cube */
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(0,0,255);
  v3f(v0); v3f(v1); v3f(v2); v3f(v3);
  glEnd();
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(0,255,255); v3f(v4); v3f(v5); v3f(v6); v3f(v7);
  glEnd();
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(255,0,255); v3f(v0); v3f(v1); v3f(v5); v3f(v4);
  glEnd();
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(255,255,0); v3f(v2); v3f(v3); v3f(v7); v3f(v6);
  glEnd();
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(0,255,0); v3f(v0); v3f(v4); v3f(v7); v3f(v3);
  glEnd();
  glBegin(wire ? GL_LINE_LOOP : GL_POLYGON);
  glColor3ub(255,0,0); v3f(v1); v3f(v2); v3f(v6); v3f(v5);
  glEnd();
}

void draw(fl_Gl_Window cube) {
  instance_data* cube_data = (instance_data*)Fl_Gl_Window_other_data(cube);
  cube_data->lasttime = cube_data->lasttime+cube_data->speed;
  Fl_Gl_Window_set_other_data(cube, cube_data);
  if (!Fl_Gl_Window_valid(cube)) {
    glLoadIdentity();
    glViewport(0,0,Fl_Gl_Window_w(cube),Fl_Gl_Window_h(cube));
    glEnable(GL_DEPTH_TEST);
    glFrustum(-1,1,-1,1,2,10000);
    glTranslatef(0,0,-10);
    flc_gl_font(FL_HELVETICA_BOLD, 16 );
  }
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
  glPushMatrix();
  glRotatef((float)(cube_data->lasttime*1.6),0,0,1);
  glRotatef((float)(cube_data->lasttime*4.2),1,0,0);
  glRotatef((float)(cube_data->lasttime*2.3),0,1,0);
  glTranslatef(-1.0, 1.2f, -1.5);
  glScalef((float)(cube_data->size),(float)(cube_data->size),(float)(cube_data->size));
  drawcube(cube_data->wire);
  glPopMatrix();
  flc_gl_color(FL_GRAY);
  glDisable(GL_DEPTH_TEST);
  flc_gl_draw_with_xy(cube_data->wire ? "Cube: wire" : "Cube: flat", -4.5f, -4.5f );
  glEnable(GL_DEPTH_TEST);
}

int handle(fl_Gl_Window cube_box, int e) {
  switch (e) {
  case FL_ENTER: Fl_Gl_Window_set_cursor(cube_box,FL_CURSOR_CROSS); break;
  case FL_LEAVE: Fl_Gl_Window_set_cursor(cube_box,FL_CURSOR_DEFAULT); break;
  }
  return Fl_Gl_Window_handle_super(cube_box,e);
}
fl_Window form;
fl_Slider speed;
fl_Slider size;
fl_Button button;
fl_Button wire;
fl_Button flat;
fl_Gl_Window cube;
fl_Gl_Window cube2;

void makeform(fl_Gl_Window_Virtual_Funcs* cube_funcs, fl_Gl_Window_Virtual_Funcs* cube2_funcs) {
  Fl_Window_begin(form);
  Fl_Box_New_WithBoxtype(FL_DOWN_FRAME,20,20,350,350,"");
  Fl_Box_New_WithBoxtype(FL_DOWN_FRAME,510,20,350,350,"");
  speed = (fl_Slider)Fl_Slider_New_WithLabel(390,90,40,220,"Speed");
  Fl_Slider_set_type(speed,FL_VERT_SLIDER);
  size = (fl_Slider)Fl_Slider_New_WithLabel(450,90,40,220,"Size");
  Fl_Slider_set_type(size,FL_VERT_SLIDER);
  wire = (fl_Radio_Light_Button)Fl_Radio_Light_Button_New_WithLabel(390,20,100,30,"Wire");
  flat = (fl_Radio_Light_Button)Fl_Radio_Light_Button_New_WithLabel(390,50,100,30,"Flat");
  button = (fl_Button)Fl_Button_New_WithLabel(390,340,100,30,"Exit");
  cube = (fl_Gl_Window)Fl_OverriddenGl_Window_NewXY_WithLabel(23,23,344,344, 0,cube_funcs);
  cube2 = (fl_Gl_Window)Fl_OverriddenGl_Window_NewXY_WithLabel(513,23,344,344, 0,cube2_funcs);
  instance_data* cube_data = (instance_data*)malloc(sizeof(instance_data));
  cube_data->lasttime = 0.0;
  instance_data* cube2_data = (instance_data*)malloc(sizeof(instance_data));
  cube2_data->lasttime = 0.0;
  Fl_Gl_Window_set_other_data(cube, cube_data);
  Fl_Gl_Window_set_other_data(cube2, cube2_data);
  int x = Fl_Gl_Window_x(cube);
  int y = Fl_Slider_y(size);
  int w = Fl_Gl_Window_w(cube);
  int h = Fl_Slider_h(size);
  fl_Box b = (fl_Box)Fl_Box_New_WithBoxtype(FL_NO_BOX,x,y,w,h,0);
  Fl_Window_set_resizable(form,b);
  Fl_Box_hide(b);
  Fl_Window_end(form);
}

#include <Fl_Sys_Menu_BarC.h>
#include <Fl_PrinterC.h>

void print_cb(fl_Widget w, void* data)
{
  fl_Printer printer = (fl_Printer) Fl_Printer_New();
  fl_Window win = Fl_first_window();
  if(!win) return;
  if(Fl_Printer_start_job(printer,1) ) return;
  if(Fl_Printer_start_page(printer)) return;
  Fl_Printer_scale_with_scale_y(printer,0.5,0.5);
  Fl_Printer_print_widget(printer, win );
  Fl_Printer_end_page(printer);
  Fl_Printer_end_job(printer);
}

int main(int argc, char **argv) {
  fl_Gl_Window_Virtual_Funcs* cube_funcs = (fl_Gl_Window_Virtual_Funcs*)Fl_Gl_Window_default_virtual_funcs();
  fl_Gl_Window_Virtual_Funcs* cube2_funcs =(fl_Gl_Window_Virtual_Funcs*)Fl_Gl_Window_default_virtual_funcs();
  cube_funcs->draw = &draw;
  cube_funcs->handle = &handle;
  cube2_funcs->draw = &draw;
  cube2_funcs->handle = &handle;
  form = (fl_Window)Fl_Window_New_WithLabel(510+390,390,argv[0]);
  makeform(cube_funcs, cube2_funcs);
  Fl_Window_begin(form);
  fl_Menu_Item i1 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i1,"Print");
  Fl_Menu_Item_set_flags(i1,FL_SUBMENU);
  fl_Menu_Item i2 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i2,"Print window");
  Fl_Menu_Item_set_callback(i2,&print_cb);
  fl_Menu_Item i3 = (fl_Menu_Item)Fl_Menu_Item_New();
  fl_Menu_Item i4 = (fl_Menu_Item)Fl_Menu_Item_New();

  fl_Menu_Item	items[] = {i1,i2,i3,i4};
  fl_Sys_Menu_Bar menubar_ = (fl_Sys_Menu_Bar)Fl_Sys_Menu_Bar_New(0,0,60,20);
  Fl_Sys_Menu_Bar_set_box(menubar_,FL_FLAT_BOX);
  Fl_Sys_Menu_Bar_menu_with_m(menubar_ ,items, 4);
  Fl_Window_end(form);
  instance_data* cube_data = (instance_data*)Fl_Gl_Window_other_data(cube);
  instance_data* cube2_data = (instance_data*)Fl_Gl_Window_other_data(cube2);
  cube_data->speed = 1.0;
  cube2_data->speed = 1.0;
  cube_data->size=1.0;
  cube2_data->size=1.0;
  cube_data->wire=0;
  cube2_data->wire=1;
  Fl_Gl_Window_set_other_data(cube, cube_data);
  Fl_Gl_Window_set_other_data(cube2, cube2_data);

  Fl_Window_begin(form);
  Fl_Slider_bounds(speed,4,0);
  Fl_Slider_set_value(speed,1.0);
  Fl_Slider_bounds(size,4,0.01);
  Fl_Slider_set_value(size,1.0);
  Fl_Button_set_value(flat,1);
  Fl_Window_set_label(form,"");
  Fl_Window_end(form);
  Fl_Window_show_with_args(form,argc,argv);
  Fl_Gl_Window_show(cube);
  Fl_Gl_Window_show(cube2);

  for (;;) {
    if (Fl_Window_visible(form) && Fl_Slider_value(speed))
      {if (!Fl_check()) break;}	// returns immediately
    else
      {if (!Fl_wait()) break;}	// waits until something happens
    instance_data* cube_data = (instance_data*)Fl_Gl_Window_other_data(cube);
    instance_data* cube2_data = (instance_data*)Fl_Gl_Window_other_data(cube2);
    cube_data->wire = Fl_Button_value(wire);
    cube2_data->wire = !Fl_Button_value(wire);
    cube_data->size = cube2_data->size = Fl_Slider_value(size);
    cube_data->speed = cube2_data->speed = Fl_Slider_value(speed);
    Fl_Gl_Window_set_other_data(cube, cube_data);
    Fl_Gl_Window_set_other_data(cube2, cube2_data);
    Fl_Gl_Window_redraw(cube);
    Fl_Gl_Window_redraw(cube2);
    if (Fl_readqueue() == button) break;
  }
  return 0;
}
