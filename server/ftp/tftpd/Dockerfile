FROM alpine:latest

RUN apk add --no-cache tftp-hpa

ENTRYPOINT ["in.tftpd"]
CMD ["--verbose", "--foreground", "--secure", "--create", "--user", "root", "/var/tftpboot"]
