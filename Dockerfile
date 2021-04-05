FROM caddy:2.3.0-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/libdns/cloudflare \
#    --with github.com/greenpau/caddy-auth-jwt \
#    --with github.com/greenpau/caddy-auth-portal \
#    --with github.com/greenpau/caddy-trace \
#    --with github.com/greenpau/go-identity
     --with github.com/HeavenVolkoff/caddy-authelia/plugin

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
