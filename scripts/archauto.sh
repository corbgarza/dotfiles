pkg_array=("bat" "brightnessctl" "btop" "curl" "eza" "fd" "ffmpeg" "fish" "fzf" "gcc" "git" "imagemagick" "kitty" "man-db" "mpv" "neovim" "networkmanager" "noto-fonts" "openssh" "otf-font-awesome" "pipewire" "python3" "qutebrowser" "ripgrep" "stow" "tealdeer" "tree" "ttf-arimo-nerd" "udiskie" "vlc" "waybar" "wireplumber" "wofi" "yazi" "yt-dlp" "zoxide")

sudo pacman -S ${pkg_array[@]}

chsh -s $(which fish)
git clone https://github.com/corbgarza/dotfiles
rm -rf ~/.config/hypr
stow fish gitconfig hypr kitty nvim waybar yt-dlp
cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru brave-nightly-bin

chsh -s $(which fish)

