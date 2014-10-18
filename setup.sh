# Clean install OS X setup with xcode command line tools and brew/brew-cask

# Installing xcode command line tools - May Requires user interaction
sudo xcode-select --install

# Install homebrew for OS X
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
# You might need to open xcode and 'agree' to the terms of service before use?
# I'm getting a brew warning saying xcode 6.0.1 is not xcode 6.1. but 6.0.1 is the most current version. Refer to this thread <https://github.com/Homebrew/homebrew/issues/32421>. I downloaded a copy of 6.1 given in the thread desipte a message saying 6.0.1 was newer.

# Install brew programs
brew install wget git vim macvim node fish

# Tap in install brew-cask along with binary apps
brew tap caskroom/cask
brew install brew-cask
brew cask install google-chrome firefox iterm2 onyx atom brackets dropbox flux vlc xquartz

#brew cask install mactex
# Note this installs the full 2.2 GB mactex package. I haven't decided if brew-cask is needed for mactex, might make more sense to just manually d/l from <https://tug.org/mactex/>

# Python install prompt
echo -n "Do you want to install Python? [y/n] > "
read pyAnswer

if [ "$pyAnswer" == "y" ]; then
    echo "Note all python installations are Python 3"
    echo -n "Source: 1 - homebrew Python, 2 - Anaconda Python (Continuum Analytics) [1/2] > "
    read pyChoice
    
    if [ "$pyChoice" == 1 ]; then
        echo "Installing Python via homebrew"
        brew install python3
        pip3 install --upgrade pip3
        pip3 install setuptools
    else
        wget -O ~/Downloads/Miniconda3-3.7.0-MacOSX-x86_64.sh http://repo.continuum.io/miniconda/Miniconda3-3.7.0-MacOSX-x86_64.sh
        bash ~/Downloads/Miniconda3-3.7.0-MacOSX-x86_64.sh
    fi

else
    echo "Okay, no Python but you're missing out"
fi
