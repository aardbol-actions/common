FROM alpine:3.23

RUN apk add --no-cache git bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT /entrypoint.sh
