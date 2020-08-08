# fltkhs-fluid-demos

These are examples of building Haskell applications using the Fluid GUI builder to generate Haskell code.
The `src` directory contains a set of `.fl` files which can be opened with [Fluid][3], the GUI builder
tool that ships with FLTK. The rest are Haskell files which contain the callbacks and drivers. [FLTKHS][1]
ships with `fltkhs-fluidtohs`, a utility which translates the `.fl` files into Haskell.
`Setup.hs` knows about the utility and automatically uses it to pre-process any `.fl` files into Haskell.
This means installation (see below) is as simple as running `stack install` or `cabal install`.

Most of the demos are faithful ports of those shipped with FLTK so the user may compare them
and learn how Fluid can be used to generate Haskell. More comprehensive documentation is
planned, but until then hopefully side-by-side comparison is a good stopgap.

## Installation

[FLTKHS] [1] now bundles the [FLTK] [5] source so all you need to do is:

```
> git clone http://github.com/deech/fltkhs-fluid-demos
> stack install --flag fltkhs:bundled
> stack exec fltkhs-fluid-tree
```

  [1]: http://hackage.haskell.org/package/fltkhs/
  [2]: http://hackage.haskell.org/package/fltkhs-fluid-demos
  [3]: https://en.wikipedia.org/wiki/FLUID
  [4]: https://github.com/deech/fltkhs#quick-install
  [5]: http://fltk.org
