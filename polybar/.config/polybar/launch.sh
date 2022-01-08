#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar -q lainbar -c $HOME/.config/polybar/config &
polybar -q lainbar_external -c $HOME/.config/polybar/config &

echo "Bars launched..."
