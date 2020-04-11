FROM caddy/caddy:2.0.0-rc.2-builder AS builder

# Add the DNS provider for Cloudflare
RUN caddy-builder github.com/caddyserver/tls.dns/providers/cloudflare
  
FROM caddy/caddy:2.0.0-rc.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
