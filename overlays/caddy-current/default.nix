final: prev: {
  caddy = let
    rev = "d6bc9e0b5c748c999e30051bf04d622dbbb0a156";
    version = "2.5.1-${builtins.substring 0 11 rev}";

    src = prev.fetchFromGitHub {
      owner = "caddyserver";
      repo = "caddy";
      inherit rev;
      sha256 = "Hf1Mgf25MJIQdqnEgA758g42Q5+LFgtUJr21Us3neZk=";
    };

    overriddenBuildGoModule = args:
      prev.buildGo118Module (args
        // {
          inherit version src;
          vendorSha256 = "aB95wEc69nhloF8qoBeIiiitSyiUTc2KpxyCEnge4rc=";
        });
  in
    prev.caddy.override {
      buildGoModule = overriddenBuildGoModule;
    };
}
