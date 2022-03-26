#!/bin/bash
pip3 install pynvim
brew install bat
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
if [ ! -d ~/.config/enhance-rails-intellisense-in-solargraph ]; then
  # To update: git -C ~/.config/enhance-rails-intellisense-in-solargraph pull
  # Clone to the project: ln -s ~/.config/enhance-rails-intellisense-in-solargraph/rails.rb <project_root>/config/definitions.rb
  git clone https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e ~/.config/enhance-rails-intellisense-in-solargraph
fi
if [ ! -d $HOME/.rbenv/plugins/rbenv-gemset ]; then
  git clone git://github.com/jf/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset
fi
gem install solargraph
solargraph download-core
sh ./link.sh
