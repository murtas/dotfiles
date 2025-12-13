#!/usr/bin/env bash
set -euo pipefail

OS="$(uname -s)"
DOTFILES="$HOME/dotfiles"

case "$OS" in
    Darwin)
        "$DOTFILES/provisioning/macos/bootstrap.sh"
        ;;
    Linux)
        echo "Missing Linux setup"
        ;;
    *)
        echo "Unsupported OS: $OS"
        ;;
esac

"$DOTFILES/provisioning/common.sh"
