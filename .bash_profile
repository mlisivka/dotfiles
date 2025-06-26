# For installing gems without sudo
export GEM_HOME=$HOME/.gem
PATH=$PATH:$HOME/.gem/bin

eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

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

# Kubernetes
KUBE_EDITOR='nvim'
EDITOR='nvim'

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
