#!/usr/bin/env bash

# Install binary packages using Homebrew (http://brew.sh)
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we're using the latest Homebrew
brew update

# Install wget with IRI support
brew install wget --with-iri

# Install more recent version of vim
brew install vim --with-lua --override-system-vi

# Install everything else
brew install brew-cask-completion
brew install ruby
brew install mongodb
brew install openssl
brew install cscope
brew install ctags
brew install python3


# Remove outdated versions from the cellar
brew cleanup

