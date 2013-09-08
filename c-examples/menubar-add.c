#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_Menu_BarC.h"
#include "Fl_Menu_ItemC.h"
#include "FL/filename.H"
#include "filenameC.h"

void MyMenuCallback(fl_Widget w, void* user_data){
  fl_Menu_Bar bar = (fl_Menu_Bar)w;
  fl_Menu_Item item = Fl_Menu_Bar_mvalue(bar);
  char ipath[256];
  Fl_Menu_Bar_item_pathname(bar, ipath, sizeof(ipath));
  fprintf(stderr, "callback: You picked '%s'", Fl_Menu_Item_label(item));	// Print item picked
  fprintf(stderr, ", item_pathname() is '%s'", ipath);		// ..and full pathname
  if ( Fl_Menu_Item_flags(item) & (FL_MENU_RADIO|FL_MENU_TOGGLE) ) {		// Toggle or radio item?
    fprintf(stderr, ", value is %s", Fl_Menu_Item_value(item)?"on":"off");	// Print item's value
  }
  fprintf(stderr, "\n");
  if ( strcmp(Fl_Menu_Item_label(item), "Google") == 0 ) { flc_open_uri("http://google.com/");}
  if ( strcmp(Fl_Menu_Item_label(item), "&Quit") == 0 ) { exit(0); }
}
int main(int argc, char** argv){
  Fl_set_scheme("gtk+");
  fl_Window window = (fl_Window)Fl_Window_New_WithLabel(250,400,"menubar-simple");
  Fl_Window_begin(window);

  fl_Menu_Bar menu = (fl_Menu_Bar)Fl_Menu_Bar_New(0,0,400,45);
  Fl_Menu_Bar_add_with_shortcutname(menu,"&File/&Open",  "^o", MyMenuCallback);
  Fl_Menu_Bar_add_with_shortcutname(menu,"&File/&Open",  "^o", MyMenuCallback);
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&File/&Save",  "^s", MyMenuCallback, 0, FL_MENU_DIVIDER);
  Fl_Menu_Bar_add_with_shortcutname(menu,"&File/&Quit",  "^q", MyMenuCallback);
  Fl_Menu_Bar_add_with_shortcutname(menu,"&Edit/&Copy",  "^c", MyMenuCallback);
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/&Paste", "^v", MyMenuCallback, 0, FL_MENU_DIVIDER);
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/Radio 1",   0, MyMenuCallback, 0, FL_MENU_RADIO);
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/Radio 2",   0, MyMenuCallback, 0, FL_MENU_RADIO|FL_MENU_DIVIDER);
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/Toggle 1",  0, MyMenuCallback, 0, FL_MENU_TOGGLE);			// Default: off
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/Toggle 2",  0, MyMenuCallback, 0, FL_MENU_TOGGLE);			// Default: off
  Fl_Menu_Bar_add_with_shortcutname_user_data_flags(menu,"&Edit/Toggle 3",  0, MyMenuCallback, 0, FL_MENU_TOGGLE|FL_MENU_VALUE);	// Default: on
  Fl_Menu_Bar_add_with_shortcutname(menu,"&Help/Google",    0, MyMenuCallback);
  {
    fl_Menu_Item item = (fl_Menu_Item)Fl_Menu_Bar_find_item_with_name(menu,"&Edit/Toggle 2");
    if ( item ) Fl_Menu_Item_set(item);
    else fprintf(stderr, "'Toggle 2' item not found?!\n");
  }
  Fl_Window_end(window);
  Fl_Window_show(window);
  return Fl_run();
}
