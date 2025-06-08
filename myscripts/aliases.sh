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

yt () {
	[[ -d $HOME/storage/movies/ytdlp ]] && PATHS="$HOME/storage/movies/ytdlp"
	[[ -d $HOME/YouTube ]] && PATHS="$HOME/Youtube"
	[[ -f $HOME/yt.urls ]] && yt-dlp --paths $PATHS -o '%(title)s.%(ext)s' --embed-chapters -a "$HOME/yt.urls" || yt-dlp --paths $PATHS -o '%(title)s.%(ext)s' --embed-chapters $1
}
