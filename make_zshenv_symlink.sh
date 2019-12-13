#!/bin/bash

ln -sf $HOME/Projects/dotfiles/.zshenv.home ~/.zshenv
exec $SHELL -l  # restart shell
