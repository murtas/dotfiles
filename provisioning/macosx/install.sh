#!/bin/bash

xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .zshrc.pre-oh-my-zsh .zshrc
echo 'PROMPT=\''%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $(git_prompt_info) %# \'' ' > ~/.oh-my-zsh/themes/murtas.zsh-theme

# Install formulas
cd ~/provisioning/macosx
brew bundle

# fzf post-install
/opt/homebrew/opt/fzf/install
mv .fzf.zsh ~/.zshrc.d/fzf && chmod a+x ~/.zshrc.d/fzf

cd  ~/
git submodule init
git submodule update
