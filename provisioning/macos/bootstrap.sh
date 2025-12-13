#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    until xcode-select -p >/dev/null 2>&1; do
        sleep 5
    done
else
    echo "Xcode Command Line Tools already installed."
fi

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# Brew bundle
cd "$DOTFILES/provisioning/brew"
brew bundle

# fzf post-install
if [ -x /opt/homebrew/opt/fzf/install ]; then
    yes | /opt/homebrew/opt/fzf/install --no-bash --no-fish --no-update-rc || true
else
    echo "fzf shell integration already installed."
fi

echo "macOS-specific provisioning complete."
