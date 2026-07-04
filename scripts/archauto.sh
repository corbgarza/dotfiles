pkg_array=("bat" "brightnessctl" "curl" "deno" "dolphin" "dunst" "eza" "fastfetch" "feh" "fd" "ffmpeg" "fish" "fzf" "gcc" "git" "gnome-characters" "htop" "imagemagick" "kitty" "ly" "man-db" "moonlight" "neovim" "networkmanager" "nmap" "npm" "opendoas" "openssh" "os-prober" "proton-vpn-gtk-app" "pulseaudio" "python3" "qutebrowser" "rclone" "resolvconf" "ripgrep" "stow" "swaybg" "swaylock" "systemd-resolvconf" "tailscale" "tealdeer" "traceroute" "tree" "ttf-jetbrains-mono-nerd" "tmux" "udiskie" "unzip" "vlc" "waybar" "wayclip" "wget" "wofi" "yazi" "yt-dlp" "zip" "zoxide")

sudo pacman -S ${pkg_array[@]}

chsh -s $(which fish)
git clone https://github.com/corbgarza/dotfiles
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

