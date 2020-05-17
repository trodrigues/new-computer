#!/bin/bash

source ../utils.sh

bcecho "Ubuntu Install Setup Script" $cyan

sudo_keep_alive

../linux/install.sh

sudo snap install --classic code
sudo snap install --classic slack
sudo snap install zoom-client
sudo snap install chromium
sudo snap install caprine


sudo apt-get install -y \
  fonts-cascadia-code \
  gnome-shell-extensions chrome-gnome-shell \
  pavucontrol paprefs pavumeter pulseaudio-equalizer \
  lm-sensors xclip \
  flatpak \
  docker.io docker-compose

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install -y HydraPaper


sudo systemctl enable --now docker
sudo usermod -aG docker trodrigues
