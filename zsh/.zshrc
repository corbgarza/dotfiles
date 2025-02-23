export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
COMPLETION_WATIING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
#plugins=(git aliases web-search)
source $ZSH/oh-my-zsh.sh
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
autoload -U compinit && compinit
bindkey -e autosuggest-accept
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#custom shit
PATH=$PATH:$HOME/.local/bin:$HOME/myscripts
alias zshconfig="nvim ~/.zshrc"
alias i3config="nvim ~/.config/i3/config"
alias picomconfig="nvim ~/.config/picom.conf"
alias polybarconfig="nvim ~/.config/polybar/config.ini"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias alacrittyconfig='nvim ~/.config/alacritty.yml'
alias search="cd / && fzf -e"
alias bat="batcat"
alias LS="ls -A --color=tty"
alias i="sudo apt-get update && sudo apt-get install -y "
precmd() { print "" }
