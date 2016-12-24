#!/usr/bin/env bash

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

# Spacemacs configuration file
cp ./spacemacs/.spacemacs ~/.spacemacs
