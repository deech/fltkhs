Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library] [1].

NOTE: As of version 0.5.0.1 only FLTK 1.3.4-1 is supported. Old code written against FLTK 1.3.3 will still work, 1.3.4 does not remove any functionality.

NOTE: As of version 0.4.0.0, due to the introduction of closed type families, only GHC >= 7.8.1 is supported.

Quick Install
-------------
### Linux and *BSD
Install FLTK-1.3.4-1 from source:

```
   > wget http://fltk.org/pub/fltk/1.3.4/fltk-1.3.4-1-source.tar.gz
   > tar -zxvf fltk-1.3.4-1-source.tar.gz
   > cd fltk-1.3.4-1
   > ./configure --enable-shared --enable-gl
   > make
   > sudo make install
   > fltk-config --version
   1.3.4-1
```

Build the FLTKHS skeleton project:

```
   > git clone http://github.com/deech/fltkhs-hello-world
   > cd fltkhs-hello-world
   > stack install
   # About 6-8 minutes passes ...
   > stack exec fltkhs-hello-world
```

### OSX Yosemite only

Install FLTK-1.3.4-1 from Brew:

```
   > brew install autoconf
   > brew install fltk
   > fltk-config --version
   1.3.4-1
```
Build the FLTKHS skeleton project:

```
   > git clone http://github.com/deech/fltkhs-hello-world
   > cd fltkhs-hello-world
   > stack install
   # About 6-8 minutes passes ...
   > stack exec fltkhs-hello-world
```

### OSX El Capitan only

Install the development version of FLTK from Brew:

```
  > brew install --devel fltk
  > fltk-config --version
  1.3.4
```
Build the FLTKHS skeleton project:

```
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
