#include <stdio.h>
#include <math.h>		// powf()
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#ifndef PI
#define PI 3.14159
#endif
int main(int argc, char *argv[]) {
  fl_Double_Window win = (fl_Double_Window)Fl_Double_Window_New_WithLabel(700,400,"Tree Of Tables");
  Fl_Double_Window_begin(win);
  {
    fl_Tree tree = (fl_Tree)Fl_Tree_New(10,10,Fl_Double_Window_w(win)-20,Fl_Double_Window_h(win)-20);
    fl_Tree_Item root = (fl_Tree_Item)Fl_Tree_root(tree);
    Fl_Tree_Item_set_label(root, "Math Tables");
    Fl_Tree_set_item_labelfont(tree,FL_COURIER);
    Fl_Tree_set_linespacing(tree,4);
    Fl_Tree_set_item_draw_mode(tree,
			       Fl_Tree_item_draw_mode(tree)|
			       FL_TREE_ITEM_DRAW_LABEL_AND_WIDGET |
			       FL_TREE_ITEM_HEIGHT_FROM_WIDGET);
    Fl_Tree_set_selectmode(tree, FL_TREE_SELECT_NONE);
    Fl_Tree_set_widgetmarginleft(tree, 12);
    Fl_Tree_set_connectorstyle(tree,FL_TREE_CONNECTOR_DOTTED);
    Fl_Tree_begin(tree);
    {

    }
    Fl_Tree_end(tree);
  }
  Fl_Double_Window_end(win);
  Fl_Double_Window_show(win);
  return Fl_run();
}
