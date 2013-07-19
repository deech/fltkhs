#include <stdio.h>
#include <math.h>		// powf()
#include <string.h>
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
#include "Fl_Double_WindowC.h"
#include "Fl_TableC.h"
#include "Fl_DrawC.h"
#include "Fl_TreeC.h"
#include "Fl_Tree_ItemC.h"
#ifndef PI
#define PI 3.14159
#endif

#if FLTK_ABI_VERSION >= 10301
void initializeTable(fl_Table table, char* m){
  void* user_data = (void*)m;
  Fl_Table_set_other_data(table,user_data);
  Fl_Table_begin(table);
  Fl_Table_set_rows(table,11);
  Fl_Table_set_row_height_all(table,20);
  Fl_Table_set_row_header(table,1);
  Fl_Table_set_cols(table,11);
  Fl_Table_set_col_width_all(table,60);
  Fl_Table_set_col_header(table,1);
  Fl_Table_set_col_resize(table,1);
  Fl_Table_end(table);
}
void resize(fl_Table table,int X,int Y,int W,int H){
  if ( W > 718 ) W = 718;
  H = Fl_Table_h(table);
  Fl_Table_resize_super(table,X,Y,W,H);
}

void draw_cell(fl_Table table,TableContextC context, int ROW, int COL, int X, int Y, int W, int H){
  static char s[40];
  char* mode = (char*)Fl_Table_other_data(table);
  switch ( context ) {
      case CONTEXT_STARTPAGEC:         // before page is drawn..
        flc_set_font(FL_HELVETICA, 10);    // set the font for our drawing operations
        return;
      case CONTEXT_COL_HEADERC:	      // Drawing column/row headers
      case CONTEXT_ROW_HEADERC: {
        int val = context==CONTEXT_COL_HEADERC ? COL : ROW;
        int col = context==CONTEXT_COL_HEADERC ? Fl_Table_col_header_color(table) : Fl_Table_row_header_color(table);
        flc_push_clip(X,Y,W,H);
	if ( strcmp(mode, "SinCos" ) == 0 ) { sprintf(s, "%.2f", ((val/10.0)*PI)); }
	else sprintf(s,"%d",val);
	flc_draw_box(FL_THIN_UP_BOX, X,Y,W,H, col);
	flc_set_color(FL_BLACK);
	flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);
        flc_pop_clip();
        return;
      }
      case CONTEXT_CELLC: {            // Draw data in cells
        int col = Fl_Table_is_selected(table,ROW,COL) ? FL_YELLOW : FL_WHITE;
        flc_push_clip(X,Y,W,H);
        if ( strcmp(mode, "Addition") == 0 ) { sprintf(s, "%d", ROW+COL); } else
        if ( strcmp(mode, "Subtract") == 0 ) { sprintf(s, "%d", ROW-COL); } else
	if ( strcmp(mode, "Multiply") == 0 ) { sprintf(s, "%d", ROW*COL); } else
	if ( strcmp(mode, "Divide"  ) == 0 ) { if ( COL==0 ) sprintf(s, "N/A"); else sprintf(s, "%.2f", (float)ROW/(float)COL); } else
	if ( strcmp(mode, "Exponent") == 0 ) { sprintf(s, "%g", powf((float)ROW,(float)COL)); } else
	if ( strcmp(mode, "SinCos"  ) == 0 ) { sprintf(s, "%.2f", sin((ROW/10.0)*PI) * cos((COL/10.0)*PI)); } else
	                                     { sprintf(s, "???"); }
	flc_set_color(col); flc_rectf(X,Y,W,H);				// bg
	flc_set_color(FL_GRAY0); flc_draw_with_align(s, X,Y,W,H, FL_ALIGN_CENTER);	// text
	flc_set_color(Fl_Table_color(table));  flc_rect(X,Y,W,H);				// box
        flc_pop_clip();
        return;
      }
      default:
        return;
    }
}
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
      fl_Table table;
      fl_Tree_Item item;
      fl_Table_Virtual_Funcs* funcs = (fl_Table_Virtual_Funcs*)Fl_Table_default_virtual_funcs();
      funcs->resize = &resize;
      funcs->draw_cell = &draw_cell;

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"Addition");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Arithmetic/Addition");
      Fl_Tree_Item_set_widget(item, table);

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"Subtract");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Arithmetic/Subtract");
      Fl_Tree_Item_set_widget(item, table);

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"Multiply");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Arithmetic/Multiply");
      Fl_Tree_Item_set_widget(item, table);

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"Divide");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Arithmetic/Divide");
      Fl_Tree_Item_set_widget(item, table);

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"Exponent");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Misc/Exponent");
      Fl_Tree_Item_set_widget(item, table);

      table = (fl_Table)Fl_Table_New(0,0,500,156,funcs);
      initializeTable(table,"SinCos");
      item = (fl_Tree_Item)Fl_Tree_add(tree, "Misc/Sin*Cos");
      Fl_Tree_Item_set_widget(item, table);
    }
    Fl_Tree_end(tree);
  }
  Fl_Double_Window_end(win);
  Fl_Double_Window_set_resizable(win,win);
  Fl_Double_Window_show(win);
  return Fl_run();
}
#else
int main(int argc, char *argv[]) {
  puts("This example must have FLTK_ABI_VERSION enabled to work properly.");
  return 0;
}
#endif
