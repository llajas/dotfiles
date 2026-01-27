#!/usr/bin/env sh
set -eu

LOC='aus+tx'
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
CACHE_FILE="$CACHE_DIR/wttr-${LOC}.json"

mkdir -p "$CACHE_DIR"

TMP="$(mktemp "${CACHE_FILE}.tmp.XXXXXX")"
trap 'rm -f "$TMP"' EXIT

# Try to fetch quickly. If it fails, DO NOT clobber an existing cache.
if curl -fsS --connect-timeout 2 --max-time 6 \
  "https://wttr.in/${LOC}?format=j1" > "$TMP"
then
  mv "$TMP" "$CACHE_FILE"
else
  # Only create a marker if we have *no* cache yet
  if [ ! -s "$CACHE_FILE" ]; then
    printf '%s\n' '{"error":"wttr unreachable"}' > "$CACHE_FILE"
  fi
fi
