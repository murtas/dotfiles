#!/bin/bash

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cd ~/provisioning/macosx
brew bundle

cd  ~/
git submodule init
git submodule update
