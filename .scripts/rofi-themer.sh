#!/usr/bin/env bash

# New Rofi launch command
dir="$HOME/.config/rofi/launchers/type-ttr"
theme='style-ttr'

# Rofi menu to select color option
CHOICE=$(echo -e "Better Blue\nGigantic Green\nGruesome Gray\nMagic Magenta\nOutrageous Orange\nParty Pink\nPerfect Purple\nTerrific Teal\nWonderful Wheat" | rofi \
    -dmenu \
    -i \
    -theme ${dir}/${theme}.rasi \
    -p "Select Color Scheme")

# Define color codes based on choice
if [[ "$CHOICE" == "Magic Magenta" ]]; then
    NEW_COLOR="D70751"
    POLYBAR_COLOR_INPUT="D70751"
    STARSHIP_COLOR="D70751"
elif [[ "$CHOICE" == "Better Blue" ]]; then
    NEW_COLOR="5294E2"
    POLYBAR_COLOR_INPUT="5294E2"
    STARSHIP_COLOR="5294E2"    
elif [[ "$CHOICE" == "Gigantic Green" ]]; then
    NEW_COLOR="50C16F"
    POLYBAR_COLOR_INPUT="50C16F"
    STARSHIP_COLOR="50C16F"    
elif [[ "$CHOICE" == "Gruesome Gray" ]]; then
    NEW_COLOR="AAAAAA"
    POLYBAR_COLOR_INPUT="AAAAAA"
    STARSHIP_COLOR="AAAAAA"
elif [[ "$CHOICE" == "Outrageous Orange" ]]; then
    NEW_COLOR="FB805F"
    POLYBAR_COLOR_INPUT="FB805F"
    STARSHIP_COLOR="FB805F"   
elif [[ "$CHOICE" == "Party Pink" ]]; then
    NEW_COLOR="CC6088"
    POLYBAR_COLOR_INPUT="CC6088"
    STARSHIP_COLOR="CC6088"       
elif [[ "$CHOICE" == "Perfect Purple" ]]; then
    NEW_COLOR="A27AE4"
    POLYBAR_COLOR_INPUT="A27AE4"
    STARSHIP_COLOR="A27AE4"  
#elif [[ "$CHOICE" == "Terrific Teal" ]]; then
  #  NEW_COLOR="348F91"
   # POLYBAR_COLOR_INPUT="348F91"
   # STARSHIP_COLOR="348F91"
elif [[ "$CHOICE" == "Wonderful Wheat" ]]; then
    NEW_COLOR="F9C470"
    POLYBAR_COLOR_INPUT="F9C470"
    STARSHIP_COLOR="F9C470"       
else
    echo "Invalid selection."
    exit 1
fi

# Paths to config files
I3_CONFIG="$HOME/.config/i3/config"
DUNST_CONFIG="$HOME/.config/dunst/dunstrc"
STARSHIP_CONFIG="$HOME/.config/starship.toml"
POLYBAR_CONFIG="$HOME/.config/polybar/config.ini" 
GTK_SETTINGS="$HOME/.config/gtk-3.0/settings.ini"
NITROGEN_CONFIG="$HOME/.config/nitrogen/bg-saved.cfg"
I3BLOCKS_CONFIG="$HOME/.config/i3/i3blocks/i3blocks.conf"
ROFI_COLORS_CONFIG="$HOME/.config/rofi/colors/ttr.rasi"

# Construct the full Polybar color with opacity
POLYBAR_COLOR="FF"$POLYBAR_COLOR_INPUT

# Function to replace color in file (improved to handle dunst config specifically)
replace_color() {
    local file="$1"
    local old_color="$2"
    local new_color="$3"
    if [[ "$file" == *"dunstrc" ]]; then
        sed -i "/frame_color/s/\"#[A-Fa-f0-9]\{6\}\"/\"#$new_color\"/" "$file"
    elif [[ "$file" == *"i3blocks.conf" ]]; then
        sed -i "7s/color=#[A-Fa-f0-9]\{6\}/color=#$new_color/" "$file"
    elif [[ "$file" == *"ttr.rasi" ]]; then
        sed -i "s/selected:       #[A-Fa-f0-9]\{6\}FF;/selected:       #${new_color}FF;/" "$file"
    else
        sed -i "s/$old_color/$new_color/g" "$file"
    fi
}

# Function to update GTK settings
update_gtk_settings() {
    local file="$1"
    local new_color="$2"
    sed -i 's/^gtk-theme-name=.*/gtk-theme-name='$new_color'/' "$file"
    sed -i 's/^gtk-icon-theme-name=.*/gtk-icon-theme-name='$new_color'/' "$file"
}

# Function to update Nitrogen config
update_nitrogen_config() {
    local file="$1"
    local new_color="$2"
    sed -i '/file=.*Wallpapers/s/[A-Fa-f0-9]\{6\}\.jpeg/'$new_color'.jpeg/' "$file"
}

# Function to set Nitrogen wallpaper FOR THREE MONITORS
set_nitrogen_wallpaper() {
    nitrogen --set-zoom-fill --head=0 --save "$HOME/Pictures/Wallpapers/$NEW_COLOR.jpeg"
    nitrogen --set-zoom-fill --head=1 --save "$HOME/Pictures/Wallpapers/$NEW_COLOR.jpeg"
    nitrogen --set-zoom-fill --head=2 --save "$HOME/Pictures/Wallpapers/$NEW_COLOR.jpeg"
}

# Update i3 configs
replace_color "$I3_CONFIG" "set \$main [A-Fa-f0-9]\{6\}" "set \$main $NEW_COLOR"

# Update polybar config (using POLYBAR_COLOR)
replace_color "$POLYBAR_CONFIG" "main = #[A-Fa-f0-9]\{2\}[A-Fa-f0-9]\{6\}" "main = #$POLYBAR_COLOR" 

# Update dunst config
replace_color "$DUNST_CONFIG" "frame_color = \"#[A-Fa-f0-9]\{6\}\"" "$NEW_COLOR"

# Update starship config
# Extract the current theme color from starship.toml
CURRENT_THEME_COLOR=$(grep "theme color" "$STARSHIP_CONFIG" | sed -E 's/.*#([A-Fa-f0-9]{6}).*/\1/')

# Update starship config
if [ -n "$CURRENT_THEME_COLOR" ]; then
    sed -i "s/#$CURRENT_THEME_COLOR/#$STARSHIP_COLOR/g" "$STARSHIP_CONFIG"
    echo "Updated Starship config: replaced #$CURRENT_THEME_COLOR with #$STARSHIP_COLOR"
else
    echo "Current theme color not found in Starship config"
fi

# Update GTK settings
update_gtk_settings "$GTK_SETTINGS" "$NEW_COLOR"

# Update Nitrogen config and set wallpaper
update_nitrogen_config "$NITROGEN_CONFIG" "$NEW_COLOR"
set_nitrogen_wallpaper

# Update i3blocks config
replace_color "$I3BLOCKS_CONFIG" "" "$NEW_COLOR"

# Update Rofi colors config
replace_color "$ROFI_COLORS_CONFIG" "" "$NEW_COLOR"

echo "Color codes updated in all specified config files."

# Restart Dunst to apply changes
pkill dunst
dunst -config $HOME/.config/dunst/dunstrc &

# Reload Starship configuration (using starship init)
starship init bash

notify-send "Theme Changed To $NEW_COLOR"

pkill polybar

polybar &

# Reload i3
i3-msg restart

exit
