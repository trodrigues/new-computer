#!/bin/bash

source ../utils.sh

bcecho "Mac OS Install Setup Script" $cyan

echo ""
bcecho "###############################################" $red
bcecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
bcecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
bcecho "#                                             #" $red
bcecho "#              READ IT THOROUGHLY             #" $red
bcecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
bcecho "###############################################" $red
echo ""

bcecho "Don't forget to set display sleep and screen saver to Never" $magenta

echo ""

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "understood that it will make changes to your computer? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

sudo_keep_alive

##############################
# Prerequisite: Install Xcode and CLI tools #
##############################
xcode-select --install

##############################
# Prerequisite: Install Brew #
##############################

echo "Installing brew..."

if test ! $(which brew)
then
	## Don't prompt for confirmation when installing homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Latest brew, install brew cask
brew upgrade
brew update
brew tap homebrew/cask
brew tap thoughtbot/formulae

#############################################
### Installs from Mac App Store
#############################################

echo "Installing apps from the App Store..."

### find app ids with: mas search "app name"
brewit mas

### Mas login is currently broken on mojave. See:
### Login manually for now.
cecho "Need to log in to App Store manually to install apps with mas...." $red
echo "Opening App Store. Please login."
open "/System/Applications/App Store.app"
echo "Is app store login complete.(y/n)? "
read response
if [ "$response" != "${response#[Yy]}" ]
then
	# Tweetbot 3
	mas install 1384080005
	# Slack
	mas install 803453959
	# Translate Tab
	mas install 458887729
	# The Unarchiver
	mas install 425424353
	# Sketch 3
	mas install 852320343
	# Shush 
	mas install 496437906
	# Pocket
	mas install 568494494
	# Patterns
	mas install 429449079
	# HexColor
	mas install 446103121
	# Gif Brewery 3
	mas install 1081413713
	# Gestimer
	mas install 990588172
else
	cecho "App Store login not complete. Skipping installing App Store Apps" $red
fi

##############################
# Install via Brew           #
##############################

echo "Starting brew install..."

brewit awscli
brewit cloc
brewit dfu-util
brewit direnv
brewit gawk
brewit git
brewit gitsh
brewit go
brewit hub
brewit imagemagick
brewit jq
brewit macvim
brewit netcat
brewit nmap
brewit pidof
brewit postgresql
brewit python
brewit rbenv
brewit readline
brewit reattach-to-user-namespace
brewit redis
brewit rename
brewit ruby
brewit ruby-build
brewit rust
brewit the_silver_searcher
brewit tig
brewit tmux
brewit tree
brewit wallpaper
brewit wget
brewit zsh
brewit exa
brewit zsh-completions
brewit jenv
brewit fnm

gem install tmuxinator

echo "Starting brew cask install..."

caskit alfred
caskit notion
caskit dropbox
caskit 1password
caskit iterm2
caskit kitty
caskit witch
caskit istat-menus
caskit tuxera-ntfs
caskit hammerspoon
caskit karabiner-elements
caskit logitech-g-hub
caskit google-chrome
caskit homebrew/cask-versions/google-chrome-canary
caskit firefox
caskit docker
caskit visual-studio-code
caskit caffeine
caskit vlc
caskit acorn
caskit carbon-copy-cloner
caskit daisydisk
caskit franz
caskit kiibohd-configurator
caskit charles
caskit choosy
caskit calibre


#############################################
### Fonts
#############################################

echo "Installing fonts..."

brew tap homebrew/cask-fonts

caskit font-hack
caskit font-inconsolata
caskit font-lato
caskit font-museo
caskit font-open-sans
caskit font-source-code-pro
caskit font-fira-code
caskit font-cascadia-code



############################################

brew cleanup

