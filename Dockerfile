FROM arm32v7/caddy:builder-alpine-builder AS builder

RUN xcaddy \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/libdns/cloudflare.git

FROM arm32v7/caddy:builder-alpine



COPY --from=builder /usr/bin/caddy /usr/bin/caddy