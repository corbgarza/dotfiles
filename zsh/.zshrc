alias zshconfig="nvim ~/.zshrc"
alias i3config="nvim ~/.config/i3/config"
alias picomconfig="nvim ~/.config/picom.conf"
alias polybarconfig="nvim ~/.config/polybar/config.ini"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias alacrittyconfig='nvim ~/.config/alacritty.yml'
alias search="cd /; fzf -e; cd -"
alias LS="ls -A --color=tty"
alias i="sudo apt-get update && sudo apt-get install -y "

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

PATH=$PATH:$HOME/.local/bin:$HOME/myscripts

source ~/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/plugins/zsh-bat/zsh-bat.plugin.zsh
source ~/plugins/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source ~/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
