#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

dir="$HOME/.config/polybar"

# launch bars
polybar -q bar -c "$dir/config.ini" &

