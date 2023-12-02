# Setting up a MacBook with Apple Silicon chips

## Introduction

This document covers how to set up a MacBook with Apple Silicon chips for Python, Node and Ruby development.

All commands below should be executed from the user's home directory.

## Install `homebrew` and perform initial `update` and `upgrade`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)
brew update
brew upgrade
```

## Install `git`

```bash
brew install git
```

## Install `pyenv`

`pyenv` is a CLI tool written in shell scripts. It installs multiple versions of Python by downloading and
compiling them from C source code. Therefore, we need to first install C compiler and various C libraries
that Python depends on for compilation.

```bash
xcode-select --install
brew install openssl readline sqlite3 xz zlib tcl-tk
```

Now install `pyenv` via `git clone` into the `~/.pyenv` folder.

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pushd ~/.pyenv && src/configure && make -C src && popd
```

Install some Python interpreter versions.

```bash
pyenv install 3.9
pyenv install 3.10
pyenv install 3.11
```

## Install `pipx`

```bash
brew install pipx
```

## Install `nvm`

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
```

## Install `rbenv`

```bash
brew install rbenv ruby-build
```

## Install `zsh-autosuggestions`

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

## Set Git global user.name and user.email

```bash
git config --global user.name YOUR_USER_NAME
git config --global user.name YOUR_EMAIL
```

## Install GitHub CLI

For authentication against GitHub, the most convenient option is to use the GitHub CLI. To install, run the
following commands.

```bash
brew install gh
```

## Get baseline dot files

Get baseline dot files from GitHub. Note that they _overwrite_ existing local ones.

```bash
curl -s -o dotFiles.zip https://raw.githubusercontent.com/kxue43/zsh-dot-files/mac-arm64/dotFiles.zip
unzip -o dotFiles.zip
rm dotFiles.zip
```
