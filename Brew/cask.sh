#!/usr/bin/env bash

# Install apps using Homebrew-Cask (http://caskroom.io/)

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `cask.sh` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update Homebrew to ensure we are using the latest Homebrew-cask version
brew update

# Install Java 6 required by some apps
brew cask install java
brew install maven


# Install applications
brew cask install macvim
brew cask install telegram
brew cask install chitchat
brew cask install slack
brew cask install spotify
brew cask install unrarx
brew cask install google-chrome
brew cask install postman
brew cask install intellij-idea  # http://us.idea.lanyus.com/     http://idea.qinxi1992.cn
brew cask install firefox
brew cask install android-studio
brew cask install android-sdk
brew cask install vlc
brew cask install virtualbox
brew cask install flash-player
brew cask install libreoffice
brew cask install suspicious-package
brew cask install dockertoolbox

# Install the docker machine

curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine

# Remove outdated versions from the cellar
brew cleanup
brew cask cleanup

