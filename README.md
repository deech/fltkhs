Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

The rest of the documentation (including installation instructions and usage) is located in
src/Examples/Graphics/UI/LowLevel/FLTK/FLTKHS.hs. This is the primary module that needs to be
imported by every Fltkhs app and the entry point into the application.

This package does not yet install on Windows.

Abbreviated installation instructions are reproduced here:

- Download [FLTK 1.3.3] [2].
- Install with:
```
    > ./configure
    > make
    > make install
```

- Clone and install this repo:
```
    > git clone https://github.com/deech/fltkhs
    cabal install
```

- Test your installation by invoking: 'fltkhs-hello-world'.


  [1]: http://www.fltk.org/index.php      "FLTK"
  [2]: http://www.fltk.org/software.php
