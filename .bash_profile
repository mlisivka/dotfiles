# For installing gems without sudo
export GEM_HOME=$HOME/.gem
PATH=$PATH:$HOME/.gem/bin

eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"
# https://github.com/rbenv/rbenv/issues/879#issuecomment-289615028
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
# Bat + fzf
export BAT_THEME='base16'

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

alias ggp!='git push origin "$(git_current_branch)" -f'
alias gph='git push heroku "$(git_current_branch)"'

# alias ctgs='ctags -R --exclude=node_modules --exclude=vendor --exclude=log --exclude=tmp'
alias cop='bundle exec rubocop --parallel'
# alias rspec='bundle exec rspec'

# Kubernetes
KUBE_EDITOR='nvim'

EDITOR='nvim'

#https://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
#stty icrnl
eval "$(rbenv init -)"
eval "$(direnv hook bash)"
PATH="$(brew --prefix postgresql@12)/bin:$PATH"
PATH=$(pyenv root)/shims:$PATH

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

NVM_HOME="$HOME/.nvm"
[ -s "$NVM_HOME/nvm.sh" ] && \. "$NVM_HOME/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
      npm i -g yarn
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
