#!/bin/sh

i=0

while IFS= read -r color; do
    [ -z "$color" ] && continue

    printf 'color%02d="%s"\n' "$i" "$color"
    i=$((i + 1))
done < "$1"
