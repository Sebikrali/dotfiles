#!/bin/bash

# $1 = "up" or "down"
# $2 = step value
if [[ "$1" == "up" ]]; then
    if [[ "$SXK_HOST" == "pc" ]]; then
        ddcutil setvcp 10 + $2
    else 
        brightnessctl s +$2%
    fi
elif [[ "$1" == "down" ]]; then
    if [[ "$SXK_HOST" == "pc" ]]; then
        ddcutil setvcp 10 - $2
    else 
        brightnessctl s $2%-
    fi
fi

# Update Waybar manually
pkill -RTMIN+10 waybar
