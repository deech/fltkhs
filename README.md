FltkHs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

It also comes with the requisite C-wrappers around FLTK. These wrappers will be published as independent library but for now they are bundled because the API is not yet suitable for C programmers.

The `c-src` directory contains the C-wrappers around the FLTK widgets and functions.

The `c-examples` directory contains C ports of some of the examples provided with the FLTK distribution.

The `src` directory contains the Haskell bindings.

The Haskell demo examples are in `src/Examples`.

Building
________

First download and install FLTK. On OSX and Linux it should build using the standard:

    > ./configure
    > make
    > make install

Once FLTK is installed the standard Cabal install command `cabal build` from the top-level directory should build everything including the C/C++ wrappers.

  [1]: http://www.fltk.org/index.php      "FLTK"
