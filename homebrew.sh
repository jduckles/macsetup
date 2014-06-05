#!/bin/sh 
## Install homebrew if necessary and install source and cask packages
GITUSER=jduckles
APPSLIST=https://raw.githubusercontent.com/${GITUSER}/macconfig/master/apps
BREWLIST=https://raw.githubusercontent.com/${GITUSER}/macconfig/master/brews

installbrew() {
    # If we can't find homebrew, install it
    hash brew 2>/dev/null || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)";
        brew tap caskroom/cask;
        brew install caskroom/cask/brew-cask;
    }
}


brews() {
    # Install all brews 
    for app in $(curl ${BREWLIST}); do
        brew install $app
    done
}

casks() {
    # install all casks in apps
    for app in $(curl ${APPSLIST}); do
        brew cask install $app
    done
}

installbrew
brews
casks



