if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
zoxide init fish | source

alias ci3="nvim ~/.config/i3/config"
alias cfish="nvim ~/.config/fish/config.fish"
alias ckitty="nvim ~/.config/kitty/kitty.conf"
alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias cnvim="nvim ~/.config/nvim/init.lua"
alias cpicom="nvim ~/.config/picom/picom.conf"
alias cpolybar="nvim ~/.config/polybar/config.ini"
alias cqute="nvim ~/.config/qutebrowser/config.py"
alias crofi="nvim ~/.config/rofi/config.rasi"
alias csxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias cyt="nvim ~/scripts/yt.urls"
alias czsh="nvim ~/.zshrc"
alias destroy="sudo apt purge -y "
alias gacp="git add --all; git commit --all --message "update"; git push"
alias i="sudo apt install -y "
alias la="eza -a"
alias lla="eza -la"
alias ll="eza -l"
alias ls="eza"
alias search="cd /; sudo fzf -e; cd -"
alias sf="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git|.android|.cache|.cargo|.local'"
alias v="nvim"

function updater
	sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
	type -q tldr && tldr --update
	type -q brew && brew update && brew upgrade
	type -q flatpak && flatpak update
end

function pkgsesrch
  apt search $argv && echo "\n#### apt results completed ####\n"
	type -q brew && brew search $argv && echo "\n#### brew results completed ####\n"
	type -q flatpak && flatpak search $argv && echo "\n#### flatpak results completed ####\n"
end

function yt
  set BATCH $HOME/.config/yt-dlp/yt.urls
	test -d $HOME/storage/movies/ytdlp && set PATHS "$HOME/storage/movies/ytdlp" || set PATHS "$HOME/Youtube"
  if count "$argv"
				yt-dlp --paths $PATHS --config-locations $HOME/.config/yt-dlp/config "$argv"
  else
				yt-dlp --paths $PATHS --config-locations $HOME/.config/yt-dlp/config -a $HOME/.config/yt-dlp/urls
  end
end
