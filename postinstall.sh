#!/bin/bash
#RUN with sudo

#Update sources
apt-get update && apt-get upgrade -y

# Install packages
apt -y install build-essential git wget curl software-properties-common ubuntu-drivers-common xorg xserver-xorg volumeicon-alsa network-manager libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake i3 unclutter vim tmux git thunderbird neofetch fonts-noto fonts-inconsolata acpi compton fontconfig scrot htop tlp caca-utils atool mediainfo poppler-utils arandr feh dosfstools exfat-utils ffmpeg ntfs-3g pulsemixer unrar unzip zathura snapd pulseaudio x11-xkb-utils mesa-utils mesa-utils-extra network-manager-gnome

#Install snaps
snap install vlc
snap install brave

#Install st
# clone the repository
cd
git clone https://github.com/margielamadman/ST-build.git st
cd st

# compile and install
make clean install
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
make install
cd
 
#Install fluxgui
add-apt-repository ppa:nathan-renniewaldock/flux -y
apt-get update
apt-get -y install fluxgui

#copy dotfiles
git clone https://github.com/margielamadman/dotfiles.git
cd dotfiles
cp .bash_aliases .bashrc wall.jpg .gitconfig .inputrc .profile .tmux.conf .vimrc .xinitrc ~/
cp unclutter /etc/default/
cp grub /etc/default/
mkdir -p ~/.config/dunst/ && cp .config/dunst/dunstrc ~/.config/dunst/
mkdir -p ~/.config/fontconfig/ && cp .config/fontconfig/fonts.conf ~/.config/fontconfig/
mkdir -p ~/.config/htop/ && cp .config/htop/htoprc ~/.config/htop/
mkdir -p ~/.config/i3/ && cp .config/i3/config ~/.config/i3/

#update grub
update-grub && update-grub2

#create directories
cd
mkdir Documents
mkdir Downloads
mkdir ~/Documents/repos
mkdir ~/.ssh
mkdir -p /media/usb
chown -R $USER:$USER /home/$USER/

#done
cd
echo "Copy over your ssh keys and fill out your gitconfig."
echo "Please reboot."

