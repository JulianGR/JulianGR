#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade

#basics
sudo apt-get install -y git wget curl apt-transport-https software-properties-common ca-certificates gnupg lsb-release python3 python3-pip openjdk-8-jre vlc nomacs kate


#grub
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer


#docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


#spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client


# visual studio

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt-get install code

# desktop appearance
git clone https://github.com/brunelli/gnome-shell-extension-installer.git
cd gnome-shell-extension-installer
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/
cd ..
sudo rm -r gnome-shell-extension-installer
sudo apt-get install -y chrome-gnome-shell gnome-shell-extensions gnome-tweak-tool

gnome-shell-extension-installer 1160
gnome-shell-extension-installer 3628
gnome-shell-extension-installer 906
gnome-shell-extension-installer 19


#flameshot
sudo apt-get install flameshot


# zsh and powerlevel10k

sudo apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# finish
sudo apt-get update
sudo apt-get upgrade
sudo apt autoremove -y



echo "====REMAINING:==="
echo " "
echo "YOU NEED TO REBOOT NOW"
echo " "
echo "+ Configure Settings"
echo "+ Wallpaper"
echo "+ Shortcut flameshot gui"
echo "+ Import configs for Dash to Panel and Arc menu"
echo "+ Finish shell:"
echo "	(first install fonts)- https://github.com/romkatv/powerlevel10k"
echo "	https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh"
