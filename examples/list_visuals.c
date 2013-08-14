#if defined(WIN32) || defined(__APPLE__)
#include <Fl_C.h>
#include <Fl_AskC.h>

int main(int, char**) {
  fl_alert("Currently, this program works only under X.");
  return 1;
}

#else
