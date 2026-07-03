#!/usr/bin/env bash

# get previously closed directory location
last_dir="$(cat $HOME/.ochaya/sakura-terminal/last-pwd.txt)"

# open sakura
sakura -x "sh -c 'cd \"$last_dir\"; exec bash'"

