#!/bin/bash

# Homebrew
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Stow
if ! command -v stow &> /dev/null
then
    echo "Stow is not installed. Installing Stow..."
    brew install stow
else
    echo "Stow is already installed."
fi

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle

# Array of directories to stow
dirs=(nvim alacritty tmux git zsh karabiner starship)

# Loop through directories and stow them
for dir in "${dirs[@]}"
do
    stow -v -R -t ~ $dir
done

echo "🚀 Dotfiles installation complete!"
