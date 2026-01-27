#!/usr/bin/env sh
set -eu

LOC='aus+tx'
CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}"
CACHE_FILE="$CACHE_DIR/wttr-${LOC}.json"

mkdir -p "$CACHE_DIR"

TMP="$(mktemp "${CACHE_FILE}.tmp.XXXXXX")"
trap 'rm -f "$TMP"' EXIT

# Prefer v2.wttr.in (often more reliable); fall back to wttr.in
URL_PRIMARY="https://v2.wttr.in/${LOC}?format=j1"
URL_FALLBACK="https://wttr.in/${LOC}?format=j1"

fetch() {
  curl -fsS \
    --connect-timeout 5 \
    --max-time 20 \
    --retry 2 \
    --retry-delay 1 \
    --retry-all-errors \
    "$1"
}

if fetch "$URL_PRIMARY" > "$TMP" 2>/dev/null || fetch "$URL_FALLBACK" > "$TMP" 2>/dev/null; then
  # Only accept it if it looks like wttr JSON (avoid caching HTML error pages)
  if grep -q '"current_condition"' "$TMP"; then
    mv "$TMP" "$CACHE_FILE"
  fi
else
  # Don't clobber a good cache; only create marker if none exists
  if [ ! -s "$CACHE_FILE" ]; then
    printf '%s\n' '{"error":"wttr unreachable"}' > "$CACHE_FILE"
  fi
fi
