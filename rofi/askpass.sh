#!/bin/bash
printf '' | rofi -dmenu\
	-password\
	-i\
	-no-fixed-num-lines\
	-p "Password: "\
	-theme "~/.ochaya/rofi/themes/askpass.rasi"
