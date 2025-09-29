#!/bin/bash
# 2025/09/28
# - executed by sudo to use rofi for password prompting
#    - flag must be set (check .../bash/aliases.sh for flag)
#
# - note: after updating to Mint 22.1, Rofi displays "Loading..." unless passed something from stdin

printf '' | rofi -dmenu\
	-password\
	-i\
	-no-fixed-num-lines\
	-p "Password: "\
	-theme "~/.ochaya/rofi/themes/askpass.rasi"
