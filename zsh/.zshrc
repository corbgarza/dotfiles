#### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. ####
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
#### Enable Powerlevel10k instant prompt ####
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.config/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR="/home/linuxbrew/.linuxbrew/bin/nvim"

autoload -U compinit && compinit
bindkey -e autosuggest-accept
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups

if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
fi

alias config-i3="nvim ~/.config/i3/config"
alias config-kitty="nvim ~/.config/kitty/kitty.conf"
alias config-picom="nvim ~/.config/picom/picom.conf"
alias config-polybar="nvim ~/.config/polybar/config.ini"
alias config-qute="nvim ~/.config/qutebrowser/config.py"
alias config-rofi="nvim ~/.config/rofi/config.rasi"
alias config-sxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias config-zsh="nvim ~/.zshrc; source ~/.zshrc"

alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias destroy="sudo apt purge -y "
alias i="sudo apt install -y "
alias la="eza -a"
alias lla="eza -la"
alias ll="eza -l"
alias ls="eza"
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
	[[ $# -eq 0 ]] && yt-dlp --paths $PATHS -o '%(title)s.%(ext)s' --embed-chapters -a "$HOME/yt.urls" || yt-dlp --paths $PATHS -o '%(title)s.%(ext)s' --embed-chapters $1
}

# To customize prompt, run `p10k configure` or edit ~/dotfiles/p10k/.p10k.zsh.
[[ ! -f ~/dotfiles/p10k/.p10k.zsh ]] || source ~/dotfiles/p10k/.p10k.zsh
