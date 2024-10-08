#!/bin/bash
# Backup zshrc file
echo "Backing up existing .zshrc file..."
mv ~/.zshrc ~/.zshrc.bak
echo "Existing .zshrc file backed up successfully!"

# Cloning the repository in the home directory
echo "Cloning the repository in the home directory..."
cd ~
git clone git@github.com/smoothwastaken/dotfiles.git
echo "Repository cloned successfully!"

# Change directory to dotfiles
cd dotfiles

# Using stow to create symlinks
echo "Creating symlinks using stow..."
stow .
echo "Symlinks created successfully!"

# Finish message
echo "Installation complete!"
echo "You can now enjoy your new dotfiles!"
