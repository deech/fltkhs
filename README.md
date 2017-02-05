Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

NOTE: As of version 0.5.0.1 only FLTK 1.3.4-1 is supported. Old code written against FLTK 1.3.3 will still work, 1.3.4 does not remove any functionality.

NOTE: As of version 0.4.0.0, due to the introduction of closed type families, only GHC >= 7.8.1 is supported.

Quick Install
-------------
### Linux, *BSD and OSX
Installing FLTK from source (vs. package mangers) is recommended. Package managers sometimes put headers and libraries in unexpected places
causing `fltkhs` compilation failures. On OSX the `brew` package for the current stable version of FLTK is broken. Furthermore some Linux distributions
only ship the shared libraries which means that executables are less portable. Compiling from source is pretty quick and painless and fixes these problems.

Install FLTK-1.3.4-1 from source:

```
  > wget http://fltk.org/pub/fltk/1.3.4/fltk-1.3.4-1-source.tar.gz
  > tar -zxf fltk-1.3.4-1-source.tar.gz
  > cd fltk-1.3.4-1
  > ./configure --enable-gl --enable-shared --enable-localjpeg --enable-localzlib --enable-localpng
  > make
  > sudo make install
  > fltk-config --version
  1.3.4-1
```

Build the FLTKHS skeleton project:

```
  > brew install autoconf # Only on OSX
  > git clone http://github.com/deech/fltkhs-hello-world
  > cd fltkhs-hello-world
  > stack install
  # About 6-8 minutes passes ...
  > stack exec fltkhs-hello-world
```

### Windows

Please see the [detailed Windows installation instructions](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:7)

Screenshots
-----------

[Drawing with FLTKHS](images/arc-windows.png)

[A table of widgets](images/widget-table-windows.png)

[A complex tree](images/tree-complex-windows.png) Done completely using Fluid. Notice how tree nodes can be arbitrary widgets.

Demos
-----
A number of demos are also available in the [fltkhs-demos] [4] and the [fltkhs-fluid-demos] [5] packages.

  [1]: http://www.fltk.org/index.php      "FLTK"
  [2]: http://www.fltk.org/software.php
  [3]: http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html
  [4]: http://github.com/deech/fltkhs-demos
  [5]: http://github.com/deech/fltkhs-fluid-demos
