#!/bin/zsh

capacity="$(cat /sys/class/power_supply/BAT0/capacity)"

if [ $capacity -gt 80 ]; then
    echo ""
elif [ $capacity -gt 60 ]; then
    echo -e ""
elif [ $capacity -gt 40 ]; then
    echo ""
elif [ $capacity -gt 20 ]; then
    echo ""
else
    echo ""
fi
