#!/bin/bash
# Rofi menu for Quick Edit / View of Settings (SUPER E)

# define your preferred text editor and terminal to use
editor=nano
tty=kitty

configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"

menu(){
  printf "1.  Hyprland Config\n"
  printf "2.  Waybar Modules\n"
  printf "3.  Waybar Style\n"
  printf "4.  Waybar Layout\n"
  printf "5.  Wofi Config\n"
  printf "6.  Wofi Style\n"
  printf "7.  Kitty Config\n"
  printf "8.  Fastfetch Config\n"
  printf "9.  Neofetch Config\n"
  printf "10. Neofetch Logo\n"
}

main() {
    choice=$(menu | wofi -i --dmenu --config ~/.config/wofi/edit.conf | cut -d. -f1)
    case $choice in
        1)
            $tty $editor "$HOME/.config/hypr/hyprland.conf"
            ;;
        2)
            $tty $editor "$HOME/.config/waybar/modules"
            ;;
        3)
            $tty $editor "$HOME/.config/waybar/style.css"
            ;;
        4)
            $tty $editor "$HOME/.config/waybar/config"
            ;;
        5)
            $tty $editor "$HOME/.config/wofi/config"
            ;;
        6)
            $tty $editor "$HOME/.config/wofi/style.css"
            ;;
        7)
            $tty $editor "$HOME/.config/kitty/kitty.conf"
            ;;
        8)
            $tty $editor "$HOME/.config/fastfetch/config.jsonc"
            ;;
		9)
            $tty $editor "$HOME/.config/neofetch/config.conf"
            ;;
        10)
            $tty $editor "$HOME/.config/neofetch/ascii.txt"
            ;;
        *)
            ;;
    esac
}

main
