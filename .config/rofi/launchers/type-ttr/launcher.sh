#!/usr/bin/env bash

# Rofi theme configuration
dir="$HOME/.config/rofi/launchers/type-ttr"
theme='style-ttr'

# Command for "All Apps" option
rofi -show drun -show-icons -theme "${dir}/${theme}.rasi"
