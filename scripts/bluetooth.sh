#!/bin/sh

# colors
purple="#8E7CC3"
lilac="#CBA6F7"
blue="#2193ff"

# Is Bluetooth powered?
if [ "$(bluetoothctl show | grep 'Powered: yes' | wc -c)" -gt 0 ]; then
    # Powered: check if any device is connected
    if [ "$(echo info | bluetoothctl | grep 'Device' | wc -c)" -gt 0 ]; then
        # Powered & connected
        echo "%{F$lilac}%{F-}"
    else
        # Powered but not connected
        echo "%{F$blue}%{F-}"
    fi
else
    # Not powered
    echo "%{F$purple}%{F-}"
fi
