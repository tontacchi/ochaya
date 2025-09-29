#!/bin/bash
notify-send "toggle script ran"

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
	bluetoothctl power on
	notify-send "bluetooth powered on!"
else
	bluetoothctl power off
	notify-send "bluetooth powered off!"
fi
