#!/bin/sh
set -e

echo "=== Starting WireGuard ==="
wg-quick up wg0 || echo "WireGuard уже запущен или ошибка"

echo "=== Starting wstunnel server ==="
# secret123 — придумай свой длинный секретный путь!
wstunnel server \
  --http-upgrade-path-prefix "secret123" \
  ws://0.0.0.0:8080 \
  udp://127.0.0.1:51820 &

# Держим контейнер живым
tail -f /dev/null
