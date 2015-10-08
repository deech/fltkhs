#include "UtilsC.h"
#ifdef __cplusplus
Fl_Menu_Item* convert(fl_Menu_Item* item, int size){
  int i = 0;
  Fl_Menu_Item* current = new Fl_Menu_Item[size];
  for (;i<size;i++){
    current[i] = *(static_cast<Fl_Menu_Item*>(*(item + i)));
  }
  return current;
}
#endif
