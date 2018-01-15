{ mkDerivation, stdenv

, autoconf, c2hs

, fltk, libjpeg, mesa

, base, bytestring, Cabal, directory, filepath, mtl, OpenGLRaw, parsec, text

, cabalFlags ? {}

}:

/*
This file is written manually, not generated automatically, because
cabal2nix doesn't provision correctly for this package's complex custom setup.
*/

let 

 # "import" utilities
 inherit (stdenv.lib) mapAttrs attrValues concatStringsSep optionals;

 flags 
   =   { bundled = false; demos = true; opengl = false; }  # same names/defaults as the cabal flags
    // cabalFlags;                                         # override defaults with any extra flags
  # NOTE `bundled` is currently ignored.

 nixSet2cabalInstallOptions = inputFlags:
   let outputFlags = 
        (attrValues                                          # e.g. [ "-f-bundled" "-fdemos" "-f-opengl" ]
          (mapAttrs (k: v: (if v then "-f" else "-f-") + k)  # e.g. { bundled = "-f-bundled"; demos = "-fdemos"; opengl = "-f-opengl"; }
            inputFlags));                                    # e.g. { bundled = false; demos = true; opengl = false; }
 
   in outputFlags;

in

mkDerivation {
  pname = "fltkhs";
  version = "0.5.4.3";

  homepage = "http://github.com/deech/fltkhs";
  description = "FLTK bindings";
  license = stdenv.lib.licenses.mit;

  src = ./.;
  isLibrary    = true;
  isExecutable = true;

  # including .cabal `flag`s
  configureFlags      = nixSet2cabalInstallOptions flags;

  # `custom-setup`
  setupHaskellDepends = [ autoconf base c2hs Cabal directory filepath ];
    # ^ `setup-depends`

  # `library`
  libraryToolDepends    = [ autoconf c2hs fltk ];
    # ^ `build-tools:` 
    # fltk provides fltk-config 
  libraryHaskellDepends = [ base bytestring text ];
    # ^ `build-depends:` 
  librarySystemDepends  = [ 
    fltk libjpeg 
  ] ++ optionals flags.opengl [ 
    mesa 
  ];
    # ^ `extra-libraries:` 

  # all the `executable`s
  executableHaskellDepends = [
    base directory filepath mtl parsec text
  ] ++ optionals flags.opengl [
    OpenGLRaw 
  ];
    # ^ `build-depends:` 

}
