#-------------------------------------------------------------------------
# Apple M1 Chip machine settings
if [[ $(uname -m) == 'arm64' ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
#-------------------------------------------------------------------------
# rbenv settings
# Needed b/c of https://github.com/castwide/vscode-solargraph/issues/108#issuecomment-487359460
eval "$(rbenv init - zsh)"
#-------------------------------------------------------------------------
