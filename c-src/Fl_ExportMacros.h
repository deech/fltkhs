#ifndef __FL_EXPORT_H
#define __FL_EXPORT_H

#ifdef EXPORT
#undef EXPORT
#endif
#define EXPORT extern "C"

#ifdef __WATCOMC__
  #include <windows.h>
  #define FL_EXPORT_C(TYPE,FUNC_NAME) extern TYPE __export __cdecl FUNC_NAME
#else
  #ifdef _WIN32
    #define FL_EXPORT_C(TYPE,FUNC_NAME) extern __declspec(dllexport) TYPE __cdecl FUNC_NAME
  #else
    #define FL_EXPORT_C(TYPE,FUNC_NAME) extern TYPE FUNC_NAME
  #endif
  #ifndef _cdecl
    #define _cdecl
  #endif
#endif
#endif /* #ifndef __FL_EXPORT_H */
