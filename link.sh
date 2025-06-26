#!/bin/bash
ln -sf "$(pwd)/.gitignore" ~/.gitignore
ln -sf "$(pwd)/.base16_theme" ~/.base16_theme
ln -sf "$(pwd)/.bash_profile" ~/.bash_profile
ln -sf "$(pwd)/.gitignore" ~/.gitignore
ln -sf "$(pwd)/.gitconfig" ~/.gitconfig
ln -sf "$(pwd)/.rgignore" ~/.rgignore
ln -sf "$(pwd)/.vimrc" ~/.vimrc
mkdir -p ~/.config/
mkdir -p ~/.config/nvim/
ln -sf "$(pwd)/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.vimrc_background" ~/.vimrc_background
ln -sf "$(pwd)/.zshrc" ~/.zshrc
ln -sf "$(pwd)/.p10k.zsh" ~/.p10k.zsh
ln -sf "$(pwd)/keybindings.json" ~/Library/Application\ Support/Cursor/User/keybindings.json
ln -sf "$(pwd)/settings.json" ~/Library/Application\ Support/Cursor/User/settings.json
