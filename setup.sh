#!/bin/bash -e
./get_dependencies.sh
ssh-keygen
chsh -s $(which fish)
git config --global user.name "Sam Tebbs"
git config --global user.email "samuel.tebbs@gmail.com"
mkdir ~/aur-builds
cd ~/aur-builds

git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
makepkg -Acs .
sudo pacman -U google-chrome*.pkg.tar.xz

cd ..
git clone https://aur.archlinux.org/pulseaudio-ctl.git
cd pulseaudio-ctl
makepkg -Acs .

cd ~/dotfiles
stow vim i3 x nvim fish fonts

setxkbmap -layout gb
