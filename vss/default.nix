{ stdenv
, fetchgit
, gnat
, gprbuild
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "vss-text";
  version = "26.0.0-20251218";
  
  src = fetchGit {
    url = "https://github.com/AdaCore/vss-text.git";
    ref = "main";
    rev = "652cc8bb555c8f9e1636e32006f827a01e2a9ff1";
  };
  
  nativeBuildInputs = [
    gprbuild
    gnat
    pkg-config
  ];

  buildPhase = ''
    runHook preBuild
    make PREFIX=$out BUILD_MODE=prod
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    make PREFIX=$out BUILD_MODE=prod install
    runHook postInstall
  '';
}
