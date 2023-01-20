# Setting up Ubuntu 22.04.1 on WSL2

## Introduction

This document covers how to set up a newly installed Ubuntu 22.04.1 distro on Windows with WSL2 for convenient
development work, especially geared toward Python.

## Prerequisite

Check the default shell used and if certain simple CLI tools are installed.

```bash
ps -p $$
which zip
which unzip
which curl
which git
which vim
```

## Install missing tools from above

Perform initial update and upgrade for a new distro.

```bash
sudo apt update -y && sudo apt upgrade -y
```

Install missing tools from above

```bash
sudo apt install zip unzip curl -y
```

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

Now install `pyenv` via `git` into the `~/.pyenv` folder.

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
pushd ~/.pyenv && src/configure && make -C src && popd
```

## Install zsh and use it as default login shell

We use `zsh` as user's login shell and set up its configuration files `~/.zshrc` and `.zprofile` with
"standard" contents.

Install `zsh` shell.

```bash
sudo apt install zsh -y
```

Pull standard config files from GitHub and overwrite local defaults.

```bash
curl -s -o dotFiles.zip https://raw.githubusercontent.com/xueke477/zsh-dot-files/master/dotFiles.zip
unzip -o dotFiles.zip
rm dotFiles.zip
```

Switch to `zsh` as default login shell.

```bash
chsh -s $(which zsh)
```

**Now exit WSL2 window and then restart it.**

## Install Python 3.10 with `pyenv`

List available bugfix versions of Python 3.10.

```bash
pyenv install -l | grep 3.10
```

Install the highest bugfix version available.

```bash
pyenv install 3.10.9
```

Verify installation.

```bash
pyenv versions
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
source .zshrc
pipx environment
```

## Install `poetry`

Install.

```bash
pipx install poetry
```

Verify.

```bash
poetry --version
```

## Install VS Code plugins to work with Python and WSL2

Install the plugin `WSL` first. Afterwards, restart VS Code if necessary.

Click on the shiny box with icon like `><` in the bottom left corner to start a remote windown with Ubuntu 22.04.1.

Install the following plugins: `Pylance`, `Python`, `Python Indent`, `Jupyter` (and its extension pack), `Docker`,
`GitLens`.

## Set Git global user.name and user.email

Before we can make an `git` commits, we need to set up minimal identity information.

```bash
git config --global user.name YOUR_USER_NAME
```

```bash
git config --global user.name YOUR_EMAIL
```
