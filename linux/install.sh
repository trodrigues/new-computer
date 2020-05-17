#!/bin/bash

source ../utils.sh

bcecho "Linux Common Install Setup Script" $cyan

sudo_keep_alive

cecho "What's the latest nvm version? Check at https://github.com/creationix/nvm or leave empty to skip" $cyan
read -r NVM_VERSION

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y \
	build-essential \
  curl git tig zsh tmux \
	direnv silversearcher-ag \
	rustc \
	ruby ruby-dev libreadline-dev \
	python3-dev python3-venv python3-wheel pipenv \
	keychain 

cargo install exa

curl -OL https://github.com/thoughtbot/gitsh/releases/download/v0.14/gitsh-0.14.tar.gz
tar -zxvf gitsh-0.14.tar.gz
cd gitsh-0.14
./configure
make
sudo make install
cd ..
rm -rf gitsh-0.14
rm -f gitsh-0.14.tar.gz

# node setup
if [ "$NVM_VERSION" -ne "" ] ; then
	export NVM_DIR="$HOME/.nvm"
	cecho "Installing node via nvm $NVM_VERSION" $cyan
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
	nvm install node
	nvm use node
fi
