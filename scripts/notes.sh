#!/usr/bin/env bash

# markdown store, nvim executable paths
vault="$HOME/vaults/Vault"
nvim="/usr/local/nvim/bin/nvim"

# helpful notification
notify-send "Notes" "edit in nvim, watch in markview" -t 2000

# open markview & save PID
$HOME/pfiles/dev/local/markview/build/bin/markview &
markview_pid=$!

# open sakura & save PID
sakura -x "sh -c 'cd \"$vault\"; exec \"$nvim\" .'" &
sakura_pid=$!

# handler to close both applications
cleanup() {
	kill "$sakura_pid" "$markview_pid" 2>/dev/null || true
}

# assign handler for a program closing
trap cleanup EXIT INT TERM
wait -n "$sakura_pid" "$markview_pid"

# close all markview instances, say bye
notify-send "Notes" "bye-bye!" -t 2000

