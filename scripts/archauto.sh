pkg_array=("bat" "brightnessctl" "btop" "curl" "deno" "eza" "fastfetch" "feh" "fd" "ffmpeg" "fish" "fzf" "gcc" "git" "imagemagick" "kitty" "man-db" "mpv" "neovim" "networkmanager" "nmap" "noto-fonts" "os-prober" "openssh" "otf-font-awesome" "pulseaudio" "python3" "qutebrowser" "rclone" "resolvconf" "ripgrep" "stow" "swaybg" "tealdeer" "traceroute" "tree" "ttf-jetbrains-mono-nerd" "tmux" "udiskie" "vlc" "waybar" "wireplumber" "wofi" "yazi" "yt-dlp" "zoxide")

sudo pacman -S ${pkg_array[@]}

chsh -s $(which fish)
git clone https://github.com/corbgarza/dotfiles
#git clone git@github.com:corbgarza/dotfiles
rm -rf ~/.config/hypr
stow fish gitconfig hypr kitty nvim tealdeer waybar yt-dlp
cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles
sudo systemctl enable NetworkManager.service

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

paru brave-nightly-bin

chsh -s $(which fish)

