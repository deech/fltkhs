#include "Fl_Menu_BarC.h"
#include "UtilsC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(int,Fl_Menu_Bar_handle )(fl_Menu_Bar menu_bar, int event){
    return (static_cast<Fl_Menu_Bar*>(menu_bar))->handle(event);
  }
  FL_EXPORT_C(fl_Menu_Bar, Fl_Menu_Bar_New_WithLabel)(int x, int y, int w, int h, const char* label) {
    Fl_Menu_Bar* menu_bar = new Fl_Menu_Bar(x,y,w,h,label);
    return (static_cast<fl_Menu_Bar>(menu_bar));
  }
  FL_EXPORT_C(fl_Menu_Bar, Fl_Menu_Bar_New)(int x, int y, int w, int h) {
    Fl_Menu_Bar* menu_bar = new Fl_Menu_Bar(x,y,w,h,0);
    return (fl_Menu_Bar)menu_bar;
  }
  FL_EXPORT_C(void   , Fl_Menu_Bar_Destroy)(fl_Menu_Bar menu_bar){
    delete (static_cast<Fl_Menu_Bar*>(menu_bar));
  }
#ifdef __cplusplus
}
#endif
