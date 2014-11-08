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
brew install macvim
brew install node
brew install fish

#Link applications
brew linkapps

echo ""
echo "OSXetup > Install homebrew cask programs"
echo ""
brew tap caskroom/cask
brew install brew-cask
brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install onyx
brew cask install atom
brew cask install brackets
brew cask install dropbox
brew cask install flux
brew cask install vlc
brew cask install xquartz
brew cask install steam

#Remove old versions from the hombrew cellar
brew cleanup
