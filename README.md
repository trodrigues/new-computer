# Setting up a new computer

A personal setup script for setting up a new macOS environment after a fresh install.

If you fork this, adjust to your needs.

Based on https://github.com/nnja/new-computer which in itself uses resources from the following:

- https://github.com/ruyadorno/installme-osx/
- https://gist.github.com/millermedeiros/6615994
- https://gist.github.com/brandonb927/3195465/

----


# Manual Configuration

These apps need to be configured manually.

For OSX settings, I'm still looking for the command line way to change this preference.

#### Set Scroll Reverser preferences

##### Scrolling Section

Checked:

- Reverse Scrolling
- Reverse vertical
- Reverse horizontal
- Reverse Mouse

Unchecked:
- Reverse Trackpad

##### App Section

Checked:

- Start at login

Unchecked:

- Show in menu bar

#### Iterm2

* Iterm2 -> Preferences -> General
	* Check: Load preferences from custom folder /Users/nina/dotfiles/iterm-profiles
	* Check: Save changes to folder when Iterm2 quits

#### System Preferences Configuration

**Users & Groups**

* make sure guest account is turned off

**Keyboard**

* Use F1, F2 as standard function keys: ON
* Turn off spotlight (use Alfred instead)
	* Keyboard -> Shortcuts -> Spotlight -> Deselect all
* Customize control strip -> Delete siri from touchbar
* Touch Bar Shows -> F1, F2, etc. Keys

**General**

* Recent items: None
* Appearance: Graphite
* Highlight color: Pink

**Mission Control**

* Dashboard: As Overlay

**Desktop & Screen Saver**

* Screensaver
	* Hot Corners
		* Top right -> Dashboard
		* Bottom right -> Start screen saver

**Trackpad**

* Tap to click: ON
* Secondary click: ON

**Display**

* Night Shift (flux) -> Schedule -> Sunrise to Sunset

**Security & Privacy**

* Firewall -> on
* Firewall options -> Enable stealth mode
* FileVault -> Turn On FileVault (encrypt harddrive)

**Sharing**

* Ensure everything is unchecked

**Finder Preferences**

* General
	* New finder window show: home folder
* Sidebar
	* Show home, remove Recents
* Advanced
	* Show all filename extensions: ON
	* Show warning before changing an extension: OFF
	* Show warning before emptying the trash: OFF

**TrackPad**

* Point & Click
	* Silent clicking -> On

#### Chrome

* Sign into chrome to sync profile & bookmarks
* Chrome -> Warn before quitting: ON

#### Alfred

* Set Double Cmd to Alfred hotkey

#### Configure VPN

#### SizeUp

* configure license
* settings -> automatically start at login

#### Karabiner Elements

* Simple Modifications
	* From key caps_lock to key left_control (Remap caps lock to control for emacs)
	* From key right_control to key `b` (custom setting for my ergonomic keyboard)
* Devices
	* For all devices -> Caps Lock LED Check Manipulate LED

#### Arduino IDE (Set up to use with Adafruit boards)

* Preferences -> Additional Boards Manager URLS -> https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
* Tools -> Board -> Board Manager. Install:
	* Arduino SAMD Boards
	* Adafruit AVR Boards
* Sketch -> Include Library -> Manage Libraries. Install:
	* Adafruit NeoPixel
	* FastLED

#### Dash

* Download
* docs for:
	* python2
	* python3
	* django
	* flask
	* arduino
	* processing
	* man pages
* cheatsheets for:
	* emacs
	* git
	* python debugger
	* python unittest assertions

### Limechat

* log into freenode

### Widgets

Useful [shipping status tracker widget](https://junecloud.com/software/dashboard/delivery-status.html)

#### Optional

Apps:

* [Send to kindle for Mac](https://www.amazon.com/gp/sendtokindle/mac)
* [Delivery Status Dashboard Widget](https://www.apple.com/downloads/dashboard/shopping/deliverystatus.html)
* [Flip Clock Screensaver](https://fliqlo.com/#about)
* [FlyCut Clipboard Manager](https://github.com/TermiT/Flycut)
* Visit [this page](http://optout.aboutads.info/) to opt out of ads (turn off adblock first)

#### Todos

- Configure touchbar?
	- See: https://blog.eriknicolasgomez.com/2016/11/28/managing-or-setting-the-mini-touchbar-control-strip/
- Set up wallpaper
	- osascript -e 'tell application "Finder" to set desktop picture to "/Users/wilsonmar/Pictures/wallpapers/macOS-High-Sierra-Wallpaper-2880x1494.jpg" as POSIX file'
- Set up alfred powerpack