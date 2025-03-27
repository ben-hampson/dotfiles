#!/usr/bin/env bash

git submodule update --init --recursive

# Install oh-my-zsh. This has to be done before expanding the dotfiles oh-my-zsh setup moves existing .zshrc out the way and replaces it with its own one.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm $HOME/.zshrc

# stow dotfiles
cd $HOME/dotfiles
git submodule update --init --recursive
stow . -vv
