#!/bin/bash

source ../utils.sh

bcecho "WSL Preferences Setup Script" $cyan

sudo_keep_alive

ln -s /mnt/c/Users/tmcro/Dropbox/ $HOME/Dropbox
ln -s /mnt/c/Users/tmcro/Documents/ $HOME/Documents
cp /mnt/c/Users/tmcro/Dropbox/configs/sshconfig $HOME/.ssh/config
sudo cp $HOME/Dropbox/configs/wsl.conf /etc/wsl.conf
ln -s $HOME/Dropbox/configs/zsh/zshrc.zsh $HOME/.zshrc

chsh -s $(which zsh)
