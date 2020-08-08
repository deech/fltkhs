#include "PopenShim.H"
#include <stdlib.h>

FILE* popenShim(const char* command) {
  FILE* fd = NULL;
  if ( ( fd = popen(command, "r") ) == NULL ) {	// start the external unix command
    perror("popen failed");
  }
  return fd;
}

int filenoShim(FILE* fd) {
  return fileno(fd);
}

void pcloseShim(FILE* fd) {
  pclose(fd);
}

char* getLineShim(FILE* fd){
  char* s = malloc(1024 * sizeof(char));
  if (fgets(s, 1023, fd) == NULL)
    return NULL;
  return s;
}
