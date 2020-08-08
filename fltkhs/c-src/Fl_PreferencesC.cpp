#include "Fl_PreferencesC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Root)( Root root, const char* vendor, const char* application ){
    Fl_Preferences* preferences = 0;
    if (root == USER) {
      preferences = new Fl_Preferences(Fl_Preferences::USER, vendor, application);
    }
    else {
      preferences = new Fl_Preferences(Fl_Preferences::SYSTEM, vendor, application);
    }
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Path)( const char* path, const char *vendor, const char *application ){
    Fl_Preferences* preferences = new Fl_Preferences(path, vendor, application);
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent_Group)( fl_Preferences parent, const char *group ){
    Fl_Preferences* preferences = new Fl_Preferences((static_cast<Fl_Preferences*>(parent)),group);
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent_GroupIndex)( fl_Preferences parent, int groupIndex){
    Fl_Preferences* preferences = new Fl_Preferences(*(static_cast<Fl_Preferences*>(parent)),groupIndex);
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent)( fl_Preferences parent){
    Fl_Preferences* preferences = new Fl_Preferences((static_cast<Fl_Preferences*>(parent)));
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Id)(ID id){
    Fl_Preferences* preferences = new Fl_Preferences(id);
    return (fl_Preferences) preferences;
  }
  FL_EXPORT_C(void,Fl_Preferences_Destroy)(fl_Preferences preferences){
    delete (static_cast<Fl_Preferences*>(preferences));
  }
  FL_EXPORT_C(const char*,Fl_newUUID)(){
    return Fl_Preferences::newUUID();
  }
  FL_EXPORT_C(ID,Fl_Preferences_id)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->id();
  }
  FL_EXPORT_C(char,Fl_Preferences_remove)(fl_Preferences preferences,ID id_){
    return (static_cast<Fl_Preferences*>(preferences))->remove(id_);
  }
  FL_EXPORT_C(const char*,Fl_Preferences_name)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->name();
  }
  FL_EXPORT_C(const char*,Fl_Preferences_path)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->path();
  }
  FL_EXPORT_C(int,Fl_Preferences_groups)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->groups();
  }
  FL_EXPORT_C(const char*,Fl_Preferences_group)(fl_Preferences preferences,int num_group){
    return (static_cast<Fl_Preferences*>(preferences))->group(num_group);
  }
  FL_EXPORT_C(char,Fl_Preferences_groupExists)(fl_Preferences preferences,const char* key){
    return (static_cast<Fl_Preferences*>(preferences))->groupExists(key);
  }
  FL_EXPORT_C(char,Fl_Preferences_deleteGroup)(fl_Preferences preferences,const char* group){
    return (static_cast<Fl_Preferences*>(preferences))->deleteGroup(group);
  }
  FL_EXPORT_C(char,Fl_Preferences_deleteAllGroups)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->deleteAllGroups();
  }
  FL_EXPORT_C(int,Fl_Preferences_entries)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->entries();
  }
  FL_EXPORT_C(const char*,Fl_Preferences_entry)(fl_Preferences preferences,int index){
    return (static_cast<Fl_Preferences*>(preferences))->entry(index);
  }
  FL_EXPORT_C(char,Fl_Preferences_entryExists)(fl_Preferences preferences,const char* key){
    return (static_cast<Fl_Preferences*>(preferences))->entryExists(key);
  }
  FL_EXPORT_C(char,Fl_Preferences_deleteEntry)(fl_Preferences preferences,const char* entry){
    return (static_cast<Fl_Preferences*>(preferences))->deleteEntry(entry);
  }
  FL_EXPORT_C(char,Fl_Preferences_deleteAllEntries)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->deleteAllEntries();
  }
  FL_EXPORT_C(char,Fl_Preferences_clear)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->clear();
  }
  FL_EXPORT_C(char,Fl_Preferences_set_int)(fl_Preferences preferences,const char* entry, int value){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_float)(fl_Preferences preferences,const char* entry,float value){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_float_with_precision)(fl_Preferences preferences,const char* entry,float value,int precision){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value,precision);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_double)(fl_Preferences preferences,const char* entry,double value){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_double_with_precision)(fl_Preferences preferences,const char* entry,double value,int precision){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value,precision);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_char)(fl_Preferences preferences,const char* entry,char value){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_char_with_size)(fl_Preferences preferences,const char* entry,const char* value,int size){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value,size);
  }
  FL_EXPORT_C(char,Fl_Preferences_set_void)(fl_Preferences preferences,const char* entry,const void* value,int size){
    return (static_cast<Fl_Preferences*>(preferences))->set(entry,value,size);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_int)(fl_Preferences preferences,const char* entry,int *value,int defaultValue){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,*value,defaultValue);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_float)(fl_Preferences preferences,const char* entry,float *value,float defaultValue){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,*value,defaultValue);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_double)(fl_Preferences preferences,const char* entry,double *value,double defaultValue){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,*value,defaultValue);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_char)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_char_with_maxSize)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue,int maxSize){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue,maxSize);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_char_with_defaultSize)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue,int defaultSize){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue,defaultSize);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_void)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue,int defaultSize){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue,defaultSize);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_void_with_defaultSize_maxSize)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue,int defaultSize,int maxSize){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue,defaultSize,maxSize);
  }
  FL_EXPORT_C(char,Fl_Preferences_get_void_with_defaultSize)(fl_Preferences preferences,const char* entry,char* value,const char* defaultValue,int defaultSize){
    return (static_cast<Fl_Preferences*>(preferences))->get(entry,value,defaultValue,defaultSize);
  }
  FL_EXPORT_C(int,Fl_Preferences_size)(fl_Preferences preferences,const char* entry){
    return (static_cast<Fl_Preferences*>(preferences))->size(entry);
  }
  FL_EXPORT_C(char,Fl_Preferences_getUserdataPath)(fl_Preferences preferences,char *path,int pathlen){
    return (static_cast<Fl_Preferences*>(preferences))->getUserdataPath(path,pathlen);
  }
  FL_EXPORT_C(void,Fl_Preferences_flush)(fl_Preferences preferences){
    return (static_cast<Fl_Preferences*>(preferences))->flush();
  }
#ifdef __cplusplus
}
#endif
