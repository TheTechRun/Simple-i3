#!/usr/bin/env bash
# Get RAM usage percentage
RAM_USAGE=$(free -m | awk 'NR==2{printf "%.0f%%", $3*100/$2}')
# Output the percentage with a leading space
echo " $RAM_USAGE"
# Optional: Add a color based on usage
if [[ "${RAM_USAGE%\%}" -gt 80 ]]; then
    echo "#FF0000"  # Red for high usage
elif [[ "${RAM_USAGE%\%}" -gt 60 ]]; then
    echo "#FFFF00"  # Yellow for medium usage
else
    echo "#FFFFFF"  # White for normal usage
fi
