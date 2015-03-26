OSXetup
=======

OS X Setup Script. Tested on Mavericks and up.

Simple script designed to automate the task of setting up a new or freshly wiped mac.
This script installs xcode, homebrew and all programs listed in .brewfile.
Script then formats the dock and restores dotfiles (ie: ~/.vimrc) to home dirrectory using [Mackup](https://github.com/lra/mackup).
OS X specific preferences plan to be added.

Installation
------------

Copy files:

```
git clone https://github.com/astronomerdamo/OSXetup.git
```

Usage
-----

Alter .brewfile and/or .osxdock to your liking OR use your own.
Execute `bootstrap.sh`:

```
./bootstrap.sh
```

The .brewfile included in this repo is an example, feel free to change.

Development
-----------

OSXetup is still young and very much in development.
Thanks to [Andrew Valencik](https://github.com/valencik) for his help and input on this project.
Note: the [Development-Guide](dev/Development-Guide.md) and create-OSX-VM.sh file will soon be branched off into a separate repo.
