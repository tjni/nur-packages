final: prev: {
  caddy = let
    rev = "3ab648382d403cdfe5c0c7218fafe2b4197ccfd7";
    version = "2.5.0-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "caddyserver";
      repo = "caddy";
      inherit rev;
      sha256 = "sha256-qY/kveKZz9I18cIaZA9NcjEdETYXYPLurFNNOrst2Dk=";
    };

    overriddenBuildGoModule = args:
      prev.buildGo118Module (args
        // {
          inherit version src;
          vendorSha256 = "sha256-xu3klc9yb4Ws8fvXRV286IDhi/zQVN1PKCiFKb8VJBo=";
        });
  in
    prev.caddy.override {
      buildGoModule = overriddenBuildGoModule;
    };
}
