FROM alpine:latest

RUN apk upgrade --update && \
    apk add --no-cache jq curl

ADD entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
