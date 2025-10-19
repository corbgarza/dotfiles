#!/usr/bin/env bash

sudo apt install -y curl >/dev/null
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash >/dev/null
curl -fsS https://dl.brave.com/install.sh | sh >/dev/null

apt_array=("brightnessctl" "btop" "curl" "feh" "ffmpeg" "fish" "fonts-noto-color-emoji" "fzf" "git" "i3" "imagemagick" "kitty" "mpv" "nala" "network-manager" "openssh-client" "openssh-server" "picom" "pipx" "polybar" "psmisc" "pulseaudio" "python3" "qutebrowser" "ripgrep" "rofi" "stow" "sxhkd" "tealdeer" "tree" "virt-manager" "vlc" "x11-xserver-utils" "xinit" "xsel" "zoxide")
brew_array=("bat" "eza""fd" "gcc" "nvim")
pip_array=("spotdl" "pywal16" "yt-dlp")

sudo nala install -y ${apt_array[@]} >/dev/null
/home/linuxbrew/.linuxbrew/bin/brew install ${brew_array[@]} >/dev/null
#pip array for loop

git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles >/dev/null
cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles.git >/dev/null
mkdir -p $HOME/.config
stow fish gitconfig i3 kitty nvim picom polybar qutebrowser rofi sxhkd yt-dlp
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
