FROM alpine:3

RUN apk add --no-cache --update ca-certificates
RUN update-ca-certificates

COPY app /bin/app
RUN chmod +x /bin/app

ENTRYPOINT [ "/bin/app" ]