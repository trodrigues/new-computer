#!/bin/bash

source ../utils.sh

bcecho "WSL Install Setup Script" $cyan

sudo_keep_alive


../linux/install.sh

sudo apt-get install -y \
	keychain \
