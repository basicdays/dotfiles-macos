#!/usr/bin/env sh

# - log in with Apple ID to App Store
# - update existing apps
# - install XCode, Slack, and LastPass from App Store
# - download and install Logitech Options

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
    awscli \
	bash \
	bash-completion \
    gettext \
	git \
	git-flow-avh \
    go \
    htop \
    jq \
    libyaml \
    nginx \
	node \
	nvm \
    pipenv \
    pyenv \
	python \
	shellcheck \
	tmux \
	vim \
	watchman

brew cask install xquartz

brew cask install \
    android-platform-tools \
    docker \
    firefox \
	font-fira-code \
	gimp \
    google-chrome \
	inkscape \
    iterm2 \
    karabiner-elements \
    kdiff3 \
    moom \
    mysqlworkbench \
    postman \
    sourcetree \
    spotify \
    vagrant \
    virtualbox \
    virtualbox-extension-pack \
    visual-studio-code \
    zoomus

npm config set prefix "$HOME/.local"
npm install --global yarn
pip3 install --user powerline-status


# allow repeating keys for VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
