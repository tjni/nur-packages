final: prev: {
  direnv = let
    rev = "9bfde47bebbe14576bda4ad3360c02ca94966870";
    version = "2.31.0-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "direnv";
      repo = "direnv";
      inherit rev;
      sha256 = "sha256-cBArWuwiCP+ciffyo2/2q0gIiEJqVWr+tcqU9h0XJCg=";
    };

    overriddenBuildGoModule = args:
      prev.buildGo118Module (args
        // {
          inherit version src;
          vendorSha256 = "sha256-r42UhmhoZmtAweBz/GLthcciBrOsDQODWrOrolzuZV0=";
        });
  in
    prev.direnv.override {
      buildGoModule = overriddenBuildGoModule;
    };
}
