# AGENTS.md — dcde

Docker Compose local development environment for PHP/Go/Java/Node projects with databases and caches.

## Setup (required on first run)

```bash
cp .env.sample .env
cp docker-compose.sample.yml docker-compose.yml
docker-compose build
docker-compose up -d
```

Both `.env` and `docker-compose.yml` are **gitignored** — they are local-only overrides. The sample files are the source of truth for defaults.

## Key layout

- `services/` — Dockerfile + per-service config (nginx, php**, mysql**, redis, postgres, etc.)
- `www/` — PHP web root, mounted into containers at `/www`. Mostly gitignored; `www/localhost/` is tracked.
- `work/` — Non-PHP project directories (golang, java, node, hyperf), mounted into their respective containers.
- `data/` — Persistent database storage (mysql5, mysql8, redis, postgres, elasticsearch, mongo). Gitignored.
- `logs/` — Container log output. Gitignored.
- `services/nginx/conf.d/` — Nginx virtual host configs. `localhost.conf` routes to `php82:9000` by default.

## Docker network

All containers sit on a bridge network at subnet `10.0.0.0/24`. Nginx has a fixed IP `10.0.0.10`. Service hostnames are the container names (e.g. `mysql8`, `redis`, `php82`).

## Enabling/disabling services

Services in `docker-compose.yml` are commented out by default. Uncomment the block for any service you need, then `docker-compose up -d`. Available but inactive services include: php72, php74, mysql5, mongodb, rabbitmq, phpmyadmin, elasticsearch, logstash, kibana, supervisor, golang, java, node, memcached.

## PHP containers

All PHP containers (php72, php74, php80, php81, php82) use Debian-based `php:X.X-fpm` images with `apt-get` for system packages and the `install-php-extensions` script for PECL extensions.

- **php72, php74, php80**: Based on Debian Bullseye. Use `sources.list` with `${DEBIAN_MIRROR_DOMAIN}` for apt mirror configuration.
- **php81, php82**: Based on Debian Bookworm. Use `debian.sources` format with `${DEBIAN_MIRROR_DOMAIN}`.
- php74/80/81 use a locally `COPY`'d `install-php-extensions` script. php82 uses `curl` to download it at build time.
- **Removed extensions**: `mcrypt` (deprecated since PHP 7.2, PECL unreliable) and `xmlrpc` (removed from core in PHP 8.0, PECL unstable) are excluded from all PHP version extension lists.

## Configuration conventions

- All container versions, ports, passwords, and paths are controlled via `.env` variables.
- **All PHP extensions**: space-separated, quoted string (e.g. `PHP82_EXTENSIONS="pdo_mysql mysqli gd"`).
- PHP containers include composer at `/usr/local/bin/composer` with `COMPOSER_HOME=/tmp/composer`.
- Line endings are forced to LF via `.gitattributes`.

## Common commands

```bash
docker-compose up -d                              # start all enabled services
docker-compose up -d nginx php82 mysql8 redis      # start specific services
docker-compose restart nginx                       # restart one service
docker-compose build php82                         # rebuild after changing PHP extensions
docker-compose exec php82 bash                     # shell into PHP container
docker-compose logs -f nginx                       # follow logs
```

