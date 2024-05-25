#!/bin/sh

if ! pgrep -x "waybar" > /dev/null ; then
	waybar -c ~/.config/waybar/config.jsonc &
else
	killall waybar
fi
