#!/bin/bash
# Incomplete Script 2025/09/28
# - meant to select directory using Rofi, then open it w/ Thunar

set -euo pipefail

# Start searching from this directory (default: HOME). You can pass one as $1.
START_DIR="${1:-$HOME}"

echo "first"

# Build the list of directories (fd is fast; falls back to find)
# if command -v fdfind >/dev/null 2>&1; then
#   # --hidden to include dot dirs; tweak excludes as you like
#   mapfile -t DIRS < <(fdfind . "$START_DIR" --type d --hidden --follow --exclude .git --exclude go)
# else
#   mapfile -t DIRS < <(find "$START_DIR" -type d ! -path '*/.git/*' -print)
# fi

SELECTION="$(fdfind . ~ --type d --exclude .git --exclude go | rofi -dmenu -i -p 'Thunar:' -matching fuzzy -no-custom)"

echo "second"

# Show the list in rofi with fuzzy matching; no custom entries
# SELECTION="$(printf '%s\n' "${DIRS[@]}" | rofi -dmenu -i -p 'Open dir in Thunar:' -matching fuzzy -no-custom)"

# Open in Thunar (if user picked something)
if [[ -n "${SELECTION}" ]]; then
  thunar "${SELECTION}" & disown
fi

echo "last"
