#!/bin/bash

echo "Starting initialization script..."

echo "  Linking .tmux.conf..."
ln -s ./.tmux.conf ~/.tmux.conf

echo "  Linking .zshrc..."
ln -s ./.zshrc ~/.zshrc

echo "  Setting up just config..."
mkdir ~/.config/just/
ln -s ./justfile.global ~/.config/just/justfile

echo "  Setting up opencode config..."
mkdir ~/.config/opencode/
ln -s ./opencode.json ~/.config/opencode/opencode.json

echo "  Running brew bundle..."
brew bundle

echo "Initialization complete!"
