/*
This is a test of how the browser draws lines.
This is a second line.
This is a third.

That was a blank line above this.

@r@_Right justify
@c@_Center justify
@_Left justify

@bBold text
@iItalic text
@b@iBold Italic
@fFixed width
@f@bBold Fixed
@f@iItalic Fixed
@f@i@bBold Italic Fixed
@lLarge
@l@bLarge bold
@sSmall
@s@bSmall bold
@s@iSmall italic
@s@i@bSmall italic bold
@uunderscore
@C1RED
@C2Green
@C4Blue

	You should try different browser types:
	Fl_Browser
	Fl_Select_Browser
	Fl_Hold_Browser
	Fl_Multi_Browser
*/

#include <Fl_C.h>
#include <Fl_Select_BrowserC.h>
#include <Fl_Double_WindowC.h>
#include <Fl_ButtonC.h>
#include <Fl_Int_InputC.h>
#include <Fl_ChoiceC.h>
#include <Fl_BrowserC.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>

fl_Select_Browser browser;
fl_Button	top,
		bottom,
		middle,
		visible,
		swap,
		sort;
fl_Choice       btype;
fl_Int_Input	field;

void b_cb(fl_Widget o, void* user_data) {
  printf("callback, selection = %d, event_clicks = %d\n",
	 Fl_Browser_value((fl_Browser)o), Fl_event_clicks());
}

void show_cb(fl_Widget o, void* user_data) {
  int line = atoi(Fl_Int_Input_value(field));

  if (!line) {
    puts("Please enter a number in the text field\nbefore clicking on the buttons.");
    return;
  }

  if (o == top)
    Fl_Select_Browser_set_topline(browser,line);
  else if (o == bottom)
    Fl_Select_Browser_bottomline(browser,line);
  else if (o == middle)
    Fl_Select_Browser_middleline(browser,line);
  else
    Fl_Select_Browser_make_visible(browser,line);
}

void swap_cb(fl_Widget w, void* user_data) {
  int a = -1, b = -1;
  int t = 0;
  for ( ;t<Fl_Select_Browser_size(browser); t++ ) {	// find two selected items
    if ( Fl_Select_Browser_selected(browser,t) ) {
      if ( a < 0 )
	{ a = t; }
      else
	{ b = t; break; }
    }
  }
  Fl_Select_Browser_swap(browser,a,b);				// swap them
}

void sort_cb(fl_Widget w, void* user_data) {
  Fl_Select_Browser_sort_with_flags(browser,FL_SORT_ASCENDING);
}

void btype_cb(fl_Widget w, void* user_data) {
  int t = 1;
  for (; t<= Fl_Select_Browser_size(browser); t++ ) Fl_Select_Browser_select_with_val(browser,t,0);
  Fl_Select_Browser_select_with_val(browser,1,0);		// leave focus box on first line
  if      ( strcmp(Fl_Choice_text(btype),"Normal")==0)      Fl_Select_Browser_set_type(browser,FL_NORMAL_BROWSER);
  else if ( strcmp(Fl_Choice_text(btype),"Select")==0) Fl_Select_Browser_set_type(browser,FL_SELECT_BROWSER);
  else if ( strcmp(Fl_Choice_text(btype),"Hold"  )==0) Fl_Select_Browser_set_type(browser,FL_HOLD_BROWSER);
  else if ( strcmp(Fl_Choice_text(btype),"Multi" )==0) Fl_Select_Browser_set_type(browser,FL_MULTI_BROWSER);
  Fl_Select_Browser_redraw(browser);
}


int main (int argc, char** argv){
  const char* fname =  "../examples/browser.c";
  fl_Double_Window window = (fl_Double_Window)Fl_Double_Window_New_WithLabel(560,400,fname);
  browser = Fl_Select_Browser_New_WithLabel(0,0,560,350,0);
  Fl_Select_Browser_set_type(browser,FL_MULTI_BROWSER);
  Fl_Select_Browser_set_callback(browser,b_cb);
  if (!Fl_Select_Browser_load(browser,fname)) {
    int done = 0;
#ifdef _MSC_VER
    puts("MSC_VER");
    fname = "../test/browser.cxx";
    done = Fl_Select_Browser_load(browser,fname);
#elif defined(__APPLE__)
    puts("apple");
    char buf[2048];
    strcpy(buf, argv[0]);
    char *slash = strrchr(buf, '/');
    if (slash)
#if defined(USING_XCODE)
      strcpy(slash, "/../Resources/browser.cxx");
#else
    puts("else");
    strcpy(slash, "/../../../browser.cxx");
#endif
    puts("here");
    done = Fl_Select_Browser_load(browser,buf);
#endif
    if ( !done )
    {
      printf("Can't load %s, %s\n", fname, strerror(errno));
      exit(1);
    }
  }

  Fl_Select_Browser_set_position(browser,0);

  field = Fl_Int_Input_New_WithLabel(55, 350, 505, 25, "Line #:");
  Fl_Int_Input_set_callback(field,show_cb);

  top = Fl_Button_New_WithLabel(0, 375, 80, 25, "Top");
  Fl_Button_set_callback(top,show_cb);

  bottom = Fl_Button_New_WithLabel(80, 375, 80, 25, "Bottom");
  Fl_Button_set_callback(bottom,show_cb);

  middle = Fl_Button_New_WithLabel(160, 375, 80, 25, "Middle");
  Fl_Button_set_callback(middle,show_cb);

  visible = Fl_Button_New_WithLabel(240, 375, 80, 25, "Make Vis.");
  Fl_Button_set_callback(visible,show_cb);

  swap = Fl_Button_New_WithLabel(320, 375, 80, 25, "Swap");
  Fl_Button_set_callback(swap,swap_cb);
  Fl_Button_set_tooltip(swap,"Swaps two selected lines\n(Use CTRL-click to select two lines)");

  sort = Fl_Button_New_WithLabel(400, 375, 80, 25, "Sort");
  Fl_Button_set_callback(sort,sort_cb);

  btype = Fl_Choice_New(480, 375, 80, 25);
  Fl_Choice_add_with_name(btype,(char*)"Normal");
  Fl_Choice_add_with_name(btype,(char*)"Select");
  Fl_Choice_add_with_name(btype,(char*)"Hold");
  Fl_Choice_add_with_name(btype,(char*)"Multi");
  Fl_Choice_set_callback(btype,btype_cb);
  Fl_Choice_value_with_index(btype,3);
  Fl_Choice_set_tooltip(btype,"Changes the browser type()");

  Fl_Double_Window_set_resizable(window,browser);
  Fl_Double_Window_show_with_args(window,argc,argv);
  return (Fl_run());
}
