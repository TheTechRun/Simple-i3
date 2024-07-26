#!/usr/bin/env bash
cd ~/
git clone https://github.com/TheTechRun/Simple-i3
mv ~/simple-i3/.* ~/
rm -R ~/simple-i3/
chmod +x ~/.config/i3/* *.sh
chmod +x ~/.config/polybar/* *.sh
chmod +x ~/.scripts/rofi-themer.sh