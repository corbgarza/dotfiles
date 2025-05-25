sudo apt install -y brightnessctl btop curl eza fastfetch feh ffmpeg fonts-noto-color-emoji fzf gcc git i3 imagemagick kitty mpv network-manager nm-tray openssh-client openssh-server picom pipx polybar psmisc pulseaudio python3 ripgrep rofi stow sxhkd startx tealdeer x11-xserver-utils xsel zoxide zsh

pipx install pywal16 spotdl yt-dlp

sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
/home/linuxbrew/.linuxbrew/bin/brew install bat nvim yazi

curl -fsS https://dl.brave.com/install.sh | sh

git clone https://github.com/corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles 
git clone https://github.com/corbgarza/Wallpaper.git $HOME/Wallpaper
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/repos/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/repos/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/repos/zsh-autosuggestions

cd $HOME/dotfiles
stow *
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
rm $HOME/*.ttf
git remote set-url origin git@github.com:corbgarza/dotfiles.git

cd $HOME
mkdir -p $HOME/.ssh
ssh-keygen -f $HOME/.ssh/github

sudo sed -i*.old 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/1' /etc/default/grub
sudo update-grub
echo 'export PATH=$PATH:$HOME' > $HOME/.xinitrc

chsh -s $(which zsh)
sudo update-alternatives --config editor
