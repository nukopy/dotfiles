#!/bin/bash

# create symlink to home directory
ln -sf $HOME/Projects/dotfiles/gitconfig/.gitconfig ~/.gitconfig
ln -sf $HOME/Projects/dotfiles/gitconfig/.gitconfig.nukopy ~/Projects/.gitconfig
ln -sf $HOME/Projects/dotfiles/gitconfig/.gitconfig.neets13 ~/Projects_neets13/.gitconfig
ln -sf $HOME/Projects/dotfiles/.zshenv.home ~/.zshenv
ln -sf $HOME/Projects/dotfiles/latex/.latexmkrc ~/.latexmkrc
ln -sf $HOME/Projects/dotfiles/karabiner ~/.config/karabiner
ln -sf $HOME/Projects/dotfiles/direnv/.direnvrc ~/.direnvrc
ln -sf $HOME/Projects/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf $HOME/Projects/dotfiles/spacemacs/.spacemacs ~/.spacemacs
ln -sf $HOME/Projects/dotfiles/homebrew/Brewfile ~/.config/brewfile/Brewfile

exec $SHELL -l  # restart shell
