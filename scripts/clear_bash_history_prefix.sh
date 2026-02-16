#!/usr/bin/env bash

# Usage:
# ./clear_history_prefix.sh nvim

PREFIX="$1"

if [[ -z "$PREFIX" ]]; then
    echo "Usage: $0 <prefix>"
    exit 1
fi

HISTFILE="${HISTFILE:-$HOME/.bash_history}"
TMPFILE="$(mktemp)"

# Write filtered history to temp file
grep -vE "^[[:space:]]*$PREFIX\b" "$HISTFILE" > "$TMPFILE"

# Replace original history
mv "$TMPFILE" "$HISTFILE"

# Clear current session history
history -c

# Reload cleaned history
history -r

echo "Removed history entries starting with: $PREFIX"

