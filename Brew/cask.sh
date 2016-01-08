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
brew cask install mongohub
brew cask install smartgit
brew cask install telegram
brew cask install unrarx
brew cask install google-chrome
brew cask install intellij-idea-ce
brew cask install spotify
#brew cask install tuxera-ntfs
brew cask install firefox
brew cask install android-studio
brew cask install android-sdk
brew cask install sublime-text
brew cask install vlc
brew cask install virtualbox
brew cask install slack
brew cask install flash-player
brew cask install libreoffice
#brew cask install osxfuse
#brew homebrew/fuse/ntfs-3g

# Remove outdated versions from the cellar
brew cleanup
brew cask cleanup

