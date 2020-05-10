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
  xclip \
  docker.io

sudo systemctl enable --now docker
sudo usermod -aG docker trodrigues