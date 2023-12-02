#-------------------------------------------------------------------------
# Apple M1 Chip machine settings
eval $(/opt/homebrew/bin/brew shellenv)
#-------------------------------------------------------------------------
# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
#-------------------------------------------------------------------------
# rbenv settings
eval "$(rbenv init - zsh)"
#-------------------------------------------------------------------------
# pipx settings
export PATH="$PATH:$HOME/.local/bin"
