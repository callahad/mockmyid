FROM alpine:latest

RUN apk add --no-cache curl
RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=${plugins}" \
    | tar -xzo -C /usr/bin/ caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

COPY Caddyfile /srv/
COPY public_html /srv/public_html/

WORKDIR /srv/

EXPOSE 80

CMD ["caddy", "-quiet"]
