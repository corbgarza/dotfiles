if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

eval $(ssh-agent -c) >/dev/null
zoxide init fish | source
set -gx EDITOR $(which nvim)
set -gx VISUAL $(which nvim)
set -U fish_greeting ""
set -gx PATH $PATH:$HOME/.local/bin:$HOME/.config/fish

alias cfish="nvim ~/.config/fish/config.fish"
alias cytdlp="nvim ~/.config/yt-dlp/urls"
alias czsh="nvim ~/.zshrc"
alias fzfl="sudo fzf -e -i -m --wrap --preview='bat {}' "
alias fzft="fzf -e -i -m --wrap --preview='bat {}'"
alias la="eza -a --color=always"
alias lla="eza -la --color=always"
alias ll="eza -l --color=always"
alias ls="eza --color=always"
alias n="set -q TERMUX_VERSION && termux-notification -t 'Command Completed' -c '' || echo ''"
alias sfish="source ~/.config/fish/config.fish"
alias treee="tree -a -C -I '.git'"
