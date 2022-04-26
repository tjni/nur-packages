{
  # Tracks the most up-to-date commits of the Caddy web server.
  #
  #   https://github.com/caddyserver/caddy
  #
  caddy-current = import ./caddy-current;

  # Tracks the most up-to-date commits of direnv.
  #
  #   https://github.com/direnv/direnv
  #
  direnv-current = import ./direnv-current;

  # My forked version of pueue with changes that have not yet been upstreamed.
  #
  #   https://github.com/tjni/pueue
  #
  tjni-pueue = import ./tjni-pueue;
}
