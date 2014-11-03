#ifndef __FL_PREFERENCES_C__
#define __FL_PREFERENCES_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Preferences.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  typedef enum {
    SYSTEM=0,
    USER
  } Root;
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Root)( Root root, const char *vendor, const char *application );
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Path)( const char* path, const char *vendor, const char *application );
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent_Group)( fl_Preferences parent, const char *group );
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent_GroupIndex)( fl_Preferences parent, int groupIndex);
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Parent)( fl_Preferences parent);
  FL_EXPORT_C(const char*, Fl_newUUID)();
  FL_EXPORT_C(fl_Preferences, Fl_Preferences_With_Id)(ID id);
  FL_EXPORT_C(void,Fl_Preferences_Destroy)(fl_Preferences preferences);
  FL_EXPORT_C(ID, Fl_Preferences_id)(fl_Preferences preferences);
  FL_EXPORT_C(char, Fl_Preferences_remove)(fl_Preferences preferences, ID id_);
  FL_EXPORT_C(const char*, Fl_Preferences_name)(fl_Preferences preferences);
  FL_EXPORT_C(const char*, Fl_Preferences_path)(fl_Preferences preferences);
  FL_EXPORT_C(int, Fl_Preferences_groups)(fl_Preferences preferences);
  FL_EXPORT_C(const char*, Fl_Preferences_group)(fl_Preferences preferences,  int num_group );
  FL_EXPORT_C(char, Fl_Preferences_groupExists)(fl_Preferences preferences,  const char *key );
  FL_EXPORT_C(char, Fl_Preferences_deleteGroup)(fl_Preferences preferences,  const char *group );
  FL_EXPORT_C(char, Fl_Preferences_deleteAllGroups)(fl_Preferences preferences);
  FL_EXPORT_C(int, Fl_Preferences_entries)(fl_Preferences preferences);
  FL_EXPORT_C(const char*, Fl_Preferences_entry)(fl_Preferences preferences,  int index );
  FL_EXPORT_C(char, Fl_Preferences_entryExists)(fl_Preferences preferences,  const char *key );
  FL_EXPORT_C(char, Fl_Preferences_deleteEntry)(fl_Preferences preferences,  const char *entry );
  FL_EXPORT_C(char, Fl_Preferences_deleteAllEntries)(fl_Preferences preferences);
  FL_EXPORT_C(char, Fl_Preferences_clear)(fl_Preferences preferences);
  FL_EXPORT_C(char, Fl_Preferences_set_int)(fl_Preferences preferences, const char* entry, int value);
  FL_EXPORT_C(char, Fl_Preferences_set_float)(fl_Preferences preferences, const char* entry, float value);
  FL_EXPORT_C(char, Fl_Preferences_set_float_with_precision)(fl_Preferences preferences, const char* entry, float value, int precision);
  FL_EXPORT_C(char, Fl_Preferences_set_double)(fl_Preferences preferences, const char* entry, double value);
  FL_EXPORT_C(char, Fl_Preferences_set_double_with_precision)(fl_Preferences preferences, const char* entry, double value, int precision);
  FL_EXPORT_C(char, Fl_Preferences_set_char)(fl_Preferences preferences, const char* entry, char value);
  FL_EXPORT_C(char, Fl_Preferences_set_char_with_size)(fl_Preferences preferences, const char* entry, const char* value, int size);
  FL_EXPORT_C(char, Fl_Preferences_set_void)(fl_Preferences preferences, const char* entry, const void* value, int size);
  FL_EXPORT_C(char, Fl_Preferences_get_int)(fl_Preferences preferences, const char* entry, int *value, int defaultValue);
  FL_EXPORT_C(char, Fl_Preferences_get_float)(fl_Preferences preferences, const char* entry, float *value, float defaultValue);
  FL_EXPORT_C(char, Fl_Preferences_get_double)(fl_Preferences preferences, const char* entry, double *value, double defaultValue);
  FL_EXPORT_C(char, Fl_Preferences_get_char)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue);
  FL_EXPORT_C(char, Fl_Preferences_get_char_with_maxSize)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue, int maxSize);
  FL_EXPORT_C(char, Fl_Preferences_get_char_with_defaultSize)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue, int defaultSize);
  FL_EXPORT_C(char, Fl_Preferences_get_void)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue, int defaultSize);
  FL_EXPORT_C(char, Fl_Preferences_get_void_with_defaultSize_maxSize)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue, int defaultSize, int maxSize);
  FL_EXPORT_C(char, Fl_Preferences_get_void_with_defaultSize)(fl_Preferences preferences, const char* entry, char* value, const char* defaultValue, int defaultSize);
  FL_EXPORT_C(int, Fl_Preferences_size)(fl_Preferences preferences,const char *entry );
  FL_EXPORT_C(char, Fl_Preferences_getUserdataPath)(fl_Preferences preferences, char *path, int pathlen );
  FL_EXPORT_C(void, Fl_Preferences_flush)(fl_Preferences preferences);
#ifdef __cplusplus
}
#endif
#endif /*__FL_PREFERENCES_C__*/
