git remote set-url origin git@github.com:corbgarza/dotfiles.git
mkdir -p $HOME/.config
curl -fsS https://dl.brave.com/install.sh | sh > /dev/null && echo "Installed Brave!"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash > /dev/null && echo "Installed Brew!"
source $HOME/dotfiles/myscripts/progs.csv
while IFS=, read -r installer package; do
	gitpath=$HOME/.config/$(echo $package | awk -F "." '{print $(NF-1)}')
	case "$installer" in
	"a") sudo apt install -y "$package" > /dev/null && echo "Installed $package!" ;;
	"b") /home/linuxbrew/.linuxbrew/bin/brew install "$package" > /dev/null && echo "Installed $package!";;
	"p") pipx install "$package" > /dev/null && echo "Installed $package!" ;;
	"g") git clone --depth=1 https://github.com/$package $gitpath > /dev/null && echo "Installed $package!" ;;
	esac
done <progs.csv
stow -d $HOME/dotfiles -t $HOME --ignore=*.ttf
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile
echo 'export PATH=$PATH:$HOME' >> $HOME/.xinitrc
chsh -s $(which zsh)
