FROM callahad/caddy:latest

COPY Caddyfile /srv/
COPY public_html /srv/public_html/
