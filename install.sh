#!/bin/bash
pip install pynvim
brew install bat
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
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
ln -sf "$(pwd)/.vimrc_background" ~/.vimrc_background
ln -sf "$(pwd)/.zshrc" ~/.zshrc
