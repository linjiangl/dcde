ARG RABBITMQ_VERSION

FROM rabbitmq:${RABBITMQ_VERSION}

COPY rabbitmq_delayed_message_exchange-3.9.0.ez /plugins

WORKDIR /plugins

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange