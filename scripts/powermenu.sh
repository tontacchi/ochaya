#!/bin/bash

theme_dir="$HOME/.config/rofi/themes"
shared="$theme_dir/shared"
uptime=$(uptime -p | sed -e 's/up //g')

command="rofi -dmenu -i -theme $dir/powermenu.rasi"

# Options
shutdown=""
logout=""
reboot=""
suspend=""
lock=""

# confirmation
confirm_exit() {
	rofi -dmenu \
		 -no-config \
		 -i \
		 -no-fixed-num-lines \
		 -p "Sure? (y/n): " \
		 -theme "$shared/confirm.rasi"
}

# message
message() {
	rofi -e "y / n"
}

# Variable passed to rofi
options="$shutdown\n$logout\n$reboot\n$suspend\n$lock"

# chosen="$(echo -e "$options" | $command -p "Uptime: $uptime" -dmenu -selected-row 0)"
chosen="$(echo -e "$options" | $command -p "Power")"
case $chosen in
$shutdown)
	systemctl poweroff
	;;
$reboot)
	systemctl reboot
	;;
$lock)
	~/.ochaya/i3/no-ring.sh
	;;
$suspend)
	systemctl suspend
	;;
$logout)
	i3-msg exit
	;;
esac
