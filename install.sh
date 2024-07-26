#!/usr/bin/env bash
#Easy method to DOWNLOAD this: see README.md
cd ~/
git clone https://github.com/TheTechRun/Simple-i3
wget https://raw.githubusercontent.com/TheTechRun/Simple-i3/master/app-install.sh
mv ~/Simple-i3/.* ~/
chmod +x app-install.sh
chmod +x ~/.config/i3/* *.sh
chmod +x ~/.config/polybar/* *.sh
chmod +x ~/.scripts/rofi-themer.sh
