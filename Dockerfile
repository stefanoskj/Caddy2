FROM caddy:2.3.0-alpine AS builder

RUN xcaddy build v2.3.0-alpine \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/libdns/cloudflare

FROM caddy:2.3.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
