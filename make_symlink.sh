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

# for Xcode
if [ "$(uname)" == 'Darwin' ]; then
    # backup
    cp ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist.bk && rm -rf ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
    cp -r ~/Library/Developer/Xcode/UserData/KeyBindings ~/Library/Developer/Xcode/UserData/KeyBindings.bk && rm -rf ~/Library/Developer/Xcode/UserData/KeyBindings

    # create symlink
    ln -sf ~/Projects/dotfiles/xcode/UserData/IDETemplateMacros.plist ~/Library/Developer/Xcode/UserData/IDETemplateMacros.plist
    ln -sf ~/Projects/dotfiles/xcode/UserData/IDETextMacros.plist ~/Library/Developer/Xcode/UserData/IDETextMacros.plist
    ln -sf ~/Projects/dotfiles/xcode/UserData/KeyBindings ~/Library/Developer/Xcode/UserData/KeyBindings
fi

exec $SHELL -l  # restart shell
