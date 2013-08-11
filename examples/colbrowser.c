#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_WindowC.h>
#include <Fl_ButtonC.h>
#include <Fl_Value_SliderC.h>
#include <Fl_Hold_BrowserC.h>
#include <Fl_BoxC.h>
#include <Fl_BrowserC.h>
#include <Fl_WidgetC.h>

#include <Fl_AskC.h>
#include <filenameC.h>
#include <FL/fl_utf8.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define MAX_RGB 3000

#define FL_FREE_COL4    ((Fl_Color)(FL_FREE_COLOR+3))
#define FL_INDIANRED	((Fl_Color)(164))


fl_Double_Window cl;
fl_Box rescol;
fl_Button dbobj;
fl_Hold_Browser colbr;
fl_Value_Slider rs;
fl_Value_Slider gs;
fl_Value_Slider bs;

char dbname[FL_PATH_MAX];

void create_form_cl(void);
int load_browser(char *);

typedef struct { int r, g, b; } RGBdb;

RGBdb rgbdb[MAX_RGB];


int main(int argc, char *argv[])
{
  create_form_cl();

#ifdef USING_XCODE
  // Xcode apps do not set the current directory
  strcpy(dbname, argv[0]);
  char *slash = strrchr(dbname, '/');
  if (slash)
    strcpy(slash, "/../Resources/rgb.txt");
#else
  strcpy(dbname, "../examples/rgb.txt");
#endif

  if (load_browser(dbname))
    Fl_Button_set_label(dbobj,dbname);
  else
    Fl_Button_set_label(dbobj,"None");
  Fl_Button_redraw(dbobj);
  // cl->size_range(cl->w(),cl->h(),2*cl->w(),2*cl->h());

  fl_Window_size_range_args* sizes = Fl_Window_default_size_range_args();
  sizes->maxw = 2 * Fl_Double_Window_w(cl);
  sizes->maxh = 2 * Fl_Double_Window_h(cl);;
  Fl_Double_Window_size_range_with_args(cl, Fl_Double_Window_w(cl), Fl_Double_Window_h(cl),sizes);
  Fl_Double_Window_set_label(cl,"RGB Browser");
  Fl_Double_Window_free_position(cl);
  Fl_Double_Window_show_with_args(cl,argc,argv);

  return Fl_run();
}


void set_entry(int i)
{
  RGBdb *db = rgbdb + i;
  Fl_set_color_rgb(FL_FREE_COL4, db->r, db->g, db->b);
  Fl_Value_Slider_set_value(rs,db->r);
  Fl_Value_Slider_set_value(gs,db->g);
  Fl_Value_Slider_set_value(bs,db->b);
  Fl_Box_redraw(rescol);
}


void br_cb(fl_Widget ob, void* user_data)
{
  int r = Fl_Browser_value((fl_Browser)ob);

  if (r <= 0)
    return;
  set_entry(r - 1);
}


int read_entry(FILE * fp, int *r, int *g, int *b, char *name)
{
  int  n;
  char buf[512], *p;

  if (!fgets(buf, sizeof(buf) - 1, fp))
    return 0;

  if(buf[0] == '!') {
    if (fgets(buf,sizeof(buf)-1,fp)==0) {
      /* ignore */
    }
  }

  if(sscanf(buf, " %d %d %d %n", r, g, b, &n) < 3)
    return 0;

  p = buf + n;

  /* squeeze out all spaces */
  while (*p)
  {
    if (*p != ' ' && *p != '\n')
      *name++ = *p;
    p++;
  }
  *name = 0;

  return (feof(fp) || ferror(fp)) ? 0 : 1;
}


int load_browser(char *fname)
{
  FILE *fp;
  RGBdb *db = rgbdb, *dbs = db + MAX_RGB;
  int r, g, b,  lr  = -1 , lg = -1, lb = -1;
  char name[256], buf[256];
#ifdef __EMX__
  if (!(fp = fl_fopen(__XOS2RedirRoot(fname), "r")))
#else
    if (!(fp = fl_fopen(fname, "r")))
#endif
    {
      printf("%s\n%s\n%s","Load", fname, "Can't open");
      return 0;
    }

  /* read the items */

  for (; db < dbs && read_entry(fp, &r, &g, &b, name);)
  {
    db->r = r;
    db->g = g;
    db->b = b;

    /* unique the entries on the fly */
    if (lr != r || lg != g || lb != b)
    {
      db++;
      lr = r;
      lg = g;
      lb = b;
      sprintf(buf, "(%3d %3d %3d) %s", r, g, b, name);
      Fl_Hold_Browser_add(colbr,buf);
    }
  }
  fclose(fp);

  if (db < dbs)
    db->r = 1000;		/* sentinel */
  else
  {
    db--;
    db->r = 1000;
  }

  Fl_Hold_Browser_set_topline(colbr,1);
  Fl_Hold_Browser_select_with_val(colbr,1,1);
  set_entry(0);

  return 1;
}


int search_entry(int r, int g, int b)
{
  register RGBdb *db = rgbdb;
  int i, j, diffr, diffg, diffb;
  unsigned int diff, mindiff;

  mindiff = (unsigned int)~0;
  for (i = j = 0; db->r < 256; db++, i++)
  {
    diffr = r - db->r;
    diffg = g - db->g;
    diffb = b - db->b;

#ifdef FL_LINEAR
    diff = (unsigned)((3.0 * (FL_abs(r - db->r)) +
                    (5.9 * FL_abs(g - db->g)) +
		       (1.1 * (FL_abs(b - db->b)))));
#else
    diff = (unsigned)((3.0 * (diffr *diffr) +
                    5.9 * (diffg *diffg) +
		       1.1 * (diffb *diffb)));
#endif

    if (mindiff > diff)
    {
      mindiff = diff;
      j = i;
    }
  }

  return j;
}


