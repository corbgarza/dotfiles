#### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. ####
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
#### Enable Powerlevel10k instant prompt ####
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/aliases.sh

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
