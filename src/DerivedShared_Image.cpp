#include "DerivedShared_Image.h"
fl_Shared_Handler* DerivedShared_Image::fl_handlers_ = 0;
int                DerivedShared_Image::fl_num_handlers_ = 0;
int                DerivedShared_Image::fl_alloc_handlers_ = 0;
// a total copy, needed because fl_Shared_Handler is different
void DerivedShared_Image::add_handler(fl_Shared_Handler f){
  int			i;		// Looping var...
  fl_Shared_Handler	*temp;		// New image handler array...

  // First see if we have already added the handler...
  for (i = 0; i < fl_num_handlers_; i ++) {
    if (fl_handlers_[i] == f) return;
  }
  if (fl_num_handlers_ >= fl_alloc_handlers_) {
    // Allocate more memory...
    temp = new fl_Shared_Handler [fl_alloc_handlers_ + 32];

    if (alloc_handlers_) {
      memcpy(temp, fl_handlers_, fl_alloc_handlers_ * sizeof(fl_Shared_Handler));

      delete[] fl_handlers_;
    }

    fl_handlers_       = temp;
    fl_alloc_handlers_ += 32;
  }

  fl_handlers_[fl_num_handlers_] = f;
  fl_num_handlers_ ++;
}
void DerivedShared_Image::reload(){
  int		i;
  FILE		*fp;
  uchar		header[64];
  Fl_Image	*img;

  if (!name_) return;

  if ((fp = fl_fopen(name_, "rb")) != NULL) {
    if (fread(header, 1, sizeof(header), fp)==0) { /* ignore */ }
    fclose(fp);
  } else {
    return;
  }

  if (memcmp(header, "#define", 7) == 0) // XBM file
    img = new Fl_XBM_Image(name_);
  else if (memcmp(header, "/* XPM */", 9) == 0) // XPM file
    img = new Fl_XPM_Image(name_);
  else {
    for (i = 0, img = 0; i < num_handlers_; i ++) {
      // The only difference is the cast
      img = (static_cast<Fl_Image*>((fl_handlers_[i])(name_, header, sizeof(header))));

      if (img) break;
    }
  }

  if (img) {
    if (alloc_image_) delete image_;

    alloc_image_ = 1;

    if ((img->w() != w() && w()) || (img->h() != h() && h())) {
      Fl_Image *temp = img->copy(w(), h());
      delete img;
      image_ = temp;
    } else {
      image_ = img;
    }

    update();
  }
};
void DerivedShared_Image::remove_handler(fl_Shared_Handler f){
  int	i;				// Looping var...
  // First see if the handler has been added...
  for (i = 0; i < fl_num_handlers_; i ++) {
    if (fl_handlers_[i] == f) break;
  }

  if (i >= fl_num_handlers_) return;

  // OK, remove the handler from the array...
  fl_num_handlers_ --;

  if (i < fl_num_handlers_) {
    // Shift later handlers down 1...
    memmove(fl_handlers_ + i, fl_handlers_ + i + 1,
           (fl_num_handlers_ - i) * sizeof(fl_Shared_Handler ));
  }
}
