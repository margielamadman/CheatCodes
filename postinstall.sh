#!/bin/bash

#Update sources
sudo apt-get update && sudo apt-get upgrade -y

# Install packages
sudo apt -y install build-essential git wget curl software-properties-common network-manager libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake i3 unclutter vim tmux git thunderbird neofetch fonts-noto fonts-inconsolata acpi compton fontconfig scrot htop tlp caca-utils atool mediainfo poppler-utils arandr feh dosfstools exfat-utils ffmpeg ntfs-3g pulsemixer unrar unzip zathura snapd pulseaudio

#Install snaps
sudo snap install vlc
sudo snap install brave

#Install st
# clone the repository
git clone https://github.com/margielamadman/ST-build.git st
cd st

# compile and install
sudo make clean install
cd

#Install i3-gaps
# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
cd
 
#Install fluxgui
sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get install fluxgui

#copy dotfiles
git clone https://github.com/margielamadman/dotfiles.git
cd dotfiles
sudo cp .bash_aliases .bashrc wall.jpg .gitconfig .inputrc .profile .tmux.conf .vimrc .xinitrc ~/
sudo cp unclutter /etc/default/
sudo mkdir -p ~/.config/dunst/ && cp .config/dunst/dunstrc ~/.config/dunst/
sudo mkdir -p ~/.config/fontconfig/ && cp .config/fontconfig/fonts.conf ~/.config/fontconfig/
sudo mkdir -p ~/.config/htop/ && cp .config/htop/htoprc ~/.config/htop/
sudo mkdir -p ~/.config/i3/ && cp .config/i3/config ~/.config/i3/

#done
cd
echo "Please reboot"

