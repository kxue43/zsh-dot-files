# Setting up a Fedora Dev Computer

## Introduction

This document covers how to set up a Linux computer with a newly installed Fedora 39 distro
for Python, Node and Ruby development.

All commands below should be executed from the user's home directory.

## Install prerequisite tools

Perform initial update and upgrade for a new distro.

```bash
sudo dnf upgrade
```

Install some common tools needed by the rest of the process.

```bash
sudo dnf install zip unzip curl vim
```

## Install zsh and use it as the default login shell

Install `zsh` shell.

```bash
sudo dnf install zsh
```

Switch to `zsh` as default login shell.

```bash
chsh -s $(which zsh)
```

**Logout the current user and log back in again.**

## Install `pyenv`

`pyenv` is a CLI tool written in shell scripts. It installs multiple versions of Python by downloading and
compiling them from C source code. Therefore, we need to first install C compiler and various C libraries
that Python depends on for compilation.

```bash
sudo dnf install make gcc patch zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel tk-devel \
libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2
```

Now install `pyenv` via `git clone` into the `~/.pyenv` folder.

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pushd ~/.pyenv && src/configure && make -C src && popd
```

## Install `pipx`

Enhance the system Python that comes with Ubuntu.

```bash
sudo dnf install pipx
pipx ensurepath
```

Refresh `PATH` environment variable and verify `pipx` installation.

```bash
source ~/.zshrc
pipx environment
```

## Install `poetry`

Install `poetry` by `pipx` and verify installation.

```bash
pipx install poetry
poetry --version
```

## Install `nvm`

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```

## Install `rbenv`

First install build dependencies.

```bash
sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel \
libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel \
ncurses-devel
```

Install `rbenv`.

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```

Install `ruby-build` as a plugin for `rbenv`.

```bash
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## Install `zsh-autosuggestions`

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

## Set Git global user.name and user.email

```bash
git config --global user.name YOUR_USER_NAME
git config --global user.email YOUR_EMAIL
git config --global core.editor vim
```

## Install GitHub CLI

For authentication against GitHub, the most convenient option is to use the GitHub CLI. To install, run the
following commands.

```bash
sudo dnf install 'dnf-command(config-manager)'
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
```

## Get baseline dot files

Get baseline dot files from GitHub. Note that they _overwrite_ existing local ones.

```bash
curl -s -o dotFiles.zip https://raw.githubusercontent.com/kxue43/zsh-dot-files/master/dotFiles.zip
unzip -o dotFiles.zip
rm dotFiles.zip
```
