#include <stdio.h>
#include "Fl_C.h"
#include "Fl_Types.h"

int main(int argc, char** argv)
{
  char* title = "FLTK Tree Window";
  fl_Window win = (fl_Window)Fl_Window_New_WithLabel(500,500,title);
  Fl_Window_begin(win);
  fl_Tree tree = (fl_Tree)Fl_Tree_New_WithLabel(50,50,200,200,"Tree");
  Fl_Tree_root_label(tree, "Root Label With Items");
  fl_Tree_Prefs prefs = (fl_Tree_Prefs)Fl_Tree_Prefs_New();
  int i = 0;
  fl_Tree_Item item;
  for (i = 0; i < 10; i++) {
    item = (fl_Tree_Item)Fl_Tree_Item_New_WithPrefs(prefs);
    Fl_Tree_Item_set_label(item, "test");
    Fl_Tree_add(tree, item, "test");
  }
  Fl_Window_end(win);
  Fl_Window_show(win);
  return Fl_run();
}
