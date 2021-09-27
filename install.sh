#!/bin/bash
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
ln -sf "$(pwd)/.gitignore" ~/.gitignore
ln -sf "$(pwd)/.base16_theme" ~/.base16_theme
ln -sf "$(pwd)/.bash_profile" ~/.bash_profile
ln -sf "$(pwd)/.gitignore" ~/.gitignore
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
ln -sf "$(pwd)/.rgignore" ~/.rgignore
ln -sf "$(pwd)/.vimrc" ~/.vimrc
ln -sf "$(pwd)/.zshrc" ~/.zshrc
