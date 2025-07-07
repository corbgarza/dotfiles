#!/usr/bin/env bash
git remote set-url origin git@github.com:corbgarza/dotfiles.git
mkdir -p $HOME/.config
curl -fsS https://dl.brave.com/install.sh | sh > /dev/null && echo "Installed Brave!"
sudo curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash > /dev/null && echo "Installed Brew!"
total=$(wc -l <$HOME$HOME/dotfiles/scripts/debauto.progs)
while IFS=, read -r installer package; do	
  gitpath=$HOME/.config/$(echo $package | awk -F "." '{print $(NF-1)}')
  n=$((n + 1))
	case "$installer" in
	"a") sudo apt install -y $package > /dev/null && echo "Installed $package, #$n of $total!" ;;
	"b") /home/linuxbrew/.linuxbrew/bin/brew install $package > /dev/null && echo "Installed $package, #$n of $total!";;
	"p") pipx install $package > /dev/null && echo "Installed $package, #$n of $total!" ;;
	"g") git clone --depth=1 https://github.com/$package $gitpath > /dev/null && echo "Installed $package, #$n of $total!" ;;
	esac
done <$HOME/dotfiles/scripts/debauto.progs
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher; echo "Installed Fisher!"
stow -t $HOME -d $HOME/dotfiles && echo "Stowed Dotfiles!"
sudo cp $HOME/dotfiles/fonts/* /usr/local/share/fonts/ && echo "Copied Fonts!"
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/' /etc/default/grub && sudo update-grub
sudo echo "export EDITOR=$(which nvim)" >> /root/.profile && echo "Nvim is root EDITOR!"
sudo echo "$(which fish)" >> /etc/shells && echo "Added fish to shells!"
chsh -s $(which fish) && echo "Changed default shell to fish!"
