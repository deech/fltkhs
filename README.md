Fltkhs - A Haskell Binding to the FLTK GUI Library
=============================================

Fltkhs aims to be a complete Haskell binding to the [FLTK GUI library][1]. The [main documentation][3]  has more detail on motivation and what this library hopes to achieve.

Quick Install
-------------
### Linux, *BSD and OSX
The fastest and easiest way of installing FLTKHS is to use the bundled FLTK library.

```
  > brew install autoconf # Only on OSX
  > git clone http://github.com/deech/fltkhs-hello-world
  > cd fltkhs-hello-world
  > stack install --flag fltkhs:bundled
  # About 6-8 minutes passes ...
  > stack exec fltkhs-hello-world
```

And that's it!

On [Windows](http://hackage.haskell.org/package/fltkhs-0.5.1.6/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:8) it is only slightly more complicated because packages like `autotools` and `tar` are not available by default.

The second fastest way is to compile FLTK from source yourself. For instructions please see the documentation for [Linux](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:10), [OSX](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:11), [Windows](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:12).

### Windows

Please see the [detailed Windows installation instructions](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-FLTKHS.html#g:8)

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
