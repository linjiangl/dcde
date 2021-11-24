#!/bin/sh

echo
echo "============================================"
echo "Install extensions from   : ${MORE_EXTENSION_INSTALLER}"
echo "PHP version               : ${PHP_VERSION}"
echo "Extra Extensions          : ${PHP_EXTENSIONS}"
echo "Multicore Compilation     : ${MC}"
echo "Work directory            : ${PWD}"
echo "============================================"
echo


if [ -z "${EXTENSIONS##*,mcrypt,*}" ]; then
    echo "---------- mcrypt was REMOVED from PHP 7.4 ----------"
fi


if [ -z "${EXTENSIONS##*,mysql,*}" ]; then
    echo "---------- mysql was REMOVED from PHP 7.4 ----------"
fi


if [ -z "${EXTENSIONS##*,sodium,*}" ]; then
    echo "---------- Install sodium ----------"
    echo "Sodium is bundled with PHP from PHP 7.4 "
fi

if [ -z "${EXTENSIONS##*,mongodb,*}" ]; then
    echo "---------- Install mongodb ----------"
    pecl install mongodb
    docker-php-ext-enable mongodb
fi

if [ -z "${EXTENSIONS##*,amqp,*}" ]; then
    echo "---------- Install amqp ----------"
    apk add --no-cache rabbitmq-c-dev
    pecl install /tmp/extensions/php74/amqp-1.10.2.tgz
    docker-php-ext-enable amqp
fi

if [ -z "${EXTENSIONS##*,redis,*}" ]; then
    echo "---------- Install redis ----------"
    mkdir redis \
    && tar -xf /tmp/extensions/php74/redis-5.3.3.tgz -C redis --strip-components=1 \
    && ( cd redis && phpize && ./configure && make ${MC} && make install ) \
    && docker-php-ext-enable redis
fi


if [ -z "${EXTENSIONS##*,memcached,*}" ]; then
    echo "---------- Install memcached ----------"
	  apk add --no-cache libmemcached-dev zlib-dev
    printf "\n" | pecl install memcached-3.1.4
    docker-php-ext-enable memcached
fi


if [ -z "${EXTENSIONS##*,xdebug,*}" ]; then
    echo "---------- Install xdebug ----------"
    pecl install /tmp/extensions/php74/xdebug-2.9.8.tgz \
    && docker-php-ext-enable xdebug
fi


if [ -z "${EXTENSIONS##*,swoole,*}" ]; then
    echo "---------- Install swoole ----------"
    mkdir swoole \
    && tar -xf /tmp/extensions/php74/swoole-4.6.4.tgz -C swoole --strip-components=1 \
    && ( cd swoole && phpize && ./configure --enable-openssl && make ${MC} && make install ) \
    && docker-php-ext-enable swoole
fi

if [ -z "${EXTENSIONS##*,pdo_sqlsrv,*}" ]; then
    echo "---------- Install pdo_sqlsrv ----------"
    apk add --no-cache unixodbc-dev
    pecl install pdo_sqlsrv
    docker-php-ext-enable pdo_sqlsrv
fi

if [ -z "${EXTENSIONS##*,sqlsrv,*}" ]; then
    echo "---------- Install sqlsrv ----------"
	  apk add --no-cache unixodbc-dev
    printf "\n" | pecl install sqlsrv
    docker-php-ext-enable sqlsrv
fi

if [ -z "${EXTENSIONS##*,apcu,*}" ]; then
    echo "---------- Install apcu ----------"
	  pecl install APCu
    docker-php-ext-enable apcu
fi


if [ -z "${EXTENSIONS##*,xhprof,*}" ]; then
    echo "---------- Install xhprof ----------"
    mkdir xhprof \
    && tar -xf /tmp/extensions/php74/xhprof-2.2.3.tgz -C xhprof --strip-components=1 \
    && ( cd xhprof/extension && phpize && ./configure --with-php-config=/usr/local/bin/php-config && make ${MC} && make install ) \
    && docker-php-ext-enable xhprof
fi

if [ -z "${EXTENSIONS##*,protobuf,*}" ]; then
    echo "---------- Install protobuf ----------"
	  pecl install protobuf-3.10.0
    docker-php-ext-enable protobuf
fi

if [ -z "${EXTENSIONS##*,gd,*}" ]; then
    echo "---------- Install gd ----------"
    apk add --no-cache freetype freetype-dev libjpeg-turbo libjpeg-turbo-dev libpng libpng-dev libwebp-dev
    docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
    docker-php-ext-install ${MC} gd
fi

cd /tmp
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/