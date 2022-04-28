final: prev:
let
  nodeEnv = import ./node-env.nix {
    inherit (prev.pkgs) stdenv lib python2 runCommand writeTextFile writeShellScript;
    inherit (prev) pkgs;
    nodejs = prev.pkgs.nodejs-18_x;
    nodejsSlim = prev.pkgs.nodejs-slim-18_x;
    libtool = if prev.pkgs.stdenv.isDarwin then prev.pkgs.darwin.cctools else null;
  };
in
{
  nodePackages = prev.nodePackages // (
    import ./node-packages.nix {
      inherit (prev.pkgs) fetchurl nix-gitignore stdenv lib fetchgit;
      inherit nodeEnv;
    }
  );
}
