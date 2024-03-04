# ------------------------------------------------------------------------
export PATH="$HOME/.local/bin:/Applications/MacVim.app/Contents/bin:$PATH"
# ------------------------------------------------------------------------
alias gproj='cd ~/projects'
alias gtemp='cd ~/temp'
alias glg='git log --graph --oneline --all'
alias venvact='. .venv/bin/activate'
alias clean-aws-cache="unset AWS_SESSION_TOKEN && unset AWS_SECRET_ACCESS_KEY && unset AWS_ACCESS_KEY_ID && rm -rf ~/.aws/boto/cache"
alias gs='git status'
alias gci='aws sts get-caller-identity'
# ------------------------------------------------------------------------
function glo {
    git log --oneline $@
}
# ------------------------------------------------------------------------
# use installed zsh completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi
#-------------------------------------------------------------------------
# prompt with Git info
source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PS1=$'%B%F{cyan}%n@%m:%F{12}%~%F{11} $(__git_ps1 "(%s)")\n%(?.%F{10}\U2714.%F{9}\U2718)%b%f\$ '
# ------------------------------------------------------------------------
# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# ------------------------------------------------------------------------
# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#-------------------------------------------------------------------------
# rbenv settings
eval "$(rbenv init - zsh)"
#-------------------------------------------------------------------------
# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
#-------------------------------------------------------------------------
