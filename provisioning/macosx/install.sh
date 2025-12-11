#!/bin/bash -eu

DOTFILES="$HOME/dotfiles"

# Xcode Command Line Tools
if ! xcode-select -p >/dev/null 2>&1; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    # Wait until installation finishes
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


# oh-my-zsh (non-interactive install)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh (non-interactive)..."
    export ZSH="$HOME/dotfiles/zsh/.oh-my-zsh"
    RUNZSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed."
fi

# Custom theme 
mkdir -p "$HOME/.oh-my-zsh/custom/themes"
cat > $HOME/.oh-my-zsh/custom/themes/murtas.zsh-theme <<'EOF'
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b $(git_prompt_info) %# '
EOF


# Brew Bundle
cd $DOTFILES/provisioning/macosx
brew bundle

# fzf post-install
if [ -x /opt/homebrew/opt/fzf/install ]; then
    yes | /opt/homebrew/opt/fzf/install --no-bash --no-fish
fi

# Git submodules
cd "$DOTFILES"
git submodule update --init --recursive

# GNU Stow installation
if ! command -v stow >/dev/null 2>&1; then
    echo "Installing GNU Stow..."
    brew install stow
fi


"$DOTFILES/provisioning/stow/stow_all.sh"

chmod a+x $HOME/.zshrc.d/*

echo "macOS provisioning complete!"
