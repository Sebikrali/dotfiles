#!/bin/bash

# $1 = "up" or "down"
# $2 = step value
if [[ "$1" == "up" ]]; then
        ddcutil setvcp 10 + $2
elif [[ "$1" == "down" ]]; then
        ddcutil setvcp 10 - $2
fi

# Update Waybar manually
pkill -RTMIN+10 waybar
