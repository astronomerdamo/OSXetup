#!/bin/bash
# Clean install OS X setup with xcode command line tools and brew/brew-cask

# Define mesage output types and colours
ERROR="$(tput setaf 1)ERROR:$(tput sgr 0)"
BOOTSTRAP="$(tput setaf 2)BOOTSTRAP:$(tput sgr 0)"

# Change to home folder
cd $HOME 

# Ask admin password and keep-alive until script finishes.
sudo -v
while true; do
  sudo -n true;
  sleep 60;
  kill -0 "$$" || exit;
done 2>/dev/null &

echo "${BOOTSTRAP} Installing xcode command line tools - May require user interaction"
sudo xcode-select --install
read -p "${BOOTSTRAP} Press any key when Xcode install completes"

echo "${BOOTSTRAP} Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

echo "${BOOTSTRAP} Installing formulae and casks from .brewfile..."
brew tap homebrew/brewdler
brew brewdle
brew cleanup -s --force
brew cask cleanup --force

# Python install prompt
read -n "${BOOTSTRAP} Do you want to install Python? [y/n] > "
read pyAnswer
case $pyAnswer in
    [yY]) 
        echo "Source: 1 - homebrew Python (Python 3 only)"
        echo "        2 - Anaconda Python (Miniconda, Continuum Analytics)"
        echo -n "[1/2] > "
        read pyChoice
        case $pyChoice in
            [1])
                echo "Installing Python via homebrew"
                brew install python3
                pip3 install --upgrade pip
                pip3 install setuptools
                ;;
            [2])
                echo "Which Python: 1 - Python 2.7"
                echo "              2 - Python 3.4"
                echo "              3 - Python 2.7 and Python 3.4"
                echo -n "[1,2,3] > "
                read minicondaChoice
                case $minicondaChoice in
                    [1])
                        echo "Installing Python 2.7 via miniconda"
                        wget -O ~/Downloads/Miniconda.sh http://repo.continuum.io/miniconda/Miniconda-3.8.3-MacOSX-x86_64.sh 
                        bash ~/Downloads/Miniconda.sh
                        rm ~/Downloads/Miniconda.sh
                        ;;
                    [2])
                        echo "Installing Python 3.4 via miniconda3"
                        wget -O ~/Downloads/Miniconda3.sh http://repo.continuum.io/miniconda/Miniconda3-3.8.3-MacOSX-x86_64.sh
                        bash ~/Downloads/Miniconda3.sh
                        rm ~/Downloads/Miniconda3.sh
                        ;;
                    [3])
                        echo "Installing Python 2.7 via miniconda"
                        wget -O ~/Downloads/Miniconda.sh http://repo.continuum.io/miniconda/Miniconda-3.8.3-MacOSX-x86_64.sh
                        bash ~/Downloads/Miniconda.sh
                        rm ~/Downloads/Miniconda.sh
                        echo "Installing Python 3.4 via miniconda3"
                        wget -O ~/Downloads/Miniconda3.sh http://repo.continuum.io/miniconda/Miniconda3-3.8.3-MacOSX-x86_64.sh
                        bash ~/Downloads/Miniconda3.sh
                        rm ~/Downloads/Miniconda3.sh
                        ;;
                    *)
                        echo "Not a valid option - skipping"
                        ;;
                esac
                ;;
            *) 
                echo "Not a valid option - skipping"
                ;;
        esac    
        ;;
    *)
        echo "Okay, but you're missing out."
        ;;
esac

echo "${BOOTSTRAP} Running dock formatting..."
./.osxdock

echo "${BOOTSTRAP} Installing oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

echo "${BOOTSTRAP} You'll need to sign into dropbox so we restire mackup"
open -a dropbox

echo "${BOOTSTRAP} Restoring mackup"
mackup restore
