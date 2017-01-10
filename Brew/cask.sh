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
brew cask install iterm2
brew cask install macvim
brew cask install telegram
brew cask install whatsapp
brew cask install slack
brew cask install spotify
brew cask install google-chrome
brew cask install postman
brew cask install rdm
brew cask install android-studio
brew cask install google-drive
brew cask install pgadmin4

# IntelliJ 16.04     http://idea.qinxi1992.cn

# Install files preview
brew cask install suspicious-package
brew cask install qlcolorcode 
brew cask install qlstephen
brew cask install qlmarkdown 
brew cask install quicklook-json 
brew cask install qlprettypatch 
brew cask install quicklook-csv 
brew cask install betterzipql 
brew cask install qlimagesize 
brew cask install webpquicklook 


# Remove outdated versions from the cellar
brew cleanup
brew cask cleanup

