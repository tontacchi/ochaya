#!/bin/sh

# colors
purple="#D3869B"
lilac="#CBA6F7"
blue="#2193ff"
sakura="#ffcdce"


# Is Bluetooth powered?
if [ "$(bluetoothctl show | grep 'Powered: yes' | wc -c)" -gt 0 ]; then
    # Powered: check if any device is connected
    if [ "$(echo info | bluetoothctl | grep 'Device' | wc -c)" -gt 0 ]; then
        # Powered & connected
        echo "%{F$purple}%{F-}"
    else
        # Powered but not connected
        echo "%{F$lilac}%{F-}"
    fi
else
    # Not powered
    echo "%{F$blue}%{F-}"
fi

