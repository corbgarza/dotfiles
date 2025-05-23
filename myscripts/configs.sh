#!/usr/bin/env bash

ANSWER=$(printf "aliases\ni3\nKitty\nPicom\nPolybar\nQutebrowser\nRofi\nsxhkd\nZsh" | rofi -dmenu)
case $ANSWER in
	"aliases")
		nvim ~/dotfiles/aliasscripts.sh
	;;
	"i3")
		nvim ~/.config/i3/config
	;;
	"Kitty")
		nvim ~/.config/kitty/kitty.conf
	;;
	"Picom")
		nvim ~/.config/picom/picom.conf
	;;
	"Polybar")
		nvim ~/.config/polybar/config.ini
	;;
	"Qutebrowser")
		nvim ~/.config/qutebrowser/config.py
	;;
	"Rofi")
		nvim ~/.config/rofi/config.rasi
	;;
	"sxhkd")
		nvim ~/.config/sxhkd/sxhkdrc
	;;
	"Zsh")
		nvim ~/.zshrc
	;;
esac
