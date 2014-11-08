#!/bin/bash

#Update brew formulae
brew cask update

echo ""
echo "OSXetup > Install homebrew cask programs"
echo ""
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
brew cask cleanup
