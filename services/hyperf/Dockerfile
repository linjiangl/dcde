ARG HYPERF_VERSION

FROM hyperf/hyperf:${HYPERF_VERSION}

ARG CONTAINER_PACKAGE_URL
ARG PHP_EXTENSIONS

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

#RUN apk update \
#    && apk --no-cache add git openssh vim tzdata openssl-dev autoconf gcc g++ libtool make curl-dev gettext-dev linux-headers

# Install PHP extensions
# zend_extension=/usr/lib/php83/modules/xdebug.so
#RUN apk add php83-dev php83-pear \
#    && pecl install xdebug

WORKDIR /hyperf-skeleton