#include <stdio.h>
#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_Multi_BrowserC.h>

#ifdef WIN32
#  define PING_CMD "ping -n 10 localhost"	// 'slow command' under windows
#  ifdef _MSC_VER
#    define popen _popen
#    define pclose _pclose
#  else /*_MSC_VER*/
#    include <unistd.h>				// non-MS win32 compilers (untested)
#  endif /*_MSC_VER*/
#else
#  include <unistd.h>
#  define PING_CMD "ping -i 2 -c 10 localhost"	// 'slow command' under unix
#endif

FILE *G_fp = NULL;

// Handler for add_fd() -- called whenever the ping command outputs a new line of data
void HandleFD(int fd, void *data) {
  fl_Multi_Browser brow = (fl_Multi_Browser)data;
  char s[1024];
  if ( fgets(s, 1023, G_fp) == NULL ) {		// read the line of data
    Fl_remove_fd(fileno(G_fp));		// command ended? disconnect callback
    pclose(G_fp);				// close the descriptor
    Fl_Multi_Browser_add(brow, "");
    Fl_Multi_Browser_add(brow, "<<DONE>>");
    return;
  }
  Fl_Multi_Browser_add(brow, s);
}

int main(int argc, char** argv){
  fl_Window win = (fl_Window)Fl_Window_New(600,600);
  fl_Multi_Browser brow = (fl_Multi_Browser)Fl_Multi_Browser_New(10,10,580,580);
  if ( ( G_fp = popen(PING_CMD, "r") ) == NULL ) {	// start the external unix command
    perror("popen failed");
    return(1);
  }
  Fl_add_fd_with_userdata(fileno(G_fp), HandleFD, (void*)brow);	// setup a callback for the popen()ed descriptor
  Fl_Window_set_resizable(win, brow);
  Fl_Window_show_with_args(win, argc, argv);
  return(Fl_run());
}
