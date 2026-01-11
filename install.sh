#!/bin/bash

# Dotfiles installation script

set -e

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$HOME/.dotfiles_backup"

echo "Installing dotfiles from $DOTFILES_DIR"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Created backup directory: $BACKUP_DIR"
fi

# Function to install a dotfile
install_dotfile() {
    local source="$1"
    local target="$2"

    # If target exists and is not a symlink, back it up
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target to $BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/$(basename $target).$(date +%Y%m%d_%H%M%S)"
    fi

    # Remove existing symlink if it exists
    if [ -L "$target" ]; then
        rm "$target"
    fi

    # Create symlink
    ln -s "$source" "$target"
    echo "Linked $source -> $target"
}

# Install dotfiles
install_dotfile "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
install_dotfile "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

echo ""
echo "Installation complete!"
echo "Please restart your shell or run: source ~/.zshrc"
echo ""
echo "Note: Edit ~/.gitconfig to update your name and email"
