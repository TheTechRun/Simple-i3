# Simple-i3
**A user friendly i3 setup that I made for family members that I decided to share with you!**

***Tested and working on Debian 12 Bookworm but should be good to go on many other distros with some slight alterations*** 

### <ins>Dependencies<ins>: 
dmenu, dunst, git, i3, network-manager-gnome, nitrogen, polybar, rofi, xorg, and alacritty.

### <ins>**OPTIONAL** Dependencies: <ins>
arandr, curl, picom, powerline, libnotify-bin, light-locker, lightdm, starship, slick-greeter, and xautolock.

### <ins>Apps built into polybar modules:<ins>
chromium, greenclip, gnome-text-editor, libreoffice, and nemo.

**Note**: *You can go to ~/.config/polybar/modules and alter the App scripts as you like.*

### <ins>Simple-i3 Install:<ins>
Easiest method is to run these commands in terminal: 
```
sudo apt update
sudo apt install git wget
cd ~/  
wget https://raw.githubusercontent.com/TheTechRun/Simple-i3/master/install.sh
chmod +x install.sh 
bash install.sh
```

Use the **install.sh** script that will install just the config files, fonts, icons, and themes. 

### You can download the install script and make it executable or just copy and paste in terminal. Be sure to Backup any configs and/or files that these might replace.

### <ins>OPTIONAL (Recommended) App install: <ins>
 The **app-install.sh** will install the *Optional Dependencies* and *Apps* (mentioned in the sections above) on debian based systems using apt. You will need to run this script as sudo. 
 
After running the **install.sh**, this simple command will run the **app-install.sh**:

`sudo ~/.scripts/app-install.sh`

Be sure to pay attention to the prompts and reboot.

 *Alter this script to work with your distro (dnf, pacman, etc) as you like.*



## <ins>Some Keybinds (See i3 config):<ins>
**$mod = Super Key**

**Control+Shift+T** = Theme Switcher

**Menu** = SIMPLE Apps List

**Alt+Space** = FULL Apps List

**Super+T** = Terminal (Alacritty)

**Super+Tab** = Show/Switch Windows tabs

**Super+L** = Lockscreen (light-locker)

**Super+P** = Polybar

**Super+C** = Clipboard

**Alt+L** = Lockscreen (light-locker)

**See ~/.config/i3/config for the rest of the keybinds.**

### <ins>TTR Theme Switcher<ins>: 
This comes with 8 built in themes that can be switched on the fly (See Keybinds). The theme switcher changes the main color in i3, rofi, dunst, starship prompt, polybar, wallpaper, and GTK themes & icons.

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Screenshot%201.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Screenshot%202.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Better-Blue.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Gigantic-Green.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Gruesome-Gray.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Wonderful-Wheat.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Magic-Magenta.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Outrageous-Orange.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Party-Pink.png)

![text](https://github.com/TheTechRun/Simple-i3/blob/master/screenshots/Perfect-Purple.png)

