#include <stdio.h>
#include <string.h>
#include <Fl_C.h>
#include <Fl_BoxC.h>
#include <Fl_WindowC.h>

int helpFlag = 0;
char *optionString = 0;
int arg(int argc, char **argv, int* i)
{
  printf("i: %d\n", *i);
  if (strcmp("-h", argv[*i]) == 0 || strcmp("--help", argv[*i]) == 0) {
    helpFlag = 1;
    *i += 1;
    return 1;
  }
  if (strcmp("-o", argv[*i]) == 0 || strcmp("--option", argv[*i]) == 0) {
    if (*i < argc-1 && argv[*i+1] != 0) {
      optionString = argv[*i+1];
      *i += 2;
      return 2;
    }
  }
  return 0;
}
int main(int argc, char** argv)
{
  int num = 1;
  int *i = &num;
   if (Fl_args_with_handler(argc, argv, i, arg) < argc)
    // note the concatenated strings to give a single format string!
    printf("error: unknown option: %s\n"
           "usage: %s [options]\n"
           " -h | --help     : print extended help message\n"
           " -o | --option # : example option with parameter\n"
           " plus standard fltk options\n",
           argv[*i], argv[0]);
  if (helpFlag)
    printf("usage: %s [options]\n"
           " -h | --help     : print extended help message\n"
           " -o | --option # : example option with parameter\n"
           " plus standard fltk options:\n"
           "\n",
           argv[0]);

  fl_Window mainWin = (fl_Window)Fl_Window_New(300,200);
  fl_Box textBox = (fl_Box)Fl_Box_New(0, 0, 300, 200);
  if (optionString != 0)
    Fl_Box_set_label(textBox, optionString);
  else
    Fl_Box_set_label(textBox, "re-run with [-o|--option] text");
  Fl_Window_show_with_args(mainWin,argc, argv);
  return Fl_run();
}
