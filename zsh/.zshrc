# Ensure Homebrew paths are available early
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"

elif [ -d "/usr/local/bin" ]; then
  export PATH="/usr/local/bin:$PATH"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set location of dotfiles repo (defaulting to ~/dotfiles)
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# asdf
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
  export PATH="$HOME/.asdf/shims:$PATH"
fi

plugins=(
  git
  yarn
  web-search
  jsontools
  macports
  node
  macos
  sudo
  thor
  docker
)

ZSH_THEME=""

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# User configuration

eval "$(jump shell zsh)"
eval "$(starship init zsh)"

starship-switch() {
  if [ -z "$1" ]; then
    echo "Usage: starship-switch <theme>"
    return 1
  fi

  cd "$DOTFILES/starship/.config"
  cp "starship/presets/$1.toml" starship.toml
  cd - > /dev/null
}

alias nfz='nvim $(fzf)'
alias lg='lazygit'

export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if command -v brew &> /dev/null; then
  BREW_PREFIX=$(brew --prefix)
  if [ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  elif [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  elif [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  fi

  if [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi
fi

if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

export GHOSTTY_CONFIG_PATH="$HOME/.config/ghostty/config"
export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/.deno/env" ]; then
  . "$HOME/.deno/env"
fi

if command -v rbenv &> /dev/null; then
  eval "$(rbenv init -)"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Load machine-specific configuration
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

# Prevent duplicate PATH entries (keep this at the end)
typeset -U path
