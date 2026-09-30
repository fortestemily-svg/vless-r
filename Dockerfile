FROM debian:bookworm-slim

ARG XRAY_VERSION=26.9.8

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl unzip gettext-base \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSL -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip" \
    && unzip -q /tmp/xray.zip -d /usr/local/bin/xray \
    && chmod +x /usr/local/bin/xray/xray \
    && rm -f /tmp/xray.zip

COPY config.template.json /etc/xray/config.template.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENV PORT=8080

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
