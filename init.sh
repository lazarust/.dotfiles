#!/bin/bash

echo "Starting initialization script..."

echo "  Linking .tmux.conf..."
ln -s ./.tmux.conf ~/.tmux.conf

echo "  Linking .zshrc..."
ln -s ./.zshrc ~/.zshrc

echo "  Setting up Ghostty"
mkdir ~/.config/ghostty/
ln -s ./.config/ghostty/config ~/.config/ghostty/config

echo "  Setting up just config..."
mkdir ~/.config/just/
ln -s ./.config/just/justfile ~/.config/just/justfile

echo "  Setting up global .gitignore..."
mkdir ~/.config/git/
ln -s ./.config/git/ignore ~/.config/git/ignore

echo "  Setting up opencode config..."
mkdir ~/.config/opencode/
ln -s ./.config/opencode/opencode.json ~/.config/opencode/opencode.json

echo "  Running brew bundle..."
brew bundle

echo "Initialization complete!"
