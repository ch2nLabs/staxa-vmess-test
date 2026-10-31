#!/bin/sh
set -eu
: "${VMESS_UUID:?VMESS_UUID must be provided as a secret environment variable}"
case "$VMESS_UUID" in
  *[!0-9a-fA-F-]*) echo "Invalid UUID characters" >&2; exit 1 ;;
esac
envsubst < /opt/config.template.json > /tmp/config.json
exec /usr/local/bin/xray run -c /tmp/config.json
