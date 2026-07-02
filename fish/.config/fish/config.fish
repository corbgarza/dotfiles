if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

zoxide init fish | source
set -gx EDITOR $(which nvim)
set -gx VISUAL $(which nvim)
set -U fish_greeting ""
set -gx PATH $PATH:$HOME/.local/bin:$HOME/.config/fish
set -gx SSH_AUTH_SOCK "$PREFIX/var/run/ssh-agent.socket"

alias cfish="nvim ~/.config/fish/config.fish"
alias chypr="nvim ~/.config/hypr/hyprland.conf"
alias cnvim="nvim ~/.config/nvim/init.lua"
alias cytdlp="nvim ~/.config/yt-dlp/urls"
alias czsh="nvim ~/.zshrc"
alias fzfl="sudo fzf -e -i -m --wrap --preview='bat {}' "
alias fzft="fzf -e -i -m --wrap --preview='bat {}'"
alias gacp="git add -A && git commit && git push"
alias la="eza -a --color=always"
alias lla="eza -la --color=always"
alias ll="eza -l --color=always"
alias ls="eza --color=always"
alias sfish="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git'"
