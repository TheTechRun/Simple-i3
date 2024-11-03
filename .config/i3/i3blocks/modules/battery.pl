#!/usr/bin/env bash

# Get battery information
battery_info=$(acpi -b)

# Extract battery percentage and status
battery_percentage=$(echo "$battery_info" | awk -F, '{print $2}' | sed 's/^ //;s/%//')
battery_status=$(echo "$battery_info" | awk -F, '{print $3}' | sed 's/^ //')

# Set the color based on battery percentage
if [[ $battery_percentage -gt 90 ]]; then
    color="#00FF00"  # Green
elif [[ $battery_percentage -gt 50 ]]; then
    color="#FFFF00"  # Yellow
else
    color="#FF0000"  # Red
fi

# Format the output with battery percentage, status, and color
output="<span foreground='$color'>$battery_percentage% $battery_status</span>"

# Print the output
echo $output
