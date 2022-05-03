final: prev: {
  caddy = let
    rev = "e84e19a04eefccc743f0d397efe49ff42626f4b3";
    version = "2.5.0-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "caddyserver";
      repo = "caddy";
      inherit rev;
      sha256 = "sha256-RtTyD+F9lTyFgfNn2tA38Vq5hJRr8rckSzTA16igUQM=";
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
