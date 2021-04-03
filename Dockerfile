FROM caddy:builder-alpine AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \
    https://github.com/libdns/cloudflare.git

FROM caddy:caddy:builder-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy