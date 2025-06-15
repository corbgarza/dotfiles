git remote set-url origin git@github.com:corbgarza/dotfiles.git
sudo apt install -y curl
source $HOME/dotfiles/myscripts/progs.csv
mkdir -p $HOME/.config 
gitpath="$HOME/.config/"

for prog in $(cat progs.csv); do
	awk '{print $1}' prog > PKGMAN
	sudo apt install -y $prog
#if b, then brew
	brew install $prog
#if p, then pip
	pipx install $prog
#if g, git clone --depth=1
	git clone --depth=1 https://github.com/$prog $gitpath
done

sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

curl -fsS https://dl.brave.com/install.sh | sh

"${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

stow -d $HOME/dotfiles -t $HOME --ignore=*.ttf
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/

sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile
echo 'export PATH=$PATH:$HOME' >> $HOME/.xinitrc

chsh -s $(which zsh)
