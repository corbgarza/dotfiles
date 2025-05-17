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
	cd ~/Wallpapers && git pull && echo '\n#### Wallpapers pulled successfully ####\n'
	cd ~
}

#git pushes
gitpushes () {
	cd ~/projects && gacp && echo '\n#### projects pushed successfully ####\n' 
	cd ~/dotfiles && gacp && echo '\n#### dotfiles pushed successfully ####\n'
	cd ~/Wallpapers && gacp && echo '\n#### Wallpapers pushed successfully ####\n'
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
	apt search $1 && echo -e "\n#### apt results completed ####\n"
	brew search $1 && echo -e "\n#### brew results completed ####\n"
	flatpak search $1 && echo -e "\n#### flatpak results completed ####\n"
}

#yt-dlp termux
ytt () {
	yt-dlp --paths '~/storage/movies/YouTube/' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor
}

#yt-dlp debian
ytd () {
	yt-dlp --paths '~/Videos' -o '%(title)s.%(ext)s' --embed-chapters --sponsorblock-remove sponsor
}
