#!/usr/bin/env bash

sudo apt install -y nala git
git clone https://github.com/corbgarza/dotfiles.git $HOME/dotfiles
#curl -fsS https://dl.brave.com/install.sh | sh > /dev/null && echo "Installed Brave!"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash > /dev/null && echo "Installed Brew!"
total=$(wc -l <$HOME/dotfiles/scripts/debauto.progs)
echo "Total packages to instsll: $total"
while IFS=, read -r installer package; do	
  gitpath=$HOME/.config/$(echo $package | awk -F "." '{print $(NF-1)}')
  n=$((n + 1))
	case "$installer" in
	"a") sudo nala install -y $package > /dev/null && echo "Installed $package, #$n of $total!" ;;
	"b") /home/linuxbrew/.linuxbrew/bin/brew install $package > /dev/null && echo "Installed $package, #$n of $total!";;
	"p") pipx install $package > /dev/null && echo "Installed $package, #$n of $total!" ;;
	"g") git clone --depth=1 https://github.com/$package $gitpath > /dev/null && echo "Installed $package, #$n of $total!" ;;
	esac
done <$HOME/dotfiles/scripts/debauto.progs
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher; echo "Installed Fisher!"
echo "Done installing!... Finishing setup!"
cd $HOME/dotfiles && git remote set-url origin git@github.com:corbgarza/dotfiles.git >/dev/null && echo "Set dotfiles url!"
mkdir -p $HOME/.config
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/ && echo "Copied Fonts!"
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub && sudo update-grub > /dev/null && echo "Updated Grub!"
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile && echo "root EDITOR is set to nvim!"
sudo echo "$(which fish)" >> /etc/shells && echo "Added fish to /etc/shells!"
chsh -s $(which fish) && echo "Changed default shell to fish!"
echo "Done! Reboot to complete!"
