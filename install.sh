#!/bin/bash
pip3 install pynvim
brew install bat
brew install zsh
brew install rbenv
brew install ripgrep
brew install neovim
brew install direnv
brew install pyenv
# brew install postgresql@16 # for pg gem
brew install libpq # for pg gem
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if [ ! -d ~/.config/base16-shell ]; then
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fi
if [ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi
# if [ ! -d ~/.config/enhance-rails-intellisense-in-solargraph ]; then
#   # Clone to the project: ln -s ~/.config/enhance-rails-intellisense-in-solargraph/rails.rb <project_root>/config/definitions.rb
#   git clone https://gist.github.com/castwide/28b349566a223dfb439a337aea29713e ~/.config/enhance-rails-intellisense-in-solargraph
# else
#   # update
#   git -C ~/.config/enhance-rails-intellisense-in-solargraph pull
# fi
if [ ! -d $HOME/.rbenv/plugins/rbenv-gemset ]; then
  git clone git://github.com/jf/rbenv-gemset.git $HOME/.rbenv/plugins/rbenv-gemset
fi
if [ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v1.40.3/install.sh | bash
nvm install node
nvm use node
npm install -g yarn
sh ./link.sh
