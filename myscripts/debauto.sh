cd $HOME/dotfiles
git remote set-url origin git@github.com:corbgarza/dotfiles.git
sudo apt install -y curl
source $HOME/dotfiles/myscripts/progs.csv

for prog in progs.csv; do
#if a, then apt
#if b, then brew
#if p, then pip
#if g, git clone --depth=1

	sudo apt install -y prog && \
	echo "Installing $prog!"
done

sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

curl -fsS https://dl.brave.com/install.sh | sh

corbgarza/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
corbgarza/Wallpaper.git
romkatv/powerlevel10k.git
zsh-users/zsh-syntax-highlighting.git
zsh-users/zsh-autosuggestions

stow -d $HOME/dotfiles -t $HOME --ignore=*.ttf
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/

sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub
sudo update-grub
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile
echo 'export PATH=$PATH:$HOME' >> $HOME/.xinitrc

chsh -s $(which zsh)
