#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_ButtonC.h>
#include <Fl_PixmapC.h>

/* XPM */
char * gradient_xpm[] = {
"135 20 26 1",
"a 	c #e0e0e0", "b 	c #dcdcdc", "c 	c #d8d8d8", "d 	c #d4d4d4", "e 	c #d2d2d2",
"f 	c #d0d0d0", "g 	c #cccccc", "h 	c #c8c8c8", "i 	c #c4c4c4", "j 	c #c2c2c2",
"k 	c #c0c0c0", "l 	c #bcbcbc", "m 	c #b8b8b8", "n 	c #b4b4b4", "o 	c #b2b2b2",
"p 	c #b0b0b0", "q 	c #acacac", "r 	c #a8a8a8", "s 	c #a4a4a4", "t 	c #a2a2a2",
"u 	c #a0a0a0", "v 	c #9c9c9c", "w 	c #989898", "x 	c #949494", "y 	c #929292",
"z 	c #909090",
"aaaaaaaaabbbbbbbbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrssss",
"aaaaaabbbbbbbbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssst",
"aaabbbbbbbbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssstt",
"bbbbbbbbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrssssssssstttt",
"bbbbbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttu",
"bbcccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuu",
"ccccccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuu",
"cccddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvv",
"ddddddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvv",
"dddeeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvw",
"eeeeeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwww",
"eeefffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwww",
"fffffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxx",
"ffffgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxx",
"fgggggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyy",
"gggggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyyyyy",
"ggghhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyyyyyyyy",
"hhhhhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyyyyyyyyzzz",
"hhhhiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyyyyyyyyzzzzzz",
"hiiiiiiijjjjjjjkkkkkkkklllllllmmmmmmmnnnnnnnnnoooooooppppppppqqqqqqrrrrrrrsssssssssttttttuuuuuuuuvvvvvvvwwwwwwwwxxxxxxyyyyyyyyzzzzzzzzz"};

int main(int argc,char** argv){
  fl_Pixmap gradient = (fl_Pixmap)Fl_Pixmap_New(gradient_xpm);
  fl_Window win = (fl_Window)Fl_Window_New_WithLabel(160,75,"test");
  fl_Button but1 = (fl_Button)Fl_Button_New_WithLabel(10,10,140,25,"Button 1");
  Fl_Button_set_image(but1,gradient);
  Fl_Button_set_align(but1,FL_ALIGN_IMAGE_BACKDROP|Fl_Button_align(but1));
  fl_Button but2 = (fl_Button)Fl_Button_New_WithLabel(10,40,140,25,"Button 2");
  Fl_Button_set_image(but2,gradient);
  Fl_Button_set_align(but2,FL_ALIGN_IMAGE_BACKDROP|Fl_Button_align(but2));
  Fl_Window_end(win);
  Fl_Window_show_with_args(win,argc,argv);
  return Fl_run();
}
