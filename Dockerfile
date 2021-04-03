FROM armv7/caddy:2.3.0-alpine-builder AS builder

RUN xcaddy \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/libdns/cloudflare.git

FROM arm32v7/caddy:2.3.0-alpine



COPY --from=builder /usr/bin/caddy /usr/bin/caddy