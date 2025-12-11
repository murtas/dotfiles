#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# Load shared package list
source "$DOTFILES/provisioning/stow/stow_packages.sh"

cd "$DOTFILES/stow"

echo "=== Unstowing dotfiles ==="

for pkg in "${STOW_PACKAGES[@]}"; do
    echo "Unstowing $pkg..."
    stow -v -D -t ~ "$pkg" || true
done

# Unstow Neovim from ~/.config
echo "Unstowing nvim (config package) from ~/.config..."
stow -v -D -t ~/.config config || true

echo "Done."
