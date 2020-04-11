FROM caddy/caddy:2.0.0-rc.2-builder AS builder

# Add the DNS provider for Cloudflare
RUN caddy-builder \
  github.com/caddyserver/tls.dns
  
FROM caddy/caddy:v2.0.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
