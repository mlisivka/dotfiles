# For installing gems without sudo
export GEM_HOME=$HOME/.gem
PATH=$PATH:$HOME/.gem/bin

# https://github.com/rbenv/rbenv/issues/879#issuecomment-289615028
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

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

alias ctgs='ctags -R --exclude=node_modules --exclude=vendor --exclude=log --exclude=tmp'

# Kubernetes
KUBE_EDITOR='nvim'

#https://askubuntu.com/questions/441744/pressing-enter-produces-m-instead-of-a-newline
#stty icrnl
