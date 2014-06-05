#!/bin/sh 
## Install homebrew if necessary and install source and cask packages

APPSLIST=https://github.com/jduckles/macconfig/master/apps/raw
BREWLIST=https://github.com/jduckles/macconfig/master/brews/raw

installbrew() {
    hash brew 2>/dev/null || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"}

}

brews() {
    for app in $(curl ${BREWLIST}); do
        brew install $app
    done
}

casks() {
    for app in $(curl ${APPSLIST}); do
        brew cask install $app
    done
}

installbrew
brews
casks



