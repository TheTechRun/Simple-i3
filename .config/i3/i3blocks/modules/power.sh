#!/usr/bin/env bash

# Rofi theme configuration
dir="$HOME/.config/rofi/launchers/type-ttr"
theme='style-ttr'

# Power menu options
options="Lock\nLogout\nReboot\nShutdown"

# Display the rofi menu and capture the selected option
selected=$(echo -e $options | rofi -dmenu -p "Power Menu")

# Handle the selected option
case $selected in
    "Lock")
        i3lock
        ;;
    "Logout")
        i3-msg exit
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
esac
