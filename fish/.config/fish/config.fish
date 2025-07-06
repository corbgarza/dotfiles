zoxide init fish | source
alias ci3="nvim ~/.config/i3/config"
alias cfish="nvim ~/.config/fish/config.fish"
alias ckitty="nvim ~/.config/kitty/kitty.conf"
alias cpicom="nvim ~/.config/picom/picom.conf"
alias cpolybar="nvim ~/.config/polybar/config.ini"
alias cqute="nvim ~/.config/qutebrowser/config.py"
alias crofi="nvim ~/.config/rofi/config.rasi"
alias csxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias cyt="nvim ~/scripts/yt.urls"
alias czsh="nvim ~/.zshrc; source ~/.zshrc"
alias treee="tree -a -C -I '.git|.android|.cache|.cargo|.local'"

alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias destroy="sudo apt purge -y "
alias i="sudo apt install -y "
alias la="eza -a"
alias lla="eza -la"
alias ll="eza -l"
alias ls="eza"
alias v="nvim"

function gacp 
	git add --all
	git commit --all --message "update"
	git push
end

function search
	cd /
	sudo fzf -e
	cd -
end

#apt update, apt upgrade, apt autoremove, apt autoclean, tldr update, brew update, flatpak update
function updater
	sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
	tldr --update
	brew update && brew upgrade
	flatpak update
end

#search pkgs
function pkgsearch
	apt search $1 && echo -e "\n#### apt results completed ####\n"
	brew search $1 && echo -e "\n#### brew results completed ####\n"
	flatpak search $1 && echo -e "\n#### flatpak results completed ####\n"
end

set BATCH $HOME/.config/yt-dlp/yt.urls
function yt
	[[ -d $HOME/storage/movies/ytdlp ]] && set PATHS "$HOME/storage/movies/ytdlp" || set PATHS "$HOME/Youtube"
	[[ count $argv -eq 0 ]] && yt-dlp --paths $PATHS --config-locations $HOME/.config/yt-dlp/config -a $HOME/.config/yt-dlp/urls
	[[ count $argv -ne 0 ]] && yt-dlp --paths $PATHS --config-locations $HOME/.config/yt-dlp/config $argv
end
