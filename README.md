# Dot

Dotfiles managed with GNU Stow.

## Installation

1. Clone this repository:

```
git clone git@github.com:JR-G/dotfiles.git ~/dotfiles
```

2. Run the install script:

```
cd ~/dotfiles
./install.sh
```

This will install necessary packages via Homebrew and set up all configurations using Stow.

## Usage

### Switching Starship Themes

Switch between different prompt themes using:

```
starship-switch <theme-name>
```

Themes are stored in `~/dotfiles/starship/.config/starship/presets/`

😌
