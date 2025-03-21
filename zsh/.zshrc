#### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. ####
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
#### Enable Powerlevel10k instant prompt ####
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias gacp="git add -A; git commit -a -m "update"; git push"
alias gitpulls="cd ~/projects && git pull; cd ~/dotfiles && git pull && cd -"
alias gitpushes="cd ~/projects && gacp; cd ~/dotfiles && gacp && cd -"
alias i="sudo apt-get install -y "
alias la="ls -A --color=always"
alias lla="ls -Al --color=always"
alias ll="ls -l --color=always"
alias ls="ls --color=always"
alias screenoff="xset dpms force off &"
alias search="cd /; fzf -e; cd -"
alias upgrade-remove="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y && tldr --update"
alias vpnup="sudo openvpn --config ~/.ssh/openvpn_vpnuser.ovpn --auth-user-pass ~/.ssh/.authinfo"
alias vpndown="sudo killall openvpn"
alias ytt="yt-dlp --paths '~/storage/movies/YouTube/' -o '%(title)s.%(ext)s' --write-thumbnail --embed-chapters --sponsorblock-remove sponsor"
alias ytd="yt-dlp --paths $HOME/Videos -o '%(title)s.%(ext)s' --write-thumbnail --embed-chapters --sponsorblock-remove sponsor"

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

#### check for and install required software ####
if [[ ! -e ~/repos/powerlevel10k ]]; then git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/repos/powerlevel10k; echo "installing powerlevel10k"; fi
if [[ ! -e ~/repos/zsh-syntax-highlighting ]]; then git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/repos/zsh-syntax-highlighting; echo "installing syntax-highlighting"; fi 
if [[ ! -e ~/repos/zsh-autosuggestions ]]; then git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/repos/zsh-autosuggestions; echo "installing autosuggestions"; fi
if [[ ! -e ~/dotfiles ]]; then git clone https://github.com/corbgarza/dotfiles $HOME/dotfiles; echo "installing dotfiles"; fi 

source ~/repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -e /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v zoxide > /dev/null; then
	eval "$(zoxide init zsh)"
fi

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
