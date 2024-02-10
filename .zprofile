# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pipx
export PATH="$PATH:/Users/kxue/.local/bin"

# rbenv
eval "$(~/.rbenv/bin/rbenv init - zsh)"
