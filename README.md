FltkHs - A Haskell Binding to the FLTK GUI Library
=============================================

FltkHs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

It also comes with the requisite C-wrappers around FLTK. These wrappers will be published as independent library but for now they are bundled because the API is not yet suitable for C programmers.

The ``c-src'' directory contains the C-wrappers around the FLTK widgets and functions.

The ``c-examples'' directory contains C ports of some of the examples provided with the FLTK distribution.

The ``src'' directory contains the Haskell bindings.

Building
________

The standard Cabal install command ``cabal install'' from the top-level directory should build and install all the is required including the C-wrappers.

The C and Haskell bindings are not installed seperately but linked into one big library ``fltkhs-<version-number>.a''.

This README will be more complete once the bindings are ready for release.

  [1]: http://www.fltk.org/index.php      "FLTK"
