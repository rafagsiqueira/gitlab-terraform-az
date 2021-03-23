FROM registry.gitlab.com/gitlab-org/terraform-images/stable:latest

RUN apk update && apk add bash py-pip curl

RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install azure-cli && \
    apk del --purge build
