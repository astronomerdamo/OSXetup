Guidelines for developing OSXetup
=================================

The following should serve as a useful guide to setting up an environment to 
help test and develop the OSXetup scripts and tools.


Create a Mac OS X virtual machine
=================================

1. Install Oracle's Virtualbox  
`brew cask install virtualbox`

2. Install iesd to help manipulate Installer
`gem install iesd`

3. Download your desired Mac OS X Installer from the AppStore

4. Run installer2iso.sh to create a Yosemite disk for use with Virtual Box
`./modifyOSXInstaller.sh`
