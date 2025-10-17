if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

zoxide init fish | source
set -gx EDITOR $(which nvim)
set -gx VISUAL $(which nvim)
set -U fish_greeting ""
set -gx PATH $PATH:$HOME/.local/bin:$HOME/.config/fish
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

alias cfish="nvim ~/.config/fish/config.fish"
alias clickclass="xprop | grep WM_CLASS | awk '{ print \$4 }'"
alias cytdlp="nvim ~/.config/yt-dlp/urls"
alias czsh="nvim ~/.zshrc"
alias dup="docker compose up --build --env-file $HOME/.config/docker.env -d"
alias ddown="docker compose down"
alias di="sudo nala install -y "
alias ai="sudo pacman -S"
alias fzfs="fzf -e -i -m --wrap --preview='bat {}'"
alias la="eza -a --color=always"
alias lla="eza -la --color=always"
alias ll="eza -l --color=always"
alias ls="eza --color=always"
alias n="set -q TERMUX_VERSION && termux-notification -t 'Command Completed' -c '' || echo ''"
alias search="sudo fzf -e -i -m --wrap --preview='bat {}' "
alias tsearch="fzf -e -i -m --wrap --preview='bat {}' "
alias sfish="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git'"
alias vm="sudo virt-manager --fork"
