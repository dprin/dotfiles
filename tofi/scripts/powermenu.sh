#!/bin/sh

# Stolen from: https://github.com/Axenide/Dots-10-06-2023/blob/main/hypr/tofi-power.sh
# Thank you lots!

case $(printf "%s\n" "Lock" "Suspend" "Log out" "Reboot" "Shut down" | tofi $@) in
	"Lock")
		swaylock
		;;
	"Suspend")
		case $(printf '%s\n' "Yes" "No" | tofi $@ --prompt-text "Are you sure?") in
			"Yes")
				systemctl suspend
				;;
			"No")
				;;
		esac
		;;
	"Log out")
		case $(printf '%s\n' "Yes" "No" | tofi $@ --prompt-text "Are you sure?") in
			"Yes")
				hyprctl dispatch exit
				;;
			"No")
				;;
		esac
		;;
	"Reboot")
		case $(printf '%s\n' "Yes" "No" | tofi $@ --prompt-text "Are you sure?") in
			"Yes")
				systemctl reboot
				;;
			"No")
				;;
		esac
		;;
	"Shut down")
		case $(printf '%s\n' "Yes" "No" | tofi $@ --prompt-text "Are you sure?") in
			"Yes")
				systemctl poweroff
				;;
			"No")
				;;
		esac
		;;
esac
