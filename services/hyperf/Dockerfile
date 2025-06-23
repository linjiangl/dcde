ARG HYPERF_VERSION

FROM ${HYPERF_VERSION}

ARG TZ

RUN if [ $CONTAINER_PACKAGE_URL ] ; then sed -i "s/dl-cdn.alpinelinux.org/${CONTAINER_PACKAGE_URL}/g" /etc/apk/repositories ; fi

RUN apk update \
    && apk --no-cache add tzdata git openssh vim
