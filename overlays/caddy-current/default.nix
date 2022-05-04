final: prev: {
  caddy = let
    caddy = prev.caddy.override {
      buildGoModule = prev.buildGo118Module;
    };
  in
    caddy.overrideAttrs (oldAttrs: let
      rev = "e84e19a04eefccc743f0d397efe49ff42626f4b3";
    in
    {
      src = prev.fetchFromGitHub {
        owner = "caddyserver";
        repo = "caddy";
        inherit rev;
        sha256 = "sha256-RtTyD+F9lTyFgfNn2tA38Vq5hJRr8rckSzTA16igUQM=";
      };

      vendorSha256 = "sha256-xu3klc9yb4Ws8fvXRV286IDhi/zQVN1PKCiFKb8VJBo=";

      version = "2.5.0-${builtins.substring 0 11 rev}";
    });
}
