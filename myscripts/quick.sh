#!/usr/bin/env bash

ANSWER=$(printf "Wallpaper\nMusic\nPolybar\nReboot\nShutdown\naliases\ni3\nkitty\npicom\npolybar\nqutebrowser\nRofi\nsxhkd\nzsh" | rofi -dmenu)

case $ANSWER in
	"Wallpaper")
	~/.local/bin/wal -i ~/Wallpaper &
	;;
	"Music")
	/usr/bin/vlc ~/Music --random &
	;;
	"Polybar")
	/usr/bin/polybar --config=~/.config/polybar/config.ini &
	;;
	"Reboot")
		sudo reboot now
	;;
	"Shutdown")
		sudo shutdown now
	;;
	"aliases")
		nvim ~/aliases.sh
	;;
	"i3")
		nvim ~/.config/i3/config
	;;
	"kitty")
		nvim ~/.config/kitty/kitty.conf
	;;
	"picom")
		nvim ~/.config/picom/picom.conf
	;;
	"polybar")
		nvim ~/.config/polybar/config.ini
	;;
	"qutebrowser")
		nvim ~/.config/qutebrowser/config.py
	;;
	"rofi")
		nvim ~/.config/rofi/config.rasi
	;;
	"sxhkd")
		nvim ~/.config/sxhkd/sxhkdrc
	;;
	"zsh")
		nvim ~/.zshrc
	;;
esac
