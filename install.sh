#!/bin/bash
# Backup zshrc file
echo "Backing up existing .zshrc file..."
mv ~/.zshrc ~/.zshrc.bak
echo "Existing .zshrc file backed up successfully!"

# Backup .config folder
echo "Searching for existing .config folder..."
if [ -d ~/.config ]; then
    echo "Found existing .config folder. Backing up .config folder..."
    mv ~/.config ~/.config.bak
    echo "Existing .config folder backed up successfully!"
fi else
    echo "No existing .config folder found!"

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
