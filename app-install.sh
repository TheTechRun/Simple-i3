#!/usr/bin/env bash

# RUN THIS SCRIPT AS SUDO

apt install -y curl dmenu dunst git i3 nitrogen polybar rofi starship xorg wget alacritty arandr picom powerline libnotify-bin light-locker lightdm slick-greeter xautolock chromium greenclip gnome-text-editor libreoffice nemo 

# Install Starship
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc

# Install Greensclip (Update the link with the latest Greenclip)
cd ~/
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod +x greenclip
mv greenclip /usr/local/bin
greenclip daemon

exit

