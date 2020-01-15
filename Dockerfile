FROM alpine:latest
MAINTAINER Sweet

LABEL caddy_version="1.0.4" architecture="amd64"

ARG plugins=http.git,http.cors,http.realip,http.expires,http.cache,http.minify,http.nobots,tls.dns.cloudflare

RUN apk add --no-cache \
        git \
        tar \
        curl

# install caddy
RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=${plugins}&license=personal&telemetry=on" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy /srv
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout", "--agree"]
