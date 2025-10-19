pkg_array=("bat brightnessctl btop curl eza fd ffmpeg fish fzf gcc git imagemagick kitty man-db mpv neovim networkmanager openssh pipewire python3 qutebrowser ripgrep stow tealdeer tree udiskie vlc waybar wireplumber wofi yt-dlp zoxide")

sudo pacman -S pkg_array[@]

git clone https://github.com/corbgarza/dotfiles
git clone https://github.com/corbgarza/projects

stow fish gitconfig hypr kitty nvim qutebrowser waybar yt-dlp

cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles
cd $HOME/projects && git remote set-url origin git@github.com:corbgarza/projects
