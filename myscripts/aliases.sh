#!/usr/bin/env bash

alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias config-i3="nvim ~/.config/i3/config"
alias config-aliases="nvim ~/aliases.sh"
alias config-kitty="nvim ~/.config/kitty/kitty.conf"
alias config-picom="nvim ~/.config/picom/picom.conf"
alias config-polybar="nvim ~/.config/polybar/config.ini"
alias config-qute="nvim ~/.config/qutebrowser/config.py"
alias config-rofi="nvim ~/.config/rofi/config.rasi"
alias config-sxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias config-zsh="nvim ~/.zshrc"
alias destroy="sudo apt purge -y "
alias ff="fastfetch"
alias i="sudo apt install -y "
alias la="ls --almost-all --color=always"
alias lla="ls --almost-all --human-readable --color=always -l"
alias ll="ls -l --human-readable --color=always"
alias ls="ls --color=always"
alias rebootnow="sudo reboot now"
alias shutdownnow="sudo shutdown now"
alias v="nvim"

#git add, commit, and push
gacp () {
	git add --all
	git commit --all --message "update"
	git push
}

#git pulls
gitpulls () {
	cd ~/projects && git pull && echo '\n#### projects pulled successfully ####\n'
	cd ~/dotfiles && git pull && echo '\n#### dotfiles pulled successfully ####\n'
	cd ~/Wallpaper && git pull && echo '\n#### Wallpapers pulled successfully ####\n'
	cd ~
}

#git pushes
gitpushes () {
	cd ~/projects && gacp && echo '\n#### projects pushed successfully ####\n' 
	cd ~/dotfiles && gacp && echo '\n#### dotfiles pushed successfully ####\n'
	cd ~/Wallpaper && gacp && echo '\n#### Wallpapers pushed successfully ####\n'
	cd ~
}

#search files
search () {
	cd /
	sudo fzf -e
cd -
}

#apt update, apt upgrade, apt autoremove, apt autoclean, tldr update, brew update, flatpak update
updater () {
	sudo apt update -y && sudo apt upgrade -y && echo -e "\n#### apt upgraded ####\n"
	sudo apt autoremove -y && sudo apt autoclean -y && echo -e "\n#### autoremoved and autocleaned ####\n"
	tldr --update && echo -e "\n#### tldr updated ####\n"
	brew update && brew upgrade && echo -e "\n#### brew upgraded ####\n"
	flatpak update && echo -e "\n#### flatpak upgraded ####\n"
}

#search pkgs
pkgsearch () {
	apt search $1 ; echo -e "\n#### apt results completed ####\n"
	brew search $1 ; echo -e "\n#### brew results completed ####\n"
	flatpak search $1 ; echo -e "\n#### flatpak results completed ####\n"
}

#yt-dlp termux
ytt () {
	yt-dlp --paths '~/storage/movies/YouTube/' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor $1
}

#yt-dlp debian
ytd () {
	yt-dlp --paths '~/Videos' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor $1
}
