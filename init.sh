#!/bin/bash

ln -s ./.tmux.conf ~/.tmux.conf

ln -s ./.zshrc ~/.zshrc

mkdir ~/.config/just/
ln -s ./justfile ~/.config/just/justfile

brew bundle
