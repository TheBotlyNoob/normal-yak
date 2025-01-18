#!/usr/bin/env bash

## A chromium wrapper to disable sandboxing and disable
## some CORS options

mkdir -p /tmp/chrome
chromium --no-sandbox --disable-web-security --user-data-dir="/tmp/chrome" "$@"
