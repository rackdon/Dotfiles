#!/usr/bin/env bash

# Install binary packages using Homebrew (http://brew.sh)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we're using the latest Homebrew
brew update

# Install wget with IRI support
brew install wget --with-iri

# Install more recent version of vim
brew install vim --with-lua --with-override-system-vi

# Install everything else
brew install mongodb
brew install node
brew install awscli
brew install sbt
brew install scala
brew install leiningen
brew install boot-clj
brew install planck

# Update boot
boot -u

#Install npm packages
npm install -g nave
npm -g install instant-markdown-d

# Git configuration
git config --global push.default simple

# Create mongodb directory
sudo mkdir -p /data/db
sudo chown -R $USER /data/db

# Bloq num remap => https://github.com/tekezo/Karabiner-Elements 
# (SO under sierra 10.12)
#mkdir -p ~/.karabiner.d/configuration/
#cd ~/.karabiner.d/configuration/
#curl -L -o karabiner.json https://raw.githubusercontent.com/tekezo/Karabiner-Elements/master/examples/change_caps_lock_to_escape.json

# Remove outdated versions from the cellar
brew cleanup

