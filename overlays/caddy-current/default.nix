final: prev: {

  caddy = let
    rev = "a8bb4a665af358f61a7ac0eabac8df2110cb6a36";
    version = "2.5.0-rc.1-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "caddyserver";
      repo = "caddy";
      inherit rev;
      sha256 = "sha256-V9iIz/93n6EBJZ9v3MDKD6FivtplRFN9a/e0o7YX0/w=";
    };

    overriddenBuildGoModule = args: prev.buildGo118Module (args // {
      inherit version src;
      vendorSha256 = "sha256-xu3klc9yb4Ws8fvXRV286IDhi/zQVN1PKCiFKb8VJBo=";
    });
  in
    prev.caddy.override {
      buildGoModule = overriddenBuildGoModule;
    };
}
