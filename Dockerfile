# NOTE: This expects to be behind a reverse proxy (nginx, haproxy, stunnel)
# that does SSL termination.

FROM debian:jessie
MAINTAINER Dan Callahan <dan.callahan@gmail.com>

# Install packages, then remove all intermediate files
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y nginx \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY public_html /srv/www
RUN chown -R www-data:www-data /srv/www \
  && chmod -R u=rwX,go=rX /srv/www

RUN rm -f /etc/nginx/sites-enabled/default
COPY nginx-site.conf /etc/nginx/sites-enabled/default

VOLUME ["/etc/nginx/sites-enabled", "/var/log/nginx", "/srv/www"]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
