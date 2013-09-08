#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_Hor_Value_SliderC.h>
#include <Fl_ChoiceC.h>
#include <Fl_DrawC.h>
#include <Fl_Menu_ItemC.h>
#include <stdio.h>

Fl_Color fg;
Fl_Color bg;
Fl_Cursor cursor;
fl_Hor_Value_Slider cursor_slider;

void choice_cb(fl_Widget w, void* v) {
  cursor = (Fl_Cursor)(fl_intptr_t)v;
  Fl_Hor_Value_Slider_set_value(cursor_slider,cursor);
  flc_cursor_with_fg_bg(cursor,fg,bg);
}

void setcursor(fl_Widget o, void * user_data) {
  fl_Hor_Value_Slider slider = (fl_Hor_Value_Slider)o;
  cursor = (int)(Fl_Hor_Value_Slider_value(slider));
  flc_cursor_with_fg_bg(cursor,fg,bg);
}

void setfg(fl_Widget o, void* user_data) {
  fl_Hor_Value_Slider slider = (fl_Hor_Value_Slider)o;
  fg = (Fl_Color)(Fl_Hor_Value_Slider_value(slider));
  flc_cursor_with_fg_bg(cursor,fg,bg);
}
void setbg(fl_Widget o, void* user_data) {
  fl_Hor_Value_Slider slider = (fl_Hor_Value_Slider)o;
  bg = (Fl_Color)(Fl_Hor_Value_Slider_value(slider));
  flc_cursor_with_fg_bg(cursor,fg,bg);
}

