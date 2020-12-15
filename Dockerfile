FROM alpine:3.12.2

RUN apk update && \
    apk add lftp && \
    apk add openssh-client && \
    mkdir ~/.ssh && chmod 0700 ~/.ssh

COPY . .