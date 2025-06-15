git remote set-url origin git@github.com:corbgarza/dotfiles.git
source $HOME/dotfiles/myscripts/progs.csv
mkdir -p $HOME/.config && gitpath="$HOME/.config/"

curl -fsS https://dl.brave.com/install.sh | sh
stow -d $HOME/dotfiles -t $HOME --ignore=*.ttf
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub
while IFS=, read -r installer package; do
	case "$installer" in
	"a") sudo apt install -y "$package" ;;
	"b") brew install -y "$package" ;;
	"p") pipx install "$package" ;;
	"g") git clone --depth=1 "$package" $HOME/.config/$package ;;
	esac
done <progs.csv
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile
echo 'export PATH=$PATH:$HOME' >> $HOME/.xinitrc
chsh -s $(which zsh)
