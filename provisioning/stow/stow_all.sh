#!/usr/bin/env bash
set -euo pipefail


DOTFILES="$HOME/dotfiles"

# Load shared package list
source "$DOTFILES/provisioning/stow/stow_packages.sh"

cd "$DOTFILES/stow"

echo "Removing ~/.zshrc (if it exists)..."
rm -i ~/.zshrc || true

for pkg in "${STOW_PACKAGES[@]}"; do
    echo "Stowing $pkg..."
    stow -v -R -t ~ "$pkg"
done

# Neovim: stow into ~/.config
mkdir -p ~/.config
echo "Stowing nvim..."
stow -v -R -t ~/.config config
