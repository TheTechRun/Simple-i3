#!/usr/bin/env bash

# Run rofi and redirect all output to /dev/null
rofi -show drun -show-icons > /dev/null 2>&1 &

# Just output the label for i3blocks
echo "START"
