#!/usr/bin/env sh

# - uninstall Chrome if still installed as global app
# - log in with Apple ID to App Store
# - update existing apps
# - install XCode, Slack from App Store
# - download and install Logitech Options
# - download and install Chrome
# - download and install VSCode

# Following forces input not to change when connecting bluetooth devices
# - Open Audio MIDI Setup under Applications/Utilities
# - Add new Aggregate Device, select appropriate input (e.g. MacBook Pro Microphone)
# - Open System Preferences -> Audio -> Input -> Select "Aggregate Device"


# The following will Force audio input to not change when connecting bluetooth devices.
# You can either use a GUI application with the following instructions, or run the following
# command to set the option via terminal. You can check if the settings worked if you connect
# the output device, play music, then option+click the bluetooth icon in the menu bar and see
# if the aptX codec is being used. If it is SBC, then it did not work.
#
# - open Xcode -> go to Xcode menu -> Open Developer Tool -> More Developer Tools...
# - Download "Additional Tools for Xcode xx"
# - Put Bluetooth Explorer anywhere (e.g. Applications)
# - Open Bluetooth Explorer
#   - Tools -> Audio Options -> Check "Force use of aptX"
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true


# additional commandline tools
xcode-select --install

# install homebrew (maybe download the script instead of curling straight into eval?)
# https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
	autoconf \
    awscli \
	bash \
	bash-completion \
    curl \
    gettext \
	git \
	git-flow-avh \
    htop \
    jq \
    libyaml \
    mono \
    nginx \
	node \
	nvm \
    pipenv \
    pyenv \
	python \
	shellcheck \
	tmux \
	vim \
	watchman \
	yarn

# does xquartz need to be installed first?
brew cask install \
    android-platform-tools \
	font-fira-code \
	gimp \
	inkscape \
    iterm2 \
    kdiff3 \
    wine-stable \
	xquartz \


# allow repeating keys for VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false


# run kdiff3 dmg, copy to applications first
hdiutil attach kdiff3-0.9.98-MacOSX-64Bit.dmg
cp -R /Volumes/kdiff3/kdiff3.app /Applications
hdiutil detach /Volumes/kdiff3
ln -s /Applications/kdiff3.app/Contents/MacOS/kdiff3 /usr/local/bin


# Download and install Docker, optionally Kitematic
