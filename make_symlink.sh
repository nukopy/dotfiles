#!/bin/bash

# create symlink to home directory
ln -sf $HOME/Projects/dotfiles/.gitconfig ~/.gitconfig
ln -sf $HOME/Projects/dotfiles/.zshenv.home ~/.zshenv
ln -sf $HOME/Projects/dotfiles/latex/.latexmkrc ~/.latexmkrc
ln -sf $HOME/Projects/dotfiles/karabiner ~/.config/karabiner
ln -sf $HOME/Projects/dotfiles/direnv/.direnvrc ~/.direnvrc
ln -sf $HOME/Projects/dotfiles/starship/starship.toml ~/.config/starship.toml

exec $SHELL -l  # restart shell
