#!/usr/bin/bash

sudo apt-get update

sudo apt install -y virtualbox-guest-* appstream apt-config-icons apt-file apt-transport-https binutils-mingw-w64-x86-64 bloodhound cgroupfs-mount cherrytree code default-mysql-client ffuf fonts-open-sans ftp fwupd	fwupd-amd64-signed gnome-software gnome-software-common hexedit kate mingw-w64-common mingw-w64-x86-64-dev neo4j nfs-common  nomacs npm openvpn pngcheck rlwrap rpcbind runc seclists software-properties-common software-properties-gtk ssss volatility3 openjdk-14-jdk openjdk-14-jre fonts-powerline flameshot openvpn-systemd-resolved git wget curl python3 python3-pip openjdk-8-jre vlc  kate p7zip-full nodejs npm build-essential python3-pip python3-dev python3-setuptools ca-certificates curl gnupg lsb-release

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# MATE terminal themes
git clone https://github.com/HattDroid/MateTermColors
cd MateTermColors/themes
./spacedust.sh
cd 


# manual install
#
# burp
#
# zsh: https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0
# https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell
#
# openstego: https://github.com/syvaidya/openstego/releases 
#
# nessus
# docker: https://docs.docker.com/engine/install/debian/
# crackmapexec
# nishang
# python2
# cambiar el dock-applet: http://www.webupd8.org/2015/05/dock-applet-icon-only-window-list-for.html
# SHORTCUTS
#
# grub
# sudo nano /etc/default/grub
# GRUB_TIMEOUT=1
# sudo update-grub
