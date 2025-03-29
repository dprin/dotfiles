#!/bin/bash

CONFIG_FILES="$HOME/.config/waybar/"

trap "killall waybar" EXIT

while true; do
    waybar --config /home/prin/.config/waybar/config.jsonc &
    inotifywait -r -e create,modify $CONFIG_FILES
    killall waybar
done
