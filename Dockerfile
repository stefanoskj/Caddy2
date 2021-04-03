FROM caddy:2.3.0-builder AS builder

RUN caddy-builder \
    github.com/caddy-dns/cloudflare \
    https://github.com/libdns/cloudflare.git

FROM caddy:2.3.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy