#!/bin/bash

source ../utils.sh

bcecho "Ubuntu Preferences Setup Script" $cyan

sudo_keep_alive

../linux/preferences.sh


ln -s $HOME/Dropbox/configs/zsh/zshrc.zsh $HOME/.zshrc
ln -s $HOME/Dropbox/configs/xprofile $HOME/.xprofile
