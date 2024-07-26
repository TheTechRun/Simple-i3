#!/usr/bin/env bash

# Path to the apps.txt file
APPS_FILE="$HOME/.config/i3/apps.txt"

# Read each line in apps.txt and create Rofi options
OPTIONS=""
while IFS= read -r line; do
    # Split the line into name and command
    name=$(echo "$line" | cut -d ',' -f 1 | sed 's/:/ /g')
    command=$(echo "$line" | cut -d ',' -f 2)

    # Remove any leading/trailing whitespace (optional)
    name=$(echo "$name" | sed 's/^[ \t]*//;s/[ \t]*$//')

    # Add the formatted option to the list
    OPTIONS="$OPTIONS\n$name"
done < "$APPS_FILE"

# Use Rofi to display options and execute selected command
selected=$(echo -e "$OPTIONS" | rofi -dmenu -p "Select an application:")

# Find the corresponding command for the selected option
command_to_execute=$(grep "^$selected," "$APPS_FILE" | cut -d ',' -f 2)

# Debug output
echo "Selected: $selected"
echo "Command to execute: $command_to_execute"

# Execute the command
if [[ -n "$command_to_execute" ]]; then
    echo "Executing: $command_to_execute"
    $command_to_execute &
fi
