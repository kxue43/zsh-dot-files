# Setting up a Ubuntu Dev Computer

## Introduction

This document covers how to set up a Linux computer with a newly installed Ubuntu 22.04 distro
for Python, Node and Ruby development. It works on Windows with WSL2 as well.

All commands below should be executed from the user's home directory.

## Install prerequisite tools

Perform initial update and upgrade for a new distro.

```bash
sudo apt update -y && sudo apt upgrade -y
```

Install some common tools needed by the rest of the process.

```bash
sudo apt install zip unzip curl -y
```

## Install zsh and use it as the default login shell

Install `zsh` shell.

```bash
sudo apt install zsh -y
```

Switch to `zsh` as default login shell.

```bash
chsh -s $(which zsh)
```

**Now exit the current login shell and then restart/login again.**

**Now Ubuntu Desktop, logout the current user and log back in again.**

## Install `pyenv`

`pyenv` is a CLI tool written in shell scripts. It installs multiple versions of Python by downloading and
compiling them from C source code. Therefore, we need to first install C compiler and various C libraries
that Python depends on for compilation.

```bash
sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
libffi-dev liblzma-dev -y
```

Now install `pyenv` via `git clone` into the `~/.pyenv` folder.

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pushd ~/.pyenv && src/configure && make -C src && popd
```

## Install `pipx`

Enhance the system Python that comes with Ubuntu.

```bash
sudo apt install python3-pip python3.10-venv
```

Verify system Python meets the requirements to install `pipx`.

```bash
python3 --version && pip3 --version
```

Install `pipx`

```bash
python3 -m pip install --user pipx
python3 -m pipx ensurepath
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
sudo apt-get install autoconf patch build-essential \
rustc libssl-dev libyaml-dev libreadline6-dev \
zlib1g-dev libgmp-dev libncurses5-dev libffi-dev \
libgdbm6 libgdbm-dev libdb-dev uuid-dev -y
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
```

## Install GitHub CLI

For authentication against GitHub, the most convenient option is to use the GitHub CLI. To install, run the
following commands.

```bash
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

## Get baseline dot files

Get baseline dot files from GitHub. Note that they _overwrite_ existing local ones.

```bash
curl -s -o dotFiles.zip https://raw.githubusercontent.com/kxue43/zsh-dot-files/master/dotFiles.zip
unzip -o dotFiles.zip
rm dotFiles.zip
```
