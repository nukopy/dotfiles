#!/bin/bash

DIR_DOTFILES="$HOME/dotfiles"
files=`ls -d $DIR_DOTFILES/.*  $DIR_DOTFILES/**/.* | uniq`

for file in $files; do
    filename=`basename $file`
    
    if [ $filename == "." ] \
        || [ $filename == ".." ] \
        || [ $filename == ".DS_Store" ] \
        || [ $filename == ".git" ]; then
        || [ $filename == ".gitignore" ]; then
        continue
    fi
    
    echo "Creating symlink to $file in home directory"
    ln -s $DIR_DOTFILES/$filename ~/$filename
done