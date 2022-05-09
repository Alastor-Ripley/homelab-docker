FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/duckdns \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:2.5.1

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

