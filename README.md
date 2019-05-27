# caddy

A [Docker](https://docker.com) image for [Caddy](https://caddyserver.com). This image includes [git](https://caddyserver.com/docs/http.git), [filebrowser](https://caddyserver.com/docs/http.filebrowser), [cors](https://caddyserver.com/docs/http.cors), [realip](https://caddyserver.com/docs/http.realip), [expires](https://caddyserver.com/docs/http.expires) and [cache](https://caddyserver.com/docs/http.cache) plugins.

## Getting Started

```sh
$ docker run -d --name caddy \
    -v $HOME/Caddyfile:/etc/Caddyfile \
    -p 80:80 -p 443:443 -p 2015:2015 \
    john123951/caddy
```

Caddyfile
```
127.0.0.1 {
  ext .html .htm .php
  gzip
  proxy / http://www.12306.com {
    transparent
    insecure_skip_verify
  }
  tls {
    dns cloudflare
  }
  log requests.log {
        rotate_size 50  # Rotate after 50 MB
        rotate_age  90  # Keep rotated files for 90 days
        rotate_keep 20  # Keep at most 20 log files
        rotate_compress # Compress rotated log files in gzip format
  }
}
```

Point your browser to `http://127.0.0.1:2015`.

### Cloudflare

```sh
$ docker run -d --name caddy \
    -v $HOME/Caddyfile:/etc/Caddyfile \
    -p 80:80 -p 443:443 -p 2015:2015 \
    -e CLOUDFLARE_EMAIL:xxx@yyy.com -e CLOUDFLARE_API_KEY:******** \
    john123951/caddy
```

### compose

```

```
