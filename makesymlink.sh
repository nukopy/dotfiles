#!/bin/bash

DIR_DOTFILES="$HOME/Projects/dotfiles"
files=$(ls -d $DIR_DOTFILES/.*  $DIR_DOTFILES/**/.* | uniq)

unlink_create_symlink () {
    file=$1
    filename=$2
    
    echo "---------- Unlink & Creating symlink ----------"
    
    echo "Unlink symlink ~/$filename"
    unlink ~/$filename
    
    echo "Creating symlink FROM $file TO ~/$filename"
    ln -s $file ~/$filename
    
    echo ""
}

for file in $files; do
    filename=`basename $file`
    
    if [ $filename == "." ] \
        || [ $filename == ".." ] \
        || [ $filename == ".DS_Store" ] \
        || [ $filename == ".git" ] \
        || [ $filename == ".gitignore" ]; then
        continue
    fi
    
    unlink_create_symlink $file $filename
done