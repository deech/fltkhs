#include <stdio.h>	// printf
#include <stdlib.h>	// exit,malloc
#include <string.h>	// strerror
#include <errno.h>	// errno
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_Sys_Menu_BarC.h>
#include <Fl_Native_File_ChooserC.h>
#include <Fl_BoxC.h>
#include <Fl_AskC.h>

typedef struct instance_data {
  fl_Native_File_Chooser* fc;
} instance_data;

int exist(const char *filename) {
  FILE *fp = fopen(filename, "r");
  if (fp) { fclose(fp); return(1); }
  else    { return(0); }
}
// 'Open' the file
void open_file(const char *filename) {
  printf("Open '%s'\n", filename);
}
void save(const char *filename) {
  printf("Saving '%s'\n", filename);
  if ( !exist(filename) ) {
    FILE *fp = fopen(filename, "w");				// create file if it doesn't exist
    if ( fp ) {
      // A real app would do something useful here.
      fprintf(fp, "Hello world.\n");
      fclose(fp);
    } else {
      flc_message_with_args("Error: %s: %s", filename, strerror(errno),NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
    }
  } else {
    // A real app would do something useful here.
  }
}
void open_cb(fl_Widget w, void *v) {
  fl_Window app = (fl_Window)v;
  instance_data* d = (instance_data*)Fl_Window_other_data(app);
  fl_Native_File_Chooser fc = d->fc;
  Fl_Native_File_Chooser_set_title(fc,"Open");
  // Fl_Native_File_Chooser_set_type(fc,BROWSE_FILE);
  switch ( Fl_Native_File_Chooser_show(fc) ) {
  case -1: break;	// Error
  case  1: break; 	// Cancel
  default:		// Choice
    Fl_Native_File_Chooser_set_preset_file(fc,Fl_Native_File_Chooser_filename(fc));
    open_file(Fl_Native_File_Chooser_filename(fc));
    break;
  }
}
void saveas_cb(fl_Widget w, void *v) {
  fl_Window app = (fl_Window)v;
  instance_data* d = (instance_data*)Fl_Window_other_data(app);
  fl_Native_File_Chooser fc = d->fc;
  Fl_Native_File_Chooser_set_title(fc,"Save As");
  Fl_Native_File_Chooser_set_type(fc,BROWSE_SAVE_FILE);
  switch ( Fl_Native_File_Chooser_show(fc) ) {
  case -1: break;	// Error
  case  1: break; 	// Cancel
  default:		// Choice
    Fl_Native_File_Chooser_set_preset_file(fc,Fl_Native_File_Chooser_filename(fc));
    save(Fl_Native_File_Chooser_filename(fc));
    break;
  }
}
void save_cb(fl_Widget w, void *v) {
  fl_Window app = (fl_Window)v;
  instance_data* d = (instance_data*)Fl_Window_other_data(app);
  fl_Native_File_Chooser fc = d->fc;
  if ( strlen(Fl_Native_File_Chooser_filename(fc)) == 0 ) {
    saveas_cb(w,v);
  } else {
    save(Fl_Native_File_Chooser_filename(fc));
  }
}

void quit_cb(fl_Widget w, void *v) {
  exit(0);
}
const char* untitled_default() {
  static char *filename = 0;
  if ( !filename ) {
    const char *home =
      getenv("HOME") ? getenv("HOME") :		 // unix
      getenv("HOME_PATH") ? getenv("HOME_PATH") :	 // windows
      ".";						 // other
    filename = (char*)malloc(strlen(home)+20);
    sprintf(filename, "%s/untitled.txt", home);
  }
  return(filename);
}

void initializeWindow(fl_Window window){
  Fl_Window_begin(window);
  instance_data* i = (instance_data*)malloc(sizeof(instance_data));
  fl_Native_File_Chooser chooser = (fl_Native_File_Chooser)Fl_Native_File_Chooser_New();
  Fl_Native_File_Chooser_set_filter(chooser,"Text\t*.txt\n");
  Fl_Native_File_Chooser_set_preset_file(chooser,untitled_default());
  i->fc = chooser;
  Fl_Window_set_other_data(window,i);
  Fl_Window_begin(window);
  fl_Sys_Menu_Bar menu = (fl_Sys_Menu_Bar)Fl_Sys_Menu_Bar_New(0,0,400,25);
  Fl_Sys_Menu_Bar_add_with_user_data(menu, "&File/&Open",  FL_COMMAND+'o', open_cb, (void*)window);
  Fl_Sys_Menu_Bar_add_with_user_data(menu,"&File/&Save",  FL_COMMAND+'s', save_cb, (void*)window);
  Fl_Sys_Menu_Bar_add_with_user_data(menu,"&File/&Save As", 0,  saveas_cb, (void*)window);
  Fl_Sys_Menu_Bar_add(menu,"&File/&Quit",  FL_COMMAND+'q', quit_cb);
  fl_Box box = (fl_Box)Fl_Box_New(20,25+20,Fl_Window_w(window)-40,Fl_Window_h(window)-40-25);
  Fl_Box_set_color(box,45);
  Fl_Box_set_box(box,FL_FLAT_BOX);
  Fl_Box_set_align(box,FL_ALIGN_CENTER|FL_ALIGN_INSIDE|FL_ALIGN_WRAP);
  Fl_Box_set_label(box,
  		   "This demo shows an example of implementing "
  		   "common 'File' menu operations like:\n"
  		   "    File/Open, File/Save, File/Save As\n"
  		   "..using the Fl_Native_File_Chooser widget.\n\n"
  		   "Note 'Save' and 'Save As' really *does* create files! "
  		   "This is to show how behavior differs when "
  		   "files exist vs. do not.");
  Fl_Box_set_labelsize(box,12);
  Fl_Window_end(window);
}
int main(int argc, char** argv){
  Fl_scheme("gtk+");
  fl_Window app = (fl_Window)Fl_Window_New_WithLabel(400,200,"Native File Chooser Example");
  initializeWindow(app);
  Fl_Window_show(app);
  return Fl_run();
}
