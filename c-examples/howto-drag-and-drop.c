#include <stdio.h>
#include <string.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_BoxC.h>

int handle_sender(fl_Box box, int event){
  int ret = Fl_Box_handle_super(box,event);
  switch ( event ) {
  case FL_PUSH: {
    const char *msg = "It works!";
    Fl_copy_with_destination(msg,strlen(msg),0);
    Fl_dnd();
    ret = 1;
    break;
  }
  }
  return(ret);
}
void initialize_sender(fl_Box sender){
  Fl_Box_set_box(sender,FL_FLAT_BOX);
  Fl_Box_set_color(sender, 9);
  Fl_Box_set_label(sender,"Drag\nfrom\nhere..");
}
int handle_receiver(fl_Box box, int event){
  int ret = Fl_Box_handle_super(box,event);
  switch ( event ) {
  case FL_DND_ENTER:          // return(1) for these events to 'accept' dnd
  case FL_DND_DRAG:
  case FL_DND_RELEASE:
    ret = 1;
    break;
  case FL_PASTE:              // handle actual drop (paste) operation
    Fl_Box_set_label(box,Fl_event_text());
    fprintf(stderr, "Pasted '%s'\n", Fl_event_text());
    ret = 1;
    break;
  }
  return(ret);
}
void initialize_receiver(fl_Box receiver){
  Fl_Box_set_box(receiver,FL_FLAT_BOX);
  Fl_Box_set_color(receiver, 10);
  Fl_Box_set_label(receiver,"..to\nhere");
}
int main(int argc, char** argv){
  fl_Window win_a = (fl_Window)Fl_Window_NewXY_WithLabel(0,0,200,100,"Sender");
  fl_Box_Virtual_Funcs* funcs_a = Fl_Box_default_virtual_funcs();
  funcs_a->handle = &handle_sender;
  fl_Box a = (fl_Box) Fl_OverriddenBox_New(0,0,100,100,funcs_a);
  initialize_sender(a);
  Fl_Window_end(win_a);
  Fl_Window_show(win_a);
  fl_Window win_b = (fl_Window)Fl_Window_NewXY_WithLabel(400,0,200,100,"Receiver");
  fl_Box_Virtual_Funcs* funcs_b = Fl_Box_default_virtual_funcs();
  funcs_b->handle = &handle_receiver;
  fl_Box b = (fl_Box) Fl_OverriddenBox_New(100,0,100,100,funcs_b);
  initialize_receiver(b);
  Fl_Window_end(win_b);
  Fl_Window_show(win_b);
  return Fl_run();
}