int main(int argc, char **argv) {
  fg = FL_BLACK;
  bg = FL_WHITE;
  cursor = FL_CURSOR_DEFAULT;

  fl_Menu_Item i1 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i1,"FL_CURSOR_DEFAULT");
  Fl_Menu_Item_set_shortcut(i1,0);
  Fl_Menu_Item_set_callback(i1,&choice_cb);
  Fl_Menu_Item_set_user_data(i1,(void*)FL_CURSOR_DEFAULT);

  fl_Menu_Item i2 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i2,"FL_CURSOR_ARROW");
  Fl_Menu_Item_set_shortcut(i2,0);
  Fl_Menu_Item_set_callback(i2,&choice_cb);
  Fl_Menu_Item_set_user_data(i2,(void*)FL_CURSOR_ARROW);

  fl_Menu_Item i3 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i3,"FL_CURSOR_CROSS");
  Fl_Menu_Item_set_shortcut(i3,0);
  Fl_Menu_Item_set_callback(i3,&choice_cb);
  Fl_Menu_Item_set_user_data(i3,(void*)FL_CURSOR_CROSS);

  fl_Menu_Item i4 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i4,"FL_CURSOR_WAIT");
  Fl_Menu_Item_set_shortcut(i4,0);
  Fl_Menu_Item_set_callback(i4,&choice_cb);
  Fl_Menu_Item_set_user_data(i4,(void*)FL_CURSOR_WAIT);

  fl_Menu_Item i5 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i5,"FL_CURSOR_INSERT");
  Fl_Menu_Item_set_shortcut(i5,0);
  Fl_Menu_Item_set_callback(i5,&choice_cb);
  Fl_Menu_Item_set_user_data(i5,(void*)FL_CURSOR_INSERT);

  fl_Menu_Item i6 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i6,"FL_CURSOR_HAND");
  Fl_Menu_Item_set_shortcut(i6,0);
  Fl_Menu_Item_set_callback(i6,&choice_cb);
  Fl_Menu_Item_set_user_data(i6,(void*)FL_CURSOR_HAND);

  fl_Menu_Item i7 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i7,"FL_CURSOR_HELP");
  Fl_Menu_Item_set_shortcut(i7,0);
  Fl_Menu_Item_set_callback(i7,&choice_cb);
  Fl_Menu_Item_set_user_data(i7,(void*)FL_CURSOR_HELP);

  fl_Menu_Item i8 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i8,"FL_CURSOR_MOVE");
  Fl_Menu_Item_set_shortcut(i8,0);
  Fl_Menu_Item_set_callback(i8,&choice_cb);
  Fl_Menu_Item_set_user_data(i8,(void*)FL_CURSOR_MOVE);

  fl_Menu_Item i9 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i9,"FL_CURSOR_NS");
  Fl_Menu_Item_set_shortcut(i9,0);
  Fl_Menu_Item_set_callback(i9,&choice_cb);
  Fl_Menu_Item_set_user_data(i9,(void*)FL_CURSOR_NS);

  fl_Menu_Item i10 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i10,"FL_CURSOR_WE");
  Fl_Menu_Item_set_shortcut(i10,0);
  Fl_Menu_Item_set_callback(i10,&choice_cb);
  Fl_Menu_Item_set_user_data(i10,(void*)FL_CURSOR_WE);

  fl_Menu_Item i11 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i11,"FL_CURSOR_NWSE");
  Fl_Menu_Item_set_shortcut(i11,0);
  Fl_Menu_Item_set_callback(i11,&choice_cb);
  Fl_Menu_Item_set_user_data(i11,(void*)FL_CURSOR_NWSE);

  fl_Menu_Item i12 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i12,"FL_CURSOR_NESW");
  Fl_Menu_Item_set_shortcut(i12,0);
  Fl_Menu_Item_set_callback(i12,&choice_cb);
  Fl_Menu_Item_set_user_data(i12,(void*)FL_CURSOR_NESW);

  fl_Menu_Item i13 = (fl_Menu_Item)Fl_Menu_Item_New();
  Fl_Menu_Item_set_label(i13,"FL_CURSOR_NONE");
  Fl_Menu_Item_set_shortcut(i13,0);
  Fl_Menu_Item_set_callback(i13,&choice_cb);
  Fl_Menu_Item_set_user_data(i13,(void*)FL_CURSOR_NONE);
  
  fl_Menu_Item i14 = (fl_Menu_Item)Fl_Menu_Item_New();

  fl_Menu_Item choices[] = {i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14};
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New(400,300);
  fl_Choice choice = Fl_Choice_New_WithLabel(80,100,200,25,"Cursor:");
  Fl_Choice_menu_with_m(choice,choices,14);
  //  Fl_Choice_set_callback(choice,&choice_cb);
  Fl_Choice_set_when(choice,FL_WHEN_RELEASE|FL_WHEN_NOT_CHANGED);

  fl_Hor_Value_Slider slider1 = Fl_Hor_Value_Slider_New_WithLabel(80,180,310,30,"Cursor:");
  cursor_slider = slider1;
  Fl_Hor_Value_Slider_set_align(slider1,FL_ALIGN_LEFT);
  Fl_Hor_Value_Slider_set_step(slider1,1);
  Fl_Hor_Value_Slider_precision(slider1,0);
  Fl_Hor_Value_Slider_bounds(slider1,0,100);
  Fl_Hor_Value_Slider_set_value(slider1,0);
  Fl_Hor_Value_Slider_set_callback(slider1,&setcursor);
  Fl_Hor_Value_Slider_set_value(slider1,cursor);

  fl_Hor_Value_Slider slider2 = Fl_Hor_Value_Slider_New_WithLabel(80,220,310,30,"fgcolor:");
  Fl_Hor_Value_Slider_set_align(slider2,FL_ALIGN_LEFT);
  Fl_Hor_Value_Slider_set_step(slider2,1);
  Fl_Hor_Value_Slider_precision(slider2,0);
  Fl_Hor_Value_Slider_bounds(slider2,0,255);
  Fl_Hor_Value_Slider_set_value(slider2,0);
  Fl_Hor_Value_Slider_set_callback(slider2,&setfg);
  Fl_Hor_Value_Slider_set_value(slider2,fg);


  fl_Hor_Value_Slider slider3 = Fl_Hor_Value_Slider_New_WithLabel(80,260,310,30,"bgcolor:");
  Fl_Hor_Value_Slider_set_align(slider3,FL_ALIGN_LEFT);
  Fl_Hor_Value_Slider_set_step(slider3,1);
  Fl_Hor_Value_Slider_precision(slider3,0);
  Fl_Hor_Value_Slider_bounds(slider3,0,255);
  Fl_Hor_Value_Slider_set_value(slider3,0);
  Fl_Hor_Value_Slider_set_callback(slider3,&setbg);
  Fl_Hor_Value_Slider_set_value(slider3,bg);

  Fl_Double_Window_set_resizable(window, window);
  Fl_Double_Window_show_with_args(window, argc, argv);
  return(Fl_run());
}
