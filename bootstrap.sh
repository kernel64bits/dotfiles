#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for Apple Silicon Macs
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ── chezmoi ───────────────────────────────────────────────────────────────────
if ! command -v chezmoi &>/dev/null; then
  echo "Installing chezmoi..."
  brew install chezmoi
fi

# ── Configure chezmoi source dir and apply dotfiles ───────────────────────────
echo "Applying dotfiles from $DOTFILES_DIR..."
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << EOF
sourceDir = "$DOTFILES_DIR"
EOF
chezmoi apply

# ── Homebrew packages ──────────────────────────────────────────────────────────
echo "Installing Homebrew packages..."
brew bundle --file="$HOME/Brewfile"

echo ""
echo "Done! Next steps:"
echo "  1. Open iTerm2 > Preferences > Profiles > Text > Font: JetBrainsMono Nerd Font"
echo "  2. Open iTerm2 > Preferences > Profiles > Terminal > Report Terminal Type: xterm-256color"
echo "  3. Run: tmux"
echo "  4. Press Ctrl+B then I (capital i) to install tmux plugins"
