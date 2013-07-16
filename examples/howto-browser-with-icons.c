#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <Fl_C.h>
#include <Fl_Double_WindowC.h>
#include <Fl_BrowserC.h>
#include <Fl_ChoiceC.h>
#include <Fl_ImageC.h>
#include <Fl_PixmapC.h>
char *big[] = {                       // XPM
  "50 34 4 1",
  "  c #000000",
  "o c #ff9900",
  "@ c #ffffff",
  "# c None",
  "##################################################",
  "###      ##############################       ####",
  "### ooooo  ###########################  ooooo ####",
  "### oo  oo  #########################  oo  oo ####",
  "### oo   oo  #######################  oo   oo ####",
  "### oo    oo  #####################  oo    oo ####",
  "### oo     oo  ###################  oo     oo ####",
  "### oo      oo                     oo      oo ####",
  "### oo       oo  ooooooooooooooo  oo       oo ####",
  "### oo        ooooooooooooooooooooo        oo ####",
  "### oo     ooooooooooooooooooooooooooo    ooo ####",
  "#### oo   ooooooo ooooooooooooo ooooooo   oo #####",
  "####  oo oooooooo ooooooooooooo oooooooo oo  #####",
  "##### oo oooooooo ooooooooooooo oooooooo oo ######",
  "#####  o ooooooooooooooooooooooooooooooo o  ######",
  "###### ooooooooooooooooooooooooooooooooooo #######",
  "##### ooooooooo     ooooooooo     ooooooooo ######",
  "##### oooooooo  @@@  ooooooo  @@@  oooooooo ######",
  "##### oooooooo @@@@@ ooooooo @@@@@ oooooooo ######",
  "##### oooooooo @@@@@ ooooooo @@@@@ oooooooo ######",
  "##### oooooooo  @@@  ooooooo  @@@  oooooooo ######",
  "##### ooooooooo     ooooooooo     ooooooooo ######",
  "###### oooooooooooooo       oooooooooooooo #######",
  "###### oooooooo@@@@@@@     @@@@@@@oooooooo #######",
  "###### ooooooo@@@@@@@@@   @@@@@@@@@ooooooo #######",
  "####### ooooo@@@@@@@@@@@ @@@@@@@@@@@ooooo ########",
  "######### oo@@@@@@@@@@@@ @@@@@@@@@@@@oo ##########",
  "########## o@@@@@@ @@@@@ @@@@@ @@@@@@o ###########",
  "########### @@@@@@@     @     @@@@@@@ ############",
  "############  @@@@@@@@@@@@@@@@@@@@@  #############",
  "##############  @@@@@@@@@@@@@@@@@  ###############",
  "################    @@@@@@@@@    #################",
  "####################         #####################",
  "##################################################",
};


char *med[] = {                       // XPM
  "14 14 2 1",
  "# c #000000",
  "  c #ffffff",
  "##############",
  "##############",
  "##          ##",
  "##  ##  ##  ##",
  "##  ##  ##  ##",
  "##   ####   ##",
  "##    ##    ##",
  "##    ##    ##",
  "##   ####   ##",
  "##  ##  ##  ##",
  "##  ##  ##  ##",
  "##          ##",
  "##############",
  "##############",
};
char *sml[] = {                       // XPM
  "9 11 5 1",
  ".  c None",
  "@  c #000000",
  "+  c #808080",
  "r  c #802020",
  "#  c #ff8080",
  ".........",
  ".........",
  "@+.......",
  "@@@+.....",
  "@@r@@+...",
  "@@##r@@+.",
  "@@####r@@",
  "@@##r@@+.",
  "@@r@@+...",
  "@@@+.....",
  "@+.......",
};

typedef struct instance_data {
  fl_Image* big_icon;
  fl_Image* med_icon;
  fl_Image* sml_icon;
} instance_data;

void initialize_browser(fl_Browser browser){
  instance_data* d = (instance_data*)malloc(sizeof(instance_data));
  d->big_icon = (fl_Image)Fl_Pixmap_New(big);
  d->med_icon = (fl_Image)Fl_Pixmap_New(med);
  d->sml_icon = (fl_Image)Fl_Pixmap_New(sml);
  Fl_Browser_set_other_data(browser,(void*)d);
  Fl_Browser_set_textfont(browser,FL_COURIER);
  Fl_Browser_set_textsize(browser,14);
  Fl_Browser_set_type(browser,FL_MULTI_BROWSER);
  Fl_Browser_add(browser,"One");
  Fl_Browser_add(browser,"Two");
  Fl_Browser_add(browser,"Three");
  Fl_Browser_add(browser,"Four");
  Fl_Browser_add(browser,"Five");
  Fl_Browser_add(browser,"Six");
  Fl_Browser_add(browser,"Seven");
}

void Choice_CB(fl_Widget w, void* user_data){
  fl_Browser mb = (fl_Browser)user_data;
  fl_Choice ch = (fl_Choice)w;
  fl_Image i = 0;
  instance_data* d = (instance_data*)Fl_Browser_other_data(mb);
  char* picked = Fl_Choice_text(ch);
  if ( strcmp(picked, "None"  ) == 0 ) {  i = 0; }
  else if ( strcmp(picked, "Small" ) == 0 ) { i = d->sml_icon; }
  else if ( strcmp(picked, "Medium") == 0 ) { i = d->med_icon; }
  else if ( strcmp(picked, "Large" ) == 0 ) { i = d->big_icon; }

  Fl_Browser_set_icon(mb,3,i);
  Fl_Browser_set_icon(mb,4,i);
  Fl_Browser_set_icon(mb,5,i);
}

int main (int argc, char** argv){
  fl_Double_Window w = (fl_Double_Window)Fl_Double_Window_New(400,300);
  fl_Browser b = (fl_Browser)Fl_Browser_New(10,40,Fl_Double_Window_w(w)-20,Fl_Double_Window_h(w)-50);
  initialize_browser(b);
  fl_Choice choice = (fl_Choice)Fl_Choice_New_WithLabel(60,10,140,25,"Icon:");
  Fl_Choice_add_with_name(choice,"None");
  Fl_Choice_add_with_name(choice,"Small");
  Fl_Choice_add_with_name(choice,"Medium");
  Fl_Choice_add_with_name(choice,"Large");
  Fl_Choice_set_callback_and_user_data(choice, Choice_CB, (void*)b);
  Fl_Choice_take_focus(choice);
  Fl_Choice_value_with_index(choice,1);
  Fl_Choice_do_callback(choice);
  Fl_Double_Window_end(w);
  Fl_Double_Window_show(w);
  return Fl_run();
}
