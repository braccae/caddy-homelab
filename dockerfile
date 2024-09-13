FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mohammed90/caddy-git-fs

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "run", "--config", "/etc/caddy/caddyfile", "--adapter", "caddyfile"]