FROM caddy:2.3.0-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/libdns/cloudflare \
    --with github.com/greenpau/caddy-auth-portal@latest \
    --with github.com/greenpau/caddy-auth-jwt@latest \
    --with github.com/HeavenVolkoff/caddy-authelia/plugin

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
