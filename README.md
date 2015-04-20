Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

Abbreviated installation instructions are for Linux and Mac are:

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

The rest of the documentation (including installation instructions for Windows and API usage) is located in the [FLTKHS module] [3]. This is the primary module that needs to beimported by every Fltkhs app and the entry point into the application.


  [1]: http://www.fltk.org/index.php      "FLTK"
  [2]: http://www.fltk.org/software.php
  [3]: http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html
