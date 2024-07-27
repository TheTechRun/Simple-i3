#!/usr/bin/env bash

# RUN THIS SCRIPT AS SUDO

# Install apps. Remove or add to your liking.
apt update
apt install -y alacritty arandr chromium curl dmenu dunst git gnome-text-editor i3 libnotify-bin libreoffice light-locker lightdm nemo network-manager-gnome nitrogen picom polybar powerline rofi slick-greeter wget xautolock xorg

# Install Greenclip (Update the link with the latest Greenclip)
cd ~/
wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
chmod +x greenclip
mv greenclip /usr/local/bin
greenclip daemon

# Install Starship
# curl -sS https://starship.rs/install.sh | sh
# echo 'eval "$(starship init bash)"' >> ~/.bashrc
# In ~/.config/starship.toml, you can change the disto logo and username on line 40
# Set transparency for different apps in ~/.config/picom.conf

exit

