#ifndef __DERIVEDSHARED_IMAGE__
#define __DERIVEDSHARED_IMAGE__
#include "FL/Fl.H"
#include "FL/Fl_Shared_Image.H"
#include "FL/Fl_XBM_Image.H"
#include "FL/Fl_XPM_Image.H"
#include "Fl_Types.h"
typedef void* (*fl_Shared_Handler)(const char *name, uchar *header,int headerlen);
class DerivedShared_Image : public Fl_Shared_Image {
  static fl_Shared_Handler* fl_handlers_;
  static int fl_num_handlers_;
  static int fl_alloc_handlers_;
 public:
  void reload();
  static void add_handler(fl_Shared_Handler h);
  static void remove_handler(fl_Shared_Handler h);
 DerivedShared_Image() : Fl_Shared_Image() {};
 DerivedShared_Image(const char *n, Fl_Image *img = 0) : Fl_Shared_Image(n, img) {};
};

#endif /* __DERIVEDSHARED_IMAGE__  */
