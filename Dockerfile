FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/libdns/cloudflare \
   # --with github.com/greenpau/caddy-auth-portal@latest \
    #--with github.com/greenpau/caddy-auth-jwt@latest \
    --with github.com/kirsch33/format-encoder@latest

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
