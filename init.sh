#!/bin/bash
set -euo pipefail

trap 'echo "Error: command failed: $BASH_COMMAND" >&2' ERR

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dst="$2"

  mkdir -p "$(dirname "$dst")"
  ln -sfn "$src" "$dst"
  echo "  Linked $dst -> $src"
}

echo "Starting initialization script..."

echo "  Linking .tmux.conf..."
link "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "  Linking .zshrc..."
link "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

echo "  Setting up Ghostty"
link "$SCRIPT_DIR/.config/ghostty/config" "$HOME/.config/ghostty/config"

echo "  Setting up just config..."
link "$SCRIPT_DIR/.config/just/justfile" "$HOME/.config/just/justfile"

echo "  Setting up global .gitignore..."
link "$SCRIPT_DIR/.config/git/ignore" "$HOME/.config/git/ignore"

echo "  Setting up opencode config..."
link "$SCRIPT_DIR/.config/opencode/opencode.json" "$HOME/.config/opencode/opencode.json"

echo "  Setting up lazygit config..."
link "$SCRIPT_DIR/.config/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

echo "  Running brew bundle..."
brew bundle

echo "Initialization complete!"
