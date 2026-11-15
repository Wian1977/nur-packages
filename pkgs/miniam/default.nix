{ lib, stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation rec {
  pname = "miniam";
  version = "0.1.0";

  src = fetchurl {
    url = "https://github.com/Wian1977/miniam/releases/download/v0.1.1/miniam-v0.1.1-linux-x86_64.tar.gz";
    sha256 = "a923813c2a9878639c4b03bff861490d5978ec1e9cc121d57721b351553a1204";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  dontConfigure = true;
  dontBuild = true;
  doCheck = false;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/share/doc/miniam
    install -m755 miniam $out/bin/miniam
    install -m644 README.md $out/share/doc/miniam/README.md
    runHook postInstall
  '';

  meta = with lib; {
    description = "Apple Music in the terminal with true-color cover art and a live spectrum";
    homepage = "https://github.com/Wian1977/miniam";
    platforms = [ "x86_64-linux" ];
    mainProgram = "miniam";
  };
}
