{
  lib,
  stdenv,
  fetchurl,
  undmg,
}: let
  pname = "Alfred";
  majorVersion = "4";
  minorVersion = "6";
  patchVersion = "4";
  buildVersion = "1294";
  appName = "${pname} ${majorVersion}";
in
  stdenv.mkDerivation rec {
    inherit pname;
    version = "${majorVersion}.${minorVersion}.${patchVersion}";

    src = fetchurl {
      url = "https://cachefly.alfredapp.com/${pname}_${version}_${buildVersion}.dmg";
      sha256 = "sha256-ys+cgGOIrlJjdpCi72mS1CCcCTAsSMXIYGsy1bg/Lq8=";
    };

    sourceRoot = "${appName}.app";

    nativeBuildInputs = [undmg];

    installPhase = ''
      mkdir -p "$out/Applications/${appName}.app"
      cp -R . "$out/Applications/${appName}.app"
      chmod a+x "$out/Applications/${appName}.app/Contents/MacOS/${pname}"
    '';

    meta = with lib; {
      description = "Productivity App for macOS";
      homepage = https://www.alfredapp.com/;
      license = {free = false;};
      platforms = platforms.darwin;
    };
  }
