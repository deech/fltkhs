#include "Fl_File_IconC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_File_Icon, Fl_File_Icon_New)(const char* p, int t, int nd, short* d){
    Fl_File_Icon* i = new Fl_File_Icon(p,t,nd,d);
    return (fl_File_Icon)i;
  }
  FL_EXPORT_C(void, Fl_File_Icon_Destroy)(fl_File_Icon file_icon){
    delete (static_cast<Fl_File_Icon*>(file_icon));
  }

  FL_EXPORT_C(short*,Fl_File_Icon_add)(fl_File_Icon file_icon,short d){
    return (static_cast<Fl_File_Icon*>(file_icon))->add(d);
  }
  FL_EXPORT_C(short*,Fl_File_Icon_add_color)(fl_File_Icon file_icon,Fl_Color c){
    return (static_cast<Fl_File_Icon*>(file_icon))->add_color(c);
  }
  FL_EXPORT_C(short*,Fl_File_Icon_add_vertex)(fl_File_Icon file_icon,float x,float y){
    return (static_cast<Fl_File_Icon*>(file_icon))->add_vertex(x,y);
  }
  FL_EXPORT_C(void,Fl_File_Icon_clear)(fl_File_Icon file_icon){
    (static_cast<Fl_File_Icon*>(file_icon))->clear();
  }
  FL_EXPORT_C(void,Fl_File_Icon_draw)(fl_File_Icon file_icon,int x,int y,int w,int h,Fl_Color ic){
    (static_cast<Fl_File_Icon*>(file_icon))->draw(x,y,w,h,ic);
  }
  FL_EXPORT_C(void,Fl_File_Icon_draw_with_active)(fl_File_Icon file_icon,int x,int y,int w,int h,Fl_Color ic,int active){
    (static_cast<Fl_File_Icon*>(file_icon))->draw(x,y,w,h,ic,active);
  }
  FL_EXPORT_C(void,Fl_File_Icon_label)(fl_File_Icon file_icon,fl_Widget w){
    (static_cast<Fl_File_Icon*>(file_icon))->label((static_cast<Fl_Widget*>(w)));
  }
  FL_EXPORT_C(void,Fl_File_Icon_load)(fl_File_Icon file_icon,const char* f){
    (static_cast<Fl_File_Icon*>(file_icon))->load(f);
  }
  FL_EXPORT_C(int,Fl_File_Icon_load_fti)(fl_File_Icon file_icon,const char* fti){
    return (static_cast<Fl_File_Icon*>(file_icon))->load_fti(fti);
  }
  FL_EXPORT_C(int,Fl_File_Icon_load_image)(fl_File_Icon file_icon,const char* i){
    return (static_cast<Fl_File_Icon*>(file_icon))->load_image(i);
  }
  FL_EXPORT_C(fl_File_Icon,Fl_File_Icon_next)(fl_File_Icon file_icon){
    return (fl_File_Icon)(static_cast<Fl_File_Icon*>(file_icon))->next();
  }
  FL_EXPORT_C(const char*,Fl_File_Icon_pattern)(fl_File_Icon file_icon){
    return (static_cast<Fl_File_Icon*>(file_icon))->pattern();
  }
  FL_EXPORT_C(int,Fl_File_Icon_size)(fl_File_Icon file_icon){
    return (static_cast<Fl_File_Icon*>(file_icon))->size();
  }
  FL_EXPORT_C(int,Fl_File_Icon_type)(fl_File_Icon file_icon){
    return (static_cast<Fl_File_Icon*>(file_icon))->type();
  }
  FL_EXPORT_C(short*,Fl_File_Icon_value)(fl_File_Icon file_icon){
    return (static_cast<Fl_File_Icon*>(file_icon))->value();
  }
  FL_EXPORT_C(void,Fl_File_Icon_labeltype)(fl_Label o,int x,int y,int w,int h,Fl_Align a){
    Fl_File_Icon::labeltype((static_cast<Fl_Label*>(o)),x,y,w,h,a);
  }
  FL_EXPORT_C(fl_File_Icon,Fl_File_Icon_find)(const char* filename,int filetype){
    return (fl_File_Icon)Fl_File_Icon::find(filename);
  }
  FL_EXPORT_C(fl_File_Icon,Fl_File_Icon_find_with_filetype)(const char* filename,int filetype){
    return (fl_File_Icon)Fl_File_Icon::find(filename, filetype);
  }
  FL_EXPORT_C(fl_File_Icon,Fl_File_Icon_first)( ){
    return (fl_File_Icon)Fl_File_Icon::first();
  }
  FL_EXPORT_C(void,Fl_File_Icon_load_system_icons)( ){
    Fl_File_Icon::load_system_icons();
  }
#ifdef __cplusplus
}
#endif
