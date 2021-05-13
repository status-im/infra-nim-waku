FROM alpine:3.13.5
MAINTAINER Jakub Sokolowski <jakub@status.im>

ARG VERSION=0.9.0

RUN apk add --update --no-cache python3 py3-numpy py3-requests

RUN wget -q https://github.com/novnc/websockify/archive/refs/tags/v${VERSION}.zip -O /tmp/websockify.zip \
 && unzip -q /tmp/websockify.zip -d /opt/ \
 && mv /opt/websockify-${VERSION} /opt/websockify \
 && rm /tmp/websockify.zip /opt/websockify/Windows

# Expose two volumes to (possibly) host configuration files needed on the
# command line, e.g. keys and certificates for WSS access, files served for
# --web options, etc.
VOLUME /opt/websockify/data
VOLUME /opt/websockify/config

WORKDIR /opt/websockify
ENTRYPOINT ["python3", "-m", "websockify"]
CMD ["--help"]
