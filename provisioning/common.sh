#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

# oh-my-zsh (non-interactive)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh (non-interactive)..."
    export ZSH="$HOME/dotfiles/zsh/.oh-my-zsh"
    RUNZSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed."
fi

# Define the custom plugins directory
CUSTOM_PLUGINS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

# List of external plugins to check and clone
# Format: "folder_name|repository_url"
external_plugins=(
  "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions"
  "zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting.git"
  "zsh-interactive-cd|https://github.com/changyuheng/zsh-interactive-cd.git"
)

# Loop through and clone if missing
for plugin in "${external_plugins[@]}"; do
  name="${plugin%%|*}"
  url="${plugin#*|}"
  
  if [ ! -d "$CUSTOM_PLUGINS_DIR/$name" ]; then
    echo "Installing plugin: $name..."
    git clone "$url" "$CUSTOM_PLUGINS_DIR/$name"
  fi
done

# Powerlevel10k
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo "Powerlevel10k already installed."
fi

# Permissions for subscripts
chmod a+x "$HOME/.zshrc.d/"* || true

# Git submodules
cd "$DOTFILES"
git submodule update --init --recursive

# Stow dotfiles
"$DOTFILES/provisioning/stow/stow_all.sh"

echo "Common provisioning complete."
