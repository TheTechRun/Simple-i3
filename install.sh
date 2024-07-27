#!/usr/bin/env bash
#Easy method to DOWNLOAD this: see README.md
cd ~
git clone https://github.com/TheTechRun/Simple-i3
cd Simple-i3
mv .config .scripts .fonts .icons Pictures .themes ~/
chmod +x ~/.config/i3/* *.sh
chmod +x ~/.config/polybar/* *.sh
chmod +x ~/.scripts/* *.sh

exit
