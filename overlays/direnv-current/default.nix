final: prev: {
  direnv = let
    rev = "c45e866d13f0161797248570493a9e70d7b278b9";
    version = "2.32.1-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "direnv";
      repo = "direnv";
      inherit rev;
      sha256 = "hiADPLDb32S70ei/h0uhCGl1Lbkb8flNJ2H+te775sM=";
    };

    overriddenBuildGoModule = args:
      prev.buildGo118Module (args
        // {
          inherit version src;
          vendorSha256 = "u/LukIOYRudFYOrrlZTMtDAlM3+WjoSBiueR7aySSVU=";
        });
  in
    prev.direnv.override {
      buildGoModule = overriddenBuildGoModule;
    };
}
