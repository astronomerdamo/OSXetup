Guidelines for developing OSXetup
=================================

The following should serve as a useful guide to setting up an environment to 
help test and develop the OSXetup scripts and tools.


Create a Mac OS X virtual machine
=================================

Mac OS X virtual machines can be created from their Installer apps with the create-OSX-VM.sh script.
This script requires the Ruby gem iesd to manipulate the Installer,
and then uses hdiutil to make an ISO.
VirtualBox's VBoxManage is used to create and modify the VM before launching it.

1. Download your desired Mac OS X Installer from the AppStore

2. Run create-OSX-VM.sh to create a OS X VM with VirtualBox
`./create-OSX-VM.sh`
