#!/bin/bash

source ../utils.sh

bcecho "Linux Common Install Setup Script" $cyan

sudo_keep_alive

cecho "What's the latest nvm version? Check at https://github.com/creationix/nvm" $cyan
read -r NVM_VERSION

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y \
	build-essential \
  curl git tig zsh tmux \
	direnv silversearcher-ag \
	rustc \
	ruby \
	python3-dev python3-venv python3-wheel pipenv \
	keychain 

cargo install exa

sudo gem install tmuxinator gitsh

# node setup
cecho "Installing node via nvm $NVM_VERSION" $cyan
curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install node
nvm use node
