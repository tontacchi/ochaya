#!/usr/bin/env bash

# user variables
vault="$HOME/vaults/Vault/"
nvim="/usr/local/nvim/bin/nvim"

# helpful notification
notify-send "Notes" "edit in nvim, watch in obsidian" -t 2000

# open markview
$HOME/pfiles/dev/local/markview/build/bin/markview &

# open sakura, open to Vault/, start neovim
sakura -x "sh -c 'cd \"$vault\" && \"$nvim\" .; exec bash'"

# close all markview instances, say bye
wmctrl -lx | awk '/markview|Markview/ {print $1}' | xargs -r -n1 wmctrl -ic
notify-send "Notes" "bye-bye!" -t 2000

