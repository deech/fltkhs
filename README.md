Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

It also comes with the requisite C-wrappers around FLTK. These wrappers will be published as independent library but for now they are bundled because the API is not yet suitable for C programmers.

The `c-src` directory contains the C-wrappers around the FLTK widgets and functions.

The `c-examples` directory contains C ports of some of the examples provided with the FLTK distribution.

The `src` directory contains the Haskell bindings.

The Haskell demo examples are in `src/Examples`.

Building
________

First make sure you have OpenGL and then download and install [FLTK 1.3.3] [2]. On OSX and Linux it should build and install smoothly using the standard:

    > ./configure
    > make
    > make install

If you didn't install FLTK from source you'll need `make`, `autoconf`, and `autoheader` to build the Haskell bindings.

Only on Linux and OSX, once FLTK is installed the standard Cabal build command `cabal build` from the top-level directory should build everything including the C/C++ wrappers and Haskell demos.

The available demos are listed in `fltkhs.cabal` as separate `Executable` components. Once it is done building, `dist/build/<demo-name>/<demo-name>` should run any of them. For example to run the `buttons` demo, from the top-level directory do:

    > dist/build/buttons/buttons

The effort to have the library and demos build/install seamlessly on Windows is on-going.

While most of the bindings are complete, the following still needs to be done:

- the rest of the bindings
- More Haskell demos
- Documentation
- make the library portable across Windows/Linux/OSX.

Once the work is complete this README will include more extensive instructions.

  [1]: http://www.fltk.org/index.php      "FLTK"
  [2]: http://www.fltk.org/software.php?VERSION=1.3.3&FILE=fltk/1.3.3/fltk-1.3.3-source.tar.gz
