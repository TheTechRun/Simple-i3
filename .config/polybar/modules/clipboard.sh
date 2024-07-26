#!/usr/bin/env bash

# Fetch clipboard history from greenclip
clipboard_history=$(greenclip print)

# Prepend the "Clear Clipboard" option to the history
menu="WARNING-Clear Clipboard-WARNING\n$clipboard_history"

# Show the menu in rofi and capture the selected option
chosen=$(echo -e "$menu" | rofi -dmenu -p "Clipboard Manager:")

if [[ "$chosen" == "WARNING-Clear Clipboard-WARNING" ]]; then
    # Clear the clipboard history if selected
    greenclip clear
    pkill greenclip
    greenclip daemon &
    notify-send "Clipboard cleared"
else
    # Use the selected clipboard item
    echo -n "$chosen" | xclip -selection clipboard
    notify-send "$chosen"
fi

exit