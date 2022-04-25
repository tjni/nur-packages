final: prev: {
  pueue = let
    rev = "84c3efd85e384884cc673d5bf9425208470a531e";
    pname = "pueue";
    version = "2.0.2-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "tjni";
      repo = pname;
      inherit rev;
      sha256 = "sha256-f3Kb91v1uvgjI82BSerRxkBqivBmBPKxoKYbPyl88hY=";
    };

    overriddenRustPlatform =
      prev.rustPlatform
      // {
        buildRustPackage = args:
          prev.rustPlatform.buildRustPackage (args
            // {
              inherit pname version src;
              cargoSha256 = "sha256-b5jGTu55mDw2I7ut8doD7F6iM4R8K7X9l8/vUxZ30sc=";
            });
      };
  in
    prev.pueue.override {
      rustPlatform = overriddenRustPlatform;
    };
}
