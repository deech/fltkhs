{ mkDerivation, stdenv
, autoconf  # , fltk-config from fltk
, fltk, libjpeg, mesa
, c2hs
, base, bytestring, Cabal, directory, filepath, mtl, parsec, text
, bundled ? false  # same default as the .cabal
, opengl ? false   # same default as the .cabal
}:

/*e.g.

`$ nix-shell --arg opengl true
[nix-shell]$ cabal configure  # see `fltkhsFlags` 
[nix-shell]$ cabal build
[nix-shell]$ cabal run fltkhs-buttons 

*/

# bundled
# Use the bundled FLTK library.

# opengl
# Enable OpenGL support.

let fltkhsFlags = builtins.concatLists
 [ (if bundled 
    then [ "-fbundled" ] 
    else [ "-f-bundled" ]) 
   (if opengl
    then [ "-fopengl" ] 
    else [ "-f-opengl" ])
 ];

in

mkDerivation {
  pname = "fltkhs";
  version = "0.5.4.3";
  homepage = "http://github.com/deech/fltkhs";
  description = "FLTK bindings";
  license = stdenv.lib.licenses.mit;
  src = ./.;
  isLibrary = true;
  isExecutable = true;

  configureFlags = fltkhsFlags;

  setupHaskellDepends      = [ base Cabal directory filepath ]; 
   # `custom-setup`
  libraryToolDepends       = [ autoconf c2hs ]
                          ++ (if bundled then [ fltk ] else []);
                               /* for fltk-config */
   # `build-tools:` 

  libraryHaskellDepends    = [ base bytestring text ];
  librarySystemDepends     = [ fltk libjpeg ] 
                          ++ (if opengl then [ mesa ] else []);
   # `extra-libraries:` 

  executableHaskellDepends = [ base directory filepath mtl parsec ];
  executableSystemDepends  = [ fltk libjpeg ] 
                          ++ (if opengl then [ mesa ] else [] );
   # `extra-libraries:`

  # testHaskellDepends       = [ ];
 
  # nativeBuildInputs = [ autoconf ]; # ???
}
