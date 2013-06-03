#include <stdio.h>
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#include "Fl_Types.h"

void TreeCallback(fl_Widget w, void* data){
  fl_Tree tree = (fl_Tree)w;
  fl_Tree_Item item = (fl_Tree_Item)Fl_Tree_callback_item(tree);
  if (! item ) return;
  switch( Fl_Tree_callback_reason(tree)) {
    case FL_TREE_REASON_SELECTED: {
      char pathname[256];
      Fl_Tree_item_pathname(tree,pathname, sizeof(pathname), item);
      printf("TreeCallback: Item selected='%s', Full pathname='%s'\n", (const char*)(Fl_Tree_Item_label(item)), pathname);
      break;
    }
    case FL_TREE_REASON_DESELECTED:
      printf("TreeCallback: Item '%s' deselected\n", (const char*)(Fl_Tree_Item_label(item)));
      break;
    case FL_TREE_REASON_OPENED:
      printf("TreeCallback: Item '%s' opened\n", (const char*)(Fl_Tree_Item_label(item)));
      break;
    case FL_TREE_REASON_CLOSED:
      printf("TreeCallback: Item '%s' closed\n", (const char*)(Fl_Tree_Item_label(item)));
    default:
      break;
  }
}
int main(int argc, char** argv) {
  Fl_set_scheme("gtk+");
  fl_Window window = (fl_Window)Fl_Window_New_WithTitle(250,400,"Simple Tree");
  Fl_Window_begin(window);
  fl_Tree tree = (fl_Tree)Fl_Tree_New(10,10,Fl_Window_w(window)-20,Fl_Window_h(window)-20);
  Fl_Tree_showroot(tree,0);

  Fl_Tree_add_with_path(tree,"Flintstones/Fred");
  Fl_Tree_add_with_path(tree,"Flintstones/Wilma");
  Fl_Tree_add_with_path(tree,"Flintstones/Pebbles");
  Fl_Tree_add_with_path(tree,"Simpsons/Homer");
  Fl_Tree_add_with_path(tree,"Simpsons/Marge");
  Fl_Tree_add_with_path(tree,"Simpsons/Bart");
  Fl_Tree_add_with_path(tree,"Simpsons/Lisa");
  Fl_Tree_add_with_path(tree,"Pathnames/\\/bin");		// front slashes
  Fl_Tree_add_with_path(tree,"Pathnames/\\/usr\\/sbin");
  Fl_Tree_add_with_path(tree,"Pathnames/C:\\\\Program Files");	// backslashes
  Fl_Tree_add_with_path(tree,"Pathnames/C:\\\\Documents and Settings");

  Fl_Tree_close_with_path(tree,"Simpsons");
  Fl_Tree_close_with_path(tree,"Pathnames");
  Fl_Tree_set_callback(tree,TreeCallback);
  Fl_Window_end(window);
  Fl_Window_show(window);
  return Fl_run();
}
