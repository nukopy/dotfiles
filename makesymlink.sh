#!/bin/bash

DIR_DOTFILES="$HOME/Projects/dotfiles"
files=$(ls -d $DIR_DOTFILES/.*  $DIR_DOTFILES/**/.* | uniq)

for file in $files; do
    filename=`basename $file`
    
    if [ $filename == "." ] \
        || [ $filename == ".." ] \
        || [ $filename == ".DS_Store" ] \
        || [ $filename == ".git" ] \
        || [ $filename == ".gitignore" ]; then
        continue
    fi
    
    echo "Unlink symlink FROM $file TO ~/$filename"
    unlink ~/$filename
    
    echo "Creating symlink FROM $file TO home directory"
    ln -s $file ~/$filename
    echo
done