#if defined(WIN32) || defined(__APPLE__)
#include <Fl_C.h>
#include <Fl_AskC.h>
int main(int argc, char** argv) {
  flc_alert("Currently, this program works only under X.");
  return 1;
}
#else
#include "list_visuals.h"
int main(int argc, char** argv) {
  if (argc == 1);
  else if (argc == 2 && argv[1][0]!='-') dname = argv[1];
  else {fprintf(stderr,"usage: %s <display>\n",argv[0]); exit(1);}
  list_visuals();
  return 0;
}
#endif
