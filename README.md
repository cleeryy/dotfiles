# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

## Installation

### Using the install script

You can install and setup these dotfiles just using this command

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/smoothwastaken/dotfiles/HEAD/.zshrc)"
```

### Manual

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/smoothwastaken/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
