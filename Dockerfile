FROM caddy:2.8.4-builder-alpine AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/pberkel/caddy-storage-redis@v1.3.0

FROM caddy:2.8.4-alpine AS caddy
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
