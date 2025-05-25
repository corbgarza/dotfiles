#!/usr/bin/env bash

alias config-i3="nvim ~/.config/i3/config"
alias config-aliases="nvim ~/aliases.sh"
alias config-kitty="nvim ~/.config/kitty/kitty.conf"
alias config-picom="nvim ~/.config/picom/picom.conf"
alias config-polybar="nvim ~/.config/polybar/config.ini"
alias config-qute="nvim ~/.config/qutebrowser/config.py"
alias config-rofi="nvim ~/.config/rofi/config.rasi"
alias config-sxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias config-zsh="nvim ~/.zshrc"

alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias destroy="sudo apt purge -y "
alias ff="fastfetch"
alias i="sudo apt install -y "
alias la="eza -a"
alias lla="eza -la"
alias ll="eza -l"
alias ls="eza"
alias rnow="sudo reboot now"
alias snow="sudo shutdown now"
alias v="nvim"

#git add, commit, and push
gacp () {
	git add --all
	git commit --all --message "update"
	git push
}

#search files
search () {
	cd /
	sudo fzf -e
	cd -
}

#apt update, apt upgrade, apt autoremove, apt autoclean, tldr update, brew update, flatpak update
updater () {
	sudo apt update -y && sudo apt upgrade -y
	sudo apt autoremove -y && sudo apt autoclean -y
	tldr --update
	brew update && brew upgrade
	flatpak update
}

#search pkgs
pkgsearch () {
	apt search $1 && echo -e "\n#### apt results completed ####\n"
	brew search $1 && echo -e "\n#### brew results completed ####\n"
	flatpak search $1 && echo -e "\n#### flatpak results completed ####\n"
}

#yt-dlp termux
ytt () {
	yt-dlp --paths '~/storage/movies/YouTube/' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor $1
}

#yt-dlp debian
ytd () {
	yt-dlp --paths '~/Videos' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor $1
}
