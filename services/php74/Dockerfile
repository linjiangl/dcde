ARG PHP_VERSION
FROM php:${PHP_VERSION}-fpm

ARG TZ
ARG PHP_EXTENSIONS
ARG DEBIAN_MIRROR_DOMAIN

ENV TZ=${TZ}

RUN if [ -n "${DEBIAN_MIRROR_DOMAIN}" ]; then \
        sed -i "s|deb.debian.org|${DEBIAN_MIRROR_DOMAIN}|g" /etc/apt/sources.list \
        && sed -i "s|security.debian.org|${DEBIAN_MIRROR_DOMAIN}|g" /etc/apt/sources.list; \
    fi

RUN export option="--no-install-recommends -y" \
    && apt-get $option update \
    && apt-get $option install git openssh-client curl vim rsync procps iputils-ping vim-tiny unzip htop tzdata

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions \
    && install-php-extensions $PHP_EXTENSIONS

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV COMPOSER_HOME=/tmp/composer

WORKDIR /www
