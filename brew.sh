#!/bin/bash

#Update brew formulae and existing installs
brew update
brew upgrade

echo ""
echo "OSXetup > Install homebrew programs"
echo ""
brew install git
brew install vim --with-python3
brew install wget
brew install node
brew tap caskroom/cask
brew install brew-cask

#Link applications
brew linkapps

#Remove old versions from the hombrew cellar
brew cleanup -s --force
