#!/bin/bash

source ../utils.sh

bcecho "Linux Preferences Setup Script" $cyan

sudo_keep_alive

chsh -s $(which zsh)