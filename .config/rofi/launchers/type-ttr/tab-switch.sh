#!/usr/bin/env bash

# Rofi theme configuration
dir="$HOME/.config/rofi/launchers/type-ttr"
theme='style-ttr'

# Launch Rofi window switcher with icons
rofi -show window -show-icons -theme "${dir}/${theme}.rasi"
