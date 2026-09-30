#!/bin/sh
set -eu

: "${PORT:=8080}"

if [ -z "${VLESS_UUID:-}" ]; then
  echo "ERROR: VLESS_UUID is not set."
  echo "Set VLESS_UUID in Railway > Service > Variables."
  exit 1
fi

mkdir -p /etc/xray

envsubst '${PORT} ${VLESS_UUID}' \
  < /etc/xray/config.template.json \
  > /etc/xray/config.json

echo "Starting Xray VLESS TCP on internal port ${PORT}..."
exec /usr/local/bin/xray/xray run -config /etc/xray/config.json
