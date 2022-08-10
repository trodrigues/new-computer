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
brew tap homebrew/cask
brew tap thoughtbot/formulae
brew update
brew upgrade

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

brewit asdf
brewit awscli
brewit cloc
brewit dfu-util
brewit direnv
brewit exa
brewit fnm
brewit gawk
brewit git
brewit gitsh
brewit go
brewit hub
brewit imagemagick
brewit jenv
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
brewit svn # needed for fonts
brewit the_silver_searcher
brewit tig
brewit tmux
brewit tree
brewit wallpaper
brewit wget
brewit zsh
brewit zsh-completions

gem install tmuxinator

echo "Starting brew cask install..."

caskit 1password
caskit acorn
caskit alfred
caskit caffeine
caskit calibre
caskit carbon-copy-cloner
caskit charles
caskit choosy
caskit coteditor
caskit daisydisk
caskit discord
caskit docker
caskit dropbox
caskit firefox
caskit google-chrome
caskit google-drive
caskit hammerspoon
caskit homebrew/cask-versions/google-chrome-canary
caskit istat-menus
caskit iterm2
caskit karabiner-elements
caskit kiibohd-configurator
caskit logitech-g-hub
caskit notion
caskit visual-studio-code
caskit vlc
caskit witch
caskit zoom

#############################################
### Fonts
#############################################

echo "Installing fonts..."

brew tap homebrew/cask-fonts

caskit font-cascadia-code
caskit font-fira-code
caskit font-hack
caskit font-inconsolata
caskit font-iosevka
caskit font-lato
caskit font-museo
caskit font-open-sans
caskit font-roboto
caskit font-source-code-pro

############################################

brew cleanup
