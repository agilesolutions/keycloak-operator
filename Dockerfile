FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1 AS build-env

RUN microdnf install -y git make golang

ADD ./ /src

# final stage
FROM registry.access.redhat.com/ubi8/ubi-minimal:8.1

ENV OPERATOR=/usr/local/bin/keycloak-operator \
    USER_UID=1001 \
    USER_NAME=keycloak-operator

RUN microdnf update && microdnf clean all && rm -rf /var/cache/yum/*

COPY build/bin /usr/local/bin
RUN  /usr/local/bin/user_setup

COPY ./images/keycloak-operator /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint"]

USER ${USER_UID}
