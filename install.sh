#!/bin/bash
set -euo pipefail

echo "🚀 Starting Mac bootstrap..."

# -------------------------------
# 1️⃣ Homebrew
# -------------------------------
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make Homebrew immediately available in this shell
eval "$(/opt/homebrew/bin/brew shellenv)"

# -------------------------------
# 2️⃣ Stow
# -------------------------------
if ! command -v stow &> /dev/null; then
    echo "Stow is not installed. Installing Stow..."
    brew install stow
fi

# -------------------------------
# 3️⃣ Install packages from Brewfile
# -------------------------------
echo "Installing packages from Brewfile..."
brew bundle --verbose --no-lock

# -------------------------------
# 4️⃣ Backup existing .zshrc safely
# -------------------------------
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    timestamp=$(date +%Y%m%d%H%M%S)
    echo "Backing up existing .zshrc to .zshrc.backup.$timestamp"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$timestamp"
fi

# -------------------------------
# 5️⃣ asdf
# -------------------------------
if [ ! -d "$HOME/.asdf" ]; then
    echo "asdf is not installed. Installing asdf..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
fi

export ASDF_DIR="$HOME/.asdf"
[ -f "$ASDF_DIR/asdf.sh" ] && . "$ASDF_DIR/asdf.sh"

# -------------------------------
# 6️⃣ Deno (non-interactive)
# -------------------------------
if ! command -v deno &> /dev/null; then
    echo "Deno is not installed. Installing Deno..."
    curl -fsSL https://deno.land/install.sh | sh -s -- --no-modify-path --no-completions
fi

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# -------------------------------
# 7️⃣ oh-my-zsh (non-interactive)
# -------------------------------
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh is not installed. Installing oh-my-zsh..."
    export RUNZSH=no
    export CHSH=no
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# -------------------------------
# 8️⃣ Stow dotfiles
# -------------------------------
dirs=(nvim tmux git zsh starship obsidian ghostty)
for dir in "${dirs[@]}"; do
    stow -v -R -t ~ --ignore='\.git' "$dir"
done

# -------------------------------
# 9️⃣ Finished
# -------------------------------
echo "🚀 Dotfiles installation complete!"
echo "Open a new terminal or run 'exec zsh -l' to start using your new shell environment."
