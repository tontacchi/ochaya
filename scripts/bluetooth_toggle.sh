#!/bin/bash

if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
	bluetoothctl power on
	notify-send "Bluetooth Toggle" "Powered on!"
else
	bluetoothctl power off
	notify-send "Bluetooth Toggle" "Powered off!"
fi
