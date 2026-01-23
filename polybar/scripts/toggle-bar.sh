#!/bin/bash

# Toggles polybar
# - running → kills process
# - not running → launches process

if pgrep -x polybar >/dev/null; then
	killall polybar
else
	$HOME/.config/polybar/launch.sh
fi

