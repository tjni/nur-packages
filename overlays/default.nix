{
  # Tracks the most up-to-date commits to the Caddy web server.
  #
  #   https://github.com/caddyserver/caddy
  #
  caddy-current = import ./caddy-current;

  # Tracks the most up-to-date commits to direnv.
  #
  #   https://github.com/direnv/direnv
  #
  direnv-current = import ./direnv-current;

  # Tracks the most up-to-date commits of pnpm.
  #
  #   https://github.com/pnpm/pnpm
  #
  pnpm-current = import ./pnpm-current;

  # Adds patches that better support SpaceVim in a Nix environment.
  #
  # In particular:
  #
  #   1. Lets SpaceVim be installed as a Vim package.
  #   2. Disables helptag generation on startup.
  #
  SpaceVim = import ./SpaceVim;
}
