# Clean install OS X setup with xcode command line tools and brew/brew-cask
# Usage:
# $ bash setup.sh

# Installing xcode command line tools - May Requires user interaction
sudo xcode-select --install
echo "OSXetup > Press any key when install completes"
read tmp
# You might need to open xcode and 'agree' to the terms of service before use?

echo ""
echo "OSXetup > Install homebrew"
echo ""
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

echo ""
echo "OSXetup > Install homebrew programs"
echo ""
brew install wget git vim macvim node fish
brew linkapps

echo ""
echo "OSXetup > Install homebrew cask programs"
echo ""
brew tap caskroom/cask
brew install brew-cask
brew cask install google-chrome firefox iterm2 onyx atom brackets dropbox flux vlc xquartz steam

#echo ""
#echo "OSXetup > Install MacTex via homebrew"
#echo ""
#brew cask install mactex
#Note this installs the full 2.2 GB mactex package. I haven't decided if brew-cask is needed for mactex, might make more sense to just manually d/l from <https://tug.org/mactex/>

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