void search_rgb(fl_Widget w, void* user_data)
{
  int r, g, b, i;
  int top  = Fl_Hold_Browser_topline(colbr);

  r = (int)(Fl_Value_Slider_value(rs));
  g = (int)(Fl_Value_Slider_value(gs));
  b = (int)(Fl_Value_Slider_value(bs));

  // fl_freeze_form(cl);
  Fl_set_color_rgb(FL_FREE_COL4, r, g, b);
  Fl_Box_redraw(rescol);
  i = search_entry(r, g, b);
  /* change topline only if necessary */
  if(i < top || i > (top+15))
    Fl_Hold_Browser_set_topline(colbr,i-8);
  Fl_Hold_Browser_select_with_val(colbr,i+1, 1);
  // fl_unfreeze_form(cl);
}


/* change database */
void db_cb(fl_Widget  ob, void* user_data)
{
  const char *p = flc_input_with_deflt("Enter New Database Name", dbname);
  char buf[512];

  if (!p || strcmp(p, dbname) == 0)
    return;

  strcpy(buf, p);
  if (load_browser(buf))
    strcpy(dbname, buf);
  else
    Fl_Widget_set_label(ob,dbname);
}


void done_cb(fl_Widget w, void* user_data)
{
  exit(0);
}


void create_form_cl(void)
{
  if (cl)
    return;

  cl = Fl_Double_Window_New(400,385);
  Fl_Double_Window_set_box(cl,FL_UP_BOX);
  Fl_Double_Window_set_color_with_bg_sel(cl,FL_INDIANRED, FL_GRAY);

  fl_Box *title = Fl_Box_New_WithLabel(40, 10, 300, 30, "Color Browser");
  Fl_Box_set_box(title,FL_NO_BOX);
  Fl_Box_set_labelcolor(title,FL_RED);
  Fl_Box_set_labelsize(title,32);
  Fl_Box_set_labelfont(title,FL_HELVETICA_BOLD);
  Fl_Box_set_labeltype(title,FL_SHADOW_LABEL);

  dbobj = Fl_Button_New_WithLabel(40, 50, 300, 25, "");
  Fl_Button_set_type(dbobj,FL_NORMAL_BUTTON);
  Fl_Button_set_box(dbobj,FL_BORDER_BOX);
  Fl_Button_set_color_with_bg_sel(dbobj,FL_INDIANRED,FL_INDIANRED);
  Fl_Button_set_callback_with_user_data(dbobj,db_cb, 0);

  colbr = Fl_Hold_Browser_New_WithLabel(10, 90, 280, 240, "");
  Fl_Hold_Browser_set_textfont(colbr,FL_COURIER);
  Fl_Hold_Browser_set_callback_with_user_data(colbr,br_cb, 0);
  Fl_Hold_Browser_set_box(colbr,FL_DOWN_BOX);

  rescol = Fl_Box_New_WithLabel(300, 90, 90, 35, "");
  Fl_Box_set_color_with_bg_sel(rescol,FL_FREE_COL4, FL_FREE_COL4);
  Fl_Box_set_box(rescol,FL_BORDER_BOX);

  rs = Fl_Value_Slider_New_WithLabel(300, 130, 30, 200, "");
  Fl_Value_Slider_set_type(rs,FL_VERT_FILL_SLIDER);
  Fl_Value_Slider_set_color_with_bg_sel(rs,FL_INDIANRED, FL_RED);
  Fl_Value_Slider_bounds(rs,0, 255);
  Fl_Value_Slider_precision(rs,0);
  Fl_Value_Slider_set_callback_with_user_data(rs,search_rgb, 0);
  Fl_Value_Slider_set_when(rs,FL_WHEN_RELEASE);

  gs = Fl_Value_Slider_New_WithLabel(330, 130, 30, 200, "");
  Fl_Value_Slider_set_type(gs,FL_VERT_FILL_SLIDER);
  Fl_Value_Slider_set_color_with_bg_sel(gs,FL_INDIANRED, FL_GREEN);
  Fl_Value_Slider_bounds(gs,0, 255);
  Fl_Value_Slider_precision(gs,0);
  Fl_Value_Slider_set_callback_with_user_data(gs,search_rgb, (void*)1);
  Fl_Value_Slider_set_when(gs,FL_WHEN_RELEASE);

  bs = Fl_Value_Slider_New_WithLabel(360, 130, 30, 200, "");
  Fl_Value_Slider_set_type(bs,FL_VERT_FILL_SLIDER);
  Fl_Value_Slider_set_color_with_bg_sel(bs,FL_INDIANRED, FL_BLUE);
  Fl_Value_Slider_bounds(bs,0, 255);
  Fl_Value_Slider_precision(bs,0);
  Fl_Value_Slider_set_callback_with_user_data(bs,search_rgb, (void*)2);
  Fl_Value_Slider_set_when(bs,FL_WHEN_RELEASE);

  fl_Button done = Fl_Button_New_WithLabel(160, 345, 80, 30, "Done");
  Fl_Button_set_type(done,FL_NORMAL_BUTTON);
  Fl_Button_set_callback_with_user_data(done,done_cb, 0);

  Fl_Double_Window_end(cl);
  Fl_Double_Window_set_resizable(cl,cl);
}
