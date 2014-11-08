#!/bin/bash
# Clean install OS X setup with xcode command line tools and brew/brew-cask

# Installing xcode command line tools - May Requires user interaction
sudo xcode-select --install
echo "OSXetup > Press any key when install completes"
read tmp

echo ""
echo "OSXetup > Install homebrew"
echo ""
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo ""
echo "OSXetup > Install brew formulae from brew.sh"
echo ""
./brew.sh

echo ""
echo "OSXetup > Install brew casks from cask.sh"
echo ""
./cask.sh

# Python install prompt
echo ""
echo -n "OSXetup > Do you want to install Python? [y/n] > "
read pyAnswer
case $pyAnswer in
    [yY])
        echo "Note: all python installations are Python 3"
        echo "Source: 1 - homebrew Python"
        echo "        2 - Anaconda Python (Continuum Analytics)"
        echo -n "[1/2] > "
        read pyChoice
        case $pyChoice in
            [1])
                echo "Installing Python via homebrew"
                brew install python3
                pip3 install --upgrade pip3
                pip3 install setuptools
                ;;
            [2])
                echo "Installing Python via Anaconda (Continuum Analytics)"
                wget -O ~/Downloads/Miniconda3-3.7.0-MacOSX-x86_64.sh http://repo.continuum.io/miniconda/Miniconda3-3.7.0-MacOSX-x86_64.sh
                bash ~/Downloads/Miniconda3-3.7.0-MacOSX-x86_64.sh
                rm ~/Downloads/Miniconda3-3.7.0-MacOSX-x86_64.sh
                ;;
            *) 
                echo "Not a valid option - skipping install"
                ;;
        esac    
        ;;
    *)
        echo "Okay, but you're missing out."
        ;;
esac
