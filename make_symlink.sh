#!/bin/bash

# create symlink to home directory
ln -sf $HOME/Projects/dotfiles/.zshenv.home ~/.zshenv
ln -sf $HOME/Projects/dotfiles/latex/.latexmkrc ~/.latexmkrc
ln -sf $HOME/Projects/dotfiles/karabiner ~/.config/karabiner

exec $SHELL -l  # restart shell
