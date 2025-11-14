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

# asdf
if [ ! -d "$HOME/.asdf" ]; then
    echo "asdf is not installed. Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
else
    echo "asdf is already installed."
fi

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh is not installed. Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "oh-my-zsh is already installed."
fi

# deno
if ! command -v deno &> /dev/null; then
    echo "deno is not installed. Installing deno..."
    curl -fsSL https://deno.land/install.sh | sh
else
    echo "deno is already installed."
fi

# Array of directories to stow
dirs=(nvim alacritty tmux git zsh karabiner starship obsidian ghostty)

# Loop through directories and stow them
for dir in "${dirs[@]}"
do
    stow -v -R -t ~ $dir
done

echo "🚀 Dotfiles installation complete!"
