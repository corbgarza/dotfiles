if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

zoxide init fish | source
set -gx EDITOR $(which nvim)
set -gx VISUAL $(which nvim)
set -U fish_greeting ""
set -gx PATH $PATH:$HOME/.local/bin

alias cfish="nvim ~/.config/fish/config.fish"
alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias czsh="nvim ~/.zshrc"
alias destroy="sudo apt purge -y "
alias i="sudo apt install -y "
alias fzfs="fzf -e -i -m --wrap --preview='bat {}'"
alias la="eza -a --color=always"
alias lla="eza -la --color=always"
alias ll="eza -l --color=always"
alias ls="eza --color=always"
alias sf="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git'"

function n
		set -q TERMUX_VERSION && termux-notification -t "Command Completed" -c "" || echo ""
end

function cnvim
    while not nvim ~/.config/nvim/init.lua;
        echo "restarting nvim...";
    end
end

function vim
    while not nvim $argv;
        echo "restarting nvim";
    end
end

function search
  cd / &&
	sudo fzf -e -i -m --wrap --preview="bat {}" 
	cd -
end

function gacpd
  cd $HOME/dotfiles
	git add --all &&
	git commit --all --message "update" &&
	git push
end

function gacpp
  cd $HOME/projects
	git add --all &&
	git commit --all --message "update" &&
	git push
end

function updater
  type -q pkg && pkg uodate && pkg upgrade
	type -q apt && sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
	type -q tldr && tldr --update
	type -q brew && brew update && brew upgrade
	type -q flatpak && flatpak update -y
end

function pkgsearch
  type -q apt && apt search $argv && echo "\n#### apt results completed ####\n"
	type -q brew && brew search $argv && echo "\n#### brew results completed ####\n"
	type -q flatpak && flatpak search $argv && echo "\n#### flatpak results completed ####\n"
end

function yt
  set BATCH $HOME/.config/yt-dlp/yt.urls
	set CONFIG $HOME/.config/yt-dlp/config
	test -d $HOME/storage/movies/ytdlp && set PATHS "$HOME/storage/movies/ytdlp" || set PATHS "$HOME/ytdlp"
  if count $argv > /dev/null
				yt-dlp --paths $PATHS --config-locations $CONFIG $argv
  else
				yt-dlp --paths $PATHS --config-locations $CONFIG
  end
end
