#!/bin/bash

# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}
bcecho() {
	tput bold
  echo "${2}${1}${reset}"
  return
}


secho() {
	echo ""
	bcecho "################################################################################" $yellow
	bcecho "# $1" $yellow
	bcecho "################################################################################" $yellow
	echo ""
}

brewit() {
	bcecho "brew install $1" $cyan
	brew install "$1"
}
caskit() {
	bcecho "brew  install --cask $1" $cyan
	brew install --cask "$1"
}

sudo_keep_alive() {
  # Ask for the administrator password upfront and run a
  # keep-alive to update existing `sudo` time stamp until script has finished
  sudo -v
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}
