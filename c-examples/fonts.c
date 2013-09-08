#include "Fl_C.h"
#include "Fl_TileC.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Hold_BrowserC.h"
#include "Fl_DrawC.h"
#include "Fl_BoxC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
#include <FL/fl_utf8.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

fl_Double_Window form;
fl_Tile tile;

typedef struct instance_data {
  int font;
  int size;
} instance_data;

void draw(fl_Widget w){
  Fl_Widget_draw_box(w);
  instance_data* d = Fl_Widget_other_data(w);
  flc_set_font((Fl_Font)d->font, d->size);
  flc_set_color(FL_BLACK);
  flc_draw_with_align(Fl_Widget_label(w), Fl_Widget_x(w)+3, Fl_Widget_y(w)+3, Fl_Widget_w(w)-6, Fl_Widget_h(w)-6, Fl_Widget_align(w));
}

fl_Widget textobj;
fl_Hold_Browser fontobj;
fl_Hold_Browser sizeobj;
int **sizes;
int *numsizes;
int pickedsize = 14;

void font_cb(fl_Widget w, void* user_data) {
  int fn = Fl_Hold_Browser_value(fontobj);
  if (!fn) return;
  fn--;
  instance_data* d = Fl_Widget_other_data(textobj);
  d->font = fn;
  Fl_Widget_set_other_data(textobj,d);

  Fl_Hold_Browser_clear(sizeobj);
  int n = numsizes[fn];
  int *s = sizes[fn];
  if (!n) {
    // no sizes
  } else if (s[0] == 0) {
    // many sizes;
    int j = 1;
    int i = 1;
    for (; i<64 || i<s[n-1]; i++) {
      char buf[20];
      if (j < n && i==s[j]) {sprintf(buf,"@b%d",i); j++;}
      else sprintf(buf,"%d",i);
      Fl_Hold_Browser_add(sizeobj,buf);
    }
    Fl_Hold_Browser_set_value(sizeobj,pickedsize);
  } else {
    // some sizes
    int w = 0;
    int i = 0;
    for (; i < n; i++) {
      if (s[i]<=pickedsize) w = i;
      char buf[20];
      sprintf(buf,"@b%d",s[i]);
      Fl_Hold_Browser_add(sizeobj,buf);
    }
    Fl_Hold_Browser_set_value(sizeobj,w+1);
  }
  Fl_Hold_Browser_redraw(textobj);
}

void size_cb(fl_Widget w, void* user_data) {
  int i = Fl_Hold_Browser_value(sizeobj);
  if (!i) return;
  const char *c = Fl_Hold_Browser_text(sizeobj,i);
  while (*c < '0' || *c > '9') c++;
  pickedsize = atoi(c);
  instance_data* d = Fl_Widget_other_data(textobj);
  d->size = pickedsize;
  Fl_Widget_set_other_data(textobj,d);
  Fl_Hold_Browser_redraw(textobj);
}

char label[0x1000];
fl_Widget make_FontDisplay(Fl_Boxtype B, int X, int Y, int W, int H, const char* L){
  fl_Widget_Virtual_Funcs* funcs = Fl_Widget_default_virtual_funcs();
  funcs->draw = &draw;
  instance_data* d = (instance_data*) malloc (sizeof(instance_data));
  d->font = 0;
  d->size = 14;
  fl_Widget fontDisplay = Fl_OverriddenWidget_New_WithLabel(X,Y,W,H,L,funcs);
  Fl_Widget_set_box(fontDisplay, B);
  Fl_Widget_set_other_data(fontDisplay, (void*)d);
  return fontDisplay;
}
void create_the_forms() {
  // create the sample string
  int n = 0;
  strcpy(label, "Hello, world!\n");
  int i = strlen(label);
  ulong c = ' ' + 1;
  for (; c < 127; c++) {
    if (!(c&0x1f)) label[i++]='\n';
    if (c=='@') label[i++]=c;
    label[i++]=c;
  }
  label[i++] = '\n';
  c = 0xA1;
  for (; c < 0x600; c += 9) {
    if (!(++n&(0x1f))) label[i++]='\n';
    i += fl_utf8encode((unsigned int)c, label + i);
  }
  label[i] = 0;

  // create the basic layout
  form = Fl_Double_Window_New(550,370);

  tile = Fl_Tile_New(0, 0, 550, 370);

  fl_Group textgroup = (fl_Group)Fl_Group_New(0, 0, 550, 185);
  Fl_Group_set_box(textgroup,FL_FLAT_BOX);
  textobj = make_FontDisplay(FL_FRAME_BOX,10,10,530,170,label);
  Fl_Widget_set_align(textobj,FL_ALIGN_TOP|FL_ALIGN_LEFT|FL_ALIGN_INSIDE|FL_ALIGN_CLIP);
  Fl_Widget_set_color_with_bg_sel(textobj,9,47);
  Fl_Group_set_resizable(textgroup,textobj);
  Fl_Group_end(textgroup);

  fl_Group fontgroup = (fl_Group)Fl_Group_New(0, 185, 550, 185);
  Fl_Group_set_box(fontgroup,FL_FLAT_BOX);
  fontobj = Fl_Hold_Browser_New(10, 190, 390, 170);
  Fl_Hold_Browser_set_box(fontobj,FL_FRAME_BOX);
  Fl_Hold_Browser_set_color_with_bg_sel(fontobj,53,3);
  Fl_Hold_Browser_set_callback(fontobj,&font_cb);
  sizeobj = Fl_Hold_Browser_New(410, 190, 130, 170);
  Fl_Hold_Browser_set_box(sizeobj,FL_FRAME_BOX);
  Fl_Hold_Browser_set_color_with_bg_sel(sizeobj,53,3);
  Fl_Hold_Browser_set_callback(sizeobj,size_cb);
  Fl_Group_set_resizable(fontgroup,fontobj);
  Fl_Group_end(fontgroup);

  Fl_Tile_end(tile);

  Fl_Double_Window_set_resizable(form,tile);
  Fl_Double_Window_end(form);
}

#include <Fl_AskC.h>
int main (int argc, char** argv){
  Fl_scheme(NULL);
  Fl_args(argc,argv);
  Fl_get_system_colors();
  create_the_forms();
  int i = 0;
  int k = Fl_set_fonts("-*");
  sizes = malloc(sizeof(int*) * k);
  numsizes = malloc(sizeof(int) * k);
  i = 0;
  for (; i < k; i++) {
    int t;
    const char *name = Fl_get_font_name_with_attributes((Fl_Font)i,&t);
    char buffer[128];
    if (t) {
      char *p = buffer;
      if (t & FL_BOLD) {*p++ = '@'; *p++ = 'b';}
      if (t & FL_ITALIC) {*p++ = '@'; *p++ = 'i';}
	  *p++ = '@'; *p++ = '.'; // Suppress subsequent formatting - some MS fonts have '@' in their name
      strcpy(p,name);
      name = buffer;
    }
    Fl_Hold_Browser_add(fontobj,name);
    int s;
    int* _s = &s;
    int n = Fl_get_font_sizes((Fl_Font)i, _s);
    numsizes[i] = n;
    if (n) {
      sizes[i] = malloc(sizeof(int) * n);
      int j = 0;
      for (; j<n; j++){sizes[i][j] = _s[j];}
    }
  }
  Fl_Hold_Browser_set_value(fontobj,1);
  font_cb(fontobj,0);
  Fl_Double_Window_show_with_args(form,argc,argv);
  return Fl_run();
}
