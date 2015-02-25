#ifdef __cplusplus
#include "Fl_Native_File_ChooserC.h"
EXPORT {
#endif
  FL_EXPORT_C(fl_Native_File_Chooser,Fl_Native_File_Chooser_New_WithVal)(int val){
    Fl_Native_File_Chooser* c = new Fl_Native_File_Chooser(val);
    return (fl_Native_File_Chooser) c;
  }
  FL_EXPORT_C(fl_Native_File_Chooser,Fl_Native_File_Chooser_New)( ){
    Fl_Native_File_Chooser* c = new Fl_Native_File_Chooser();
    return (fl_Native_File_Chooser) c;
  }
  FL_EXPORT_C(void, Fl_Native_File_Chooser_Destroy)(fl_Native_File_Chooser chooser){
    delete (static_cast<Fl_Native_File_Chooser*>(chooser));
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_type)(fl_Native_File_Chooser chooser,int type){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->type(type);
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_type)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->type();
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_options)(fl_Native_File_Chooser chooser,int options){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->options(options);
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_options)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->options();
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_count)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->count();
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_filename)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->filename();
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_filename_with_i)(fl_Native_File_Chooser chooser,int i){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->filename(i);
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_directory)(fl_Native_File_Chooser chooser,const char *val){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->directory(val);
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_directory)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->directory();
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_title)(fl_Native_File_Chooser chooser,const char * title){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->title(title);
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_title)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->title();
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_filter)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->filter();
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_filter)(fl_Native_File_Chooser chooser,const char * filter){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->filter(filter);
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_filters)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->filters();
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_filter_value)(fl_Native_File_Chooser chooser,int i){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->filter_value(i);
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_filter_value)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->filter_value();
  }
  FL_EXPORT_C(void,Fl_Native_File_Chooser_set_preset_file)(fl_Native_File_Chooser chooser,const char* preset_file){
    (static_cast<Fl_Native_File_Chooser*>(chooser))->preset_file(preset_file);
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_preset_file)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->preset_file();
  }
  FL_EXPORT_C(const char*,Fl_Native_File_Chooser_errmsg)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->errmsg();
  }
  FL_EXPORT_C(int,Fl_Native_File_Chooser_show)(fl_Native_File_Chooser chooser){
    return (static_cast<Fl_Native_File_Chooser*>(chooser))->show();
  }
#ifdef __cplusplus
}
#endif
