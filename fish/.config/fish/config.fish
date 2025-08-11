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
alias destroy="sudo nala purge -y "
alias dup="docker compose up --build --env-file $HOME/.config/docker.env -d"
alias ddown="docker compose down"
alias i="sudo nala install -y "
alias fzfs="fzf -e -i -m --wrap --preview='bat {}'"
alias la="eza -a --color=always"
alias lla="eza -la --color=always"
alias ll="eza -l --color=always"
alias ls="eza --color=always"
alias sf="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git'"
alias vm="sudo virt-manager --fork"

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
	 fzf -e -i -m --wrap --preview="bat {}" 
	cd -
end

function gacpd
  cd $HOME/dotfiles
	git add --all &&
	git commit --all --message "update" &&
	git push
	cd -
end

function gacpp
  cd $HOME/projects
	git add --all &&
	git commit --all --message "update" &&
	git push
	cd -
end

function updater
  type -q pkg && pkg uodate && pkg upgrade
	type -q nala && sudo nala update && sudo nala upgrade -y && sudo nala autoremove -y
	type -q tldr && tldr --update
	type -q brew && brew update && brew upgrade
	type -q flatpak && flatpak update -y
end

function pkgsearch
  type -q nala && nala search $argv && echo "#### nala results completed ####"
	type -q brew && brew search $argv && echo "#### brew results completed ####"
	type -q flatpak && flatpak search $argv && echo "#### flatpak results completed ####"
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
