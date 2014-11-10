#!/bin/bash

#Update brew formulae and existing installs
brew update
brew upgrade

echo ""
echo "OSXetup > Install homebrew programs"
echo ""
brew install wget
brew install git
brew install vim --with-python3
brew install node
brew install fish

#Link applications
brew linkapps

echo ""
echo "OSXetup > Install homebrew cask"
echo ""
brew tap caskroom/cask
brew install brew-cask

#Remove old versions from the hombrew cellar
brew cleanup
