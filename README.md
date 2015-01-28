Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/deech/fltkhs?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

It also comes with the requisite C-wrappers around FLTK. These wrappers will be published as independent library but for now they are bundled because the API is not yet suitable for C programmers.

The `c-src` directory contains the C-wrappers around the FLTK widgets and functions.

The `c-examples` directory contains C ports of some of the examples provided with the FLTK distribution.

The `src` directory contains the Haskell bindings.

The Haskell demo examples are in `src/Examples`.

Building
________

Unfortunately this package does not currently install in Windows. The instructions below are only for OSX and Linux.

First make sure you have OpenGL and then download and install [FLTK 1.3.3] [2].

The recommended way to install FLTK on Linux is from source. The reason is that some package managers seem to put the headers and libraries in a non-standard locations. On OSX and Linux it should build and install smoothly using the standard:

    > ./configure
    > make
    > make install

If you are customizing your `configure` step it is important to at least enable OpenGL and Cairo like so:

    > ./configure --enable-gl --enable-cairo

If you didn't install FLTK from source you will need to ensure that the FLTK headers are in the include path and, along with the standard FLTK library, `fltk_gl`, and `fltk_cairo` are also in the library path. You will also need the `make`, `autoconf`, and `autoheader` tools to build the Haskell bindings.

Make sure `c2hs` is also installed with `cabal install c2hs`.

Then clone this repository:

    > git clone https://github.com/deech/fltkhs

Then, only on Linux and OSX, once FLTK is installed, the standard Cabal build command `cabal build` from the top-level directory should build everything including the C/C++ wrappers and Haskell demos.

NOTE: If are getting a flood of `undefined reference` errors please install FLTK from source as outlined above. It seems as though some package managers put the libraries and headers in non-standard places.

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
